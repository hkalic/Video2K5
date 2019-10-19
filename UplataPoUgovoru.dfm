object FUplataPoUgovoru: TFUplataPoUgovoru
  Left = 346
  Top = 263
  ActiveControl = CurrencyEdit1
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Uplata po ugovoru'
  ClientHeight = 151
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 62
    Top = 116
    Width = 121
    Height = 16
    Caption = 'VRSTA PLA'#268'ANJA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 22
      Width = 279
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 388
      Top = 23
      Width = 15
      Height = 16
      Caption = 'Kn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 293
      Top = 18
      Width = 92
      Height = 24
      AutoSelect = False
      AutoSize = False
      Color = clInfoBk
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnKeyDown = CurrencyEdit1KeyDown
    end
  end
  object BtnNaplati: TButton
    Left = 110
    Top = 77
    Width = 75
    Height = 25
    Caption = 'NAPLATI'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
  end
  object BtnPromjena: TButton
    Left = 208
    Top = 77
    Width = 96
    Height = 25
    Caption = 'ODUSTANI'
    ModalResult = 3
    TabOrder = 2
  end
  object wwDBLookupCombo2: TwwDBLookupCombo
    Left = 192
    Top = 112
    Width = 153
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NazivPlacanja'#9'30'#9'NazivPlacanja'#9#9)
    LookupTable = Podaci.tVrstePlacanja
    LookupField = 'NazivPlacanja'
    TabOrder = 3
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = False
    ShowMatchText = True
  end
end
