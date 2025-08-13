# 🧙‍♂️ The Sysadmin's Verse 🧙‍♂

[![Join the TrustMindLab Discussions](https://img.shields.io/badge/💬_Join-TrustMindLab-blueviolet)](https://github.com/goAuD/MyHomeLab/discussions/1)
<div class="badge-base LI-profile-badge" data-locale="hu_HU" data-size="medium" data-theme="light" data-type="VERTICAL" data-vanity="viktor-halupka-weiz" data-version="v1"><a class="badge-base__link LI-simple-link" href="https://at.linkedin.com/in/viktor-halupka-weiz?trk=profile-badge">Viktor Halupka</a></div>

---

```ini
One Firewall to rule all them,
One DNS to find them,
One DHCP to bring them all,
And in the darkness bind them.

```

## *A pfSense tale where NAT and DHCP rules reign supreme - and only one sysadmin apprentice stands between order and chaos.*

> *"Tuned in the darkest corners of Mordor..."*

pfSense Dashboard Snapshot:

![Dashboard](assets/img/pfsense-dashboard.png)

---

Status of my pfSense - minimal CPU load, low memory usage, and a KEA-powered DHCP. Yes, DNS Unbound still reigns supreme.

---

## Synopsis

This isn’t just a HomeLab project. This is an epic.

An old HP laptop, once forgotten, rises again – not as a client, but as a firewall.  
The hero's journey spans two interfaces: one toward the ISP, one into the heart of the LAN.  
Along the way, they face mythical entities such as `dhcpd`, the `pfctl` daemon, and the fearsome `nbound`.

## ⚔️ The Quest

- [x] Install pfSense on a 2017-ish laptop that wheezes under load

- [x] Configure WAN/LAN interfaces (with some reboot rituals)

- [x] Grant LAN devices access to the internet – *finally*

- [x] Explore the dark arts of port forwarding

- [x] Integrate Tailscale, Plex, DNS

- [ ] Never reinstall again (lol, sure...)

---

## 🧱 How I Stabilized pfSense on an Old Laptop — A DIY Firewall Journey

## 🎯 Goal

Build a reliable and secure pfSense firewall on aging hardware, using only minimal resources — and **a lot of patience**.

---

## 🛠️ The Setup

- **Device:** 2017 HP notebook (AMD A9, 8 GB RAM)

- **Interfaces:** One internal Ethernet, one USB → Gigabit Ethernet (AX88179, now UGREEN)

- **OS:** pfSense CE 2.8, native install (not virtualized)

- **Use Case:** LAN gateway, firewall, DNS resolver, pfBlockerNG, with optional remote access

---

## ⚠️ The Challenge

The USB-LAN adapter (`ue0`) kept randomly **dropping the link**, causing:

- 🔄 Flapping interface state (`ue0: link state changed`)

- 📉 LAN interruption & WAN routing failure

- 🔁 Continuous `/rc.linkup` and filter reloads

- ❌ Unstable network and IPsec/VPN issues

---

## 🔍 Troubleshooting Summary

### ✅ What Worked

1. **Replaced old USB-Ethernet adapter with a UGREEN AX88179**  
   → Significantly better chipset + driver stability

2. **Switched USB port from left to right**  
   → Avoided a possibly damaged USB controller on the mainboard

3. **Used a powered USB hub**  
   → Provided stable and sufficient power to the adapter

4. **Stopped moving cables unnecessarily**  
   → Even small shifts could still trigger disconnects, so proper cable management is key

5. **Monitored logs closely (`system.log`, `dmesg`, `usbconfig`)**  
   → Identified real root cause: hardware/port instability, not pfSense fault

---

## 💬 Lessons Learned

- 🧠 *Software stability is meaningless if your hardware is unstable.*

- ⚡ *Powered USB hubs can be lifesavers in embedded setups.*

- 🧯 *Sometimes the simplest change (port switch) solves cascading issues.*

- 🛜 *Don’t trust every USB adapter — go with a reliable chipset (ASIX, Realtek with known FreeBSD support).*

- 📝 *Document everything. Your logs will tell the story if you’re listening.*

---

## 🧩 Known Limitations

- Still **avoiding unnecessary cable movement**, as it may destabilize the connection.

- USB 2.0 may bottleneck gigabit speeds, but my ISP speed (250 Mbps) is still fully supported.

- Long-term plan: replace with a fanless, silent, multi-NIC firewall appliance.

---

## 🏁 Final Words

It wasn’t easy, but I built a working, stable pfSense firewall using:

> 🔌 Old hardware  
> 🛠️ Cheap parts  
> 🧠 Knowledge  
> ⏳ Patience  
> 🤝 And a helpful AI partner.

I now have a reliable firewall, full control over my LAN, and a great learning experience.  
This journey proves: **you don’t need expensive hardware to build a professional-grade home lab — just persistence**.

---

## 🧙‍♂️ *Written after ca. 1 month of real-time troubleshooting, logging, and testing. If you’re reading this and struggling: keep going. You're not alone.* 🧙‍♂️
