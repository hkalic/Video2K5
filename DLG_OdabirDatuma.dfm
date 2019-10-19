object DajDatum: TDajDatum
  Left = 356
  Top = 219
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Odaberite datuma'
  ClientHeight = 65
  ClientWidth = 233
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Odaberi: TButton
    Left = 61
    Top = 32
    Width = 110
    Height = 25
    Caption = 'ODABERI'
    ModalResult = 1
    TabOrder = 0
    OnKeyDown = OdaberiKeyDown
  end
  object DatumOd: TwwDBDateTimePicker
    Left = 56
    Top = 8
    Width = 121
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    MaxDate = 55153
    MinDate = 32874
    ShowButton = True
    TabOrder = 1
    UnboundDataType = wwDTEdtDate
    OnChange = DatumOdChange
  end
end
