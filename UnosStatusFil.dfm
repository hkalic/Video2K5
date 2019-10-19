inherited FUnosStatusFil: TFUnosStatusFil
  Left = 312
  Top = 168
  Caption = 'Status filma'
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
          Left = 67
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
          Left = 48
          Top = 139
          Width = 69
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Naziv'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel [3]
          Left = 48
          Top = 179
          Width = 69
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Zbroj'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 120
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
          Left = 120
          Top = 136
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Naziv'
          DataSource = DS
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Tag = 128
          Left = 120
          Top = 176
          Width = 41
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Zbroj'
          DataSource = DS
          TabOrder = 3
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = TStatFil
  end
  inherited TQ: TMySQLQuery
    TableName = 'statusfilma'
    object TQSifra: TAutoIncField
      FieldName = 'Sifra'
      Origin = 'Sifra'
      ReadOnly = True
    end
    object TQNaziv: TMySQLStringField
      FieldName = 'Naziv'
      Origin = 'Naziv'
      Size = 25
      StringType = stNormal
    end
    object TQZbroj: TSmallintField
      FieldName = 'Zbroj'
      Origin = 'Zbroj'
      Required = True
      Visible = False
    end
  end
  object TStatFil: TMySQLDataset
    Server = Podaci.myDB
    MasterFields = 'Sifra=Sifra'
    MasterSource = DQ
    TableName = 'statusfilma'
    Left = 552
    Top = 224
    object TStatFilZbroj: TSmallintField
      FieldName = 'Zbroj'
      Origin = 'Zbroj'
      Required = True
      Visible = False
    end
    object TStatFilSifra: TAutoIncField
      Alignment = taCenter
      DisplayLabel = #352'ifra'
      FieldName = 'Sifra'
      Origin = 'Sifra'
      ReadOnly = True
    end
    object TStatFilNaziv: TStringField
      FieldName = 'Naziv'
      Origin = 'Naziv'
      Size = 25
    end
  end
end
