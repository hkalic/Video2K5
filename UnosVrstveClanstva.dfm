inherited FUnosVrstveClanstva: TFUnosVrstveClanstva
  Left = 261
  Top = 224
  Caption = 'Vrste '#269'lanstava'
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
          Caption = 'Vrste '#269'lanstva'
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
          DataField = 'Naziv'
          DataSource = DS
          TabOrder = 2
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = TVrstaClanstva
  end
  inherited TQ: TMySQLQuery
    TableName = 'vrstaupisa'
    object TQSifra: TAutoIncField
      Alignment = taCenter
      DisplayLabel = #352'ifra'
      FieldName = 'Sifra'
      ReadOnly = True
    end
    object TQNaziv: TStringField
      FieldName = 'Naziv'
      Size = 25
    end
  end
  object TVrstaClanstva: TMySQLDataset
    Server = Podaci.myDB
    MasterFields = 'Sifra=Sifra'
    MasterSource = DQ
    TableName = 'vrstaupisa'
    Left = 560
    Top = 224
    object TVrstaClanstvaSifra: TAutoIncField
      Alignment = taCenter
      DisplayLabel = #352'ifra'
      FieldName = 'Sifra'
      ReadOnly = True
    end
    object TVrstaClanstvaNaziv: TStringField
      FieldName = 'Naziv'
      Size = 25
    end
  end
end
