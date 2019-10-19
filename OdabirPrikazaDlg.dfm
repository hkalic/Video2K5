object FOdabirPrikazaDlg: TFOdabirPrikazaDlg
  Left = 261
  Top = 149
  ActiveControl = wwDBGrid1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Odabir prikaza'
  ClientHeight = 361
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 333
    Height = 14
    Align = alTop
    Caption = 'Label1'
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object wwDBGrid1: TwwDBGrid
    Left = 0
    Top = 14
    Width = 333
    Height = 303
    Selected.Strings = (
      'section'#9'49'#9'Snimljeni prikazi')
    IniAttributes.FileName = 'aa.ini.ini'
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alTop
    DataSource = wwDataSource1
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    OnDblClick = Button1Click
    OnKeyDown = wwDBGrid1KeyDown
  end
  object Button1: TButton
    Left = 50
    Top = 328
    Width = 100
    Height = 25
    Caption = 'Odaberi'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 178
    Top = 328
    Width = 100
    Height = 25
    Caption = 'Osnovni prikaz'
    TabOrder = 2
    OnClick = Button2Click
  end
  object wwDataSource1: TwwDataSource
    DataSet = Tini
    Left = 168
    Top = 40
  end
  object Tini: TdxMemData
    Indexes = <>
    Persistent.Data = {
      566572333333333333FB3F02000000290000000100080073656374696F6E0015
      000000010005006772696400}
    SortOptions = []
    SortedField = 'section'
    OnFilterRecord = TiniFilterRecord
    Left = 200
    Top = 144
    object Tinisection: TStringField
      DisplayLabel = 'Snimljeni prikazi'
      DisplayWidth = 49
      FieldName = 'section'
      Size = 40
    end
    object Tinigrid: TStringField
      DisplayWidth = 20
      FieldName = 'grid'
      Visible = False
    end
  end
end
