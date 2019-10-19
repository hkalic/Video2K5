inherited FUnosBlagdana: TFUnosBlagdana
  Left = 340
  Top = 196
  Caption = 'FUnosBlagdana'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pregled: TPageControl
    inherited Tpregled: TTabSheet
      inherited TBar: TToolBar
        inherited DBNavigator3: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
    inherited Tunos: TTabSheet
      inherited Panel1: TPanel
        object Label2: TLabel [1]
          Left = 71
          Top = 99
          Width = 50
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #352'ifra:'
          FocusControl = DBEdit1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel [2]
          Left = 24
          Top = 139
          Width = 97
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Naziv blagdana:'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel [3]
          Left = 32
          Top = 178
          Width = 89
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Datum blagdana:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel [4]
          Left = 40
          Top = 226
          Width = 289
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'PA'#381'NJA!!! Upisati samo datume koji su neradni dani.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 136
          Top = 96
          Width = 64
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'SifraBlagdana'
          DataSource = DS
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Tag = 128
          Left = 136
          Top = 136
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NazivBlagdana'
          DataSource = DS
          TabOrder = 2
        end
        object wwDBDateTimePicker1: TwwDBDateTimePicker
          Left = 136
          Top = 175
          Width = 97
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          DataField = 'DatumBlagdana'
          DataSource = DS
          Epoch = 1950
          ShowButton = True
          TabOrder = 3
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = tBlagdani
  end
  inherited TQ: TMySQLQuery
    TableName = 'blagdani'
    object TQSifraBlagdana: TAutoIncField
      DisplayLabel = #352'ifra'
      FieldName = 'SifraBlagdana'
      ReadOnly = True
    end
    object TQNazivBlagdana: TMySQLStringField
      DisplayLabel = 'Naziv blagdana'
      FieldName = 'NazivBlagdana'
      Size = 40
      StringType = stNormal
    end
    object TQDatumBlagdana: TDateField
      DisplayLabel = 'Datum blagdana'
      FieldName = 'DatumBlagdana'
    end
  end
  object tBlagdani: TMySQLDataset
    Server = Podaci.myDB
    MasterFields = 'SifraBlagdana=SifraBlagdana'
    MasterSource = DQ
    TableName = 'blagdani'
    Left = 592
    Top = 256
    object tBlagdaniSifraBlagdana: TAutoIncField
      DisplayLabel = #352'ifra'
      FieldName = 'SifraBlagdana'
      ReadOnly = True
    end
    object tBlagdaniNazivBlagdana: TMySQLStringField
      DisplayLabel = 'Naziv blagdana'
      FieldName = 'NazivBlagdana'
      Size = 40
      StringType = stNormal
    end
    object tBlagdaniDatumBlagdana: TDateField
      DisplayLabel = 'Datum blagdana'
      FieldName = 'DatumBlagdana'
    end
  end
end
