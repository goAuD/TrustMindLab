# 🔥 pfSense Panaszlista

[![Join the TrustMindLab Discussions](https://img.shields.io/badge/💬_Join-TrustMindLab-blueviolet)](https://github.com/goAuD/MyHomeLab/discussions/1)  
<div class="badge-base LI-profile-badge" data-locale="hu_HU" data-size="medium" data-theme="light" data-type="VERTICAL" data-vanity="viktor-halupka-weiz" data-version="v1">
  <a class="badge-base__link LI-simple-link" href="https://at.linkedin.com/in/viktor-halupka-weiz?trk=profile-badge">Viktor Halupka</a>
</div>

---

> *„A nyílt forráskód nem jelent nyílt szívet.” – Viktor, 2025*

---

## 📉 A Legnagyobb Túlélések Listája

### 1. **Realtek NIC driver és a véletlen LAN ledobás**

> „Nem halt meg, csak elment magába.”

- Rendszer: stabil
- LAN kapcsolat: instabil
- Hibakeresés: reboot
- Megoldás: új gép, új élet

---

### 2. **Syslog loop – a logok logjainak logja**

> „Már csak a log íródik, az operációs rendszer régen feladta.”

- CPU 100%, venti 8000 RPM, RAM full
- Hibás workaround: syslog levágása /dev/null-ba
- Végső workaround: uninstall pfSense 😅

---

### 3. **DMZ vagy Double NAT? Válassz: egyik se működik.**

- *NAT on NAT on NAT*
- „A port forwarding olyan, mint a párkapcsolat: ha túl sokat állítgatsz rajta, nem működik.”

---

### 4. **UPnP vagy UN-PnP**

> „Nincs több automatikus portnyitás, csak manual szenvedés.”

- Plex nem látja magát
- Tailscale is megsértődik
- Megoldás: `Túl sok port, túl kevés öröm`

---

### 5. **WebGUI: ha bejön, az véletlen volt**

- Port 443? Nem válaszol.
- Port 8443? Véletlenül a routeredbe léptél be.
- Firefox? Fehér képernyő.
- Megoldás: `elmegyek_pihizni.sh`

---

### 6. **Package menedzsment vagy: „Általános hiba: most nem megy.”**

- Telepítenél egy Snort-ot?
  - Nem megy.
- Suricata?
  - Nem támogatott.
- Egy normális IDS?
  - Menj OpenWRT-re.

---

### 7. **Túlmelegedő laptop: pfSense vs. AMD A9 CPU**

> „Hallgattam, de hallottam: felzúgott, majd lekapcsolt.”

- 95°C – majd hirtelen 0
- Kernel panic, mint reggeli kávé

---

## 🧹 Megoldások, amik működnek:

- `shutdown -h now`
- `restore previous life`
- Debian + Tailscale + docker + nyugalom
- Egy hideg sör, és egy meleg logikai switch

---

👑 **Kedvenc parancs:**

```bash
echo "Goodbye pfSense" > /etc/motd
```
