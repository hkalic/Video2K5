unit PrintTOPfilmovi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PrintTempl, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, MySQLDataset;

type
  TFPrintTOPfilmovi = class(TFPrintTempl)
    Query2: TQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel12: TQRLabel;
    Query1: TMySQLQuery;
    procedure FprintFormeUnosaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    ispiso :Integer;
  public
    { Public declarations }
  end;

var
  FPrintTOPfilmovi: TFPrintTOPfilmovi;

implementation
uses BazeModul;

{$R *.DFM}

procedure TFPrintTOPfilmovi.FprintFormeUnosaBeforePrint( Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  Screen.Cursor := crHourglass;
  Try
      Query1.open;
  Finally
      Screen.Cursor := crDefault;
  end;
  ispiso := 0;
end;

procedure TFPrintTOPfilmovi.DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (ispiso < 20);
  inc(ispiso);
end;

end.
