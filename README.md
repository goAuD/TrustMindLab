# Welcome, in my HomeLab Project!

<details>
<summary><strong>  Introduction – Who I am and what this project is about</strong></summary>

My name is Viktor Halupka, I was born in Budapest, and I have been living in Austria since 2014.  
Since my childhood (Commodore 64), I have been interested in the world of IT, but I worked in the gastronomy industry for a long time.  
At the age of forty, however, I decided to make a dream come true: to work professionally with IT, networks, and servers.

This homelab project is the first step on that path: I am building a real, working test environment on my own budget and in my free time, in order to gain hands-on experience in system and network administration.

This is not a perfectly sterile lab, but rather a fine worked, dynamically evolving learning platform, with its own mistakes, solutions, and documentation.

My goal with this project is to:  
- demonstrate my progress,  
- help other beginners who are starting a similar journey, and  
- convince my future employer that they are dealing with a motivated, eager-to-learn, and practical-minded person.

**It’s never too late to change direction – the only thing that matters is that you take the first step.**

</details>

---

<details>
<summary><strong>  Equipment Overview |2025|</strong></summary>

### Workstations and Servers

***MSI Thin 15 B12UC laptop:***  
- CPU: Intel Core i5 (12th generation)  
- RAM: 32 GB  
- VGA: Nvidia RTX 3050  
- Storage: 1 TB NVMe SSD  
- OS: Fedora Linux  
- Purpose: Learning system administration, network simulations, monitoring  

***Windows 11 Pro PC (main server):***  
- CPU: Intel Core i7-8700K  
- RAM: 32 GB  
- VGA: Nvidia RTX 3060 Ti  
- Storage: 2× 1 TB NVMe SSD, 1 TB HDD  
- Roles: Plex + Tailscale media server, planned NGINX web server  

***HP 15-ba106ng laptop (pfSense router):***  
- CPU: AMD A9-9410  
- RAM: 8 GB  
- Storage: 1 TB HDD  
- OS: pfSense (fresh install, in configuration)  
- Roles: Firewall, DHCP, NAT, VLAN, port forwarding, VPN (WireGuard planned)  

### Network

- Netgear GS308E managed switch (8 ports)  
- UNI USB–Ethernet adapter for HP laptop  
- ISP Routers:  
  - ZTE MC888A Ultra (5G, main internet)  
  - ZTE H338A (4G, backup)  

### Mobile Devices

- iPhone 11 (static public IP, uses Tailscale)  
- Samsung tablet (Android 14, media playback, remote access)  

### Backup and Security

- Weekly full system backup with Windows built-in tool  
- Planning incremental backups  
- Documents on OneDrive for mobile access  
- Plexamp + Tailscale used during commutes for music  
- Tailscale exit node automatically enabled on iPhone for public network security  

</details>

---

<details>
<summary><strong>  Planned Developments</strong></summary>
  
- Set up NGINX web server on Windows  
- Create basic static website for portfolio/monitoring  
- Finish pfSense full configuration  
- Automate Wake-on-LAN and remote management  
- Update automation with Ansible
- Docker installation with Photoprism for photo cataloging and secure, remote access from mobile
- Planning Wake-on-LAN and remote server control automation 

</details>

---

<details>
<summary><strong>  Log |2025-06-08|</strong></summary>  
  
  ***System Tweaks:***
- Pagefile set to initial 1024 MB, max 4892 MB on SSD (works well with 32 GB RAM)

***Network Setup:***  
- UPnP enabled (helps Plex and Tailscale)  
- SIP-ALG still on, will disable after Wi-Fi Calling off  
- MAC/IP/Port Filtering disabled (unnecessary)  
- DMZ not used  
- Manual port forwarding for Plex (32400) working; UPnP might be disabled
- pfSense configuration ongoing (WAN/LAN, VLAN, WireGuard, port forwarding)  

***Plex + Tailscale:***  
- Direct connection enabled, better and stable streaming  
- iPhone uses Tailscale *exit node* depending on network  
- Plex works flawlessly over Tailscale  

</details>

---

### ***To be continued...***

---

