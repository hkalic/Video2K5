�
 TFISPRAVAKKDLG 0p  TPF0TFIspravakKDlgFIspravakKDlgLeft�TopSActiveControlwwDBGridBorderIconsbiSystemMenu BorderStylebsDialogCaption   Ispravak kartice zaduženjaClientHeight\ClientWidthColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
KeyPreview	OldCreateOrderPositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreate
OnKeyPressFormKeyPressPixelsPerInch`
TextHeight TPanelPanel1Left TopCWidthHeightAlignalBottom
BevelInner	bvLoweredTabOrder  TLabelLabel16Left1TopWidth!HeightCaption<DEL>Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel17LeftUTopWidthpHeightCaption   Obriši označene filmove  TLabelLabel18Left� TopWidth/Height	AlignmenttaRightJustifyAutoSizeCaption<ESC>Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel15LeftTopWidth+HeightCaptionPovratak  TLabelLabel3Left	TopWidth(HeightCaption<CTRL>Font.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont   TPanelPanel2Left Top WidthHeight1AlignalTopTabOrder TLabelLabel1Left	TopWidthsHeightCaption   VAŽNA NAPOMENAFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel2LeftTopWidth� HeightCaptionZ   Sve ispravke koje napravite na kartici automatski se
ažuriraju i snimaju u bazu posudbi.   	TwwDBGridwwDBGridLeft Top1WidthHeightTabStopControlType.StringsVrati;CheckBox;True;False Selected.StringsVrati	3	Vrati   SifraKazete	4	Šifrabcodekaz	8	BarkodDatumPos	9	Datumfilm	32	Naziv filmavMedij	17	Medijdjel	5	Djel IniAttributes.FileNameaa.iniIniAttributes.Delimiter;;
TitleColorclSilverOnCreateDateTimePickerwwDBGridCreateDateTimePicker	FixedCols ShowHorzScrollBar	EditControlOptionsecoSearchOwnerFormecoDisableEditorIfReadOnly AlignalClient
DataSourceds1
KeyOptions Options	dgEditingdgTitlesdgIndicator
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExit
dgWordWrap ReadOnly	RowHeightPercentsTabOrderTitleAlignmenttaLeftJustifyTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
TitleLinesTitleButtons	OnKeyDownwwDBGridKeyDown
OnKeyPresswwDBGridKeyPress  
TdxMemDataTPosIndexes SortOptionssoDesc Left� Top�  TBooleanField	TPosVratiDisplayWidth	FieldNameVrati  TIntegerFieldTPosSifraKazeteDisplayLabel   ŠifraDisplayWidth	FieldNameSifraKazeteReadOnly	  TStringFieldTPosbcodekazeteDisplayLabelBarkodDisplayWidth	FieldNamebcodekazReadOnly	Size  TDateTimeFieldTPosDatumPosDisplayLabelDatumDisplayWidth		FieldNameDatumPos  TStringFieldTPosfilmDisplayLabelNaziv filmaDisplayWidth 	FieldNamefilmReadOnly	Size  TStringField
TPosvMedijDisplayLabelMedijDisplayWidth	FieldNamevMedijReadOnly	Size  TStringFieldTPosdjelDisplayLabelDjelDisplayWidth	FieldNamedjelReadOnly	Size  TIntegerFieldTPossifraNebitna	FieldNamesifraNebitnaVisible   TDataSourceds1DataSetTPosLeft� Top�    