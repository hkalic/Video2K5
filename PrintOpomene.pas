unit PrintOpomene;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TFPrintOpomene = class(TQuickRep)
    Query1: TQuery;
    PageHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRMemo1: TQRMemo;
    QRDBText9: TQRDBText;
    QRMemo2: TQRMemo;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRMemo3: TQRMemo;
    QRLabel7: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    procedure FPrintOpomeneBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure QRLabel16Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    ukcl:Currency;
  public

  end;

var
  FPrintOpomene: TFPrintOpomene;

implementation
Uses BazeModul;
{$R *.DFM}

procedure TFPrintOpomene.FPrintOpomeneBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  ukCl:=0;
  Query1.Open;
end;

procedure TFPrintOpomene.Query1BeforeOpen(DataSet: TDataSet);
begin
  Query1.Params[0].value := DatumDug;
end;

procedure TFPrintOpomene.QRLabel13Print(sender: TObject;var Value: String);
begin
  Value := inttostr(date - Query1.FieldByName('Datum posudbe').value)
end;                                  

procedure TFPrintOpomene.QRLabel16Print(sender: TObject; var Value: String);
var s:Currency;
begin
  s := Podaci.Naplata(nil,1,Query1.FieldByName('bcodekaz').value,Query1.FieldByName('Datum posudbe').value);
  ukcl := ukcl +s;
  Value := Format('%m', [s]);
end;

procedure TFPrintOpomene.QRLabel12Print(sender: TObject; var Value: String);
begin
  Value := Format('%m', [ukcl]);
end;

procedure TFPrintOpomene.QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ukCl:=0;
end;

end.
