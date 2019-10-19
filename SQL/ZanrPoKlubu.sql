SELECT s.nazivkluba, v.naziv, COUNT(v.naziv) UZanr
FROM pos_solid k, setup s, bcodekazete b, kazete x, vrsta v
WHERE k.sifrakluba=s.sifrakluba
AND k.bcodekaz=b.barcode
AND b.sifrakazete=x.sifra
AND v.sifra=x.zanr
AND k.datumpos BETWEEN [DATOD] AND [DATDO]
GROUP BY s.nazivkluba, v.naziv