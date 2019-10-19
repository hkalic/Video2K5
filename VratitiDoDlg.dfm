object FVratitiDoDlg: TFVratitiDoDlg
  Left = 289
  Top = 167
  Width = 438
  Height = 251
  ActiveControl = Platitcedo
  Caption = 'Upit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    430
    224)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 185
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 0
    object RNDatum: TDBText
      Left = 160
      Top = 72
      Width = 57
      Height = 17
      DataField = 'Datum'
      DataSource = Podaci.DSRacuni
    end
    object Label1: TLabel
      Left = 232
      Top = 72
      Width = 179
      Height = 13
      Caption = 'sam pogledao/la, te mi je za njih izdan'
    end
    object Label2: TLabel
      Left = 40
      Top = 88
      Width = 50
      Height = 13
      Caption = 'ra'#269'un broj:'
    end
    object RNBroj: TDBText
      Left = 104
      Top = 88
      Width = 57
      Height = 17
      DataField = 'BrojRacuna'
      DataSource = Podaci.DSRacuni
    end
    object Label3: TLabel
      Left = 168
      Top = 88
      Width = 39
      Height = 13
      Caption = 'u iznosu'
    end
    object Label4: TLabel
      Left = 40
      Top = 104
      Width = 206
      Height = 13
      Caption = 'Po istom ra'#269'unu sam ostao/la du'#382'an/du'#382'na'
    end
    object Label5: TLabel
      Left = 40
      Top = 120
      Width = 75
      Height = 13
      Caption = 'a to '#263'u platiti do'
    end
    object Label6: TLabel
      Left = 40
      Top = 16
      Width = 148
      Height = 16
      Caption = 'Razlog storna ra'#269'una'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Platitcedo: TwwDBDateTimePicker
      Left = 128
      Top = 120
      Width = 81
      Height = 19
      BorderStyle = bsNone
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Color = clInfoBk
      Epoch = 1950
      MaxDate = 55153
      MinDate = 37987
      ShowButton = True
      TabOrder = 0
      UnboundDataType = wwDTEdtDate
    end
    object rb1: TRadioButton
      Left = 24
      Top = 40
      Width = 385
      Height = 17
      Caption = 'film je tehni'#269'ki neuporabljiv/o'#353'te'#269'en'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rb2: TRadioButton
      Left = 24
      Top = 56
      Width = 385
      Height = 17
      Caption = 
        'jo'#353' za vrijeme odabira filma sam se predomislio/la i odabrao/la ' +
        'sam drugi film'
      TabOrder = 2
    end
    object rb3: TRadioButton
      Left = 24
      Top = 72
      Width = 137
      Height = 17
      Caption = 'filmove posu'#273'ene dana:'
      TabOrder = 3
    end
    object rb4: TRadioButton
      Left = 24
      Top = 136
      Width = 385
      Height = 17
      Caption = 'gre'#353'kom djelatnika videoteke krivo mi je zadu'#382'en film'
      TabOrder = 4
    end
    object rb5: TRadioButton
      Left = 24
      Top = 152
      Width = 105
      Height = 17
      Caption = 'neki drugi razlog'
      TabOrder = 5
    end
    object razlog: TEdit
      Left = 128
      Top = 152
      Width = 289
      Height = 13
      BorderStyle = bsNone
      MaxLength = 40
      TabOrder = 6
    end
    object Ostalo: TdxCurrencyEdit
      Left = 256
      Top = 101
      Width = 81
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Style.BorderStyle = xbsNone
      TabOrder = 7
      Alignment = taRightJustify
      AutoSize = False
      DisplayFormat = ',0.00 kn'
      UseThousandSeparator = True
      Height = 17
      StoredValues = 1
    end
    object RNCifra: TdxDBCurrencyEdit
      Left = 216
      Top = 85
      Width = 81
      Color = clBtnFace
      Style.BorderStyle = xbsNone
      TabOrder = 8
      Alignment = taLeftJustify
      AutoSize = False
      DataField = 'Cifra'
      DataSource = Podaci.DSRacuni
      ReadOnly = True
      DisplayFormat = ',0.00 kn'
      Nullable = False
      UseThousandSeparator = True
      Height = 17
      StoredValues = 65
    end
  end
  object BtnNaplati: TButton
    Left = 175
    Top = 192
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = BtnNaplatiClick
  end
end
