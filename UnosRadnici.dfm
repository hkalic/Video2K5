�
 TFUNOSRADNICI 0�  TPF0�TFUnosRadniciFUnosRadniciLeft� Top� Caption   Matični podaci o djelatnicimaPixelsPerInch`
TextHeight �TPageControlPregled �	TTabSheetTpregled �TToolBarTBar �TDBNavigatorDBNavigator3Hints.Strings     �	TTabSheetTunos �TPanelPanel1 �TLabelLabel4LeftTopRWidthZHeight	AlignmenttaRightJustifyAutoSizeCaptionPrezime i imeFocusControlDBEdit2Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  �TLabelLabel5Left8Top� Width2Height	AlignmenttaRightJustifyAutoSizeCaptionAdresaFocusControlDBEdit3Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  �TLabelLabel6Left8Top� Width2Height	AlignmenttaRightJustifyAutoSizeCaptionPtt brojFocusControlDBEdit4Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  �TLabelLabel7Left8Top� Width2Height	AlignmenttaRightJustifyAutoSizeCaptionMjestoFocusControlDBEdit5Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  �TLabelLabel8Left+TopWidth?Height	AlignmenttaRightJustifyCaptionPASSWORDFocusControlDBEdit6Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  �TLabelLabel2Left8TopxWidth2Height	AlignmenttaRightJustifyAutoSizeCaption	ID oznakaFocusControlDBEdit7Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  �TLabelLabel30TagLeft3TopqWidth4Height	AlignmenttaRightJustifyCaptionNaziv firmeFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBEditDBEdit2Tag� LeftmTopNWidthHeight	DataFieldNaziv
DataSourceDSTabOrder  TDBEditDBEdit3LeftmTop� Width� HeightCharCaseecUpperCase	DataFieldUlica
DataSourceDSTabOrder  TDBEditDBEdit4LeftmTop� WidthAHeight	DataFieldPtt
DataSourceDSTabOrder  TDBEditDBEdit5LeftmTop� Width� HeightCharCaseecUpperCase	DataFieldMjesto
DataSourceDSTabOrder  TDBEditDBEdit6LeftmTopWidthPHeightCharCaseecUpperCase	DataFieldLozinka
DataSourceDSPasswordChar*TabOrder  TDBCheckBoxDBCheckBox1LeftnTop1Width� HeightCaption   Djelatnik više nije zaposlen	DataField	NeVrijedi
DataSourceDSFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrderValueCheckedDValueUncheckedNVisible
OnKeyPressKpress  TDBCheckBoxDBCheckBox2LeftnTopLWidth� HeightCaptionVlasnik (sva prava)	DataFieldVlasnik
DataSourceDSFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrderValueCheckedDValueUncheckedN
OnKeyPressKpress  TDBEditDBEdit7LeftmToptWidth,HeightCharCaseecUpperCase	DataFieldID
DataSourceDSTabOrder  TRxDBLookupComboRxDBLookupCombo7TagLeftmTopmWidth� HeightHint   CTRL-ENTER ulazak u šifarnikDropDownCountDropDownWidth� ColorclSilver	DataField
SifraFirme
DataSourceDSLookupField
sifrafirmeLookupDisplaynazivpoduzecaLookupSourcedSetupParentShowHintShowHint	TabOrder	
OnKeyPressKpress     �TDataSourceDSDataSetTradnici  �TMySQLQueryTQ	TableNameradnici TAutoIncFieldTQSifra	FieldNameSifraReadOnly	  TStringFieldTQNazivDisplayLabelPrezime i ime	FieldNameNazivSize  TStringFieldTQUlicaDisplayLabelAdresa	FieldNameUlica  TIntegerFieldTQPtt	FieldNamePtt  TStringFieldTQMjesto	FieldNameMjesto  TStringField	TQLozinka	FieldNameLozinkaVisibleSize  TStringField	TQVlasnik	FieldNameVlasnikVisibleSize  TStringFieldTQNeVrijedi	FieldName	NeVrijediVisibleSize  TStringFieldTQIDDisplayWidth	FieldNameIDRequired	Size   TMySQLDatasetTradniciServerPodaci.myDBMasterFieldsSifra=SifraMasterSourceDQ	TableNameradnici
BeforeEditTradniciBeforeEditLeft(Top�   TMySQLDatasettSetupServerPodaci.myDBSQL.Strings select sifrafirme, nazivpoduzeca
from setupgroup by nazivpoduzecaorder by nazivpoduzeca 	TableNamesetupLefthTop�  TDataSourcedSetupDataSettSetupLeft�Top�   