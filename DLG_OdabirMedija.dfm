object fOdabirMedija: TfOdabirMedija
  Left = 555
  Top = 257
  Width = 190
  Height = 160
  BorderIcons = [biSystemMenu]
  Caption = 'Odabir medija'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 182
    Height = 133
    Align = alClient
    DataSource = ds1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
  end
  object qDajMedije: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      'select m.naziv, m.sifra'
      'from bcodekazete b, statusfilma s, medij m'
      'where b.sifrakazete=[FILM]'
      'and b.status=s.sifra'
      'and s.zbroj>0'
      'and b.sifra_medija=m.sifra'
      'group by m.naziv, m.sifra')
    OnExecSQL = Loguj
    Left = 56
    Top = 64
    object qDajMedijenaziv: TMySQLStringField
      DisplayLabel = 'Medij'
      DisplayWidth = 24
      FieldName = 'naziv'
      Origin = 'Naziv'
      Size = 15
      StringType = stNormal
    end
    object qDajMedijesifra: TIntegerField
      FieldName = 'sifra'
      Origin = 'Sifra'
      Required = True
      Visible = False
    end
  end
  object ds1: TDataSource
    DataSet = qDajMedije
    Left = 88
    Top = 64
  end
end
