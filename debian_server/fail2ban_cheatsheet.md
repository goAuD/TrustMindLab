# Fail2ban Cheat Sheet (Debian-based Systems)

## 📦 Installation

```bash
sudo apt update
sudo apt install -y fail2ban
```

## ⚠️ Required: Enable rsyslog for SSH log monitoring

```bash
sudo apt install -y rsyslog
sudo systemctl enable rsyslog --now
```

> **Fail2ban depends on /var/log/auth.log which is created by rsyslog.**

---

## 🔐 Basic Usage (SSH protection)

```bash
sudo systemctl enable fail2ban --now
```

> **This activates the default sshd jail.**

---

## 🔎 Check Status

```bash
sudo fail2ban-client status
sudo fail2ban-client status sshd
```

---

## ⚙️ Configuration Files

- Main config (read-only): /etc/fail2ban/jail.conf

- Debian jail: /etc/fail2ban/jail.d/defaults-debian.conf

- Custom jails (recommended): /etc/fail2ban/jail.local.

---

## 🐞 Troubleshooting

### Problem: Fail2ban fails to start

> ERROR   Failed during configuration: Have not found any log file for sshd jail

1. **⚙️ Fix:**

- Make sure /var/log/auth.log exists (install rsyslog)

-  Run fail2ban manually to debug:

```bash
sudo fail2ban-client -v -x start
```

2. **🔥 Ban Log**

```bash
sudo cat /var/log/fail2ban.log
```

1. **📤 Unban IP**

```bash
sudo fail2ban-client set sshd unbanip 192.168.0.100
```
