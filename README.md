# Welcome, in my HomeLab Project!

## Introduction – Who I am and what this project is about

My name is Viktor Halupka, I was born in Budapest, and I have been living in Austria since 2014.  
Since my childhood (Commodore 64), I have been interested in the world of IT, but I worked in the gastronomy industry for a long time.  
At the age of forty, however, I decided to make a dream come true: to work professionally with IT, networks, and servers.

This homelab project is the first step on that path: I am building a real, working test environment on my own budget and in my free time, in order to gain hands-on experience in system and network administration.

This is not a perfectly sterile lab – rather, a real, dynamically evolving learning platform, with its own mistakes, solutions, and documentation.

My goal with this project is to:  
- demonstrate my progress,  
- help other beginners who are starting a similar journey, and  
- convince my future employer that they are dealing with a motivated, eager-to-learn, and practical-minded person.

**It’s never too late to change direction – the only thing that matters is that you take the first step.**

---

## Equipment Overview (2025)

### Workstations and Servers

**MSI Thin 15 B12UC laptop:**  
- CPU: Intel Core i5 (12th generation – exact model can be checked with lscpu)  
- RAM: 32 GB  
- VGA: Nvidia RTX 3050  
- Storage: 1 TB NVMe SSD  
- OS: Fedora Linux  
- Main purpose: Learning, system administration, network simulations  

**Windows 11 Pro PC (main server):**  
- CPU: Intel Core i7-8700K  
- RAM: 32 GB  
- VGA: Nvidia RTX 3060 Ti  
- Storage: 2× 1 TB NVMe SSD, 1 TB HDD  
- Role:  
  - Plex + Tailscale media server (replacing the previous Jellyfin + Kodi setup)  
  - Web server: planned NGINX-based static website  

**HP 15-ba106ng laptop (as pfSense router):**  
- CPU: AMD A9-9410  
- RAM: 8 GB  
- VGA: Intel  
- Storage: 1 TB HDD  
- OS: pfSense (freshly installed, under configuration)  
- Role: Firewall, DHCP, NAT, VLAN, port forwarding, VPN (e.g. WireGuard – planned)  

---

### Network

- Netgear GS308E: 8-port managed switch  
- UNI USB–Ethernet adapter: used with HP laptop  
- ISP Routers:  
  - ZTE MC888A Ultra (5G, currently the active internet connection)  
  - ZTE H338A (4G, can be used as a backup access point)  

### Mobile Devices

- iPhone 11 is the main mobile, with static public IP, using Tailscale  
- Samsung tablet with Android 14, used for media playback and remote access  

---

### Backup and Security

- I use the built-in Windows backup for full system backups once a week.  
- I plan to try incremental backups in the near future.  
- I store my documents on OneDrive, so I have access to them when needed on the go.  
- When I drive to a job interview, I listen to music using the Plexamp + Tailscale combination.  
- On public networks, I use a Tailscale exit node on my iPhone for security when browsing; this is automatically enabled.  

---

## Planned Developments

- Setting up an NGINX web server on Windows  
- Creating a basic static website (for portfolio / monitoring purposes)  
- Full configuration of pfSense (WAN/LAN, VLAN, WireGuard, port forwarding)  
- Setting up automatic Wake-on-LAN or remote server control  

