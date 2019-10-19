inherited FUnosCrneListe: TFUnosCrneListe
  Left = 226
  Top = 166
  Caption = 'Unos crne liste'
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
          Left = 51
          Top = 99
          Width = 50
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #352'ifra'
          FocusControl = DBEdit1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel [2]
          Left = 32
          Top = 139
          Width = 69
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ime i prezime'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel [3]
          Left = 32
          Top = 171
          Width = 69
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Napomena'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel [4]
          Left = 32
          Top = 203
          Width = 69
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Datum upisa'
          FocusControl = DBEdit4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel [5]
          Left = 32
          Top = 235
          Width = 69
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Telefon1'
          FocusControl = DBEdit5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel [6]
          Left = 32
          Top = 267
          Width = 69
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Telefon2'
          FocusControl = DBEdit6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel [7]
          Left = 15
          Top = 28
          Width = 566
          Height = 26
          Caption = 
            'Kod upisa PREZIMENA i IMENA '#269'lana morate paziti da sve budu veli' +
            'ka slova i da podatak bude to'#269'no upisan, ina'#269'e se'#13#10'ne'#263'e mo'#263'i pro' +
            'na'#269'i '#269'lan.'
        end
        object DBEdit1: TDBEdit
          Left = 104
          Top = 96
          Width = 64
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'Sifra'
          DataSource = DS
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Tag = 128
          Left = 104
          Top = 136
          Width = 233
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ImePrezime'
          DataSource = DS
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 104
          Top = 168
          Width = 505
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Napomena'
          DataSource = DS
          TabOrder = 3
        end
        object DBEdit4: TDBEdit
          Left = 104
          Top = 200
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DatumUpisa'
          DataSource = DS
          TabOrder = 4
        end
        object DBEdit5: TDBEdit
          Left = 104
          Top = 232
          Width = 129
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Telefon1'
          DataSource = DS
          TabOrder = 5
        end
        object DBEdit6: TDBEdit
          Left = 104
          Top = 264
          Width = 129
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Telefon2'
          DataSource = DS
          TabOrder = 6
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = TCrnaLista
  end
  inherited TQ: TMySQLQuery
    TableName = 'crnalista'
    Left = 600
    object TQSifra: TAutoIncField
      DisplayLabel = #352'ifra'
      FieldName = 'Sifra'
      Origin = 'Sifra'
      ReadOnly = True
    end
    object TQImePrezime: TMySQLStringField
      DisplayLabel = 'Ime prezime'
      FieldName = 'ImePrezime'
      Origin = 'ImePrezime'
      Size = 30
      StringType = stNormal
    end
    object TQNapomena: TMySQLStringField
      DisplayWidth = 50
      FieldName = 'Napomena'
      Origin = 'Napomena'
      Size = 50
      StringType = stNormal
    end
  end
  object TCrnaLista: TMySQLDataset
    Server = Podaci.myDB
    MasterFields = 'Sifra=Sifra'
    MasterSource = DQ
    TableName = 'crnalista'
    AfterInsert = TCrnaListaAfterInsert
    Left = 600
    Top = 256
    object TCrnaListaSifra: TAutoIncField
      FieldName = 'Sifra'
      Origin = 'Sifra'
      ReadOnly = True
    end
    object TCrnaListaImePrezime: TMySQLStringField
      FieldName = 'ImePrezime'
      Origin = 'ImePrezime'
      Size = 30
      StringType = stNormal
    end
    object TCrnaListaNapomena: TMySQLStringField
      FieldName = 'Napomena'
      Origin = 'Napomena'
      Size = 300
      StringType = stNormal
    end
    object TCrnaListaDatumUpisa: TDateField
      FieldName = 'DatumUpisa'
      Origin = 'DatumUpisa'
      Visible = False
    end
    object TCrnaListaTelefon1: TMySQLStringField
      FieldName = 'Telefon1'
      Origin = 'Telefon1'
      Visible = False
      Size = 15
      StringType = stNormal
    end
    object TCrnaListaTelefon2: TMySQLStringField
      FieldName = 'Telefon2'
      Origin = 'Telefon2'
      Visible = False
      Size = 15
      StringType = stNormal
    end
  end
end
