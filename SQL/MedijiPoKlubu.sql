SELECT s.nazivkluba, m.naziv, COUNT(m.naziv) UMedija
FROM pos_solid k, setup s, bcodekazete b, medij m
WHERE k.sifrakluba=s.sifrakluba
AND k.bcodekaz=b.barcode
AND b.sifra_medija=m.sifra
AND k.datumpos BETWEEN [DATOD] AND [DATDO]
GROUP BY s.nazivkluba, m.naziv
