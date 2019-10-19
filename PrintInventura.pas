unit PrintInventura;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, MySQLDataset;

type
  TFPrintInventura = class(TQuickRep)
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRExpr1: TQRExpr;
    PageFooterBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    Query1: TMySQLQuery;
    Query1Sifra: TIntegerField;
    Query1BrKazeta: TLargeintField;
    Query1IzdanoKop: TLargeintField;
    Query1Stanje: TIntegerField;
    QRDBText4: TQRDBText;
    procedure FPrintInventuraBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Query1CalcFields(DataSet: TDataSet);
  private
    zbIma,zbVani:Integer;
  public

  end;

var
  FPrintInventura: TFPrintInventura;

implementation
uses BazeModul;

{$R *.DFM}

procedure TFPrintInventura.FPrintInventuraBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  zbIma := 0;
  zbVani :=0;
  Query1.Open;
end;

procedure TFPrintInventura.SummaryBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel6.caption := inttostr(zbIma);
  QRLabel7.caption := inttostr(zbVAni);
end;

procedure TFPrintInventura.DetailBand1AfterPrint(Sender: TQRCustomBand;  BandPrinted: Boolean);
begin
  zbIma := zbIma + Query1.fieldByName('BrKazeta').AsInteger;
  zbVani := zbVani + Query1.fieldByName('IzdanoKop').AsInteger;
end;

procedure TFPrintInventura.Query1CalcFields(DataSet: TDataSet);
begin
    Query1.FieldByName('Stanje').AsInteger:=Query1.FieldByName('BrKazeta').AsInteger-Query1.FieldByName('IzdanoKop').AsInteger;
end;

end.
