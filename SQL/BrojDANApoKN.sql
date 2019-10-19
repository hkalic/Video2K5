SELECT t.kuna, SUM(t.komada) kom
FROM (select d.dan kuna, sum(d.brdan) komada 
     from racunidetail d, racuni r where d.sifraracuna=r.sifra and r.sifrakluba [KLUB] and r.datum between [OD] and [DO] and d.brdan<>0 group by d.dan union
     select d.svaki kuna, sum(d.brsvaki) komada 
     from racunidetail d, racuni r where d.sifraracuna=r.sifra and r.sifrakluba [KLUB] and r.datum between [OD] and [DO] and d.brsvaki<>0 group by d.svaki union
     select d.vikend kuna, sum(d.brvikend) komada 
     from racunidetail d, racuni r where d.sifraracuna=r.sifra and r.sifrakluba [KLUB] and r.datum between [OD] and [DO] and d.brvikend<>0 group by d.vikend union
     select d.blagdan kuna, sum(d.brblagdan) komada 
     from racunidetail d, racuni r where d.sifraracuna=r.sifra and r.sifrakluba [KLUB] and r.datum between [OD] and [DO] and d.brblagdan<>0 group by d.blagdan union
     select d.dan kuna, sum(d.brdan) komada
     from racunidetail2 d, racuni2 r where d.sifraracuna=r.sifra and r.sifrakluba [KLUB] and r.datum between [OD] and [DO] and d.brdan<>0 group by d.dan union
     select d.svaki kuna, sum(d.brsvaki) komada 
     from racunidetail2 d, racuni2 r where d.sifraracuna=r.sifra and r.sifrakluba [KLUB] and r.datum between [OD] and [DO] and d.brsvaki<>0 group by d.svaki union
     select d.vikend kuna, sum(d.brvikend) komada 
     from racunidetail2 d, racuni2 r where d.sifraracuna=r.sifra and r.sifrakluba [KLUB] and r.datum between [OD] and [DO] and d.brvikend<>0 group by d.vikend union
     select d.blagdan kuna, sum(d.brblagdan) komada 
     from racunidetail2 d, racuni2 r where d.sifraracuna=r.sifra and r.sifrakluba [KLUB] and r.datum between [OD] and [DO] and d.brblagdan<>0 group by d.blagdan
     ) AS t
WHERE t.kuna<>0
GROUP BY t.kuna
ORDER BY 1
