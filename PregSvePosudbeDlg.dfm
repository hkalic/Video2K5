inherited FPregSvePosudbeDlg: TFPregSvePosudbeDlg
  Left = 209
  Caption = 'Pregled svih posudbi filma'
  ClientWidth = 894
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 894
    Height = 41
    object Label1: TLabel [0]
      Left = 18
      Top = 14
      Width = 52
      Height = 13
      Caption = 'Film broj:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [1]
      Left = 298
      Top = 14
      Width = 97
      Height = 13
      Caption = 'Ukupno posudbi:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited Btnizlaz: TBitBtn
      Left = 804
    end
    inherited BitBtn1: TBitBtn
      Left = 724
      Top = 9
    end
    object SpinEd: TRxSpinEdit
      Left = 84
      Top = 8
      Width = 91
      Height = 24
      Decimal = 0
      MaxValue = 20000
      MinValue = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnKeyPress = SpinEdKeyPress
    end
    object Button1: TButton
      Left = 192
      Top = 9
      Width = 93
      Height = 22
      Caption = 'Prika'#382'i posudbe'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 400
      Top = 8
      Width = 49
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Text = '0'
    end
  end
  inherited DBGrid1: TdxDBGrid
    Top = 41
    Width = 894
    Height = 397
    DefaultFields = False
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoMouseScroll, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoSyncSelection, edgoUseBookmarks]
    object DBGrid1sifrakazete: TdxDBGridMaskColumn
      Caption = #352'ifra'
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sifrakazete'
    end
    object DBGrid1barcode: TdxDBGridMaskColumn
      Caption = 'Barkod'
      Width = 57
      BandIndex = 0
      RowIndex = 0
      FieldName = 'barcode'
    end
    object DBGrid1sifraclana: TdxDBGridMaskColumn
      Caption = '# '#269'lana'
      Width = 59
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sifraclana'
    end
    object DBGrid1imeprezime: TdxDBGridMaskColumn
      Caption = 'Ime prezime '#269'lana'
      Width = 184
      BandIndex = 0
      RowIndex = 0
      FieldName = 'imeprezime'
    end
    object DBGrid1posudjen: TdxDBGridDateColumn
      Caption = 'Posu'#273'en'
      Width = 112
      BandIndex = 0
      RowIndex = 0
      FieldName = 'posudjen'
    end
    object DBGrid1vracen: TdxDBGridDateColumn
      Caption = 'Vra'#269'en'
      Width = 112
      BandIndex = 0
      RowIndex = 0
      FieldName = 'vracen'
    end
    object DBGrid1nazivkluba: TdxDBGridMaskColumn
      Caption = 'Naziv kluba'
      Width = 178
      BandIndex = 0
      RowIndex = 0
      FieldName = 'nazivkluba'
    end
    object DBGrid1naziv: TdxDBGridMaskColumn
      Caption = 'Medij'
      Width = 94
      BandIndex = 0
      RowIndex = 0
      FieldName = 'naziv'
    end
  end
  inherited DataSource1: TDataSource
    DataSet = Query1
  end
  object Query1: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      'SELECT k.sifrakazete, k.barcode, k.sifraclana, c.imeprezime,'
      'k.posudjen, k.vracen, s.nazivkluba, m.naziv'
      'FROM koi k, clanovi c, setup s, bcodekazete b, medij m'
      'WHERE k.sifraclana=c.sifra'
      'AND k.sifrakluba=s.sifrakluba'
      'AND k.barcode=b.barcode'
      'AND b.sifra_medija=m.sifra'
      'AND k.sifrakazete=[BRF]'
      '[PERIOD]'
      'ORDER BY k.vracen DESC')
    OnExecSQL = Loguj
    Left = 432
    Top = 96
  end
end
