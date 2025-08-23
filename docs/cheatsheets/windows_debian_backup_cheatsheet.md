# TrustMindLab – Windows→Debian Backup Cheatsheet (SFTP + Duplicati)

## TL;DR

**Debian**: csatold a külső SSD-t `/srv/backups` alá (`fstab + UUID`), hozz létre `backupuser` felhasználót, zárd `chroot`-ba SFTP-re.  
**Windows**: Duplicati → SFTP target `backupuser@<debian-ip>:/windows11` → titkosítás (AES-256), ütemezés, retention.  
**Teszt**: `sftp backupuser@<debian-ip>` → `ls` csak `lost+found` + `windows11`.

---

## [MODE:FAST] Lépésről-lépésre (amit tényleg futtattunk)

### 1) Külső SSD csatolása Debianon (ext4, /srv/backups)

```bash
# 1) Ellenőrzés
lsblk

# 2) (Ha kell) formázás ext4-re – FIGYELEM: minden adat törlődik az sda1-en!
sudo mkfs.ext4 /dev/sda1

# 3) Mount pont
sudo mkdir -p /srv/backups

# 4) Csatolás
sudo mount /dev/sda1 /srv/backups

# 5) Ellenőrzés
df -h | grep sda1

# 6) UUID lekérdezés az fstab-hoz
sudo blkid /dev/sda1
# Példa: UUID="281783b3-ba91-406a-a205-695098696e81"
```

**`/etc/fstab` (állandó csatoláshoz):**
```
UUID=281783b3-ba91-406a-a205-695098696e81  /srv/backups  ext4  defaults  0  2
```

**Aktiválás:**

```bash
sudo mount -a
mount | grep /srv/backups
```

---

### 2) Dedikált backup user + jogosultság

```bash
# Shell nélküli user: csak SFTP-re
sudo adduser backupuser --shell /usr/sbin/nologin

# Céltár kialakítása (Windows mentéseknek)
sudo mkdir -p /srv/backups/windows11
sudo chown backupuser:backupuser /srv/backups/windows11
```

---

### 3) SFTP chroot korlátozás (csak a backup-gyökér látszódjon)

```bash
sudo nano /etc/ssh/sshd_config
```

**Add a végére:**

```
Match User backupuser
    ChrootDirectory /srv/backups
    ForceCommand internal-sftp
    AllowTcpForwarding no
```

**Alkalmazás:**

```bash
sudo systemctl restart ssh
```

---

### 4) Gyors SFTP teszt Windowsról

**PowerShell:**
```powershell
sftp backupuser@<debian-ip>
# jelszó megadása után:
sftp> ls
# Várt kimenet: "lost+found  windows11"
sftp> exit
```

**WinSCP (opcionális):**

- Protocol: SFTP  
- Host: `<debian-ip>` (mehet Tailscale IP is)  
- Port: 22  
- User/Pass: backupuser / jelszó  

Belépve jobb oldalt csak `windows11` látszódjon (lost+found normális).

---

## [MODE:DEEP] Duplicati – ajánlott beállítások (Windows)

**Telepítés + indítás:**  
Letöltés → telepítés → böngészőben: `http://localhost:8200`

### Új backup (példa: D: projektek)

- **Name**: D-projects  
- **Encryption**: AES-256, erős jelszó (jegyezd fel!)  
- **Target**:  
  - Storage type: SFTP (SSH)  
  - Server/Port: `<debian-ip>:22`  
  - Path: `/windows11/d-projects`  
  - User/Pass: backupuser / jelszó  
  - Test connection: kell hogy OK legyen

- **Source**: jelöld a D:\ projekt mappákat

**Filters – tipikus kizárások:**

```
*\node_modules\*
*\__pycache__\*
*\.venv\*
*.iso
*.msi
*.exe
*.zip
```

> Ha telepítőket is mentesz, ezeket ne zárd ki.

**Schedule**: naponta 22:00  
**Retention (Custom)**: `7D:1D, 4W:1W, 12M:1M`  
➡ Jelentés: 7 napig napi, 4 hétig heti, 12 hónapig havi snapshot

---

### C: kritikus adatok (külön job javasolt)

**Forrás – mentsd:**

