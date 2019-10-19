unit PrintUgovor;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, DB, MySQLDataset;

type
  TFPrintUgovor = class(TQuickRep)
    QRMemo1: TQRMemo;
    QRBand1: TQRBand;
    QRMemo3: TQRMemo;
    Naslov: TQRLabel;
    QRLabel2: TQRLabel;
    red1: TQRLabel;
    red2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    red7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    red8: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel10: TQRLabel;
    red9: TQRLabel;
    QRLabel12: TQRLabel;
    brug: TQRDBText;
    Red4: TQRDBText;
    QRDBText1: TQRDBText;
    red3: TQRDBText;
    Red5: TQRDBText;
    Red6: TQRDBText;
    QRDBText2: TQRDBText;
    tClanovi: TMySQLQuery;
    procedure FPrintUgovorBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DajUgovorClana(broj:string);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
  private

  public

  end;

var
  FPrintUgovor: TFPrintUgovor;

implementation
Uses BazeModul, UnosClanovi;
{$R *.DFM}

procedure TFPrintUgovor.DajUgovorClana(broj:string);
var i: integer;
begin
    tClanovi.Close;
    tClanovi.MacroByName('WHERE').AsString:='WHERE sifra='+broj;
    tClanovi.Open;
    
    for i := 1 to Podaci.TabSetUp.FieldByName('BrojKopUgovora').AsInteger do
//        FPrintUgovor.Print;
        FPrintUgovor.Preview;
end;

procedure TFPrintUgovor.FPrintUgovorBeforePrint(Sender: TCustomQuickRep;var PrintReport: Boolean);
begin
  QRMemo3.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'Ugovor.Txt');
//  brug.Caption := FUnosClanova.TClanovi.FieldByName('Sifra').AsString;
  Red1.Caption := Podaci.TabSetUp.FieldByName('NazivPoduzeca').AsString+', '+
                  Podaci.TabSetUp.FieldByName('NazivKluba').AsString+', '+
                  Podaci.TabSetUp.FieldByName('Adresa1').AsString;
  Red2.Caption := Podaci.TabSetUp.FieldByName('Vlasnik').AsString;

//  red3.Caption := FUnosClanova.TClanovi.FieldByName('ImePrezime').AsString;
//  red4.Caption := FUnosClanova.TClanovi.FieldByName('Adresa').AsString+' '+
//                  FUnosClanova.TClanovi.FieldByName('Mjstanovanja').AsString;
//  red5.Caption := FUnosClanova.TClanovi.FieldByName('Telefon').AsString;
//  red6.Caption := FUnosClanova.TClanovi.FieldByName('Osobna').AsString;
  red7.Caption := Podaci.TabSetUp.FieldByName('NazivKluba').AsString;
  red9.Caption := red7.Caption;
  red8.Caption := Podaci.TabSetUp.FieldByName('SamoMjesto').AsString;
  Naslov.Caption:=Podaci.TabSetUp.FieldByName('NaslovUgovora').AsString;
end;

procedure TFPrintUgovor.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

end.
