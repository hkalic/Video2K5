�
 TFFILMOVIDLG 0   TPF0TFFilmoviDlgFFilmoviDlgLeft_Top� BorderIconsbiSystemMenu BorderStylebsDialogCaptionFilmoviClientHeight�ClientWidth.Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
KeyPreview	OldCreateOrderPositionpoScreenCenter
OnActivateFormActivateOnClose	FormClose	OnKeyDownFormKeyDown
OnKeyPressFormKeyPressPixelsPerInch`
TextHeight TPanelPanel2Left Top�Width.HeightAlignalBottom
BevelInner	bvLoweredTabOrder  TLabelLabel16Left	TopWidth1HeightCaption<ENTER>Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel17Left=TopWidth2HeightCaption   Zaduži film  TLabelLabel18Left� TopWidth/Height	AlignmenttaRightJustifyAutoSizeCaption<ESC>Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel15Left� TopWidth+HeightCaptionPovratak  TLabelLabel1Left�TopWidth/Height	AlignmenttaRightJustifyAutoSizeCaption<F11>Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel2Left�TopWidthUHeightCaptionSvi mediji filmaFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel3Left@TopWidth$Height	AlignmenttaRightJustifyAutoSizeCaption<F12>Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel4LeftfTopWidthQHeightCaptionPodaci o filmuFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel5LeftTopWidth/Height	AlignmenttaRightJustifyAutoSizeCaption<F10>Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel6Left6TopWidth\HeightCaption   Posdbe članovaFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont   	TwwDBGrid	wwDBGrid1Left Top Width.Height�Selected.StringscOznaka	4	   		Sifra	7	Broj filma		Naziv	43	Naziv filma		 OrginalNaziv	32	Naziv orginala		   NazivZanra	15	Naziv žanra		BrKazeta	5	Ukupno	F	IzdanoKop	5	Izdano		razDVD	5	DVD		razVHS	5	VHS		 IniAttributes.FileNamePero.iniIniAttributes.SectionName	wwDBGrid1IniAttributes.Delimiter;;
TitleColorclMoneyGreen	FixedCols ShowHorzScrollBar	AlignalClient
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicator
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExit
dgWordWrap 
ParentFontReadOnly	TabOrderTitleAlignmenttaLeftJustifyTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
TitleLinesTitleButtonsOnCalcCellColorswwDBGrid1CalcCellColors	OnKeyDownwwDBGrid1KeyDown
OnKeyPresswwDBGrid1KeyPress  TDataSourceDataSource1DataSetTFilmLeft�Top�   TMySQLQueryTFilmServerPodaci.myDBSQL.StringsSELECT ?k.Sifra, k.Naziv, k.OrginalNaziv, v.naziv NazivZanra, k.ObrisanFROM kazete k, vrsta vWHERE [STA]AND k.zanr=v.sifra2GROUP BY k.Sifra, k.Naziv, k.OrginalNaziv, v.naziv[ORDER][LIMIT] 	OnExecSQLLogujOnCalcFieldsTFilmCalcFieldsLeft�Top�  TStringFieldTFilmcOznakaDisplayLabel   DisplayWidth	FieldKindfkCalculated	FieldNamecOznakaOrigincOznakaSize
Calculated	  TIntegerField
TFilmSifra	AlignmenttaLeftJustifyDisplayLabel
Broj filmaDisplayWidth	FieldNameSifraOriginkazete.SifraRequired	  TMySQLStringField
TFilmNazivDisplayLabelNaziv filmaDisplayWidth+	FieldNameNazivOriginkazete.NazivSize
StringTypestNormal  TMySQLStringFieldTFilmOrginalNazivDisplayLabelNaziv orginalaDisplayWidth 	FieldNameOrginalNazivOriginkazete.OrginalNazivSize
StringTypestNormal  TMySQLStringFieldTFilmNazivZanraDisplayLabel   Naziv žanraDisplayWidth	FieldName
NazivZanraOriginvrsta.NazivSize
StringTypestNormal  TSmallintFieldTFilmBrKazetaDisplayLabelUkupnoDisplayWidth	FieldKindfkLookup	FieldNameBrKazetaLookupDataSet	TBrKazetaLookupKeyFieldssifrakazeteLookupResultFieldBrKazeta	KeyFieldsSifraOriginUkupnoLookup	  TSmallintFieldTFilmIzdanoKopDisplayLabelIzdanoDisplayWidth	FieldKindfkLookup	FieldName	IzdanoKopLookupDataSetTIzdanoLookupKeyFieldssifrakazeteLookupResultFieldIzdano	KeyFieldsSifraOrigin	IzdanoKopLookup	  TIntegerFieldTFilmrazDVDDisplayLabelDVDDisplayWidth	FieldKindfkCalculated	FieldNamerazDVDOriginrazDVD
Calculated	  TIntegerFieldTFilmrazVHSDisplayLabelVHSDisplayWidth	FieldKindfkCalculated	FieldNamerazVHSOriginrazVHS
Calculated	  TSmallintField	TFilmuDVDDisplayWidth	FieldKindfkLookup	FieldNameuDVDLookupDataSetTuDVDLookupKeyFieldssifrakazeteLookupResultFielduDVD	KeyFieldsSifraOriginuDVDVisibleLookup	  TSmallintField	TFilmuVHSDisplayWidth	FieldKindfkLookup	FieldNameuVHSLookupDataSetTuVHSLookupKeyFieldssifrakazeteLookupResultFielduVHS	KeyFieldsSifraOriginuVHSVisibleLookup	  TSmallintFieldTFilmDVD	FieldKindfkLookup	FieldNameDVDLookupDataSetTDVDLookupKeyFieldssifrakazeteLookupResultFieldDVD	KeyFieldsSifraOriginDVDVisibleLookup	  TSmallintFieldTFilmVHS	FieldKindfkLookup	FieldNameVHSLookupDataSetTVHSLookupKeyFieldssifrakazeteLookupResultFieldVHS	KeyFieldsSifraOriginVHSVisibleLookup	  TMySQLStringFieldTFilmObrisan	FieldNameObrisanOriginkazete.ObrisanRequired	VisibleSize
StringTypestNormal   TMySQLQuery	TBrKazetaServerPodaci.myDBSQL.Strings/SELECT COUNT(b.barcode) BrKazeta, b.sifrakazete"FROM bcodekazete b, statusfilma s WHERE b.status=s.sifra AND s.zbroj>0 GROUP BY b.sifrakazete 	OnExecSQLLogujLeft�Top�   TDataSourceds2DataSet	TBrKazetaLeft�Top�   TMySQLQueryTIzdanoServerPodaci.myDBSQL.Strings-SELECT COUNT(b.barcode) Izdano, b.sifrakazete"FROM bcodekazete b, statusfilma s WHERE b.status=s.sifra AND s.zbroj>0 AND b.Izdano='D' GROUP BY b.sifrakazete 	OnExecSQLLogujLeft�Top�   TDataSourceds3DataSetTIzdanoLeft�Top�   TMySQLQueryTuDVDServerPodaci.myDBSQL.Strings+SELECT COUNT(b.barcode) uDVD, b.sifrakazete+FROM bcodekazete b, medij m, statusfilma s %WHERE b.status=s.sifra AND s.zbroj>0 2AND b.sifra_medija=m.Sifra AND m.naljepnica='DVD' AND b.sifra_videokluba=[KLUB] GROUP BY b.sifrakazete 	OnExecSQLLogujOnMacroDajKlubLeftTop�   TDataSourceds4DataSetTuDVDLeftTop�   TMySQLQueryTuVHSServerPodaci.myDBSQL.Strings+SELECT COUNT(b.barcode) uVHS, b.sifrakazete+FROM bcodekazete b, medij m, statusfilma s %WHERE b.status=s.sifra AND s.zbroj>0 2AND b.sifra_medija=m.Sifra AND m.naljepnica='VHS' AND b.sifra_videokluba=[KLUB] GROUP BY b.sifrakazete 	OnExecSQLLogujOnMacroDajKlubLeft(Top�   TDataSourceds5DataSetTuVHSLeft(Top�   TMySQLQueryTDVDServerPodaci.myDBSQL.Strings*SELECT COUNT(b.barcode) DVD, b.sifrakazete+FROM bcodekazete b, medij m, statusfilma s %WHERE b.status=s.sifra AND s.zbroj>0 2AND b.sifra_medija=m.Sifra AND m.naljepnica='DVD' AND b.Izdano='D'AND b.sifra_videokluba=[KLUB] GROUP BY b.sifrakazete 	OnExecSQLLogujOnMacroDajKlubLeftHTop�   TDataSourceds6DataSetTDVDLeftHTop�   TMySQLQueryTVHSServerPodaci.myDBSQL.Strings*SELECT COUNT(b.barcode) VHS, b.sifrakazete+FROM bcodekazete b, medij m, statusfilma s %WHERE b.status=s.sifra AND s.zbroj>0 2AND b.sifra_medija=m.Sifra AND m.naljepnica='VHS' AND b.Izdano='D'AND b.sifra_videokluba=[KLUB] GROUP BY b.sifrakazete 	OnExecSQLLogujOnMacroDajKlubLefthTop�   TDataSourceds7DataSetTVHSLefthTop�    