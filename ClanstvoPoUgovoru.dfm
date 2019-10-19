object FClanstvoPoUgovoru: TFClanstvoPoUgovoru
  Left = 257
  Top = 149
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #268'lanstvo po ugovoru'
  ClientHeight = 447
  ClientWidth = 736
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 736
    Height = 34
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 0
    object DBText2: TDBText
      Left = 3
      Top = 3
      Width = 62
      Height = 27
      Alignment = taCenter
      Color = clRed
      DataField = 'Sifra'
      DataSource = FKartica.DClan
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 67
      Top = 4
      Width = 290
      Height = 26
      Alignment = taCenter
      Color = clInfoBk
      DataField = 'ImePrezime'
      DataSource = FKartica.DClan
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Button2: TButton
      Left = 658
      Top = 7
      Width = 69
      Height = 21
      Caption = 'Izlaz'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button122: TButton
      Left = 562
      Top = 6
      Width = 69
      Height = 21
      Caption = 'Uplata'
      TabOrder = 1
      OnClick = Button122Click
    end
    object Button5: TButton
      Left = 378
      Top = 7
      Width = 111
      Height = 21
      Caption = 'Pregled uplata'
      TabOrder = 2
      OnClick = Button5Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 34
    Width = 736
    Height = 34
    Align = alTop
    TabOrder = 1
    object Label11: TLabel
      Left = 428
      Top = 13
      Width = 156
      Height = 13
      Alignment = taRightJustify
      Caption = 'Zadnja uplata '#269'lanarine vrijedi do'
      FocusControl = DBEdit15
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button3: TButton
      Left = 16
      Top = 7
      Width = 82
      Height = 20
      Caption = 'Unos novog'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button4: TButton
      Left = 102
      Top = 7
      Width = 82
      Height = 20
      Caption = 'Obri'#353'i'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button111Click
    end
    object DBEdit15: TDBEdit
      Left = 591
      Top = 13
      Width = 70
      Height = 13
      TabStop = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'ClanarinaVrijediDo'
      DataSource = FKartica.DClan
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 68
    Width = 736
    Height = 379
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'Sifra'
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 2
    DataSource = dsPoUgovoru
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoImmediateEditor, edgoMouseScroll, edgoTabThrough, edgoVertThrough]
    OptionsCustomize = [edgoBandMoving, edgoBandSizing]
    OptionsDB = [edgoCancelOnExit, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoSyncSelection, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoUseBitmap]
    object dxDBGrid1Sifra: TdxDBGridMaskColumn
      Width = 66
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Sifra'
    end
    object dxDBGrid1Datum: TdxDBGridDateColumn
      ReadOnly = True
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Datum'
    end
    object dxDBGrid1LookVrstaClanstva: TdxDBGridLookupColumn
      Width = 142
      BandIndex = 0
      RowIndex = 0
      FieldName = 'LookVrstaClanstva'
    end
    object dxDBGrid1IznosUgovora: TdxDBGridCurrencyColumn
      Width = 76
      BandIndex = 0
      RowIndex = 0
      FieldName = 'IznosUgovora'
      Nullable = False
    end
    object dxDBGrid1DodajNaSaldo: TdxDBGridCurrencyColumn
      Width = 77
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DodajNaSaldo'
      Nullable = False
    end
    object dxDBGrid1Placeno: TdxDBGridCurrencyColumn
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Placeno'
      Nullable = False
    end
    object dxDBGrid1CalcSaldo: TdxDBGridColumn
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'CalcSaldo'
    end
    object dxDBGrid1Komercijalista: TdxDBGridMaskColumn
      Visible = False
      Width = 71
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Komercijalista'
    end
    object dxDBGrid1SifraClana: TdxDBGridMaskColumn
      Visible = False
      Width = 65
      BandIndex = 0
      RowIndex = 0
      FieldName = 'SifraClana'
    end
    object dxDBGrid1VrstaUgovora: TdxDBGridMaskColumn
      Visible = False
      Width = 72
      BandIndex = 0
      RowIndex = 0
      FieldName = 'VrstaUgovora'
    end
    object dxDBGrid1RadnikID: TdxDBGridMaskColumn
      ReadOnly = True
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'RadnikID'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 176
    Top = 224
    object Prenesistatuslanstvanalana1: TMenuItem
      Caption = 'Prenesi status '#269'lanstva na '#269'lana'
      OnClick = Prenesistatuslanstvanalana1Click
    end
  end
  object TVrstaClanstva: TMySQLDataset
    Server = Podaci.myDB
    TableName = 'vrstaupisa'
    Left = 240
    Top = 192
  end
  object TPoUgovoru: TMySQLDataset
    Server = Podaci.myDB
    TableName = 'clanstvopougovoru'
    OnExecSQL = Loguj
    AfterInsert = TPoUgovoruAfterInsert
    BeforeEdit = TPoUgovoruBeforeEdit
    BeforePost = TPoUgovoruBeforePost
    AfterPost = TPoUgovoruAfterPost
    OnCalcFields = TPoUgovoruCalcFields
    Left = 360
    Top = 128
    object TPoUgovoruSifra: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Broj ugovora'
      DisplayWidth = 10
      FieldName = 'Sifra'
      Origin = 'Sifra'
      ReadOnly = True
    end
    object TPoUgovoruDatum: TDateField
      Alignment = taCenter
      DisplayWidth = 10
      FieldName = 'Datum'
      Origin = 'Datum'
      Required = True
    end
    object TPoUgovoruLookVrstaClanstva: TStringField
      DisplayLabel = 'Status '#269'lanstva'
      DisplayWidth = 22
      FieldKind = fkLookup
      FieldName = 'LookVrstaClanstva'
      LookupDataSet = TVrstaClanstva
      LookupKeyFields = 'Sifra'
      LookupResultField = 'Naziv'
      KeyFields = 'VrstaUgovora'
      Origin = 'LookVrstaClanstva'
      Size = 40
      Lookup = True
    end
    object TPoUgovoruIznosUgovora: TFloatField
      FieldName = 'IznosUgovora'
    end
    object TPoUgovoruDodajNaSaldo: TFloatField
      FieldName = 'DodajNaSaldo'
    end
    object TPoUgovoruPlaceno: TFloatField
      FieldName = 'Placeno'
    end
    object TPoUgovoruCalcSaldo: TCurrencyField
      DisplayLabel = 'Dug'
      DisplayWidth = 11
      FieldKind = fkCalculated
      FieldName = 'CalcSaldo'
      Origin = 'CalcSaldo'
      Calculated = True
    end
    object TPoUgovoruKomercijalista: TIntegerField
      DisplayWidth = 10
      FieldName = 'Komercijalista'
      Origin = 'Komercijalista'
      Visible = False
    end
    object TPoUgovoruSifraClana: TIntegerField
      DisplayWidth = 10
      FieldName = 'SifraClana'
      Origin = 'SifraClana'
      Visible = False
    end
    object TPoUgovoruVrstaUgovora: TIntegerField
      DisplayWidth = 10
      FieldName = 'VrstaUgovora'
      Origin = 'VrstaUgovora'
      Required = True
      Visible = False
    end
    object TPoUgovoruRadnikID: TStringField
      FieldName = 'RadnikID'
      Origin = 'RadnikID'
      Required = True
      Size = 4
    end
  end
  object dsPoUgovoru: TDataSource
    DataSet = TPoUgovoru
    Left = 400
    Top = 128
  end
end
