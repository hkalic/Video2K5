�
 TFBRISANJEPODATAKADLG 0�  TPF0TFBrisanjePodatakaDlgFBrisanjePodatakaDlgLeft� Top� BorderIconsbiSystemMenu BorderStylebsDialogCaptionBrisanje podataka iz bazaClientHeight�ClientWidthColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
KeyPreview	OldCreateOrderPositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreate
OnKeyPressFormKeyPressPixelsPerInch`
TextHeight TPanelPanel1Left Top WidthHeight+AlignalTop
BevelInner	bvLoweredBorderWidthTabOrder  TLabelLabel1LeftTopWidthZHeightCaption   UPIŠITE Psssword  TEditEdit1LeftuTopWidthyHeightCharCaseecUpperCasePasswordChar*TabOrder 
OnKeyPressEdit1KeyPress  TBitBtnBtnizlazLeft�Top	WidthHHeightCaption&IzlazTabOrderTabStopOnClickBtnizlazClick
Glyph.Data
�   �   BM�       v   (               �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� ������������p��   �p�` ������`�����`�� ���`�w��`� `��`��� �`����`��h��`�����`����`����������    �   TPanelPanel2Left Top+WidthHeight{AlignalClientTabOrderVisible TLabelLabel2LeftTopWidthHeight	AlignmenttaCenterAutoSizeCaption�   BRISANJE podataka iz baza uvijek radite na kraju dana, nakon napravljene
obrade poslovanja (ZAKLJUČI DAN) i snimljene rezervne kopije PERIODIČNE (na diskete)ColorclAquaFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold ParentColor
ParentFont  TLabelLabel3LeftTop*Width� HeightCaption3   baze iz kojih želite brisati potrebno je označiti  TLabelLabel13Left;Top.WidthHeightCaptionbaza  TLabelLabel14Left�Top.Width$Height	AlignmenttaRightJustifyCaption	   veličina  TLabelLabel15Left�Top.WidthAHeightCaptionbroj podataka  TButtonButton1LeftTopRWidthyHeightCaptionIsprazni bazeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder OnClickButton1Click  TPanelPanel3LeftTop<Width0Height%
BevelInner	bvLoweredTabOrder TLabelLabel4Left� TopWidthtHeightCaptionn   baza dnevnih događaja: računi "DRUGI", ispravci kartice zaduženja, promjene
salda člana. Prazni se cijelaFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  	TCheckBox	CheckBox1LeftTopWidthyHeightCaption	baza DNEVColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ParentColor
ParentFontTabOrder    TPanelPanel4LeftTopfWidth0Height%
BevelInner	bvLoweredCaptionPanel4TabOrder TLabelLabel5Left� TopWidthzHeightCaption�   baza sa zaduženjima (ne posudbe), ispisujete li ili ne zaduženja ona se stvaraju u
ovoj bazi, te je potrebno redovno ju prazniti. Prazni se cijela.Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  	TCheckBox	CheckBox2LeftTopWidthyHeightCaption
baza ZADUZFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder    TPanelPanel5LeftTop� Width/HeightO
BevelInner	bvLoweredCaptionPanel4TabOrder TLabelLabel6Left� TopWidth�HeightACaption@  baza sa podacima što je član gledao. U praksi ovo je jedna od najvećih baza te je
potrebno redovno ju prazniti.
Brisanje se izvodi tako da upišete datum do kojega želite da se obrišu podaci.
(od nultog datuma do datuma koji ste zadali)
SAVJET ostavite podatke uvijek zadnjih 12 - 18 mjeseci, a starije brišiteFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel8LeftTopWidthwHeightCaption   obriši podatke do datuma  	TCheckBox	CheckBox3LeftTopWidthyHeightCaptionbaza KOIFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder   TwwDBDateTimePickerwwDBDateTimePicker1LeftTop,WidthyHeightCalendarAttributes.Font.CharsetDEFAULT_CHARSETCalendarAttributes.Font.ColorclWindowTextCalendarAttributes.Font.Height�CalendarAttributes.Font.NameMS Sans SerifCalendarAttributes.Font.Style Epoch�
ShowButton	TabOrder   TPanelPanel6LeftTop� Width/Heightb
BevelInner	bvLoweredTabOrder TLabelLabel7Left� TopWidthzHeight4Caption  baza sa računima (najveća i najvažnija) potrebno ju je redovno prazniti.
podaci se fizički brišu iz glavne baze RAČUNA i prebacuju u bazu RACUNIX.DB
koja se nalazi u direktoriju BAZEX. Podatake možete pregledati tako da kod
pregleda računa označite traži u RACUNIX.DB.Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel9Left� TopWidthFHeightCaptionF   podaci se brišu iz glavne baze računa i prebacuju u drugu "rezervnu"Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel10Left� TopWidth+HeightCaption   VAŽNOFont.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel11LeftTop#Width� HeightCaption   "obriši" podatke do datuma  TLabelLabel12Left� TopPWidthaHeightCaptionG   OVO NAPRAVITE otprilike nakon 20.000 izdanih računa (4-8 mjeseci rada)  	TCheckBox	CheckBox4LeftTopWidthyHeightCaptionbaza RACUNIFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder   TwwDBDateTimePickerwwDBDateTimePicker2LeftTop2WidthyHeightCalendarAttributes.Font.CharsetDEFAULT_CHARSETCalendarAttributes.Font.ColorclWindowTextCalendarAttributes.Font.Height�CalendarAttributes.Font.NameMS Sans SerifCalendarAttributes.Font.Style Epoch�
ShowButton	TabOrder   TListBoxListBox1Left:Top<Width� Height:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name	Furniture
Font.PitchfpFixed
Font.Style 
ItemHeight

ParentFontTabOrder   TDataSourceDRacuniXDataSetTRacuniXLeft�TopP  TTableTRacuniXAutoCalcFieldsDatabaseNameDBSessionNameDefault	TableNameRacuniLeft�TopP  TTableTRacuniDetXAutoCalcFieldsDatabaseNameDBSessionNameDefault	IndexNameSifraRacunaMasterFieldsSifraMasterSourceDRacuniX	TableNameRacuniDetailLeft�Top�    