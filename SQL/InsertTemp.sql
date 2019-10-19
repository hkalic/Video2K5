insert into temp_a
select b.sifrakazete, count(b.sifrakazete) Komada, b.sifra_videokluba, b.sifra_medija
from bcodekazete b, statusfilma s
where b.status=s.sifra
and s.zbroj=1
group by b.sifrakazete, b.sifra_videokluba, b.sifra_medija


