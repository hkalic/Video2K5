object FIzvozDlg: TFIzvozDlg
  Left = 186
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Izvoz podataka'
  ClientHeight = 144
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 266
    Height = 20
    Caption = 'Izvoz filmova od broja - do broja'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 48
    Top = 43
    Width = 49
    Height = 13
    Caption = 'Od broja'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 196
    Top = 43
    Width = 98
    Height = 13
    Caption = '(uljuèujuæi i ovaj broj)'
  end
  object Label5: TLabel
    Left = 48
    Top = 72
    Width = 49
    Height = 13
    Caption = 'Do broja'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 196
    Top = 72
    Width = 98
    Height = 13
    Caption = '(uljuèujuæi i ovaj broj)'
  end
  object Button1: TButton
    Left = 80
    Top = 112
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 176
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Odustani'
    ModalResult = 2
    TabOrder = 1
  end
  object OdBroja: TRxSpinEdit
    Left = 103
    Top = 38
    Width = 88
    Height = 22
    Decimal = 0
    AutoSelect = False
    AutoSize = False
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object DoBroja: TRxSpinEdit
    Left = 103
    Top = 67
    Width = 88
    Height = 22
    Decimal = 0
    AutoSelect = False
    AutoSize = False
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
end
