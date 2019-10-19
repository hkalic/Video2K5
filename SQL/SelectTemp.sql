select k.sifra,
(select t.Komada from temp_a t where t.sifra_videokluba=1 and t.sifra_medija=1 and t.sifrakazete=k.sifra) KLUB1,
(select t.Komada from temp_a t where t.sifra_videokluba=2 and t.sifra_medija=1 and t.sifrakazete=k.sifra) KLUB2,
(select t.Komada from temp_a t where t.sifra_videokluba=3 and t.sifra_medija=1 and t.sifrakazete=k.sifra) KLUB3,
(select t.Komada from temp_a t where t.sifra_videokluba=4 and t.sifra_medija=1 and t.sifrakazete=k.sifra) KLUB4,
(select t.Komada from temp_a t where t.sifra_videokluba=5 and t.sifra_medija=1 and t.sifrakazete=k.sifra) KLUB5
from kazete k

