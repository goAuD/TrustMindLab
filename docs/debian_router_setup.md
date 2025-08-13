# 🛠️ Debian Router Setup – Security HomeLab

> *„Ha az alap stabil, minden ráépülő modul biztonságos lesz.”*  
> – Viktor × AI

---

## 🎯 Cél

- HP EliteDesk (Debian 12) **routerként** és **IDS hostként** üzemeljen  
- WAN/LAN szétválasztás a két NIC között  
- Alap tűzfal és NAT beállítása  
- Suricata IDS előkészítése

---

## 🔹 1. Hardver ellenőrzés

1. **Intel NIC + bracket beszerelése** a HP EliteDesk-be
2. Csatlakoztatás:
   - WAN (külső): Intel NIC → ISP router (ZTE)
   - LAN (belső): alap NIC → switch / AP
3. Ideiglenes kijelző: **Smart TV** vagy SSH telepítés után

---

## 🔹 2. Debian 12 telepítése (bare metal)

1. Töltsd le a **Debian 12 netinstall ISO-t**
   → https://www.debian.org/distrib/netinst
2. Telepítés:
   - Minimal install (nincs GUI)
   - Válaszd a **"SSH server"** és **"Standard system utilities"** csomagokat
   - Hozz létre **sudo usert** (pl. `viktor`)
3. Első boot után frissítés:

   ```bash
   sudo apt update && sudo apt full-upgrade -y
   ```

---

## 🔹 3. NIC-ek azonosítása

1. Nézd meg a hálózati interfészek nevét:

```bash
ip a
```

2. Példa:

- Intel NIC (WAN): enp3s0

- Alap NIC (LAN): enp1s0

---

## 🔹 4. Statikus IP beállítás (LAN)

1. Szerkeszd a netplan vagy interfaces fájlt:

```bash
sudo nano /etc/network/interfaces
```

2. Konfiguráció példa:

```ìni
auto enp1s0
iface enp1s0 inet static
  address 192.168.10.1
  netmask 255.255.255.0

auto enp3s0
iface enp3s0 inet dhcp
```

3. Hálózat újraindítása:

```bash
sudo systemctl restart networking
```

---

## 🔹 5. NAT és tűzfal

1. Engedélyezd az IP forwardot:

```bash
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

2. Telepítsd az iptables-t (ha nincs):

```bash
sudo apt install iptables-persistent -y
```

3. Alap NAT szabály:

```bash
sudo iptables -t nat -A POSTROUTING -o enp3s0 -j MASQUERADE
sudo netfilter-persistent save
```

## 🔹 6. DHCP szerver (LAN kliens oldalon)

