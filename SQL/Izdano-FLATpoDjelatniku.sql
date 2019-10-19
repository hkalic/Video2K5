select d.Naziv, ifnull(IZDANO.umedija,0) Ukupno_medija, ifnull(FLAT.UFlat,0) Ukupno_Flat, ifnull(KDUkupno.KDjelatnika,0) Ukupno_KDjelatnika, 
ifnull(IZDANO.umedija,0)-ifnull(FLAT.UFlat,0)-ifnull(KDUkupno.KDjelatnika,0) AS UKUPNO
from radnici d left outer join
     (SELECT p.operater, COUNT(p.bcodekaz) as UMedija
     FROM pos_solid p
     WHERE p.datumpos BETWEEN [DATOD] AND [DATDO]
     GROUP BY p.operater) IZDANO on d.sifra=IZDANO.operater
left outer join
     (select r.radnik, count(rd.sifrakazete) as UFlat
     from racunidetail rd, racuni r, clanovi c
     where rd.sifraracuna=r.sifra
     and c.sifra=r.sifraclana
     and c.statuspougovoru=8
     and r.sifraclana=c.sifra
     and r.vrstaracuna=1
     and r.popust=100
     and r.datum between [DATOD] AND [DATDO]
     group by r.radnik) FLAT on d.ID=FLAT.radnik
left outer join
    (select r.radnik, count(rd.sifrakazete) as KDjelatnika
     from racunidetail rd, racuni r, clanovi c
     where rd.sifraracuna=r.sifra
     and c.sifra=r.sifraclana
     and c.statuspougovoru=7
     and r.sifraclana=c.sifra
     and r.vrstaracuna=1
     and r.popust=100
     and r.datum between [DATOD] AND [DATDO]
     group by r.radnik) KDUkupno on d.ID=KDUkupno.radnik
