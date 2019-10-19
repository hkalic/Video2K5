SELECT b.barcode, b.sifraKazete, k.naziv film, 
z.naziv zanr, m.naziv medij, s.naziv status, 
b.datum_izmjene, m.naljepnica, k.imdb, k.pg
FROM bcodekazete b, kazete k, vrsta z, medij m, statusfilma s
WHERE b.sifrakazete=k.sifra
AND z.sifra=k.zanr
AND m.sifra=b.sifra_medija
AND s.sifra=b.status
AND m.naljepnica<>''
