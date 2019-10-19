unit PrintKatalog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PrintTempl, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, MySQLDataset;

type
  TFPrintKatalog = class(TFPrintTempl)
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRSysData2: TQRSysData;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    Query1: TMySQLQuery;
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure FprintFormeUnosaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure NapraviPrint(koji:Integer;vr1,vr2,vr3,vr4,vr5:String);
  end;

var
  FPrintKatalog: TFPrintKatalog;

implementation
uses BazeModul;

{$R *.DFM}

procedure TFPrintKatalog.NapraviPrint(koji:Integer; vr1, vr2, vr3, vr4, vr5:String);
var upit: string;
Begin
    if vr5 <> '' then vr5 := '(k.VrstaMedija = '+vr5+') and ';
    if vr3 = 'ok' then
    begin
        case koji of           //NEOBRISANI
        1: if vr5 <> '' then upit:='AND '+vr5+'(1 = 1)';
        2: upit:='AND '+vr5+'(k.Zanr = '+vr1+')' ;
        3: upit:='AND '+vr5+'(k.Rezija = '+vr1+')';
        4: upit:='AND '+vr5+'((k.Glumac1 = '+vr1+') or (k.Glumac2 ='+vr1+'))';
        5: upit:='AND '+vr5+'(k.Drzava = '+vr1+')';
        6: upit:='AND '+vr5+'(d.Dobavljac = '+vr1+')';
        7: upit:='AND '+vr5+'((d.Kupljen >='''+FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDate(vr1))+
                        ''') and (d.Kupljen <='''+FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDate(vr2))+'''))';
        8: upit:='AND '+vr5+'(d.dobavljac = '+vr4+') and ((d.Kupljen >='''+FormatDateTime('yyyy-mm-dd hh:mm:ss', StrToDate(vr1))+
                        ''') and (d.Kupljen <='''+FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDate(vr2))+'''))';
        End;
    End
    Else
    begin
        case koji of
        1: upit:='AND '+vr5+'(d.Obrisan = ''N'''+')';
        2: upit:='AND '+vr5+'(d.Obrisan = ''N'') and (k.Zanr = '+vr1+')';
        3: upit:='AND '+vr5+'(d.Obrisan = ''N'') and (k.Rezija = '+vr1+')';
        4: upit:='AND '+vr5+'(d.Obrisan = ''N'') and ((k.Glumac1 = '+vr1+') or (k.Glumac2 ='+vr1+'))';
        5: upit:='AND '+vr5+'(d.Obrisan = ''N'') and (k.Drzava = '+vr1+')';
        6: upit:='AND '+vr5+'(d.Obrisan = ''N'') and (d.Dobavljac = '+vr1+')';
        7: upit:='AND '+vr5+'(d.Obrisan = ''N'') and ((d.Kupljen >='''+FormatDateTime('yyyy-mm-dd hh:mm:ss', StrToDate(vr1))+
                        ''') and (d.Kupljen <='''+FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDate(vr2))+'''))';
        8: upit:='AND '+vr5+'(d.Obrisan = ''N'') and (d.dobavljac = '+vr4+') and ((d.Kupljen >='''+FormatDateTime('yyyy-mm-dd hh:mm:ss', StrToDate(vr1))+
                        ''') and (d.Kupljen <='''+FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDate(vr2))+'''))';
        End;
    End;

    Try
        Screen.Cursor := crHourglass;
        try
            Query1.Close;
            Query1.MacroByName('WHERE').AsString:=upit;
            Query1.MacroByName('ORDER').AsString:='ORDER BY Zanr, k.Naziv';
            Query1.Open;
            Screen.Cursor := crDefault;
            FPrintKatalog.Preview;
        except
            MessageDlg('Neispravan kriteriji !!!'+#13+#13+'Pogledajte da li ste odabrali dobar uslov i za njega postavili vrijednost.', mtError,[mbOk], 0);
        End;
    Finally
        FPrintKatalog.Destroy;
        Screen.Cursor := crDefault;
    End;
End;


procedure TFPrintKatalog.QRLabel14Print(sender: TObject; var Value: String);
begin
  inherited;
  if Query1.FieldByName('obrisan').Value='D' then Value := '*'
  Else Value := '';
end;

procedure TFPrintKatalog.FprintFormeUnosaBeforePrint( Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  PrintReport := Query1.RecordCount > 0;
end;

procedure TFPrintKatalog.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

end.
