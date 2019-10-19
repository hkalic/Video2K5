SELECT COUNT(r.sifra)
FROM rezervacija r, bcodekazete b
WHERE (r.statusflag='X' OR r.statusflag='D')
AND r.barcode=b.barcode
[KLUB]