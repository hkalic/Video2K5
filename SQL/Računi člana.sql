select r.sifra, r.datum, r.popust, v.kratkinaziv, r.cifra,
k.naziv, d.brdan*d.dan + d.brsvaki*d.svaki + d.brvikend*d.vikend + d.brblagdan*d.blagdan UKUPNO
from racuni r left outer join racunidetail d on r.sifra=d.sifraracuna
left outer join kazete k on d.sifrakazete=k.sifra, vrstaracuna v 
where r.sifraclana=31
and extract(year from r.datum)=2004
and r.vrstaracuna=v.vrstaracuna
order by r.datum