```
C:\Users\<NEVED>\Documents
C:\Users\<NEVED>\Desktop
C:\Users\<NEVED>\Pictures
C:\Users\<NEVED>\.ssh\
C:\Users\<NEVED>\AppData\Roaming\
(válogatva) C:\Users\<NEVED>\AppData\Local\
C:\ProgramData\
```

**Forrás – zárd ki:**

```
C:\Windows\
C:\Program Files\
C:\Program Files (x86)\
C:\$Recycle.Bin\
C:\pagefile.sys
C:\hiberfil.sys
C:\swapfile.sys
C:\Users\<NEVED>\AppData\Local\Temp\
C:\Users\<NEVED>\AppData\Local\Microsoft\Windows\INetCache\
```

**Schedule**: heti 2× (kedd+péntek 22:00)  
**Retention**: `4W:1W, 12M:1M`  

---

## Smart vs. Custom retention – gyors magyarázat

- **Smart**: egyszerű, automatizált → `7D:4W:12M`
- **Custom**: kézzel → `<időtáv>:<mintavétel>` vesszővel:

```
7D:1D, 4W:1W, 12M:1M
30D:1D, 12M:1M, 3Y:1M
```

---

## Hasznos jegyzetek

- **UUID**: a partíció egyedi azonosítója:  
  `sudo blkid /dev/sda1`

- **fstab-ban UUID**-t használunk, mert stabilabb mint a `/dev/sdX` név.

- **lost+found** az ext4 saját mappája → hagyd békén.

- **chroot szabály**: a gyökér tulaja root legyen:

```bash
sudo chown root:root /srv/backups
sudo chown backupuser:backupuser /srv/backups/windows11
```

- **Tailscale**: használhatod a Tailscale IP-t a Duplicatiban.

- **Titkosítás**: ha elveszted a jelszót → mentés olvashatatlan.

- **Első futás**: lassú → ez normális (titkosítás + tömörítés + uplink)

---

## Restore mini-teszt – ajánlott

1. Duplicati → Restore → válassz 1–2 fájlt
2. Restore egy ideiglenes mappába
3. Ellenőrizd: megnyithatóak?

---

## Restore – 60 másodperces vázlat

1. Duplicati UI → Restore  
2. Válassz dátumot (verziót)  
3. Válaszd ki a fájlokat/mappákat  
4. Restore files to… (új helyre)  
5. Nyisd meg a fájlt → ha rendben van, jöhet az éles restore

---

## ✅ CHECKLIST (gyors audit)

- `/etc/fstab` → UUID sor rendben, `mount -a` hiba nélkül  
- `/srv/backups` root tulajdon, `windows11` mappa `backupuser` tulajdon  
- `sshd_config` → `Match User backupuser` blokk bent, SSH újraindítva  
- `sftp backupuser@<ip>` → látod a `windows11`-et  
- **Duplicati D:** napi, `7D:1D,4W:1W,12M:1M`, kizárások beállítva  
- **Duplicati C:** kedd+péntek 22:00, `4W:1W,12M:1M`, rendszer/cache kizárva  
- Próba restore lefutott (legalább 2 fájllal)

---

## 📌 DECISION LOG (aktuális)

- **Target**: Külső 2TB SSD, ext4 → `/srv/backups`  
- **Protokoll**: SFTP (SSH), chrootolt `backupuser`  
- **Backup kliens**: Duplicati (fájlszint, titkosítás, deduplikáció)  
- **Retention**:  
  - D: `7D:1D,4W:1W,12M:1M`  
  - C: `4W:1W,12M:1M`  
- **Ütemezés**:  
  - D: napi 22:00  
  - C: kedd+péntek 22:00

---

## ▶️ NEXT ACTIONS

- **Duplicati – D:** ellenőrizd, hogy fut-e az első teljes mentés, majd állíts be e-mail értesítőt (ha használod). *(Te, 10–15p)*  
- **Duplicati – C:** finomhangold az exclude listát (Temp/INetCache biztosan menjen ki). *(Te, 5–10p)*  
- **Restore mini-teszt**: válassz ki 2–3 fájlt (egyik legyen AppData-ból), restore egy temp mappába, nyisd meg. *(Te, 10p)*
