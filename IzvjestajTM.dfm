object Izvjestaji: TIzvjestaji
  OldCreateOrder = False
  Left = 367
  Top = 199
  Height = 413
  Width = 680
  object Poslovanje: TfrReport
    Dataset = frDBDSPoslovanje
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 32
    Top = 24
    ReportForm = {19000000}
  end
  object frDesigner1: TfrDesigner
    Left = 88
    Top = 320
  end
  object frDBDSPoslovanje: TfrDBDataSet
    CloseDataSource = True
    DataSet = Podaci.myQuery1
    Left = 32
    Top = 72
  end
  object frShapeObject1: TfrShapeObject
    Left = 160
    Top = 272
  end
  object frRoundRectObject1: TfrRoundRectObject
    Left = 160
    Top = 224
  end
  object SviReporti: TMySQLDataset
    Server = Podaci.myDB
    TableName = 'izvjestaji'
    Left = 32
    Top = 272
    object SviReportiSifraIzvjestaja: TAutoIncField
      FieldName = 'SifraIzvjestaja'
      ReadOnly = True
    end
    object SviReportiNazivReporta: TMySQLStringField
      FieldName = 'NazivReporta'
      Size = 40
      StringType = stNormal
    end
    object SviReportiIzgled: TBlobField
      FieldName = 'Izgled'
      Size = 65535
    end
  end
  object dsReports: TDataSource
    DataSet = SviReporti
    Left = 32
    Top = 320
  end
  object frBarCodeObject1: TfrBarCodeObject
    Left = 161
    Top = 321
  end
  object KazeteUDugu: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      
        'SELECT p.SifraClana, c.ImePrezime, c.Telefon, c.Adresa, c.MjStan' +
        'ovanja,'
      'p.SifraKazete, p.bcodekaz, k.Naziv,'
      'p.DatumPos, datediff(p.DatumPos, CURDATE()) dana, p.iznos, '
      's.nazivKluba, s.adresa1, s.adresa2'
      'FROM pos p INNER JOIN clanovi c ON (p.SifraClana = c.Sifra)'
      'INNER JOIN kazete k ON (p.SifraKazete = k.Sifra)'
      'INNER JOIN setup s ON (p.sifrakluba=s.sifrakluba)'
      'WHERE DATE(p.DatumPos)<=[DATDUG]'
      '[KLUB]'
      'ORDER BY c.ImePrezime')
    OnExecSQL = Loguj
    Left = 256
    Top = 120
  end
  object frDBDSUDugu: TfrDBDataSet
    CloseDataSource = True
    DataSet = KazeteUDugu
    Left = 256
    Top = 72
  end
  object frUDugu: TfrReport
    Dataset = frDBDSUDugu
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 256
    Top = 24
    ReportForm = {19000000}
  end
  object frDBDSPoslovanje2: TfrDBDataSet
    CloseDataSource = True
    DataSet = Podaci.myQuery2
    Left = 112
    Top = 48
  end
  object frxReport1: TfrxReport
    Version = '4.7.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = '?? ?????????'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39780.9926853935
    ReportOptions.LastChange = 39780.9926853935
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 400
    Top = 32
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
    Left = 400
    Top = 88
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    Left = 464
    Top = 32
  end
end
