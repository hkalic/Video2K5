object FUkupnoFilm: TFUkupnoFilm
  Left = 326
  Top = 213
  Width = 688
  Height = 422
  Caption = 'Detalji filma'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 15
      Top = 12
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Broj filma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 134
      Top = 12
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Naziv'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 92
      Top = 35
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Orginalni naziv'
      FocusControl = DBEdit5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit2: TDBEdit
      Tag = 128
      Left = 164
      Top = 8
      Width = 217
      Height = 21
      CharCase = ecUpperCase
      DataField = 'naziv'
      DataSource = dsFUkupno
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Tag = 128
      Left = 164
      Top = 31
      Width = 217
      Height = 21
      CharCase = ecUpperCase
      DataField = 'orginalnaziv'
      DataSource = dsFUkupno
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 64
      Top = 8
      Width = 65
      Height = 21
      Enabled = False
      TabOrder = 2
    end
  end
  object dxDBGrid1: TdxDBGrid
    Left = 0
    Top = 65
    Width = 680
    Height = 330
    Bands = <
      item
      end>
    DefaultLayout = False
    HeaderPanelRowCount = 1
    KeyField = 'barcode'
    ShowGroupPanel = True
    SummaryGroups = <
      item
        DefaultGroup = True
        SummaryItems = <
          item
            SummaryField = 'izdano'
            SummaryFormat = '(ukupno=0)'
            SummaryType = cstCount
          end>
        Name = 'dxDBGrid1SummaryGroup1'
      end>
    SummarySeparator = ', '
    Align = alClient
    TabOrder = 1
    OnKeyDown = dxDBGrid1KeyDown
    DataSource = dsFUkupno
    Filter.Active = True
    Filter.AutoDataSetFilter = True
    Filter.Criteria = {00000000}
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoMouseScroll, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    object dxDBGrid1barcode: TdxDBGridMaskColumn
      Caption = 'barkod'
      Width = 82
      BandIndex = 0
      RowIndex = 0
      FieldName = 'barcode'
    end
    object dxDBGrid1fmedij: TdxDBGridMaskColumn
      Caption = 'medij'
      Width = 94
      BandIndex = 0
      RowIndex = 0
      FieldName = 'fmedij'
    end
    object dxDBGrid1izdano: TdxDBGridMaskColumn
      Width = 54
      BandIndex = 0
      RowIndex = 0
      FieldName = 'izdano'
    end
    object dxDBGrid1posudio: TdxDBGridColumn
      Width = 157
      BandIndex = 0
      RowIndex = 0
      FieldName = 'posudio'
    end
    object dxDBGrid1DatumPos: TdxDBGridDateColumn
      Width = 108
      BandIndex = 0
      RowIndex = 0
      FieldName = 'datumpos'
    end
    object dxDBGrid1nazivkluba: TdxDBGridMaskColumn
      Caption = 'naziv kluba'
      Sorted = csUp
      Visible = False
      Width = 137
      BandIndex = 0
      RowIndex = 0
      FieldName = 'nazivkluba'
      GroupIndex = 0
      SummaryGroupName = 'dxDBGrid1SummaryGroup1'
    end
    object dxDBGrid1fstatus: TdxDBGridMaskColumn
      Caption = 'status'
      Width = 123
      BandIndex = 0
      RowIndex = 0
      FieldName = 'fstatus'
    end
    object dxDBGrid1SifraKluba: TdxDBGridColumn
      Visible = False
      Width = 91
      BandIndex = 0
      RowIndex = 0
      FieldName = 'sifra_videokluba'
    end
  end
  object qFilmUkupno: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      'SELECT b.barcode, m.naziv fmedij,'
      'b.izdano, b.sifra_videokluba, k.naziv, k.orginalnaziv,'
      
        '(SELECT c.imeprezime FROM clanovi c, pos p WHERE p.bcodekaz=b.ba' +
        'rcode AND p.sifraclana=c.sifra) posudio,'
      's.nazivkluba, st.naziv fstatus,'
      
        '(SELECT DATE_FORMAT(p.datumpos, '#39'%e.%c.%y %h:%m'#39') FROM pos p WHE' +
        'RE p.bcodekaz=b.barcode) datumpos'
      'FROM bcodekazete b, medij m, setup s, statusfilma st, kazete k'
      'WHERE b.sifrakazete=[FILM]'
      'AND b.sifra_medija=m.Sifra'
      'AND b.sifra_videokluba=s.sifrakluba'
      'AND st.sifra=b.status'
      'AND k.sifra=b.sifrakazete'
      'ORDER BY s.nazivkluba, b.barcode')
    ReadOnly = True
    OnExecSQL = Loguj
    Left = 448
    Top = 16
  end
  object dsFUkupno: TDataSource
    DataSet = qFilmUkupno
    Left = 416
    Top = 16
  end
end
