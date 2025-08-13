# 🛡️ Kerberos Cheat Sheet (Human-Friendly Edition)

## 🎭 Mi az a Kerberos?

Egy jegyalapú (ticket-based) hitelesítési protokoll. Célja: biztonságos hálózati bejelentkezés JELSZÓ elküldése nélkül.

- Használja: főleg Windows Active Directory (de Unix rendszereken is van támogatás).
- Működési elv: “Bejelentkezel, kapsz egy belépőt, azzal mehetsz a szolgáltatásokhoz.”

## 🧪 Emlékeztető analógia

```ini
🎫 TGT = éves bérlet
🎟️ Service Ticket = adott mozihoz jegy
🏛️ KDC = mozijegypénztár
💼 Client = te, aki sorban állsz
```

## 🧩 Alapfogalmak

- **KDC** – Key Distribution Center (2 része van):
  - **AS** – Authentication Server
  - **TGS** – Ticket Granting Server
- **TGT** – Ticket Granting Ticket
- **ST** – Service Ticket
- **Principal** – bárki vagy bármi, ami be akar jelentkezni (user, service)
- **Realm** – Kerberos tartomány (pl. `MYDOMAIN.LOCAL`)

---

## 🏗️ Fő összetevők

| Komponens | Szerep |
|----------|--------|
| **Client** | A felhasználó, aki be akar lépni |
| **KDC (Key Distribution Center)** | A központi agy, 2 részből áll: |
| → Authentication Server (AS) | Ellenőrzi, hogy te vagy-e, akinek mondod magad |
| → Ticket Granting Service (TGS) | Jegyeket oszt a szolgáltatásokhoz |
| **TGT (Ticket Granting Ticket)** | "Igazolvány", amit az AS ad, ezzel kérsz más jegyeket |
| **Service Ticket** | Ezzel jutsz el egy adott szolgáltatáshoz (pl. fájlszerver) |

---

## 🔁 Hitelesítési Folyamat – 5 lépésben

1. **User login → KDC/AS**  
   → `username + timestamp` →  
   KDC küld vissza egy **TGT**-t (titkosítva a jelszóból származtatott kulccsal)

2. **User → dekódolja TGT-t**  
   Ha helyes a jelszó → megkapja a session key-t és TGT-t

3. **User → KDC/TGS-hez**  
   → elküldi a TGT-t + a kívánt szolgáltatás nevét  
   (pl. `HTTP/server.example.com`)

4. **TGS → visszaadja a Service Ticket-et**

5. **User → Szolgáltatás (pl. Web server)**  
   → elküldi a Service Ticket-et  
   Szolgáltatás dekódolja → **user hitelesítve** 🎉

---

## 🧠 Megjegyzés

- Minden jegy (ticket) időhöz kötött (timestamp alapján működik)
- Szinkronizált idő **kritikus** (pl. NTP kötelező)
- Alkalmas **SSO**-ra (Single Sign-On)
- Főként **Windows Active Directory** környezetben elterjedt

---

## 🧠 Miért nehéz?

- Titkos kulcsos titkosítás minden lépésnél (symmetric crypto).
- Time-based (clock drift = 😭).
- Tickets időhöz kötöttek (lejárnak).
- Csak centralizált KDC-vel működik.
- Platformfüggő (főleg Windows)
- Debugolni: horror. *Dark Souls szintű kihívás*

---

## 🔐 Milyen támadások vannak?

| Támadás | Röviden |
|--------|---------|
| **Pass-the-Ticket** | Ellopott jeggyel próbálkozik |
| **Golden Ticket** | Hamisított TGT master kulcsból |
| **Silver Ticket** | Hamisított service ticket |
| **Kerberoasting** | Service Account jelszavak kisütése offline brute-force-al |

---

## 🎯 Mikor kell ezzel foglalkoznod?

✅ Ha:

- Active Directory környezetben dolgozol
- Pentester / Blue Team vagy
- Windows szervereket integrálsz

❌ Nem kell (vagy alig), ha:

- DevSecOps / Linux környezetben vagy
- Modern auth: OAuth2, OpenID, SAML, JWT
- Cloud-native / CI/CD / microservices irány

---

## 🛠️ Parancsok Linuxon (ha mégis kell)

```bash
kinit viktor@REALM.COM        # Bejelentkezés Kerberos-szal
klist                         # Aktív jegyek listája
kdestroy                     # Jegyek törlése
```

---

## 🧯 Túlélési Tipp

> "Ha nem muszáj, **ne konfigurálj Kerberost kézzel**. Ha muszáj: készíts jegyzetet, állítsd be az órát, és hívj egy segítőt." 😅
