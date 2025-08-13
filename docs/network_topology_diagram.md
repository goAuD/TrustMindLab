# 🖼️ Network Topology Diagram – Security DarkLab

## Fő elemek:

> ISP Router/ZTE (WAN)

> HP EliteDesk (Debian router + Suricata) – WAN/LAN szétválasztás

> LAN Switch/AP – belső hálózat

> VM-ek – Proxmoxon (Parrot, Honeypot, Windows, stb.)

```ini

            🌐 Internet
                 │
            [ISP Router]
                 │
         (WAN NIC - Intel)
          HP EliteDesk 
      (Debian Router + IDS)
                 │
         (LAN NIC - on-board)
                 │
         ┌───────┴─────────┐
         │                 │
     [Switch/AP]        [Proxmox]
         │                 │
  ┌──────┼────────┐     ┌──┴─────────────┐
  │      │        │     │                │
Home  Windows   Laptop  Parrot        Honeypot
PC    Admin     (mobil  Security OS    (Cowrie)
      Laptop     device)    VM             VM
```

## 📌 Diagram meta

HP EliteDesk → központi router + Suricata IDS/IPS host

Proxmox → VM-ek (Parrot, Honeypot, teszt Windows, stb.)

Switch/AP → belső hálózat eszközei (Home PC, Laptop, Smart TV, stb.)
