# 🛡️ Security HomeLab – Teljes Setup Roadmap

> *„Az alapot egyszer rakd össze jól, és minden későbbi fejlesztés stabil lesz.”*  
> – Viktor × AI

---

## 🎯 Hardver

### 🔹 HP EliteDesk 800 G3 (Host gép)

- **CPU:** Intel i5-7600
- **RAM:** 16 GB DDR4
- **SSD:** 512 GB NVMe
- **Funkció:** Router + IDS/IPS host + Virtualizáció

### 🔹 Hálózati interfészek

1. **Alap NIC (LAN)** – belső hálózat (switch, HomeLab eszközök)
2. **Intel NIC (WAN)** – külső hálózat (ISP ZTE router)
   - Bracket beépítés szükséges a stabil rögzítéshez

### 🔹 Kijelző

- Nincs dedikált monitor → **ideiglenesen a Smart TV-re kötve**, ha kell  
- Hosszú távon **SSH + web GUI** (Proxmox, Splunk) távoli menedzsment

---

## 🛠️ OS és virtualizáció

### 🔹 1. Debian 12 (bare metal)

- Ez lesz a **core host**, ami a következőket adja:
  - Router funkció (WAN ↔ LAN szétválasztás)
  - Suricata IDS/IPS
  - Proxmox vagy KVM/QEMU virtualizáció

📌 **Telepítés főbb lépései**:

1. Minimal install (SSH + sudo + net-tools)
2. Statikus IP cím LAN interfészre
3. NAT és alap tűzfal beállítás (iptables/nftables)
4. Suricata előkészítése (csak log mód)
5. Hostname: `darklab-gateway`

---

### 🔹 2. Proxmox (vagy sima KVM/QEMU)

- Debian alól virtualizáció
- VM-ek kezelése web GUI-n keresztül
- Snapshot, mentés, erőforrás-szabályozás → **biztonságos tesztelés**

📌 **VM-ek, amiket indítunk**:

- **Parrot Security OS** – pentest / sandbox környezet
- (később) Kali Linux, Honeypot (Cowrie), Windows teszt VM

---

## 🧩 Biztonsági stack

### 🔹 1. Suricata (IDS/IPS)

- Telepítés Debian hoston
- **IDS módban indul** – forgalom megfigyelése
- EVE JSON log → Splunk input
- Később: **IPS mód** – aktív blokkolás

---

### 🔹 2. Fail2ban

- SSH és Suricata logokat figyel
- Automatikusan BAN-olja a gyanús IP címeket
- Log események → Splunk-ba küldés

---

### 🔹 3. Splunk (SIEM)

- Minden log központi gyűjtése és elemzése
- Dashboard: támadási próbálkozások, blokkolt IP-k, IDS riasztások
- Riasztások e-mailben / mobilon

---

## 🔹 Hálózati topológia (terv)

```ini
    [ISP Router/ZTE]
             │
       (WAN NIC)
     HP EliteDesk
       (Debian12)
             │
       (LAN NIC)
             │
     [Switch / AP]
 ┌────────────┼───────┐
 │            │       │
[Home PC] [Laptop] [VM-ek]
(Parrot, Honeypot, teszt hálózat)
```

---

## 🗂️ Haladási ütem

1. **Hardver összerakása**
   - Intel NIC + bracket beszerelés
   - LAN/WAN kábelezés ellenőrzése
2. **Debian telepítés**
   - Router és SSH hozzáférés működőképes
3. **Proxmox vagy KVM virtualizáció**
   - Parrot Security OS telepítése
4. **Suricata telepítése (IDS mód)**
   - Alap szabálykészletek beállítása
   - Logok megértése
5. **Fail2ban integráció**
   - Suricata + SSH logokra reagál
6. **Splunk telepítés**
   - Logok központosítása, dashboard
7. **Teljes teszt**
   - pl. nmap portscan → log és blokkolás figyelése

---

## 📅 Jegyzet meta

- **Verzió:** 2025-07-21  
- **Frissítés:** Debian router telepítési lépések és Suricata IDS konfiguráció

> *„Előbb építsd fel a várat, aztán gyakorold a támadást. A sorrend adja a biztonságot.”*
