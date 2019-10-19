select k.sifra, k.naziv, lista.NazivKluba, lista.komada
from kazete k join
    (select b.sifrakazete, s2.NazivKluba, count(b.BarCode) komada
    from bcodekazete b, statusfilma s, setup s2
    where b.Status=s.sifra and s.Zbroj=1 and s2.sifrakluba=b.sifra_videokluba
    group by b.sifrakazete, s2.NazivKluba) lista on k.sifra=lista.sifrakazete
having lista.komada>2
order by 1
