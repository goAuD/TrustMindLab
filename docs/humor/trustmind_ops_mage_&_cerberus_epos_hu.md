# 🧟‍♂️ Kerberos Jungle Expedition (visual edition)

## 👨‍💻 Szereplők

Te: “Á, csak beállítom gyorsan a Kerberost…”
Haver: “Biztos vagy benne, tesó? Nálam van egy fejsze és két kávé.”
Cerberus (Kerberos): “Who dares disturb my realm?! 🔥”

## ✨ A "gyors beállítás" valósága

1. krb5.conf megnyitása
15 perc néma merengés:
„Ez a sor… mit jelent? És ez? És miért van belőle három?”
2. Realm beírása
Nem egyezik az AD realm-mel:
Authentication failed. 🤷‍♂️
3. Idő szinkronizáció nincs
"Clock skew too great"
"Dehát csak 3 percet késett a gépem!"
4. Ticketek törlése: kdestroy
Majd:
"Semmi se változott."
Megint:
"Restart kell."

---

## 🧙‍♂️ Megjelenik a Túlélőtárs

"Haver, te csak tekerd vissza az órát, én addig újraindíom a Winbindet..."
"De várj, milyen realm-ben vagyunk?!"
"Fogalmam sincs, de az AD szerint nincs is ilyen user..." 😭

## 🔚 Végül:

✅ "kerberos is finally configured."
♻️ 3 nap múla:
semmi se működik, mert lejárt egy ticket, vagy az órád előreszaladt.

## 🧙‍♂️ Bölcsesség a végére:

```ini
Aki saját kezűleg beállította már a Kerberost és túlélte,
az nem is DevOps, hanem DarkOps Mage.
(Csak ők látnak bele az AS–TGS misztikus kapcsolatába...)
```
