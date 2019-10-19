object fPregledWishLista: TfPregledWishLista
  Left = 366
  Top = 217
  Width = 826
  Height = 540
  Caption = 'Pregled slobodnih filmova sa wish lista'
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
      'sifrafilma'#9'6'#9#352'ifra'#9#9
      'naziv'#9'48'#9'Naziv filma'#9'F'#9
      'medij'#9'15'#9'Medij'#9#9
      'vrijemeunosa'#9'18'#9'Vrijeme unosa'#9#9
      'sifraclana'#9'6'#9#268'lan'#9#9
      'imeprezime'#9'30'#9'Ime '#269'lana'#9#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alTop
    DataSource = ds1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 0
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 818
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      818
      41)
    object Label1: TLabel
      Left = 304
      Top = 14
      Width = 390
      Height = 13
      Caption = 
        'SPACE-Ozna'#269'i, F9 - Zadu'#382'i ozna'#269'ene, DEL-Poni'#353'ti film, F11-Detalj' +
        'i filma, ESC-Izlaz'
    end
    object Label2: TLabel
      Left = 16
      Top = 14
      Width = 174
      Height = 13
      Caption = 'FILMOVI KOJI SE MOGU ZADU'#381'ITI'
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
      Left = 320
      Top = 14
      Width = 390
      Height = 13
      Caption = 
        'SPACE-Ozna'#269'i, F9 - Zadu'#382'i ozna'#269'ene, DEL-Poni'#353'ti film, F11-Detalj' +
        'i filma, ESC-Izlaz'
    end
    object Label4: TLabel
      Left = 16
      Top = 14
      Width = 161
      Height = 13
      Caption = 'SVI FILMOVI NA WISH LISTAMA'
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
      'sifrafilma'#9'6'#9#352'ifra'
      'naziv'#9'48'#9'Naziv filma'
      'medij'#9'15'#9'Medij'
      'vrijemeunosa'#9'18'#9'Vrijeme unosa'
      'sifraclana'#9'6'#9#268'lan'#9'F'
      'imeprezime'#9'30'#9'Ime '#269'lana')
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
  object ds1: TDataSource
    DataSet = qDetWLista
    Left = 418
    Top = 116
  end
  object qDetWLista: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      
        'SELECT w.id, w.sifrafilma, k.naziv, m.naziv medij, w.vrijemeunos' +
        'a,'
      'w.sifraclana, c.imeprezime, w.status'
      'FROM whishlista w, kazete k, clanovi c, medij m'
      'WHERE w.status='#39'aktivan'#39
      'AND w.sifrafilma=k.sifra'
      'AND w.sifraclana=c.sifra'
      'AND w.vrstamedija=m.sifra'
      'AND EXISTS (SELECT b.barcode'
      '            FROM bcodekazete b'
      '            WHERE w.sifrafilma=b.sifrakazete'
      '            AND b.izdano='#39'N'#39
      '            AND b.sifra_videokluba=[KLUB])'
      'ORDER BY w.vrijemeunosa')
    OnExecSQL = qDetWListaExecSQL
    BeforeOpen = qDetWListaBeforeOpen
    Left = 416
    Top = 144
    object qDetWListaselected: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'X'
      DisplayWidth = 2
      FieldKind = fkCalculated
      FieldName = 'selected'
      Origin = 'selected'
      Calculated = True
    end
    object qDetWListasifrafilma: TIntegerField
      DisplayLabel = #352'ifra'
      DisplayWidth = 6
      FieldName = 'sifrafilma'
      Origin = 'whishlista.sifrafilma'
    end
    object qDetWListanaziv: TMySQLStringField
      DisplayLabel = 'Naziv filma'
      DisplayWidth = 48
      FieldName = 'naziv'
      Origin = 'kazete.Naziv'
      Size = 50
      StringType = stNormal
    end
    object qDetWListamedij: TMySQLStringField
      DisplayLabel = 'Medij'
      DisplayWidth = 15
      FieldName = 'medij'
      Origin = 'medij.Naziv'
      Size = 15
      StringType = stNormal
    end
    object qDetWListavrijemeunosa: TDateTimeField
      DisplayLabel = 'Vrijeme unosa'
      DisplayWidth = 18
      FieldName = 'vrijemeunosa'
      Origin = 'whishlista.vrijemeunosa'
      Required = True
    end
    object qDetWListasifraclana: TIntegerField
      DisplayLabel = #268'lan'
      DisplayWidth = 6
      FieldName = 'sifraclana'
      Origin = 'whishlista.sifraclana'
    end
    object qDetWListaimeprezime: TMySQLStringField
      DisplayLabel = 'Ime '#269'lana'
      DisplayWidth = 30
      FieldName = 'imeprezime'
      Origin = 'clanovi.ImePrezime'
      Size = 30
      StringType = stNormal
    end
    object qDetWListaid: TAutoIncField
      FieldName = 'id'
      Origin = 'whishlista.id'
      ReadOnly = True
      Visible = False
    end
    object qDetWListastatus: TMySQLStringField
      FieldName = 'status'
      Origin = 'whishlista.status'
      Visible = False
      StringType = stNormal
    end
  end
  object ds2: TDataSource
    DataSet = qSveWListe
    Left = 426
    Top = 372
  end
  object qSveWListe: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      
        'SELECT w.id, w.sifrafilma, k.naziv, m.naziv medij, w.vrijemeunos' +
        'a,'
      'w.sifraclana, c.imeprezime, w.status'
      'FROM whishlista w, kazete k, clanovi c, medij m'
      'WHERE w.status='#39'aktivan'#39
      'AND w.sifrafilma=k.sifra'
      'AND w.sifraclana=c.sifra'
      'AND w.vrstamedija=m.sifra'
      'AND EXISTS (SELECT b.barcode'
      '            FROM bcodekazete b'
      '            WHERE w.sifrafilma=b.sifrakazete'
      '            AND b.sifra_videokluba=[KLUB])'
      'ORDER BY w.vrijemeunosa')
    OnExecSQL = qDetWListaExecSQL
    BeforeOpen = qDetWListaBeforeOpen
    Left = 424
    Top = 400
    object qSveWListeselected: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'X'
      DisplayWidth = 2
      FieldKind = fkCalculated
      FieldName = 'selected'
      Origin = 'selected'
      Calculated = True
    end
    object qSveWListesifrafilma: TIntegerField
      DisplayLabel = #352'ifra'
      DisplayWidth = 6
      FieldName = 'sifrafilma'
      Origin = 'whishlista.sifrafilma'
    end
    object qSveWListenaziv: TMySQLStringField
      DisplayLabel = 'Naziv filma'
      DisplayWidth = 48
      FieldName = 'naziv'
      Origin = 'kazete.Naziv'
      Size = 50
      StringType = stNormal
    end
    object qSveWListemedij: TMySQLStringField
      DisplayLabel = 'Medij'
      DisplayWidth = 15
      FieldName = 'medij'
      Origin = 'medij.Naziv'
      Size = 15
      StringType = stNormal
    end
    object qSveWListevrijemeunosa: TDateTimeField
      DisplayLabel = 'Vrijeme unosa'
      DisplayWidth = 18
      FieldName = 'vrijemeunosa'
      Origin = 'whishlista.vrijemeunosa'
      Required = True
    end
    object qSveWListesifraclana: TIntegerField
      DisplayLabel = #268'lan'
      DisplayWidth = 6
      FieldName = 'sifraclana'
      Origin = 'whishlista.sifraclana'
    end
    object qSveWListeimeprezime: TMySQLStringField
      DisplayLabel = 'Ime '#269'lana'
      DisplayWidth = 30
      FieldName = 'imeprezime'
      Origin = 'clanovi.ImePrezime'
      Size = 30
      StringType = stNormal
    end
    object qSveWListeid: TAutoIncField
      FieldName = 'id'
      Origin = 'whishlista.id'
      ReadOnly = True
      Visible = False
    end
    object qSveWListestatus: TMySQLStringField
      FieldName = 'status'
      Origin = 'whishlista.status'
      Visible = False
      StringType = stNormal
    end
  end
end
