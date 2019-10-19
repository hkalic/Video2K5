SELECT z.datum, s.nazivkluba, z.ZbirRacuniL, z.stopaporeza, 
z.ZbirRacuniL-(floor(z.ZbirRacuniL*z.stopaporeza/(100+z.stopaporeza)* 100 + .55)/100) osnovicaPDV, 
floor(z.ZbirRacuniL*z.stopaporeza/(100+z.stopaporeza)* 100 + .55)/100 iznosPDV,
z.izdano, z.vraceno,
(SELECT COUNT(r.sifra) FROM racuni r
 WHERE DATE(r.datum)=DATE(z.datum)
 AND z.sifrakluba=r.sifrakluba
 AND vrstaracuna=2) NoviClanovi
FROM zaklj z, setup s
WHERE z.datum BETWEEN [DATOD] AND [DATDO]
AND z.sifrakluba=s.sifrakluba
GROUP BY z.sifrakluba, z.datum
ORDER by z.sifrakluba, z.datum
