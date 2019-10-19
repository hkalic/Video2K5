inherited FUnosKontaktiranja: TFUnosKontaktiranja
  Caption = 'Na'#269'in kontaktiranja '#269'lanova'
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
        object DBEdit1: TDBEdit
          Left = 136
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
          Left = 136
          Top = 136
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Naziv'
          DataSource = DS
          TabOrder = 2
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = MySQLDataset1
  end
  inherited TQ: TMySQLQuery
    TableName = 'nacinkontaktiranja'
    object TQSifra: TAutoIncField
      DisplayLabel = #352'ifra'
      FieldName = 'Sifra'
      ReadOnly = True
    end
    object TQNaziv: TMySQLStringField
      FieldName = 'Naziv'
      Size = 30
      StringType = stNormal
    end
  end
  object MySQLDataset1: TMySQLDataset
    Server = Podaci.myDB
    MasterFields = 'Sifra=Sifra'
    MasterSource = DQ
    TableName = 'nacinkontaktiranja'
    Left = 592
    Top = 256
    object MySQLDataset1Sifra: TAutoIncField
      DisplayLabel = #352'ifra'
      FieldName = 'Sifra'
      ReadOnly = True
    end
    object MySQLDataset1Naziv: TMySQLStringField
      FieldName = 'Naziv'
      Size = 30
      StringType = stNormal
    end
  end
end
