object FPostavkeDlg: TFPostavkeDlg
  Left = 300
  Top = 189
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Postavke'
  ClientHeight = 522
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 138
    Top = 0
    Width = 634
    Height = 487
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '     Osnovne     '
      object Label7: TLabel
        Left = 99
        Top = 292
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Telefon'
        FocusControl = DBEdit7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit7: TDBEdit
        Left = 138
        Top = 289
        Width = 210
        Height = 21
        DataField = 'Telefon'
        DataSource = DataSource1
        TabOrder = 1
        OnKeyDown = Kdown
      end
      object GroupBox3: TGroupBox
        Left = 20
        Top = 52
        Width = 595
        Height = 223
        TabOrder = 0
        object Label31: TLabel
          Left = 39
          Top = 25
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'Naziv poduze'#263'a'
          FocusControl = DBEdit23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 31
          Top = 52
          Width = 83
          Height = 13
          Alignment = taRightJustify
          Caption = 'Adresa poduze'#263'a'
          FocusControl = DBEdit24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 20
          Top = 79
          Width = 94
          Height = 13
          Alignment = taRightJustify
          Caption = 'Naziv kluba i mjesto'
          FocusControl = DBEdit25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 25
          Top = 107
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Caption = 'Samo mjesto kluba'
          FocusControl = DBEdit26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 23
          Top = 136
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Adresa video kluba'
          FocusControl = DBEdit27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 80
          Top = 163
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vlasnik'
          FocusControl = DBEdit28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label37: TLabel
          Left = 96
          Top = 191
          Width = 18
          Height = 13
          Alignment = taRightJustify
          Caption = 'OIB'
          FocusControl = DBEdit29
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 330
          Top = 110
          Width = 163
          Height = 13
          Caption = 'npr. Osijeku, Zagrebu, Vinkovcima'
        end
        object Label48: TLabel
          Left = 120
          Top = 80
          Width = 362
          Height = 13
          Caption = 
            'Program je registriran te nije mogu'#263'e mijenjati naziv video klub' +
            'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object DBEdit25: TDBEdit
          Left = 118
          Top = 76
          Width = 289
          Height = 21
          DataField = 'NazivKluba'
          DataSource = DataSource1
          TabOrder = 2
          OnKeyDown = Kdown
        end
        object DBEdit23: TDBEdit
          Left = 119
          Top = 22
          Width = 289
          Height = 21
          DataField = 'NazivPoduzeca'
          DataSource = DataSource1
          TabOrder = 0
          OnKeyDown = Kdown
        end
        object DBEdit24: TDBEdit
          Left = 118
          Top = 49
          Width = 210
          Height = 21
          DataField = 'Adresa2'
          DataSource = DataSource1
          TabOrder = 1
          OnKeyDown = Kdown
        end
        object DBEdit26: TDBEdit
          Left = 118
          Top = 104
          Width = 210
          Height = 21
          DataField = 'SamoMjesto'
          DataSource = DataSource1
          TabOrder = 3
          OnKeyDown = Kdown
        end
        object DBEdit27: TDBEdit
          Left = 118
          Top = 133
          Width = 210
          Height = 21
          DataField = 'Adresa1'
          DataSource = DataSource1
          TabOrder = 4
          OnKeyDown = Kdown
        end
        object DBEdit28: TDBEdit
          Left = 118
          Top = 160
          Width = 210
          Height = 21
          DataField = 'Vlasnik'
          DataSource = DataSource1
          TabOrder = 5
          OnKeyDown = Kdown
        end
        object DBEdit29: TDBEdit
          Left = 118
          Top = 188
          Width = 210
          Height = 21
          DataField = 'MBO'
          DataSource = DataSource1
          TabOrder = 6
          OnKeyDown = Kdown
        end
      end
      object DBRadioGroup8: TDBRadioGroup
        Left = 20
        Top = 8
        Width = 205
        Height = 41
        Caption = ' Vrsta firme '
        Columns = 2
        DataField = 'VrstaPoslovnice'
        DataSource = DataSource1
        Items.Strings = (
          'Video klub'
          'Frizerski salon')
        TabOrder = 2
        Values.Strings = (
          'V'
          'F')
      end
    end
    object TabSheet2: TTabSheet
      Caption = '     Programske     '
      ImageIndex = 1
      object Bevel2: TBevel
        Left = 6
        Top = 16
        Width = 319
        Height = 119
      end
      object Label9: TLabel
        Left = 46
        Top = 90
        Width = 61
        Height = 13
        Caption = 'Te'#269'aj 1 Euro'
        FocusControl = DBEdit9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 17
        Top = 23
        Width = 91
        Height = 13
        Caption = 'Broj kopija ugovora'
        FocusControl = DBEdit11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 186
        Top = 90
        Width = 13
        Height = 13
        Caption = 'Kn'
        FocusControl = DBEdit9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 32
        Top = 45
        Width = 75
        Height = 13
        Caption = 'Besplatan svaki'
        FocusControl = DBEdit8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 185
        Top = 45
        Width = 15
        Height = 13
        Caption = 'film'
        FocusControl = DBEdit8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 37
        Top = 68
        Width = 71
        Height = 13
        Caption = 'Iznos poreza %'
        FocusControl = DBEdit15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 38
        Top = 112
        Width = 71
        Height = 13
        Caption = 'Iznos '#269'lanarine'
        FocusControl = DBEdit18
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel3: TBevel
        Left = 6
        Top = 140
        Width = 319
        Height = 317
      end
      object Label19: TLabel
        Left = 16
        Top = 403
        Width = 126
        Height = 13
        Caption = 'Prva posudba max. kazeta'
        FocusControl = DBEdit31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label47: TLabel
        Left = 221
        Top = 403
        Width = 93
        Height = 13
        Caption = '0 nema ograni'#269'enja'
        FocusControl = DBEdit31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label52: TLabel
        Left = 14
        Top = 381
        Width = 76
        Height = 13
        Caption = 'Iznos osiguranja'
        FocusControl = DBEdit33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit9: TDBEdit
        Left = 112
        Top = 86
        Width = 70
        Height = 21
        DataField = 'TecajDem'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 0
        OnKeyDown = Kdown
      end
      object DBCheckBox1: TDBCheckBox
        Left = 16
        Top = 194
        Width = 97
        Height = 17
        Caption = 'Ispis zadu'#382'enja'
        DataField = 'IspisZaduz'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBEdit11: TDBEdit
        Left = 112
        Top = 20
        Width = 70
        Height = 21
        DataField = 'BrojKopUgovora'
        DataSource = DataSource1
        TabOrder = 2
        OnKeyDown = Kdown
      end
      object DBCheckBox2: TDBCheckBox
        Left = 186
        Top = 23
        Width = 97
        Height = 17
        Caption = 'Ispis ugovora'
        DataField = 'IspisUgovora'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 354
        Top = 139
        Width = 273
        Height = 38
        Caption = ' VIKEND je '
        Columns = 2
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Items.Strings = (
          'Petak - Ponedjeljak'
          'Subota - Ponedjeljak')
        ParentFont = False
        TabOrder = 4
        Values.Strings = (
          '1'
          '2'
          '3')
        Visible = False
      end
      object DBEdit8: TDBEdit
        Left = 112
        Top = 42
        Width = 70
        Height = 21
        DataField = 'BesplatanSvaki'
        DataSource = DataSource1
        TabOrder = 5
        OnKeyDown = Kdown
      end
      object DBCheckBox4: TDBCheckBox
        Left = 16
        Top = 177
        Width = 273
        Height = 17
        Caption = 'Zabranjeno izdavanje ako je saldo u minusu'
        DataField = 'SaldoMinus'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBEdit15: TDBEdit
        Left = 112
        Top = 64
        Width = 70
        Height = 21
        DataField = 'IznosPoreza'
        DataSource = DataSource1
        TabOrder = 7
        OnKeyDown = Kdown
      end
      object GroupBox1: TGroupBox
        Left = 330
        Top = 201
        Width = 273
        Height = 192
        Caption = 'RA'#268'UN'
        TabOrder = 8
        object Label16: TLabel
          Left = 22
          Top = 40
          Width = 110
          Height = 13
          Caption = 'zadnji redovi na ra'#269'unu'
          FocusControl = DBEdit14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 22
          Top = 103
          Width = 196
          Height = 13
          Caption = 'tekst za naplatu dugovanja putem ra'#269'una'
          FocusControl = DBEdit14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 22
          Top = 143
          Width = 132
          Height = 13
          Caption = 'tekst za naplatu po ugovoru'
          FocusControl = DBEdit14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBCheckBox6: TDBCheckBox
          Left = 22
          Top = 16
          Width = 201
          Height = 17
          Caption = 'Prezime i ime '#269'lana na ra'#269'unu'
          DataField = 'ImeNaRacunu'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ValueChecked = 'D'
          ValueUnchecked = 'N'
          OnKeyDown = Kdown
        end
        object DBEdit14: TDBEdit
          Left = 22
          Top = 53
          Width = 230
          Height = 21
          DataField = 'Zadnji1'
          DataSource = DataSource1
          TabOrder = 1
          OnKeyDown = Kdown
        end
        object DBEdit16: TDBEdit
          Left = 22
          Top = 77
          Width = 230
          Height = 21
          DataField = 'Zadnji2'
          DataSource = DataSource1
          TabOrder = 2
          OnKeyDown = Kdown
        end
        object DBEdit17: TDBEdit
          Left = 22
          Top = 116
          Width = 230
          Height = 21
          DataField = 'Zadnji3'
          DataSource = DataSource1
          TabOrder = 3
          OnKeyDown = Kdown
        end
        object DBEdit32: TDBEdit
          Left = 22
          Top = 156
          Width = 230
          Height = 21
          DataField = 'TekstNaplataUgovor'
          DataSource = DataSource1
          TabOrder = 4
          OnKeyDown = Kdown
        end
      end
      object GroupBox2: TGroupBox
        Left = 394
        Top = 128
        Width = 273
        Height = 73
        Caption = ' BLAGDAN je '
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
        Visible = False
        object Label20: TLabel
          Left = 20
          Top = 21
          Width = 95
          Height = 13
          Caption = 'Po'#269'inje sa datumom'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 11
          Top = 45
          Width = 105
          Height = 13
          Caption = 'Zavr'#353'ava sa datumom'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object wwDBDateTimePicker1: TwwDBDateTimePicker
          Left = 120
          Top = 17
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          DataField = 'BlagdanOd'
          DataSource = DataSource1
          Date = 39202
          Epoch = 1950
          Enabled = False
          ShowButton = True
          TabOrder = 0
          OnKeyDown = Kdown
        end
        object wwDBDateTimePicker2: TwwDBDateTimePicker
          Left = 120
          Top = 41
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          DataField = 'BlagdanDo'
          DataSource = DataSource1
          Date = 39204
          Epoch = 1950
          Enabled = False
          ShowButton = True
          TabOrder = 1
          OnKeyDown = Kdown
        end
      end
      object DBCheckBox7: TDBCheckBox
        Left = 186
        Top = 112
        Width = 130
        Height = 17
        Caption = #268'lanarina se napla'#269'uje'
        DataField = 'NaplatiClanarinu'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBEdit18: TDBEdit
        Left = 112
        Top = 109
        Width = 70
        Height = 21
        DataField = 'IznosClanarine'
        DataSource = DataSource1
        TabOrder = 11
        OnKeyDown = Kdown
      end
      object DBCheckBox5: TDBCheckBox
        Left = 16
        Top = 211
        Width = 255
        Height = 17
        Caption = 'Upis '#269'lana sa neispravnim JMBG/OIB dozvoljen'
        DataField = 'UpisClanaJmbgNeisp'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox8: TDBCheckBox
        Left = 16
        Top = 228
        Width = 209
        Height = 17
        Caption = 'Popust vidljiv na kartici zadu'#382'enja'
        DataField = 'PopustVidljiv'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox9: TDBCheckBox
        Left = 16
        Top = 161
        Width = 209
        Height = 17
        Caption = 'Nedjelja je radni dan'
        DataField = 'NedjeljaRadna'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 330
        Top = 10
        Width = 272
        Height = 36
        Caption = ' Sustav CIJENIKA '
        Columns = 3
        DataField = 'BrojCjenika'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Items.Strings = (
          '1 cjenik'
          '2 cjenika'
          '3 cijenika')
        ParentFont = False
        TabOrder = 15
        Values.Strings = (
          '1'
          '2'
          '3')
      end
      object DBCheckBox11: TDBCheckBox
        Left = 16
        Top = 144
        Width = 209
        Height = 17
        Caption = 'Da li postoji BARCODE '#269'ita'#263
        DataField = 'ImaCitac'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox12: TDBCheckBox
        Left = 16
        Top = 244
        Width = 291
        Height = 17
        Caption = 'Promjene salda '#269'lanova utje'#269'u na stanje blagajne'
        DataField = 'SaldaUtjecu'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox13: TDBCheckBox
        Left = 16
        Top = 294
        Width = 189
        Height = 17
        Caption = 'Broj izdanih vidljiv u tra'#382'enju filma'
        DataField = 'IzdaneVidljive'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox14: TDBCheckBox
        Left = 16
        Top = 278
        Width = 153
        Height = 17
        Caption = 'Prikaz fotografija '#269'lana'
        DataField = 'Slike'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 19
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox15: TDBCheckBox
        Left = 16
        Top = 261
        Width = 129
        Height = 17
        Caption = 'Da li postoji INFO box'
        DataField = 'PostojiINFOBOX'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 20
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox16: TDBCheckBox
        Left = 16
        Top = 311
        Width = 105
        Height = 17
        Caption = 'Ispis suglasnosti'
        DataField = 'IspisOvlastenja'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 21
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox18: TDBCheckBox
        Left = 16
        Top = 328
        Width = 150
        Height = 17
        Caption = 'Ispis salda '#269'lana na ra'#269'un'
        DataField = 'SaldoRacun'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 22
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox20: TDBCheckBox
        Left = 16
        Top = 344
        Width = 217
        Height = 17
        Caption = 'Bilje'#382'i prijavu djelatnika (datum i vrijeme)'
        DataField = 'Biljezi'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 23
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox21: TDBCheckBox
        Left = 256
        Top = 344
        Width = 65
        Height = 17
        Caption = '----cros--'
        DataField = 'cross'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 24
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox22: TDBCheckBox
        Left = 16
        Top = 361
        Width = 217
        Height = 17
        Caption = 'Zabrana upisa maloljetnih osoba'
        DataField = 'ZabranaMalodobnici'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 25
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBEdit31: TDBEdit
        Left = 146
        Top = 400
        Width = 70
        Height = 21
        DataField = 'PrvoDizanjeMax'
        DataSource = DataSource1
        TabOrder = 26
        OnKeyDown = Kdown
      end
      object DBEdit33: TDBEdit
        Left = 93
        Top = 378
        Width = 70
        Height = 21
        DataField = 'IznosOsiguranja'
        DataSource = DataSource1
        TabOrder = 27
        OnKeyDown = Kdown
      end
      object DBCheckBox24: TDBCheckBox
        Left = 169
        Top = 380
        Width = 140
        Height = 17
        Caption = 'Osiguranje se napla'#269'uje'
        DataField = 'NaplatiOsiguranje'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 28
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox25: TDBCheckBox
        Left = 176
        Top = 278
        Width = 137
        Height = 17
        Caption = 'Prikaz fotografija filmova'
        DataField = 'SlikaFilma'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 29
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox26: TDBCheckBox
        Left = 16
        Top = 417
        Width = 217
        Height = 17
        Caption = 'Ispis potvrde storno ra'#269'una'
        DataField = 'PotvrdaStornoRN'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 30
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox27: TDBCheckBox
        Left = 16
        Top = 433
        Width = 217
        Height = 17
        Caption = 'Ispis potvrde kartice storna ra'#269'una'
        DataField = 'PotvrdaStornoZad'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 31
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object GroupBox4: TGroupBox
        Left = 330
        Top = 400
        Width = 273
        Height = 57
        Caption = 'UGOVOR'
        TabOrder = 32
        object Label56: TLabel
          Left = 22
          Top = 12
          Width = 31
          Height = 13
          Caption = 'naslov'
          FocusControl = DBEdit14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit36: TDBEdit
          Left = 22
          Top = 28
          Width = 230
          Height = 21
          DataField = 'NaslovUgovora'
          DataSource = DataSource1
          TabOrder = 0
          OnKeyDown = Kdown
        end
      end
      object GroupBox5: TGroupBox
        Left = 329
        Top = 48
        Width = 273
        Height = 73
        Caption = ' VIKEND je '
        ParentShowHint = False
        ShowHint = False
        TabOrder = 33
        object DBCheckBox29: TDBCheckBox
          Left = 72
          Top = 48
          Width = 145
          Height = 17
          Caption = 'Dodaj blagdan vikendu'
          DataField = 'BlagdanVikendu'
          DataSource = DataSource1
          TabOrder = 0
          ValueChecked = 'D'
          ValueUnchecked = 'N'
        end
        object wwRadioGroup1: TwwRadioGroup
          Left = 8
          Top = 16
          Width = 257
          Height = 33
          ShowGroupCaption = False
          Columns = 2
          DataField = 'VikendJe'
          DataSource = DataSource1
          Items.Strings = (
            'Petak - Ponedjeljak'
            'Subota - Ponedjeljak')
          TabOrder = 1
          Values.Strings = (
            '1'
            '2')
        end
      end
      object DBCheckBox30: TDBCheckBox
        Left = 186
        Top = 66
        Width = 111
        Height = 17
        Caption = 'Porezni obveznik?'
        DataField = 'ObveznikPDV'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 34
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
    end
    object TabSheet3: TTabSheet
      Caption = '     Sistemske     '
      ImageIndex = 2
      object Label18: TLabel
        Left = 34
        Top = 93
        Width = 87
        Height = 13
        Caption = 'Pin za ladicu 2 ili 5'
        FocusControl = DBEdit19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 34
        Top = 115
        Width = 103
        Height = 12
        Caption = 'samo za EPSON TM-300'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 299
        Top = 165
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Izbaci redova'
        FocusControl = DBEdit13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 432
        Top = 159
        Width = 157
        Height = 36
        Caption = 
          'A4 printer koji upotrebljava papir u roli'#13#10'(npr za EPSON LX300 =' +
          ' 16)'#13#10'za ostale obavezno je upisatu 0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 28
        Top = 143
        Width = 96
        Height = 13
        Caption = 'Min. du'#382'ina barkoda'
        FocusControl = DBEdit12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 486
        Top = 262
        Width = 110
        Height = 12
        Caption = 'za ispis ra'#269'una i zadu'#382'enja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 28
        Top = 391
        Width = 121
        Height = 13
        Alignment = taRightJustify
        Caption = 'Program Norton Speedisk'
        FocusControl = DBEdit20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 62
        Top = 340
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = 'Program ScanDisk'
        FocusControl = DBEdit21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label29: TLabel
        Left = 76
        Top = 367
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Program Defrag'
        FocusControl = DBEdit22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 294
        Top = 6
        Width = 301
        Height = 193
      end
      object Label53: TLabel
        Left = 47
        Top = 276
        Width = 103
        Height = 13
        Alignment = taRightJustify
        Caption = 'PATH za slike filmova'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label54: TLabel
        Left = 38
        Top = 300
        Width = 151
        Height = 13
        Alignment = taRightJustify
        Caption = 'Format slike filma u px:   '#352'IRINA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label55: TLabel
        Left = 250
        Top = 300
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'VISINA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Panel3: TPanel
        Left = 296
        Top = 48
        Width = 289
        Height = 105
        BevelOuter = bvNone
        TabOrder = 15
        object DBRadioGroup6: TDBRadioGroup
          Left = 8
          Top = 4
          Width = 153
          Height = 93
          Caption = 'Ispis ra'#269'una i zadu'#382'enja na'
          DataField = 'RacuniNa'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Items.Strings = (
            'Matri'#269'ni A4'
            'POS EPSON TM-300'
            'POS STAR SP200')
          ParentFont = False
          TabOrder = 0
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object DBRadioGroup7: TDBRadioGroup
          Left = 176
          Top = 4
          Width = 113
          Height = 64
          Caption = 'Printer je na'
          DataField = 'Port'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Items.Strings = (
            'COM1'
            'COM2'
            'LPT1')
          ParentFont = False
          TabOrder = 1
          Values.Strings = (
            'COM1'
            'COM2'
            'LPT1')
        end
      end
      object DBEdit19: TDBEdit
        Left = 127
        Top = 88
        Width = 70
        Height = 21
        DataField = 'PinZaKasu'
        DataSource = DataSource1
        TabOrder = 0
        OnKeyDown = Kdown
      end
      object DBRadioGroup5: TDBRadioGroup
        Left = 488
        Top = 207
        Width = 106
        Height = 53
        Caption = 'Kodna stranica'
        DataField = 'KodnaStranica'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Items.Strings = (
          'HR - 437'
          'HR - 852')
        ParentFont = False
        TabOrder = 1
        Values.Strings = (
          '0'
          '1')
      end
      object Button1: TButton
        Left = 456
        Top = 17
        Width = 131
        Height = 25
        Caption = 'Pode'#353'avanje COM porta'
        TabOrder = 2
        OnClick = Button2Click
      end
      object DBCheckBox10: TDBCheckBox
        Left = 35
        Top = 59
        Width = 145
        Height = 17
        Caption = 'Postoji LADICA za novac'
        DataField = 'Ladica'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBEdit13: TDBEdit
        Left = 366
        Top = 161
        Width = 62
        Height = 21
        DataField = 'BrojRazmaka'
        DataSource = DataSource1
        TabOrder = 4
        OnKeyDown = Kdown
      end
      object DBEdit12: TDBEdit
        Left = 128
        Top = 140
        Width = 70
        Height = 21
        DataField = 'MinDuzBcode'
        DataSource = DataSource1
        TabOrder = 5
        OnKeyDown = Kdown
      end
      object DBCheckBox3: TDBCheckBox
        Left = 35
        Top = 37
        Width = 232
        Height = 17
        Caption = 'Da li postoji printer za ra'#269'une i zadu'#382'enja'
        DataField = 'PostojiPrinterRacuni'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBEdit20: TDBEdit
        Left = 153
        Top = 388
        Width = 313
        Height = 21
        DataField = 'PathSpeedisk'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 7
        OnKeyDown = Kdown
      end
      object DBEdit21: TDBEdit
        Left = 153
        Top = 337
        Width = 225
        Height = 21
        DataField = 'PathScanDisk'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 8
        OnKeyDown = Kdown
      end
      object DBEdit22: TDBEdit
        Left = 153
        Top = 363
        Width = 225
        Height = 21
        DataField = 'PathDefrag'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 9
        OnKeyDown = Kdown
      end
      object DBCheckBox19: TDBCheckBox
        Left = 35
        Top = 191
        Width = 232
        Height = 17
        Caption = 'Dozvoljena su slova u BARCODE '#353'ifri'
        DataField = 'SmijuSlova'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object DBCheckBox23: TDBCheckBox
        Left = 35
        Top = 15
        Width = 232
        Height = 17
        Caption = 'Program se izvodi pod Win XP'
        DataField = 'XP'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
      object dxDBButtonEdit1: TdxDBButtonEdit
        Tag = 1
        Left = 153
        Top = 272
        Width = 225
        Style.BorderStyle = xbs3D
        TabOrder = 12
        OnExit = dxDBButtonEdit1Exit
        DataField = 'PathSlikeF'
        DataSource = DataSource1
        Buttons = <
          item
            Default = True
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000E0000000E0000000100
              0400000000007000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33003333333333333300300000000333330000B7B7B7B03333000B0B7B7B7B03
              33000BB0B7B7B7B033000FBB0000000033000BFB0B0B0B0333000FBFBFBFB003
              33000BFBFBF00033330030BFBF03333333003800008333333300333333333333
              33003333333333333300}
            Kind = bkGlyph
          end>
        OnButtonClick = dxDBButtonEdit1ButtonClick
        ExistButtons = True
      end
      object DBEdit34: TDBEdit
        Left = 193
        Top = 297
        Width = 48
        Height = 21
        DataField = 'SirinaSlikeF'
        DataSource = DataSource1
        TabOrder = 13
        OnKeyDown = Kdown
      end
      object DBEdit35: TDBEdit
        Left = 289
        Top = 297
        Width = 48
        Height = 21
        DataField = 'VisinaSlikeF'
        DataSource = DataSource1
        TabOrder = 14
        OnKeyDown = Kdown
      end
      object RadioGroup1: TRadioGroup
        Left = 304
        Top = 11
        Width = 145
        Height = 33
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'glavni'
          'drugi')
        TabOrder = 16
        Visible = False
        OnClick = RadioGroup1Click
      end
      object Panel4: TPanel
        Left = 296
        Top = 48
        Width = 289
        Height = 105
        BevelOuter = bvNone
        TabOrder = 17
        Visible = False
        object DBRadioGroup3: TDBRadioGroup
          Left = 8
          Top = 4
          Width = 153
          Height = 93
          Caption = 'Ispis ra'#269'una i zadu'#382'enja na'
          DataField = 'RacuniNa2'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Items.Strings = (
            'Matri'#269'ni A4'
            'POS EPSON TM-300'
            'POS STAR SP200')
          ParentFont = False
          TabOrder = 0
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object DBRadioGroup4: TDBRadioGroup
          Left = 176
          Top = 4
          Width = 113
          Height = 64
          Caption = 'Printer je na'
          DataField = 'Port2'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Items.Strings = (
            'COM1'
            'COM2'
            'LPT1')
          ParentFont = False
          TabOrder = 1
          Values.Strings = (
            'COM1'
            'COM2'
            'LPT1')
        end
      end
      object DBCheckBox28: TDBCheckBox
        Left = 35
        Top = 167
        Width = 232
        Height = 17
        Caption = 'Bez broja kopija filma u barkodu'
        DataField = 'bezbrojanjabarkodova'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        OnKeyDown = Kdown
      end
    end
    object TabSheet4: TTabSheet
      Caption = '   Rezervna kopija   '
      ImageIndex = 3
      object Bevel4: TBevel
        Left = 102
        Top = 46
        Width = 395
        Height = 183
      end
      object Label1: TLabel
        Left = 124
        Top = 92
        Width = 82
        Height = 13
        Alignment = taRightJustify
        Caption = 'Lokacija na HDD'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 125
        Top = 160
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = 'Disketna jedinica'
        FocusControl = DBEdit2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 123
        Top = 72
        Width = 211
        Height = 13
        Alignment = taRightJustify
        Caption = 'SVAKODNEVNA REZERVNA KOPIJA'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 126
        Top = 139
        Width = 195
        Height = 13
        Alignment = taRightJustify
        Caption = 'PERIODI'#268'NA REZERVNA KOPIJA'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel5: TBevel
        Left = 102
        Top = 238
        Width = 395
        Height = 59
      end
      object Label5: TLabel
        Left = 114
        Top = 244
        Width = 321
        Height = 13
        Alignment = taRightJustify
        Caption = 'DATUM ZADNJE REZERVNE KOPIJE BAZA PODATAKA'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 125
        Top = 191
        Width = 254
        Height = 26
        Caption = 
          'kod promjene ovih podataka potrebno je da iza'#273'ete iz'#13#10'programa, ' +
          'da bi promjena imala utjecaja.'
      end
      object DBEdit1: TDBEdit
        Left = 209
        Top = 89
        Width = 225
        Height = 21
        DataField = 'PathHDD'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 0
        OnKeyDown = Kdown
      end
      object DBEdit2: TDBEdit
        Left = 209
        Top = 156
        Width = 225
        Height = 21
        DataField = 'PathFloppy'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 1
        OnKeyDown = Kdown
      end
      object DBEdit3: TDBEdit
        Left = 113
        Top = 259
        Width = 176
        Height = 32
        Color = clInfoBk
        DataField = 'ZadnjiputSnimano'
        DataSource = DataSource1
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnKeyDown = Kdown
      end
    end
    object TabSheet5: TTabSheet
      Caption = '    INFO box     '
      Enabled = False
      ImageIndex = 4
      object Label26: TLabel
        Left = 353
        Top = 10
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Uvodna poruka'
        FocusControl = DBEdit23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label30: TLabel
        Left = 351
        Top = 193
        Width = 60
        Height = 13
        Caption = 'tekst novosti'
        FocusControl = DBEdit23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label41: TLabel
        Left = 22
        Top = 27
        Width = 84
        Height = 13
        Alignment = taRightJustify
        Caption = 'Samo naziv kluba'
        FocusControl = DBEdit4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label42: TLabel
        Left = 56
        Top = 56
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'zaglavlje 1'
        FocusControl = DBEdit5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label43: TLabel
        Left = 56
        Top = 83
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'zaglavlje 2'
        FocusControl = DBEdit6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label44: TLabel
        Left = 56
        Top = 111
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'zaglavlje 3'
        FocusControl = DBEdit10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBMemo1: TDBMemo
        Left = 352
        Top = 25
        Width = 185
        Height = 160
        DataField = 'Uvod'
        DataSource = DInfo
        TabOrder = 0
      end
      object DBMemo2: TDBMemo
        Left = 352
        Top = 208
        Width = 185
        Height = 201
        DataField = 'Novosti'
        DataSource = DInfo
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 110
        Top = 24
        Width = 91
        Height = 21
        DataField = 'SamoKlub'
        DataSource = DInfo
        TabOrder = 2
        OnKeyDown = Kdown
      end
      object DBEdit5: TDBEdit
        Left = 110
        Top = 53
        Width = 187
        Height = 21
        DataField = 'Zag1'
        DataSource = DInfo
        TabOrder = 3
        OnKeyDown = Kdown
      end
      object DBEdit6: TDBEdit
        Left = 110
        Top = 80
        Width = 187
        Height = 21
        DataField = 'Zag2'
        DataSource = DInfo
        TabOrder = 4
        OnKeyDown = Kdown
      end
      object DBEdit10: TDBEdit
        Left = 110
        Top = 108
        Width = 187
        Height = 21
        DataField = 'Zag3'
        DataSource = DInfo
        TabOrder = 5
        OnKeyDown = Kdown
      end
      object DBCheckBox17: TDBCheckBox
        Left = 24
        Top = 137
        Width = 209
        Height = 17
        Caption = #268'lanovima je dozvoljen ispis'
        DataField = 'Ispis'
        DataSource = DInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        ValueChecked = 'D'
        ValueUnchecked = 'N'
        Visible = False
        OnKeyDown = Kdown
      end
    end
    object TabSheet6: TTabSheet
      Caption = '  O sistemu  '
      ImageIndex = 5
      object Label49: TLabel
        Left = 416
        Top = 17
        Width = 186
        Height = 15
        AutoSize = False
        Caption = 'System version:'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label51: TLabel
        Left = 320
        Top = 177
        Width = 281
        Height = 15
        AutoSize = False
        Caption = 'System info:'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label50: TLabel
        Left = 11
        Top = 177
        Width = 289
        Height = 15
        AutoSize = False
        Caption = 'Client/Server version:'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label40: TLabel
        Left = 13
        Top = 17
        Width = 388
        Height = 15
        AutoSize = False
        Caption = 'Database config:'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Memo4: TMemo
        Left = 320
        Top = 192
        Width = 281
        Height = 153
        ReadOnly = True
        TabOrder = 0
      end
      object Memo2: TMemo
        Left = 416
        Top = 32
        Width = 185
        Height = 121
        ReadOnly = True
        TabOrder = 1
      end
      object Memo3: TMemo
        Left = 11
        Top = 192
        Width = 289
        Height = 153
        ReadOnly = True
        TabOrder = 2
      end
      object Memo1: TMemo
        Left = 12
        Top = 32
        Width = 389
        Height = 121
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 487
    Width = 772
    Height = 35
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 1
    object Btnizlaz: TBitBtn
      Left = 688
      Top = 6
      Width = 72
      Height = 23
      Caption = '&Izlaz'
      TabOrder = 0
      TabStop = False
      OnClick = BtnizlazClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF7F7FF7F00F
        7FFFF7FF7F7FF0E0FF7FF7F7FF7F70E607FF000000FF70E66000FFFFFFF7F0E6
        607FFFFF078880E6607FFFFF008880E6607FFF77060880E8607FF0000E6080E0
        607F0EEEEEE600E6607F0EEEEEE680E6607FFFFF0E6880E6607FFFFF068880E6
        607FFFFF0F88880E607FFFFFFF888880E07FFFFFFF00000000FF}
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 138
    Height = 487
    Align = alLeft
    Color = clWhite
    TabOrder = 2
    object Label39: TLabel
      Left = 16
      Top = 168
      Width = 93
      Height = 48
      Caption = 'Prilago'#273'avanje'#13#10'programa va'#353'im'#13#10'specifi'#263'nostima'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Image1: TImage
      Left = 2
      Top = 16
      Width = 128
      Height = 128
      AutoSize = True
      Picture.Data = {
        0A544A504547496D6167650B0E0000FFD8FFE000104A46494600010100000100
        010000FFDB00430006040506050406060506070706080A100A0A09090A140E0F
        0C1017141818171416161A1D251F1A1B231C1616202C20232627292A29191F2D
        302D283025282928FFDB0043010707070A080A130A0A13281A161A2828282828
        2828282828282828282828282828282828282828282828282828282828282828
        28282828282828282828282828FFC00011080080008003012200021101031101
        FFC4001F0000010501010101010100000000000000000102030405060708090A
        0BFFC400B5100002010303020403050504040000017D01020300041105122131
        410613516107227114328191A1082342B1C11552D1F02433627282090A161718
        191A25262728292A3435363738393A434445464748494A535455565758595A63
        6465666768696A737475767778797A838485868788898A92939495969798999A
        A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
        D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
        01010101010101010000000000000102030405060708090A0BFFC400B5110002
        0102040403040705040400010277000102031104052131061241510761711322
        328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
        292A35363738393A434445464748494A535455565758595A636465666768696A
        737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
        A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
        E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FAA6
        8A28A0028A2A1BDBB82C6DA4B8BB99218231967738028026AA7A9EAB61A5C5E6
        6A37705B276F31C027E83A9FC2B91B9D7F57D7E4687C3F1B59599E0DDCAB991C
        7FB2A7803DCF3F4AB1A6F82ED2297ED17ACF7374DCB4B331773F89A007CDE3DB
        0662BA6D8EA37E7380D1C3B14FE2E47F2A81BC5FAC37FA8F0D120F4F32F021FD
        10D74F069D6B08C2C63A62A716F00E9127E5401C88F17EB287F7FE19207FD33B
        C0E7FF0040153C3E3CB1560BA958EA3607382D243BD7F3427F9574E6DE023989
        3F2A827D3AD260434639A007E99AAD86A91799A75DC1729DFCB7048FA8EA3F1A
        B95C6EA7E0CB496517162CD6B74BCACB036C71F88AAF6FAFEADE1F9043AFC6D7
        B66381771262441FED28E0FD473F5A00EEA8A86CAEE0BEB68EE2D2649A090655
        D0E41A9A800A28A2800A28A2802AEA77F6FA658CB77792048631927B9F400772
        6B82C5CF89AF92EF54CC7668D982D3A851D8B7AB545ACEA27C47ADB1562749B1
        62B1AF69A41D5BDC761FFD7AE4ED3C512CFACEA305F6EB58A397CA8195BA0001
        0DF99FD2803D264D54D81090C212243B5948E47D6B6AC35286F610F130CF71E9
        5C35B6AABA9B8B3BE78E1D4C2FEE66FE0B85F426B29EFEE746BC67883A796712
        C2DD53FC45007ABF9B479B5CEE89AEC1AADB0789C6FC7CCB9E95A3E7FBF1401A
        3E65472DD2C781D58F402A8B5C00A49380299A4B8B8925B87E769C2FB5006903
        315DCEC235AA124D15DC8D037EF571C9C74AA7E21BC90986189CA8724123D6A5
        B354B68804E4F727BD00604B1DD7856FDEEF4C064B37399ED7B30FEF2FA35775
        A65FDBEA76315DD9C81E190641EE3D41F422B8CF15EA6F6F6CB2411AC8B1B813
        337445279FC6B3742D4FFE11ED62372C46917EC0483B4321E8FF0043D0FF00F5
        A803D3E8A28A002B97F889AB3E9BA03436CD8BCBD6FB3C58EA33F79BF019FC48
        AEA2BCC3C7175F6DF1C436C49F274FB70719E37BF27FF1D0B400CD3A04B2B38A
        08C615001587E24D112FE177840598F3C71CD6C9973D3A51E60E9906803C9E3D
        6A4D3E5FECDD6848210DFBB981F9A26F506BB5B2D762D4FC8D375BB88E2BEDB8
        B1D487DC9D7B2BFF00876A87C65E1A875BB3665004E0641F5AF1F5D4A7D06E24
        D2B5D8DE5D3D9BAE70633D994F622803D4EE66BEF0FEAAE63468A788E65801CE
        41FE25F5535E8DA26B4751B0599E368E4C6591B83F5C7A5784786352D47C75E2
        5D3B499F50DD61A6EE9526236C9344A412A7B92460019F5AF709F4337DB60591
        C348EADFBA936B0E720923F95004FA9EBD69670466E25D89382B1BF5463E9B87
        00E3B1AB5A45F8874F00B062C73C1EB5E47F11AEF4F17D73656B3DCA490B66E0
        A8668DCAE5491EFCE323B554F01F892E239EC74E96E167B79FE481D97694619C
        A13D4F18FF00F55007B05DDCFDA7F74A0927A7B568D9E9DA84F1AA99C2A1182D
        DFF0AE013E20E85A55E189965B971F79D0719F6A9351F8C6F345E478774799A5
        231E6CA3701F871401BBF152F6DF4DD1AD342B320DDDE4AACC01F98203D4FD4F
        F5AAB25AACFA30B494654C7B4F1DEB93D034DBEBDD4DF58D7A5796F243901CE7
        15D80930012702803ADF877AB3EA5A02C372DBAF2C9BECF293D4E3EEB7E231F8
        835D45797F81AE8D978E67B6C9F2B508338CFF001A723F4DD5EA1400578B5D4F
        E7F8B7C4139249FB498BE9B3E5FE95ED35E0FB8C7E21F1086273FDA539FC0C86
        803544BC714A25E4E0D51F331C1C6293CDEF9ED4017FCD3C7E79AE27E2869565
        75E1BBFBC9A2025B785E40475F9549FE95D479D9EFCD64F89E2179A25CC0DCA4
        885197D548C1FD2803C23C09ADDDE93AE595EDB64CCAC170A7870DC1183D883F
        857B95EF8A351B6BABBD734DBC9AE2C15D17FB355712428508639FE3F98E723D
        474C57CE3A2B7D82EBC8B895A29227214EC39041C64577BE1CBCF37C516F3B5D
        CD3DB1995E548729B901E47D2802FF008CE1B8BB956FEF12F163902163342D12
        216190188CFE7C0AC1B6BC9B47D52DEE4CD03ADA4AB2858DB761D586EC01D063
        8FA57D2735C966424C72A4803AED60438FE4718EF5E01F13EC3448FC4B168FE1
        981D6E6E58BEA05662CB0E4E4C614FDD3D49FAD007A8786ADB4FBED3C5F240AC
        6E7F7D9231F7867A76EB5BD0C36F07FAB8A343EC2B234084596916F0800617A0
        E315A1E69C8C1E2802EF99CE73DBBF6A3CCC753C76AA464E738C5065F5A009ED
        26F23C5BE1F9C139FB508B3FEFFCBFD6BDA6BC1C3993C41E1F03AFF69407F0F3
        057BC50015E19E268DACBC73AD407859245997DC300C7F535EE75E49F192C4DA
        6B5A6EAE8311CC86DA523D472BF9E4FF00DF3401CE890919E293CDE0906A8893
        0073903AD38316202F53D85005BF33AFAFD6A8DC4B35DCC2D6D813231E4FF76A
        D7D9E63844C991BBFF0074547AA5FDB78634F90074FB6B296DCDD13D09FE83BD
        0078ADEE8C2FED98901B13CA55D7A8CB7F2AADA358EA5A4C922C526F89F1F2B0
        3D477EB5F4D681E238F4FD1ECEDACEDEC8C091AED671C9C8CE4D690F17C87FE5
        D34F3FF01FFEBD53689499E0BA8788F599F4C8B4DD200B38638963372CB991BB
        B1033C6493CD52F0C6936BA24D653DE44D2A3DDA2CCE4E642ACAC320FB139FAD
        7D13FF00098CA3EEDAE9C3FE03FF00D7AC2F1778A23D63C377F67756F622365F
        EE60EE1C8C67DE84D034CC96DF6A21DF289E094660B85FBB20F43E8C3B8FCBD9
        4CBF5AE77C1B35D5A5D2E997845C69F2E18AC9CF18E0FD41039F7F6AF496D12C
        6EADD92DD7C99F1F23062467D0E6A4A399326473D0537CC38C038AAF70925BCC
        F0CE9B2543865351990004E4FA5006B786236BDF1CE8902F2A921998FA6D0587
        EA2BDD6BC93E0DD89BBD6B52D5DD47970A0B688FA9272DF9607FDF55EB740056
        278CF445F107876EEC0E04ACBBE163FC2E391FE1F435B745007CCF0F9AB1BA4E
        0A4D012922B0C608A9EFE6D42C5228B478A337728DCD3CA9BC20F61D3DB9F43F
        87A0FC4FF0B98EE1B5CB08F7238C5E46A3FF001FFF001AE1E15BD482258A18EE
        6241FBA93714751E99A00B577AE4D61E1EB6B9D4A1822D6191848B10C29E7E57
        2BD891DAB8BB7D326D5EE1AF3530C41259118E4F3DCFBFF2AEA63D1A7BBB8F3F
        50C7072B183C03EBCF535A62C31D07E9401C0CDE0EB291CBE5FE80918A6FFC21
        5658EB2FFDF46BD045891D07E428FB09C72B401E7BFF00085D913D64FF00BE8E
        2A6B5F095A5BCC2401D88E80B645779F61F6A4FB0E3A0A00E5751B6BC0D1CFA7
        4BE55CC4300E3208F43ED5B9E17F16B4B22DAEA49F67BA518DA4FDEF707BD5FF
        00B09C703154EFF418AF107989F38E8C3820FD6803A5D7ECA3D5EC7ED7032FDA
        225CE41003AFA13ED5C1DC0976A4502169E53B1140C92C78ABD2DA6A31D9B5B5
        CDD11680E5D81C171E86BBAF861E172F3AEB77F1ED4418B48C8FCDCFF4A00ED7
        C19A22F87FC3B6960306555DF337F7A43C9FF0FA0ADBA28A0029188032696A0B
        B2444714014F50BF8A34659369523041E845793EB091E8B7CF73A7A9934F73BA
        4847262F52BED5D0F89A7995DB6E6B8CB89A52C724D00755A5BDA6A76EB2DA48
        8EA4763D2AF7F66FB579A0866B5B9373A64ED6B71D480328FF0055AE934CF1E5
        C59811EB962C547FCB7806F5FA9EE2803A7FECDE3A51FD9DCF4A9B4CF16F87F5
        15061BE8413D99B06B6A3B9B094652E6123D9850073FFD9DED49FD9DC7DDFD2B
        A192E2C23197B9840F76158BA9F8B7C3FA729335F4248ECA7268021FECEE7A55
        1D4DED34C81A5BA91100F53D6B1B53F1E5C5E663D0EC1829E93CE362FD4773F8
        5739E4CF73722E7539DAEEE072370C227D16803ABD02D535CBD4BAD494C7A7A9
        DD1C07832FA16F415EB7673C6F1A88C00A06001C002BC5B4EB89C48319AF48F0
        DCB2322EECD007554522F414B40053645DEB834EA28039ED57475B804E2B95BE
        F0D9C9DAB5E96403D6A27811BA81401E433E832293F29AA5268F2AFF0009AF63
        934F89BB0AAEFA444DFC22803C5AE7C3D14E7335AC6EDFDE2833F9D556F0ADB9
        E91CCBFEECD22FF235ED8DA2447F84530E8517F7050078BAF856DC7FCB299BFD
        E9A46FE66ADDAF876280E61B58D1BFBC1067F3AF5E1A1C43F845489A2C43F845
        00796C5A2CADFC26B42DBC3D231195AF4A8F4B897F845588ECA34EC28038CD37
        C3A1482CB5D669F62B6EA0015796355E829F40051451401FFFD9}
    end
  end
  object DataSource1: TDataSource
    DataSet = Podaci.TabSetUp
    Left = 232
    Top = 362
  end
  object DInfo: TDataSource
    DataSet = TInfo
    Left = 388
    Top = 360
  end
  object LMDDirDlg1: TLMDDirDlg
    CaptionTitle = 'Odaberite direktorij'
    Left = 356
    Top = 360
  end
  object TInfo: TMySQLDataset
    Server = Podaci.myDB
    TableName = 'infobox'
    Left = 416
    Top = 360
  end
end
