SELECT p.sifranebitna, p.sifrakazete, p.bcodekaz, k.naziv film, m.naziv medij,
p.datumpos, p.sifraclana, c.imeprezime, p.vracanje
FROM pos p, bcodekazete b, medij m, kazete k, clanovi c
WHERE p.vracanje='D'
AND p.bcodekaz=b.barcode
AND b.sifra_medija=m.sifra
AND p.sifrakazete=k.sifra
AND p.sifraclana=c.sifra
