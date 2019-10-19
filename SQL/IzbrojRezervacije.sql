SELECT COUNT(r.sifra) ukupno_rez
FROM rezervacija2 r
WHERE r.status='rezervirano'
and r.zeljenidatum=[DATUM]
[KLUB]