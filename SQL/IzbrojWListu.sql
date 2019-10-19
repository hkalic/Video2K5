SELECT COUNT(w.id)
FROM whishlista w
WHERE w.status='aktivan'
AND EXISTS (SELECT b.barcode
            FROM bcodekazete b
            WHERE w.sifrafilma=b.sifrakazete
            AND b.izdano='N'
            AND b.sifra_medija=w.vrstamedija
            AND b.sifra_videokluba=[KLUB])
