object FNaruceni: TFNaruceni
  Left = 245
  Top = 225
  Width = 777
  Height = 480
  Caption = 'Pregled naru'#269'enih filmova'
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
    Width = 769
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      769
      41)
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 507
      Height = 13
      Caption = 
        'SPACE-Ozna'#269'i, F9-Zadu'#382'i ozna'#269'ene, DEL-Poni'#353'ti naru'#269'ene, F5-Promj' +
        'eni datum, F11-Detalji filma, ESC-Izlaz'
    end
    object Shape1: TShape
      Left = 544
      Top = 13
      Width = 17
      Height = 17
      Hint = 'Crvenom bojom su ozna'#269'eni filmovi za dostavu'
      Brush.Color = clRed
      Shape = stRoundRect
    end
    object Label2: TLabel
      Left = 562
      Top = 14
      Width = 90
      Height = 13
      Caption = '=filmovi za dostavu'
    end
    object BitBtn1: TBitBtn
      Tag = 1
      Left = 664
      Top = 9
      Width = 60
      Height = 23
      Anchors = [akTop, akRight]
      Caption = 'Ispis ...'
      PopupMenu = IspisPopup
      TabOrder = 0
      TabStop = False
      OnClick = Printaj
      OnMouseDown = BitBtn1MouseDown
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
      Left = 728
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
    Width = 769
    Height = 240
    ControlType.Strings = (
      'Selected;CheckBox;True;False'
      'selected;CheckBox;True;False')
    Selected.Strings = (
      'selected'#9'2'#9'X'
      'sifrakazete'#9'6'#9#353'ifra'
      'k.naziv'#9'32'#9'naziv filma'
      'm.naziv'#9'17'#9'medij'
      'datum'#9'17'#9'datum'
      'sifraclana'#9'8'#9#269'lan'
      'imeprezime'#9'35'#9'ime '#269'lana')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alTop
    DataSource = DataSource1
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
    OnCalcCellColors = DBGrid1CalcCellColors
    OnKeyUp = DBGrid1KeyUp
  end
  object DBGrid2: TwwDBGrid
    Tag = 2
    Left = 0
    Top = 322
    Width = 769
    Height = 131
    ControlType.Strings = (
      'Selected;CheckBox;True;False'
      'selected;CheckBox;True;False')
    Selected.Strings = (
      'selected'#9'2'#9'X'
      'sifrakazete'#9'6'#9#353'ifra'
      'film'#9'32'#9'naziv filma'
      'medij'#9'17'#9'medij'
      'datumpos'#9'17'#9'datum posudbe'
      'sifraclana'#9'8'#9#269'lan'
      'imeprezime'#9'35'#9'Ime '#269'lana')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 2
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    OnCalcCellColors = DBGrid1CalcCellColors
    OnKeyUp = DBGrid2KeyUp
  end
  object Panel2: TPanel
    Left = 0
    Top = 281
    Width = 769
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      769
      41)
    object Label3: TLabel
      Left = 16
      Top = 14
      Width = 450
      Height = 13
      Caption = 
        'SPACE - Ozna'#269'i, F9 - Razdu'#382'i ozna'#269'ene, DEL - Poni'#353'ti naru'#269'ene, F' +
        '11 - Detalji filma, ESC - Izlaz'
    end
    object Shape2: TShape
      Left = 544
      Top = 13
      Width = 17
      Height = 17
      Hint = 'Crvenom bojom su ozna'#269'eni filmovi za dostavu'
      Brush.Color = clAqua
      Shape = stRoundRect
    end
    object Label4: TLabel
      Left = 562
      Top = 14
      Width = 93
      Height = 13
      Caption = '=filmovi za vra'#269'anje'
    end
    object BitBtn2: TBitBtn
      Tag = 2
      Left = 692
      Top = 9
      Width = 60
      Height = 23
      Anchors = [akTop, akRight]
      Caption = 'Ispis ...'
      PopupMenu = IspisPopup2
      TabOrder = 0
      TabStop = False
      OnClick = Printaj
      OnMouseDown = BitBtn1MouseDown
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
  object DataSource1: TDataSource
    DataSet = qDetNarudzbi
    Left = 418
    Top = 100
  end
  object qClanovi: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      'select sifra, imeprezime, duzan'
      'from [$TABLENAME] [JOIN] [WHERE] [GROUPBY] [ORDER] [LIMIT]')
    TableName = 'clanovi'
    OnExecSQL = Loguj
    Left = 424
    Top = 208
  end
  object qDetNarudzbi: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      'SELECT r.sifra, r.sifrakazete, r.barcode, k.naziv, m.naziv, '
      'r.datum, r.sifraclana, c.imeprezime, r.statusflag'
      'FROM rezervacija r, bcodekazete b, medij m, kazete k, clanovi c'
      'WHERE (r.statusflag='#39'X'#39' OR r.statusflag='#39'D'#39')'
      'AND r.barcode=b.barcode'
      'AND b.sifra_medija=m.sifra'
      'AND r.sifrakazete=k.sifra'
      'AND r.sifraclana=c.sifra')
    OnExecSQL = Loguj
    Left = 416
    Top = 128
    object qDetNarudzbiselected: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'X'
      DisplayWidth = 2
      FieldKind = fkCalculated
      FieldName = 'selected'
      Origin = 'selected'
      Calculated = True
    end
    object qDetNarudzbisifrakazete: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #353'ifra'
      DisplayWidth = 6
      FieldName = 'sifrakazete'
      Origin = 'rezervacija.SifraKazete'
    end
    object qDetNarudzbiknaziv: TMySQLStringField
      DisplayLabel = 'naziv filma'
      DisplayWidth = 32
      FieldName = 'k.naziv'
      Origin = 'kazete.Naziv'
      Size = 30
      StringType = stNormal
    end
    object qDetNarudzbimnaziv: TMySQLStringField
      DisplayLabel = 'medij'
      DisplayWidth = 17
      FieldName = 'm.naziv'
      Origin = 'video.medij.Naziv'
      Size = 15
      StringType = stNormal
    end
    object qDetNarudzbidatum: TMySQLStringField
      DisplayWidth = 17
      FieldName = 'datum'
      Origin = 'rezervacija.Datum'
      Size = 25
      StringType = stNormal
    end
    object qDetNarudzbisifraclana: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #269'lan'
      DisplayWidth = 8
      FieldName = 'sifraclana'
      Origin = 'rezervacija.SifraClana'
    end
    object qDetNarudzbiimeprezime: TMySQLStringField
      DisplayLabel = 'ime '#269'lana'
      DisplayWidth = 35
      FieldName = 'imeprezime'
      Origin = 'clanovi.ImePrezime'
      Size = 30
      StringType = stNormal
    end
    object qDetNarudzbibarcode: TMySQLStringField
      Alignment = taCenter
      DisplayWidth = 8
      FieldName = 'barcode'
      Origin = 'rezervacija.Barcode'
      Visible = False
      Size = 13
      StringType = stNormal
    end
    object qDetNarudzbisifra: TAutoIncField
      Alignment = taLeftJustify
      DisplayLabel = #353'ifra'
      FieldName = 'sifra'
      Origin = 'rezervacija.Sifra'
      ReadOnly = True
      Visible = False
    end
    object qDetNarudzbistatusflag: TMySQLStringField
      DisplayLabel = 'flag'
      FieldName = 'statusflag'
      Origin = 'rezervacija.StatusFlag'
      Visible = False
      Size = 1
      StringType = stNormal
    end
  end
  object IspisPopup: TPopupMenu
    Left = 608
    Top = 48
    object naPOSprinter1: TMenuItem
      Tag = 1
      Caption = 'na POS printer'
      OnClick = MenuClick
    end
    object naWindowsprinter1: TMenuItem
      Tag = 2
      Caption = 'na Windows printer'
      OnClick = MenuClick
    end
  end
  object qDetVracanja: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      
        'SELECT p.sifranebitna, p.sifrakazete, p.bcodekaz, k.naziv film, ' +
        'm.naziv medij,'
      'p.datumpos, p.sifraclana, c.imeprezime, p.vracanje'
      'FROM pos p, bcodekazete b, medij m, kazete k, clanovi c'
      'WHERE p.vracanje='#39'D'#39
      'AND p.bcodekaz=b.barcode'
      'AND b.sifra_medija=m.sifra'
      'AND p.sifrakazete=k.sifra'
      'AND p.sifraclana=c.sifra')
    Left = 472
    Top = 128
    object qDetVracanjaselected: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'X'
      DisplayWidth = 2
      FieldKind = fkCalculated
      FieldName = 'selected'
      Origin = 'selected'
      Calculated = True
    end
    object qDetVracanjasifrakazete: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #353'ifra'
      DisplayWidth = 6
      FieldName = 'sifrakazete'
      Origin = 'pos.SifraKazete'
      Required = True
    end
    object qDetVracanjafilm: TMySQLStringField
      DisplayLabel = 'naziv filma'
      DisplayWidth = 32
      FieldName = 'film'
      Origin = 'kazete.Naziv'
      Size = 30
      StringType = stNormal
    end
    object qDetVracanjamedij: TMySQLStringField
      DisplayWidth = 17
      FieldName = 'medij'
      Origin = 'medij.Naziv'
      Size = 15
      StringType = stNormal
    end
    object qDetVracanjadatumpos: TDateTimeField
      DisplayLabel = 'datum posudbe'
      DisplayWidth = 17
      FieldName = 'datumpos'
      Origin = 'pos.DatumPos'
    end
    object qDetVracanjasifraclana: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #269'lan'
      DisplayWidth = 8
      FieldName = 'sifraclana'
      Origin = 'pos.SifraClana'
      Required = True
    end
    object qDetVracanjaimeprezime: TMySQLStringField
      DisplayLabel = 'Ime '#269'lana'
      DisplayWidth = 35
      FieldName = 'imeprezime'
      Origin = 'clanovi.ImePrezime'
      Size = 30
      StringType = stNormal
    end
    object qDetVracanjasifranebitna: TAutoIncField
      FieldName = 'sifranebitna'
      Origin = 'pos.SifraNEBITNA'
      ReadOnly = True
      Visible = False
    end
    object qDetVracanjabcodekaz: TMySQLStringField
      FieldName = 'bcodekaz'
      Origin = 'pos.BcodeKaz'
      Visible = False
      Size = 13
      StringType = stNormal
    end
    object qDetVracanjavracanje: TMySQLStringField
      FieldName = 'vracanje'
      Origin = 'pos.Vracanje'
      Required = True
      Visible = False
      Size = 1
      StringType = stNormal
    end
  end
  object DataSource2: TDataSource
    DataSet = qDetVracanja
    Left = 472
    Top = 96
  end
  object IspisPopup2: TPopupMenu
    Left = 664
    Top = 328
    object MenuItem1: TMenuItem
      Tag = 3
      Caption = 'na POS printer'
      OnClick = MenuClick
    end
    object MenuItem2: TMenuItem
      Tag = 4
      Caption = 'na Windows printer'
      OnClick = MenuClick
    end
  end
end
