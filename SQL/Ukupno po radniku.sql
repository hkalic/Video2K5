select r.radnik, SUM(d.dan*d.brdan+d.svaki*d.brsvaki+d.vikend*d.brvikend+d.blagdan*d.brblagdan) as Iznos, COUNT(r.radnik) Broj
from racunidetail2 d, racuni2 r
where d.sifraracuna=r.sifra 
and r.sifrakluba in (7, 9)
and month(r.datum)=12
and year(r.datum)=2009
group by r.radnik
order by 2 desc
