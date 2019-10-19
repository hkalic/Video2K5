object FRekDlg: TFRekDlg
  Left = 257
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  ClientHeight = 195
  ClientWidth = 381
  Color = clRed
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 195
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Color = clSilver
    TabOrder = 0
    object Label2: TLabel
      Left = 5
      Top = 5
      Width = 371
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = 'REKONSTRUKCIJA STRUKTURA BAZA U TIJEKU...'
      Color = 210
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Memo: TMemo
      Left = 16
      Top = 29
      Width = 312
      Height = 153
      BorderStyle = bsNone
      Color = clSilver
      Lines.Strings = (
        '')
      TabOrder = 0
    end
  end
end
