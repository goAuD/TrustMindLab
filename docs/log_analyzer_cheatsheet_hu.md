# 🐧 Linux Logelemzés Cheat Sheet

## 📜 Általános logfájlok helye

```bash
/var/log/
```

---

## 📂 Fontosabb fájlok

> /var/log/syslog – általános rendszerüzenetek (Debian/Ubuntu)

> /var/log/messages – hasonló, CentOS/RHEL rendszereken

> /var/log/auth.log – hitelesítés, sudo, ssh

> /var/log/dmesg – kernelüzenetek

> /var/log/boot.log – rendszerindítás

> /var/log/Xorg.0.log – grafikus felület indítása

---

## 🔍 Keresés, szűrés

```bash
grep "error" /var/log/syslog         # csak a "hiba" sorokat
grep -i "error" /var/log/messages   # kis-nagybetű mindegy
grep -v "ignored" auth.log          # mindent, KIVÉVE ami "ignored"
```

---

## 🧹 Real-time figyelés

```bash
tail -f /var/log/syslog             # új sorokat mutat élőben
journalctl -f                       # systemd log stream
```

---

## 🕐 Idő szerint

```bash
journalctl --since "10 minutes ago"
journalctl --since yesterday --until today
```

---

## 📅 Boot-ok szerint

```bash
journalctl --list-boots
journalctl -b -1                    # előző boot logja
```

---

## 🔗 Egy adott szolgáltatás logja

```bash
journalctl -u ssh.service
```

---

## 💡 Egyéb hasznosak

```bash
less /var/log/syslog
dmesg | grep -i usb
```

---

## 💡 Mini-javaslat (opcionális)

> ### logrotate említése (Linux): hogyan rotálódnak automatikusan a logok

> Mentés parancs outputba, például:

```bash
journalctl -u ssh.service > ssh_logs.txt
```

---

# 🪟 Windows (CMD & PowerShell)

## 📚 Rendszernaplók

```powershell
Event Viewer → eventvwr.msc
→ System / Application / Security
```

---

## 🔍 Parancssoros lekérdezés

```powershell
Get-EventLog -LogName System -Newest 50
Get-EventLog -LogName Application | where {$_.EntryType -eq "Error"}
```

---

## 🆕 Új Event Viewer API (PowerShell 5+)

```powershell
Get-WinEvent -LogName System -MaxEvents 50
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4624}
```

---

## 🔎 Szűrés dátum szerint

```powershell
Get-EventLog -LogName System -After (Get-Date).AddDays(-1)
```

---

## 🌐 Rendszerindítás és hálózati események

```ini
Boot ID: 6005 (start), 6006 (shutdown)

Network: 4201 (csatlakozás), 4202 (leválasztás)
```

---

## 💥 Blue Screen események

```powershell
Get-WinEvent -FilterHashtable @{LogName="System"; ID=1001}
```

## PowerShell-ben exportálás CSV-be

```powershell
Get-EventLog -LogName System | Export-Csv -Path system_log.csv
```

---

## 🔚 Hasznos Tippek

> ## Ha valami fura, mindig nézd meg

- **Linux: journalctl -xe**

- **Windows: Get-WinEvent -LogName System -MaxEvents 100 | Out-GridView**

- **Mindig keress: error, fail, denied, refused, timeout**

- **Soha ne felejtsd: a naplókban van a kulcs mindenhez.**
