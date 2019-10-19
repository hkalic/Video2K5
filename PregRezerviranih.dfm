object FRezervirani: TFRezervirani
  Left = 365
  Top = 175
  Width = 826
  Height = 540
  Caption = 'Pregled rezerviranih filmova'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 818
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      818
      41)
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 519
      Height = 13
      Caption = 
        'SPACE-Ozna'#269'i, F9 - Zadu'#382'i ozna'#269'ene, DEL-Poni'#353'ti rezervaciju, F5-' +
        'Promjeni datum, F11-Detalji filma, ESC-Izlaz'
    end
    object BitBtn1: TBitBtn
      Tag = 1
      Left = 713
      Top = 9
      Width = 60
      Height = 23
      Anchors = [akTop, akRight]
      Caption = 'Ispis ...'
      TabOrder = 0
      TabStop = False
      OnClick = Printaj
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object Btnizlaz: TBitBtn
      Left = 777
      Top = 9
      Width = 36
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 1
      TabStop = False
      OnClick = BtnizlazClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF7F7FF7F00F
        7FFFF7FF7F7FF0E0FF7FF7F7FF7F70E607FF000000FF70E66000FFFFFFF7F0E6
        607FFFFF078880E6607FFFFF008880E6607FFF77060880E8607FF0000E6080E0
        607F0EEEEEE600E6607F0EEEEEE680E6607FFFFF0E6880E6607FFFFF068880E6
        607FFFFF0F88880E607FFFFFFF888880E07FFFFFFF00000000FF}
    end
  end
  object DBGrid1: TwwDBGrid
    Tag = 1
    Left = 0
    Top = 41
    Width = 818
    Height = 208
    ControlType.Strings = (
      'Selected;CheckBox;True;False'
      'selected;CheckBox;True;False'
      'dostava;CheckBox;da;ne')
    Selected.Strings = (
      'selected'#9'2'#9'X'#9#9
      'sifrakazete'#9'6'#9#353'ifra'#9#9
      'naziv'#9'43'#9'Naziv filma'#9#9
      'sifraclana'#9'8'#9#353'ifra'#9#9
      'imeprezime'#9'30'#9'Ime '#269'lana'#9#9
      'zeljenidatum'#9'10'#9#381'eljeni datum'#9#9
      'vrijemerezervacije'#9'18'#9'Rezervirano'#9#9
      'dostava'#9'6'#9'Dostava'#9#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alTop
    DataSource = ds1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 1
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    OnKeyUp = DBGrid1KeyUp
  end
  object Panel2: TPanel
    Left = 0
    Top = 249
    Width = 818
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      818
      41)
    object Label3: TLabel
      Left = 16
      Top = 14
      Width = 519
      Height = 13
      Caption = 
        'SPACE-Ozna'#269'i, F9 - Zadu'#382'i ozna'#269'ene, DEL-Poni'#353'ti rezervaciju, F5-' +
        'Promjeni datum, F11-Detalji filma, ESC-Izlaz'
    end
    object BitBtn2: TBitBtn
      Tag = 2
      Left = 741
      Top = 9
      Width = 60
      Height = 23
      Anchors = [akTop, akRight]
      Caption = 'Ispis ...'
      TabOrder = 0
      TabStop = False
      OnClick = Printaj
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object DBGrid2: TwwDBGrid
    Tag = 2
    Left = 0
    Top = 290
    Width = 818
    Height = 223
    ControlType.Strings = (
      'Selected;CheckBox;True;False'
      'selected;CheckBox;True;False'
      'dostava;CheckBox;da;ne')
    Selected.Strings = (
      'selected'#9'2'#9'X'
      'sifrakazete'#9'6'#9#353'ifra'
      'naziv'#9'43'#9'naziv'
      'sifraclana'#9'8'#9'sifraclana'
      'imeprezime'#9'30'#9'Ime '#269'lana'
      'zeljenidatum'#9'10'#9#381'eljeni datum'
      'vrijemerezervacije'#9'18'#9'Rezervirano'
      'dostava'#9'6'#9'Dostava')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = ds2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 3
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    OnKeyUp = DBGrid1KeyUp
  end
  object qDetRezervacija: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      
        'SELECT r.sifra, r.sifrakazete, r.barcode, k.naziv, r.zeljenidatu' +
        'm,'
      'r.vrijemerezervacije, r.sifraclana, c.imeprezime, r.dostava'
      'FROM rezervacija2 r, kazete k, clanovi c'
      'WHERE r.status='#39'rezervirano'#39
      'AND r.sifrakazete=k.sifra'
      'AND r.sifraclana=c.sifra'
      '[DODATAK] '
      'ORDER BY r.vrijemerezervacije')
    OnExecSQL = Loguj
    BeforeOpen = qDetRezervacijaBeforeOpen
    Left = 416
    Top = 144
    object qDetRezervacijaselected: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'X'
      DisplayWidth = 2
      FieldKind = fkCalculated
      FieldName = 'selected'
      Origin = 'selected'
      Calculated = True
    end
    object qDetRezervacijasifrakazete: TIntegerField
      Alignment = taCenter
      DisplayLabel = #353'ifra'
      DisplayWidth = 6
      FieldName = 'sifrakazete'
      Origin = 'rezervacija2.SifraKazete'
      Required = True
    end
    object qDetRezervacijanaziv: TMySQLStringField
      DisplayLabel = 'Naziv filma'
      DisplayWidth = 43
      FieldName = 'naziv'
      Origin = 'kazete.Naziv'
      Size = 50
      StringType = stNormal
    end
    object qDetRezervacijasifraclana: TIntegerField
      Alignment = taCenter
      DisplayLabel = #353'ifra'
      DisplayWidth = 8
      FieldName = 'sifraclana'
      Origin = 'rezervacija2.SifraClana'
      Required = True
    end
    object qDetRezervacijaimeprezime: TMySQLStringField
      DisplayLabel = 'Ime '#269'lana'
      DisplayWidth = 30
      FieldName = 'imeprezime'
      Origin = 'clanovi.ImePrezime'
      Size = 30
      StringType = stNormal
    end
    object qDetRezervacijazeljenidatum: TDateField
      DisplayLabel = #381'eljeni datum'
      DisplayWidth = 10
      FieldName = 'zeljenidatum'
      Origin = 'rezervacija2.ZeljeniDatum'
      Required = True
    end
    object qDetRezervacijavrijemerezervacije: TDateTimeField
      DisplayLabel = 'Rezervirano'
      DisplayWidth = 18
      FieldName = 'vrijemerezervacije'
      Origin = 'rezervacija2.VrijemeRezervacije'
      Required = True
    end
    object qDetRezervacijadostava: TMySQLStringField
      DisplayLabel = 'Dostava'
      DisplayWidth = 6
      FieldName = 'dostava'
      Origin = 'rezervacija2.Dostava'
      Required = True
      Size = 10
      StringType = stNormal
    end
    object qDetRezervacijabarcode: TMySQLStringField
      Alignment = taCenter
      DisplayWidth = 8
      FieldName = 'barcode'
      Origin = 'rezervacija2.Barcode'
      Required = True
      Visible = False
      Size = 8
      StringType = stNormal
    end
    object qDetRezervacijasifra: TAutoIncField
      Alignment = taCenter
      FieldName = 'sifra'
      Origin = 'rezervacija2.Sifra'
      ReadOnly = True
      Visible = False
    end
  end
  object ds1: TDataSource
    DataSet = qDetRezervacija
    Left = 418
    Top = 116
  end
  object qSveRezervacije: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      
        'SELECT r.sifra, r.sifrakazete, r.barcode, k.naziv, r.zeljenidatu' +
        'm,'
      'r.vrijemerezervacije, r.sifraclana, c.imeprezime, r.dostava'
      'FROM rezervacija2 r, kazete k, clanovi c'
      'WHERE r.status='#39'rezervirano'#39
      'AND r.sifrakazete=k.sifra'
      'AND r.sifraclana=c.sifra'
      '[DODATAK] '
      'ORDER BY r.zeljenidatum, r.vrijemerezervacije')
    OnExecSQL = Loguj
    BeforeOpen = qSveRezervacijeBeforeOpen
    Left = 424
    Top = 400
    object BooleanField1: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'X'
      DisplayWidth = 2
      FieldKind = fkCalculated
      FieldName = 'selected'
      Origin = 'selected'
      Calculated = True
    end
    object qSveRezervacijesifrakazete: TIntegerField
      DisplayLabel = #353'ifra'
      DisplayWidth = 6
      FieldName = 'sifrakazete'
      Origin = 'rezervacija2.SifraKazete'
      Required = True
    end
    object qSveRezervacijenaziv: TMySQLStringField
      DisplayWidth = 43
      FieldName = 'naziv'
      Origin = 'kazete.Naziv'
      Size = 50
      StringType = stNormal
    end
    object qSveRezervacijesifraclana: TIntegerField
      DisplayWidth = 8
      FieldName = 'sifraclana'
      Origin = 'rezervacija2.SifraClana'
      Required = True
    end
    object qSveRezervacijeimeprezime: TMySQLStringField
      DisplayLabel = 'Ime '#269'lana'
      DisplayWidth = 30
      FieldName = 'imeprezime'
      Origin = 'clanovi.ImePrezime'
      Size = 30
      StringType = stNormal
    end
    object qSveRezervacijezeljenidatum: TDateField
      DisplayLabel = #381'eljeni datum'
      DisplayWidth = 10
      FieldName = 'zeljenidatum'
      Origin = 'rezervacija2.ZeljeniDatum'
      Required = True
    end
    object qSveRezervacijevrijemerezervacije: TDateTimeField
      DisplayLabel = 'Rezervirano'
      DisplayWidth = 18
      FieldName = 'vrijemerezervacije'
      Origin = 'rezervacija2.VrijemeRezervacije'
      Required = True
    end
    object qSveRezervacijedostava: TMySQLStringField
      DisplayLabel = 'Dostava'
      DisplayWidth = 6
      FieldName = 'dostava'
      Origin = 'rezervacija2.Dostava'
      Required = True
      Size = 10
      StringType = stNormal
    end
    object qSveRezervacijesifra: TAutoIncField
      FieldName = 'sifra'
      Origin = 'rezervacija2.Sifra'
      ReadOnly = True
      Visible = False
    end
    object qSveRezervacijebarcode: TMySQLStringField
      FieldName = 'barcode'
      Origin = 'rezervacija2.Barcode'
      Required = True
      Visible = False
      Size = 8
      StringType = stNormal
    end
  end
  object ds2: TDataSource
    DataSet = qSveRezervacije
    Left = 426
    Top = 372
  end
end
