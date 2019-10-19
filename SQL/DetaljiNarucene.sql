SELECT r.sifra, r.sifrakazete, r.barcode, k.naziv, m.naziv, 
r.datum, r.sifraclana, c.imeprezime, r.statusflag
FROM rezervacija r, bcodekazete b, medij m, kazete k, clanovi c
WHERE r.statusflag IN ('X','D')
AND r.barcode=b.barcode
AND b.sifra_medija=m.sifra
AND r.sifrakazete=k.sifra
AND r.sifraclana=c.sifra
