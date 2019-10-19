object DLG_OdabirKluba: TDLG_OdabirKluba
  Left = 490
  Top = 415
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Odaberite klub'
  ClientHeight = 38
  ClientWidth = 235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object KlubCombo: TComboBox
    Left = 8
    Top = 8
    Width = 217
    Height = 21
    AutoDropDown = True
    ItemHeight = 13
    TabOrder = 0
    Text = 'Svi klubovi'
    OnKeyDown = KlubComboKeyDown
  end
  object SviKlubovi: TMySQLDataset
    Server = Podaci.myDB
    SQL.Strings = (
      'select SifraKluba, NazivKluba'
      'from [$TABLENAME] [JOIN] [WHERE] [GROUPBY] [ORDER] [LIMIT]')
    TableName = 'setup'
    Left = 120
  end
end
