inherited FCrnaListaDlg: TFCrnaListaDlg
  Left = 243
  Caption = 'Crna lista'
  ClientHeight = 419
  ClientWidth = 606
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 606
    Height = 41
    object Label1: TLabel [0]
      Left = 4
      Top = 4
      Width = 389
      Height = 33
      Align = alLeft
      Caption = 
        'Kod upisa PREZIMENA i IMENA '#269'lana morate paziti da sve budu veli' +
        'ka slova'#13#10'i da podatak bude to'#269'no upisan, ina'#269'e se ne'#263'e mo'#263'i pro' +
        'na'#269'i '#269'lan.'
    end
    inherited Btnizlaz: TBitBtn
      Left = 430
    end
    inherited BitBtn1: TBitBtn
      Left = 521
      Top = 9
    end
  end
  inherited DBGrid1: TdxDBGrid
    Top = 41
    Width = 606
    Height = 378
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoSyncSelection, edgoUseBookmarks]
  end
  object Table1: TMySQLQuery
    Server = Podaci.myDB
    TableName = 'crnalista'
    OnExecSQL = Loguj
    Left = 320
    Top = 176
  end
end
