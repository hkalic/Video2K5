unit PrintUdugu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PrintTempl, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables;

type
  TFPrintUdugu = class(TFprintTempl)
    Query1: TQuery;
    QRDBText1: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    procedure FprintFormeUnosaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRLabel11Print(sender: TObject; var Value: String);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLabel12Print(sender: TObject; var Value: String);
  private
    { Private declarations }
    ukcl:Currency;
  public
    { Public declarations }
  end;

var
  FPrintUdugu: TFPrintUdugu;

implementation
Uses BazeModul;
{$R *.DFM}

procedure TFPrintUdugu.FprintFormeUnosaBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  ukCl:=0;
  Query1.Open;
end;

procedure TFPrintUdugu.Query1BeforeOpen(DataSet: TDataSet);
begin
  Query1.Params[0].value := DatumDug;
end;

procedure TFPrintUdugu.QRLabel8Print(sender: TObject; var Value: String);
begin
  Value := inttostr(date - Query1.FieldByName('Datum posudbe').value)
end;

procedure TFPrintUdugu.QRLabel11Print(sender: TObject; var Value: String);
var s:Currency;
begin
  s := Podaci.Naplata(nil,1,Query1.FieldByName('bcodekaz').value, Query1.FieldByName('Datum posudbe').value);
  ukcl := ukcl +s;
  Value := Format('%m', [s]);
end;

procedure TFPrintUdugu.QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ukCl:=0;
end;

procedure TFPrintUdugu.QRLabel12Print(sender: TObject; var Value: String);
begin
  Value := Format('%m', [ukcl]);
end;

end.
