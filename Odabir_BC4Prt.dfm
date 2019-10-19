object Odabir_BC: TOdabir_BC
  Left = 293
  Top = 158
  Width = 775
  Height = 539
  ActiveControl = dxDBGrid2
  Caption = 'Odaberite kodove za ispis naljepnica'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 265
    Align = alTop
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 329
      Top = 1
      Width = 8
      Height = 263
      Cursor = crHSplit
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 328
      Height = 263
      Align = alLeft
      TabOrder = 0
      object GroupBox3: TGroupBox
        Left = 8
        Top = 8
        Width = 313
        Height = 105
        Caption = ' Filteri '
        TabOrder = 0
        object Label30: TLabel
          Tag = 1
          Left = 22
          Top = 24
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vrsta medija'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 22
          Top = 48
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Status filma'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 14
          Top = 64
          Width = 59
          Height = 33
          Alignment = taCenter
          AutoSize = False
          Caption = 'Odabir video kluba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object RxDBLookupCombo7: TRxDBLookupCombo
          Tag = 1
          Left = 83
          Top = 21
          Width = 200
          Height = 20
          Hint = 'CTRL-ENTER ulazak u '#353'ifarnik'
          DropDownCount = 8
          DropDownWidth = 200
          Color = clSilver
          DataField = 'Sifra_medija'
          DataSource = Podaci.DBarcode
          Enabled = False
          LookupField = 'Sifra'
          LookupDisplay = 'Naziv;Sifra'
          LookupSource = DMediji
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnChange = RxDBLookupCombo7Change
        end
        object RxDBLookupCombo9: TRxDBLookupCombo
          Tag = 2
          Left = 83
          Top = 45
          Width = 200
          Height = 20
          Hint = 'CTRL-ENTER ulazak u '#353'ifarnik'
          DropDownCount = 8
          DropDownWidth = 200
          Color = clSilver
          DataField = 'Status'
          DataSource = Podaci.DBarcode
          Enabled = False
          LookupField = 'Sifra'
          LookupDisplay = 'Naziv;Sifra'
          LookupSource = DStatFilma
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnChange = RxDBLookupCombo7Change
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Tag = 2
          Left = 83
          Top = 69
          Width = 200
          Height = 20
          DropDownCount = 8
          DropDownWidth = 200
          Color = clSilver
          DataField = 'Sifra_videokluba'
          DataSource = Podaci.DBarcode
          LookupField = 'SifraKluba'
          LookupDisplay = 'NazivKluba;Grad'
          LookupSource = DKlubovi
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnChange = RxDBLookupCombo7Change
        end
        object CheckBox1: TCheckBox
          Left = 288
          Top = 22
          Width = 20
          Height = 17
          TabOrder = 3
          OnClick = CheckBox1Click
        end
        object CheckBox2: TCheckBox
          Left = 288
          Top = 46
          Width = 20
          Height = 17
          TabOrder = 4
          OnClick = CheckBox2Click
        end
        object CheckBox3: TCheckBox
          Left = 288
          Top = 70
          Width = 20
          Height = 17
          Checked = True
          State = cbChecked
          TabOrder = 5
          OnClick = CheckBox3Click
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 120
        Width = 313
        Height = 137
        Caption = ' Odabir '
        TabOrder = 1
        object Label3: TLabel
          Left = 48
          Top = 83
          Width = 52
          Height = 13
          Caption = 'Od datuma'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 48
          Top = 107
          Width = 52
          Height = 13
          Caption = 'Do datuma'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 48
          Top = 24
          Width = 64
          Height = 13
          Caption = 'Od broja filma'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 48
          Top = 48
          Width = 64
          Height = 13
          Caption = 'Do broja filma'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object OdBroja: TEdit
          Left = 120
          Top = 21
          Width = 57
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object DatumOd: TwwDBDateTimePicker
          Left = 104
          Top = 80
          Width = 81
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Epoch = 1950
          Enabled = False
          MaxDate = 55153
          MinDate = 32874
          ShowButton = True
          TabOrder = 1
          UnboundDataType = wwDTEdtDate
        end
        object DatumDo: TwwDBDateTimePicker
          Left = 104
          Top = 104
          Width = 81
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Epoch = 1950
          Enabled = False
          MaxDate = 55153
          MinDate = 32874
          ShowButton = True
          TabOrder = 2
          UnboundDataType = wwDTEdtDate
        end
        object DoBroja: TEdit
          Left = 120
          Top = 45
          Width = 57
          Height = 21
          Enabled = False
          TabOrder = 3
        end
        object CheckBox4: TCheckBox
          Left = 24
          Top = 34
          Width = 20
          Height = 17
          TabOrder = 4
          OnClick = CheckBox4Click
        end
        object CheckBox5: TCheckBox
          Left = 24
          Top = 92
          Width = 20
          Height = 17
          TabOrder = 5
          OnClick = CheckBox5Click
        end
        object BitBtn1: TBitBtn
          Left = 216
          Top = 48
          Width = 75
          Height = 25
          Caption = 'DODAJ'
          TabOrder = 6
          OnClick = DodajClick
        end
        object BitBtn2: TBitBtn
          Left = 216
          Top = 80
          Width = 75
          Height = 22
          Caption = 'PRINT'
          PopupMenu = PopupMenu1
          TabOrder = 7
          OnMouseDown = BitBtn2MouseDown
        end
        object CheckBox6: TCheckBox
          Left = 218
          Top = 109
          Width = 75
          Height = 20
          Caption = '+ dodatna'
          Checked = True
          State = cbChecked
          TabOrder = 8
        end
        object CheckBox7: TCheckBox
          Left = 217
          Top = 12
          Width = 82
          Height = 20
          Caption = 'gledaj filtere'
          Checked = True
          State = cbChecked
          TabOrder = 9
        end
      end
    end
    object Panel2: TPanel
      Left = 337
      Top = 1
      Width = 429
      Height = 263
      Align = alClient
      TabOrder = 1
      object dxDBGrid2: TdxDBGrid
        Left = 1
        Top = 1
        Width = 427
        Height = 261
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'barcode'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        TabOrder = 0
        OnKeyDown = dxDBGrid2KeyDown
        OnKeyPress = dxDBGrid2KeyPress
        DataSource = dsQuery
        Filter.Criteria = {00000000}
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoIndicator, edgoUseBitmap]
        object dxDBGrid2barcode: TdxDBGridMaskColumn
          Alignment = taCenter
          Caption = 'Barkod'
          HeaderAlignment = taCenter
          Width = 82
          BandIndex = 0
          RowIndex = 0
          FieldName = 'barcode'
        end
        object dxDBGrid2sifraKazete: TdxDBGridMaskColumn
          Alignment = taCenter
          Caption = 'Br. filma'
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'sifraKazete'
        end
        object dxDBGrid2film: TdxDBGridMaskColumn
          Alignment = taLeftJustify
          Caption = 'Naziv filma'
          HeaderAlignment = taCenter
          Width = 247
          BandIndex = 0
          RowIndex = 0
          FieldName = 'film'
        end
        object dxDBGrid2zanr: TdxDBGridMaskColumn
          Alignment = taCenter
          Caption = #381'anr'
          HeaderAlignment = taCenter
          Visible = False
          Width = 183
          BandIndex = 0
          RowIndex = 0
          FieldName = 'zanr'
        end
        object dxDBGrid2medij: TdxDBGridMaskColumn
          Alignment = taCenter
          Caption = 'Medij'
          HeaderAlignment = taCenter
          Visible = False
          Width = 113
          BandIndex = 0
          RowIndex = 0
          FieldName = 'medij'
        end
        object dxDBGrid2status: TdxDBGridMaskColumn
          Alignment = taCenter
          Caption = 'Status'
          HeaderAlignment = taCenter
          Visible = False
          Width = 183
          BandIndex = 0
          RowIndex = 0
          FieldName = 'status'
        end
        object dxDBGrid2datum_izmjene: TdxDBGridDateColumn
          Alignment = taCenter
          Caption = 'Datum izmjene'
          HeaderAlignment = taCenter
          Visible = False
          Width = 89
          BandIndex = 0
          RowIndex = 0
          FieldName = 'datum_izmjene'
        end
      end
    end
  end
  object dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 265
    Width = 767
    Height = 247
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'SifraFilma'
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    TabOrder = 0
    DataSource = DS
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoSyncSelection, edgoUseBookmarks]
    object dxDBGrid1RecId: TdxDBGridColumn
      Visible = False
      Width = 59
      BandIndex = 0
      RowIndex = 0
      FieldName = 'RecId'
    end
    object dxDBGrid1barcode: TdxDBGridMaskColumn
      Width = 82
      BandIndex = 0
      RowIndex = 0
      FieldName = 'barcode'
    end
    object dxDBGrid1sifrakazete: TdxDBGridMaskColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sifrakazete'
    end
    object dxDBGrid1film: TdxDBGridMaskColumn
      Width = 184
      BandIndex = 0
      RowIndex = 0
      FieldName = 'film'
    end
    object dxDBGrid1zanr: TdxDBGridMaskColumn
      Width = 124
      BandIndex = 0
      RowIndex = 0
      FieldName = 'zanr'
    end
    object dxDBGrid1medij: TdxDBGridMaskColumn
      Width = 94
      BandIndex = 0
      RowIndex = 0
      FieldName = 'medij'
    end
    object dxDBGrid1status: TdxDBGridMaskColumn
      Width = 106
      BandIndex = 0
      RowIndex = 0
      FieldName = 'status'
    end
    object dxDBGrid1datum_izmjene: TdxDBGridDateColumn
      Width = 90
      BandIndex = 0
      RowIndex = 0
      FieldName = 'datum_izmjene'
    end
  end
  object Button1: TButton
    Left = 536
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Design FR3'
    TabOrder = 2
    Visible = False
    OnClick = TestFR3
  end
  object DMediji: TDataSource
    DataSet = TMediji
    Left = 188
    Top = 17
  end
  object DStatFilma: TDataSource
    DataSet = TStatFilma
    Left = 244
    Top = 49
  end
  object DKlubovi: TDataSource
    DataSet = TKlubovi
    Left = 188
    Top = 73
  end
  object DS: TDataSource
    DataSet = TStavke
    Left = 160
    Top = 312
  end
  object TStavke: TdxMemData
    Indexes = <>
    SortOptions = []
    SortedField = 'naljepnica'
    Left = 200
    Top = 312
    object TStavkebarcode: TStringField
      DisplayLabel = 'Barkod'
      FieldName = 'barcode'
      Size = 13
    end
    object TStavkesifrakazete: TIntegerField
      DisplayLabel = 'Br. filma'
      FieldName = 'sifrakazete'
    end
    object TStavkefilm: TStringField
      DisplayLabel = 'Naziv filma'
      FieldName = 'film'
      Size = 30
    end
    object TStavkezanr: TStringField
      DisplayLabel = #381'anr'
      FieldName = 'zanr'
      Size = 25
    end
    object TStavkemedij: TStringField
      DisplayLabel = 'Medij'
      FieldName = 'medij'
      Size = 15
    end
    object TStavkestatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Size = 25
    end
    object TStavkedatum_izmjene: TDateField
      DisplayLabel = 'Datum izmjene'
      FieldName = 'datum_izmjene'
    end
    object TStavkenaljepnice: TStringField
      DisplayLabel = 'Naljepnica'
      FieldName = 'naljepnica'
      Visible = False
      Size = 30
    end
    object TStavkeimdb: TFloatField
      FieldName = 'imdb'
      Visible = False
    end
    object TStavkepg: TStringField
      FieldName = 'pg'
      Visible = False
      Size = 25
    end
  end
  object dsQuery: TDataSource
    DataSet = qBarkodovi
    Left = 501
    Top = 73
  end
  object PopupMenu1: TPopupMenu
    Left = 311
    Top = 186
    object Design1: TMenuItem
      Tag = 2
      Caption = 'Dizajn DVD naljepnice'
      OnClick = DizajnFR
    end
    object DizajnVHSreporta1: TMenuItem
      Tag = 3
      Caption = 'Dizajn VHS naljepnice'
      OnClick = DizajnFR
    end
    object DizajnZajednikenaljepnice1: TMenuItem
      Tag = 4
      Caption = 'Dizajn Zajedni'#269'ke DVD naljepnice'
      OnClick = DizajnFR
    end
    object DizajnZajednikeVHSnaljepnice1: TMenuItem
      Tag = 5
      Caption = 'Dizajn Zajedni'#269'ke VHS naljepnice'
      OnClick = DizajnFR
    end
  end
  object tVHS: TdxMemData
    Indexes = <>
    SortOptions = []
    SortedField = 'barcode'
    Left = 200
    Top = 368
    object StringField1: TStringField
      DisplayLabel = 'Barkod'
      FieldName = 'barcode'
      Size = 13
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Br. filma'
      FieldName = 'sifrakazete'
    end
    object StringField2: TStringField
      DisplayLabel = 'Naziv filma'
      FieldName = 'film'
      Size = 30
    end
    object StringField3: TStringField
      DisplayLabel = #381'anr'
      FieldName = 'zanr'
      Size = 25
    end
    object StringField4: TStringField
      DisplayLabel = 'Medij'
      FieldName = 'medij'
      Size = 15
    end
    object StringField5: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Size = 25
    end
    object DateField1: TDateField
      DisplayLabel = 'Datum izmjene'
      FieldName = 'datum_izmjene'
    end
    object StringField6: TStringField
      DisplayLabel = 'Naljepnica'
      FieldName = 'naljepnica'
      Visible = False
      Size = 30
    end
    object tVHSimdb: TFloatField
      FieldName = 'imdb'
      Visible = False
    end
    object tVHSpg: TStringField
      FieldName = 'pg'
      Visible = False
      Size = 25
    end
  end
  object tDVD: TdxMemData
    Indexes = <>
    SortOptions = []
    SortedField = 'barcode'
    Left = 232
    Top = 368
    object StringField7: TStringField
      DisplayLabel = 'Barkod'
      FieldName = 'barcode'
      Size = 13
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Br. filma'
      FieldName = 'sifrakazete'
    end
    object StringField8: TStringField
      DisplayLabel = 'Naziv filma'
      FieldName = 'film'
      Size = 30
    end
    object StringField9: TStringField
      DisplayLabel = #381'anr'
      FieldName = 'zanr'
      Size = 25
    end
    object StringField10: TStringField
      DisplayLabel = 'Medij'
      FieldName = 'medij'
      Size = 15
    end
    object StringField11: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Size = 25
    end
    object DateField2: TDateField
      DisplayLabel = 'Datum izmjene'
      FieldName = 'datum_izmjene'
    end
    object StringField12: TStringField
      DisplayLabel = 'Naljepnica'
      FieldName = 'naljepnica'
      Visible = False
      Size = 30
    end
    object tDVDimdb: TFloatField
      FieldName = 'imdb'
      Visible = False
    end
    object tDVDpg: TStringField
      FieldName = 'pg'
      Visible = False
      Size = 25
    end
  end
  object TMediji: TMySQLTable
    Server = Podaci.myDB
    TableName = 'medij'
    Left = 160
    Top = 16
  end
  object TKlubovi: TMySQLTable
    Server = Podaci.myDB
    TableName = 'setup'
    Left = 160
    Top = 72
  end
  object TStatFilma: TMySQLTable
    Server = Podaci.myDB
    TableName = 'statusfilma'
    Left = 216
    Top = 48
  end
  object qBarkodovi2: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      'SELECT b.barcode, b.sifraKazete, k.naziv film, '
      'z.naziv zanr, m.naziv medij, s.naziv status, '
      'b.datum_izmjene, m.naljepnica, k.imdb, k.pg'
      'FROM bcodekazete b, kazete k, vrsta z, medij m, statusfilma s'
      'WHERE b.sifrakazete=k.sifra'
      'AND z.sifra=k.zanr'
      'AND m.sifra=b.sifra_medija'
      'AND s.sifra=b.status'
      'AND m.naljepnica<>'#39#39)
    Left = 72
    Top = 176
  end
  object qBarkodovi: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      'SELECT b.barcode, b.sifraKazete, k.naziv film, '
      'z.naziv zanr, m.naziv medij, s.naziv status, '
      'b.datum_izmjene, m.naljepnica, k.imdb, k.pg'
      'FROM bcodekazete b, kazete k, vrsta z, medij m, statusfilma s'
      'WHERE b.sifrakazete=k.sifra'
      'AND z.sifra=k.zanr'
      'AND m.sifra=b.sifra_medija'
      'AND s.sifra=b.status'
      'AND m.naljepnica<>'#39#39)
    OnExecSQL = Loguj
    Left = 536
    Top = 72
  end
  object frxReport2: TfrxReport
    Version = '4.7.12'
    DataSet = frxDBDataset2
    DataSetName = 'frxDBDataset2'
    DotMatrixReport = False
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = '?? ?????????'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39777.984028912
    ReportOptions.LastChange = 39777.984028912
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 576
    Top = 376
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000
      Width = 1000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210
      PaperHeight = 297
      PaperSize = 9
    end
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10
    DefaultRightMargin = 10
    DefaultTopMargin = 10
    DefaultBottomMargin = 10
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    OnSaveReport = frxDesigner1SaveReport
    Left = 544
    Top = 376
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = tDVD
    Left = 632
    Top = 376
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = tVHS
    Left = 632
    Top = 408
  end
end
