inherited FUnosMediji: TFUnosMediji
  Left = 330
  Top = 172
  Caption = 'Medij'
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
          Caption = 'Vrsta medija'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel [3]
          Left = 24
          Top = 171
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Boja za pregled'
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
        object dxDBButtonEdit1: TdxDBButtonEdit
          Left = 104
          Top = 168
          Width = 97
          TabOrder = 3
          DataField = 'Boja'
          DataSource = DS
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = dxDBButtonEdit1ButtonClick
          ExistButtons = True
        end
        object Panel3: TPanel
          Left = 208
          Top = 168
          Width = 89
          Height = 21
          TabOrder = 4
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = TMediji
    OnDataChange = DSDataChange
  end
  inherited TQ: TMySQLQuery
    TableName = 'medij'
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
    object TQBoja: TIntegerField
      FieldName = 'Boja'
    end
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 420
    Top = 161
  end
  object TMediji: TMySQLDataset
    Server = Podaci.myDB
    MasterFields = 'Sifra=Sifra'
    MasterSource = DQ
    TableName = 'medij'
    Left = 552
    Top = 224
    object TMedijiSifra: TAutoIncField
      Alignment = taCenter
      DisplayLabel = #352'ifra'
      FieldName = 'Sifra'
      ReadOnly = True
    end
    object TMedijiNaziv: TStringField
      FieldName = 'Naziv'
      Size = 25
    end
    object TMedijiBoja: TIntegerField
      FieldName = 'Boja'
    end
  end
end
