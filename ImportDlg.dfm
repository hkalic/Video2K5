object FImportDlg: TFImportDlg
  Left = 261
  Top = 140
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = ' '
  ClientHeight = 352
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 515
    Height = 73
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 212
      Height = 32
      Alignment = taCenter
      Caption = 
        'Da li želite dodati navedene filmove'#13#10'u postojeæu bazu podataka ' +
        '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 213
      Height = 13
      Caption = 'Zadnji broj filma (prije dodavanja) u vašoj bazi'
    end
    object Label3: TLabel
      Left = 235
      Top = 48
      Width = 39
      Height = 13
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 308
      Top = 11
      Width = 113
      Height = 28
      Caption = 'Dodaj filmove'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 440
      Top = 11
      Width = 65
      Height = 28
      Caption = 'Izlaz'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 73
    Width = 515
    Height = 279
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Sifra'
        Title.Caption = 'Broj filma'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Naziv'
        Title.Caption = 'Naziv filma'
        Width = 225
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kupljen'
        Title.Caption = 'Datum kupovine filma'
        Width = 138
        Visible = True
      end>
  end
  object Table1: TTable
    DatabaseName = 'DB'
    TableName = 'kazete2'
    Left = 472
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 440
    Top = 88
  end
end
