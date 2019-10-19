inherited FUnosVrstePologa: TFUnosVrstePologa
  Left = 311
  Top = 190
  Caption = 'Vrste pologa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pregled: TPageControl
    ActivePage = Tunos
    TabIndex = 1
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
          Caption = 'Vrsta pologa'
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
    DataSet = TVrstePologa
  end
  inherited TQ: TMySQLQuery
    TableName = 'vrstapologa'
    object TQSifra: TAutoIncField
      Alignment = taCenter
      DisplayLabel = #352'ifra'
      FieldName = 'Sifra'
      Origin = 'Sifra'
      ReadOnly = True
    end
    object TQNaziv: TStringField
      FieldName = 'Naziv'
      Origin = 'Naziv'
      Size = 25
    end
  end
  object TVrstePologa: TMySQLDataset
    Server = Podaci.myDB
    MasterFields = 'Sifra=Sifra'
    MasterSource = DQ
    TableName = 'vrstapologa'
    Left = 560
    Top = 224
    object TVrstePologaSifra: TAutoIncField
      Alignment = taCenter
      DisplayLabel = #352'ifra'
      FieldName = 'Sifra'
      Origin = 'Sifra'
      ReadOnly = True
    end
    object TVrstePologaNaziv: TStringField
      FieldName = 'Naziv'
      Origin = 'Naziv'
      Size = 25
    end
  end
end
