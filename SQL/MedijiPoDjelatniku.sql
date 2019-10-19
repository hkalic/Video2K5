SELECT r.naziv DJELATNIK, m.naziv MEDIJ, COUNT(m.naziv) UMedija
FROM radnici r, bcodekazete b, medij m, pos_solid p
WHERE p.operater=r.sifra
AND p.bcodekaz=b.barcode
AND b.sifra_medija=m.sifra
AND p.datumpos BETWEEN [DATOD] AND [DATDO]
GROUP BY r.naziv, m.naziv
