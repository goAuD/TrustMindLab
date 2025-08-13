# 🛡️ Splunk + Fail2ban + Flooding – Blue Team Alapok

> *„Az adat az új arany. A log az új fegyver.”*  
> – Viktor × AI Security Notes

---

## 🔹 Splunk – A Nagy Testvér a Logok Felett

- **SIEM rendszer** (Security Information and Event Management)
- Gyűjti, elemzi és korrelálja a logokat a különböző rendszerekről:
  - szerverek
  - hálózati eszközök
  - alkalmazások
- **Haszna**:
  - Anomáliák észlelése (pl. hirtelen belépési próbálkozások)
  - Dashboards, hogy vizualizáld a hálózati állapotot
  - Események összefűzése (pl. egy IP több helyen próbálkozik)

📌 **HomeLab ötlet**:  
Rakj össze egy Splunk Free + Docker loggyűjtő stack-et → tanuláshoz tökéletes.

---

## 🔹 Fail2ban – Az Automata Ajtócsukogató

- Figyeli a logokat → szabályrendszer alapján **BAN**-olja a gyanús IP-ket
- Klasszikus felhasználás:
  - SSH brute-force védelem
  - HTTP/FTP auth túlterhelés megfogása
- **Integráció**:
  - iptables / nftables / pfSense blokklistákkal
  - Splunk logot is tudja etetni → láthatod a tiltott hostokat

📌 **HomeLab ötlet**:  
Teszteld élesben: 5 rossz SSH jelszó → azonnal tiltás.  
Próbáld ki Tailscale / Docker környezetben is.

---

## 🔹 Flooding támadások – Túlterhelés az Első Vonalon

- Cél: a szolgáltatás elérhetetlenné tétele (DDoS, SYN flood, UDP flood)
- Nem lopnak adatot → **lebénítják a hálózatod**
- **Védelem**:
  - IDS/IPS (pl. Snort / Suricata)  
  - Fail2ban / rate limiting / WAF
  - Cloudflare / upstream filtering (ha publikus IP)

📌 **HomeLab ötlet**:  
Indítsd el a Suricatát a HomeLab routereden (HP EliteDesk / Debian).  
Figyeld a flood támadásokat egy lokális nmap stress-teszttel.

---

## 🔹 Következő lépések – Defense in Depth

1. **IDS/IPS mélyebben** – Suricata vagy Snort telepítés és szabályok tanulása  
2. **Brute-force + credential stuffing detektálás** – Splunk + Fail2ban összekötése  
3. **SIEM finomhangolás** – Splunk dashboard, saját riasztások  
4. **Rate limiting és connection hardening** – iptables / pf / nginx WAF szabályok  
5. **Projekt**: Mini-SOC HomeLabben → naplózás + riasztás + automatikus védelem

---

## 📅 Jegyzet meta

- **Verzió**: 2025-07-21  
- **Frissítés**: következő modulban IDS/IPS hardening gyakorlati lépései

---

> „A megelőzés mindig olcsóbb, mint a kármentés. A log a barátod – a csend a legrosszabb ellenséged.”
