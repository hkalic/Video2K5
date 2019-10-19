unit PrintJednostavnoIzda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PrintTempl, Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, BazeModul,
  MySQLDataset;

type
  TFPrintJednostavnoIzda = class(TFPrintTempl)
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
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
  FPrintJednostavnoIzda: TFPrintJednostavnoIzda;

implementation

{$R *.DFM}

procedure TFPrintJednostavnoIzda.FprintFormeUnosaBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  Query1.Open;
end;

end.
