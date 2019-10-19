unit PrintJednostavnoSVI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PrintTempl, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, MySQLDataset, BazeModul;

type
  TFPrintJednostavnoSVI = class(TFPrintTempl)
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    Query1: TMySQLQuery;
    procedure FprintFormeUnosaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrintJednostavnoSVI: TFPrintJednostavnoSVI;

implementation

{$R *.DFM}

procedure TFPrintJednostavnoSVI.FprintFormeUnosaBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  Query1.Open;
end;

end.
