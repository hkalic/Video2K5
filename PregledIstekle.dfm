�
 TFPREGLEDISTEKLE 0�  TPF0�TFPregledIstekleFPregledIstekleLeft� Top� Caption!   Članovi sa isteklim članarinamaClientHeight�ClientWidth�OldCreateOrder	PixelsPerInch`
TextHeight �TPanelPanel1Width�Height( �TBitBtnBtnizlazLeft�  �TBitBtnBitBtn1Left0Top	   �	TdxDBGridDBGrid1Top(Width�Height�
ParentFontFilter.Criteria
         �TDataSourceDataSource1DataSetQuery1LefttTop<  TMySQLQueryQuery1ServerPodaci.myDBSQL.Strings5SELECT c.ClanarinaVrijediDo,  c.Sifra, c.ImePrezime, -c.Adresa,  c.Telefon, c.MjStanovanja, v.nazivFROM clanovi c, vrstaupisa v#WHERE c.SifStatusPoUgovoru=v.sifra "AND c.ClanarinaVrijediDo < [DATUM]ORDER BY c.ClanarinaVrijediDo 
BeforeOpenQuery1BeforeOpenLeft0Top`   