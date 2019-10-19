inherited FUnosVrstaPlacanja: TFUnosVrstaPlacanja
  Caption = 'FUnosVrstaPlacanja'
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
          Caption = 'Vrsta pla'#269'anja'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
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
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Tag = 128
          Left = 104
          Top = 136
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NazivPlacanja'
          DataSource = DS
          TabOrder = 2
        end
        object DBCheckBox1: TDBCheckBox
          Left = 60
          Top = 179
          Width = 57
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Aktivan'
          DataField = 'Aktivan'
          DataSource = DS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          ValueChecked = 'D'
          ValueUnchecked = 'N'
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = TVrstePlacanja
  end
  inherited TQ: TMySQLQuery
    TableName = 'vrstaplacanja'
    object TQSifra: TAutoIncField
      DisplayLabel = #352'ifra'
      FieldName = 'Sifra'
      ReadOnly = True
    end
    object TQNazivPlacanja: TMySQLStringField
      DisplayLabel = 'Naziv pla'#269'anja'
      FieldName = 'NazivPlacanja'
      Size = 30
      StringType = stNormal
    end
    object TQAktivan: TMySQLStringField
      FieldName = 'Aktivan'
      Required = True
      Size = 1
      StringType = stNormal
    end
  end
  object TVrstePlacanja: TMySQLDataset
    Server = Podaci.myDB
    MasterFields = 'Sifra=Sifra'
    MasterSource = DQ
    TableName = 'vrstaplacanja'
    Left = 592
    Top = 224
    object TVrstePlacanjaSifra: TAutoIncField
      FieldName = 'Sifra'
      ReadOnly = True
    end
    object TVrstePlacanjaNazivPlacanja: TMySQLStringField
      FieldName = 'NazivPlacanja'
      Size = 30
      StringType = stNormal
    end
    object TVrstePlacanjaAktivan: TMySQLStringField
      FieldName = 'Aktivan'
      Required = True
      Size = 1
      StringType = stNormal
    end
  end
end
