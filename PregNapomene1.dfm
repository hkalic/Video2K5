inherited FPregNapomene1: TFPregNapomene1
  Left = 294
  Top = 159
  Caption = 'Pregled napomene 1'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 41
    inherited BitBtn1: TBitBtn
      Left = 366
      Top = 9
    end
  end
  inherited DBGrid1: TdxDBGrid
    Top = 41
    Height = 397
    Filter.Criteria = {00000000}
  end
  inherited DataSource1: TDataSource
    DataSet = Query1
  end
  object Query1: TMySQLQuery
    Server = Podaci.myDB
    SQL.Strings = (
      'select Sifra, ImePrezime, Napomena'
      'from [$TABLENAME] [JOIN] '
      'WHERE Napomena IS NOT NULL'
      '[GROUPBY] [ORDER] [LIMIT]')
    TableName = 'clanovi'
    OnExecSQL = Loguj
    Left = 344
    Top = 120
  end
end
