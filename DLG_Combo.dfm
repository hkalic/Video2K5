object DlgCombo: TDlgCombo
  Left = 408
  Top = 251
  Width = 260
  Height = 74
  Caption = 'Odaberite djelatnika'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LookCombo: TRxDBLookupCombo
    Left = 10
    Top = 12
    Width = 231
    Height = 21
    Hint = 'Postavljanje filtera dru'#353'tva'
    DropDownCount = 8
    Color = 13303754
    LookupField = 'Sifra'
    LookupDisplay = 'Naziv'
    LookupSource = DataSource2
    TabOrder = 0
    OnKeyDown = LookComboKeyDown
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = ComboTablica
    Left = 68
    Top = 4
  end
  object ComboTablica: TMySQLQuery
    Server = Podaci.myDB
    Options = [doShareConnection, doThreadedUpdate, doMacrosEnabled, doMacroCheck, do2KStrToMemo, doUseCursor]
    TableName = 'nacinkontaktiranja'
    Left = 120
  end
end
