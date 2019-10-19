update kazete
set kupljen=
    (select d.kupljen
    from kazetedetail d
    where d.sifrakazete=kazete.sifra
    and d.kupljen is not null
    LIMIT 1)
where sifra>4563

update kazete
set izdanokop=
    (select count(p.sifranebitna)
    from pos p
    where p.sifrakazete=kazete.sifra
    group by p.sifrakazete)
where sifra>4563

update kazete
set izdatputa=
    (select count(r.sifrakazete)
    from racunidetail r
    where r.sifrakazete=kazete.sifra
    group by r.sifrakazete)
where sifra>4563

update kazete
set kupljenokazeta=
    (select sum(d.kupljenokazeta)
    from kazetedetail d
    where d.sifrakazete=kazete.sifra
    group by d.sifrakazete)
where sifra>4563

update kazete
set brkazeta=
    (select count(b.sifrakazete)
    from bcodekazete b, statusfilma s
    where b.sifrakazete=kazete.sifra
    and b.status=s.sifra
    and s.zbroj>0
    group by b.sifrakazete)
where sifra>4563

update kazetedetail
set brkazeta=
    (select count(b.sifrakazete)
    from bcodekazete b, statusfilma s, setup x
    where b.sifrakazete=kazetedetail.sifrakazete
    and x.sifrafirme=kazetedetail.sifrafirme
    and b.sifra_videokluba=x.sifrakluba
    and b.status=s.sifra
    and s.zbroj>0
    group by b.sifrakazete)
where sifrakazete>4563

update kazetedetail
set izdanokop=
    (select count(p.sifranebitna)
    from pos p, setup x
    where p.sifrakazete=kazetedetail.sifrakazete
    and x.sifrafirme=kazetedetail.sifrafirme
    and p.sifrakluba=x.sifrakluba
    group by p.sifrakazete)
where sifrakazete>4563
