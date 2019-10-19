unit PrintBarCode;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db;

type
  TFPrintBarCode = class(TQuickRep)
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    Procedure Kreni(TBaza:TDataSet;Tekst:String);
  end;

var
  FPrintBarCode: TFPrintBarCode;

implementation

{$R *.DFM}

Procedure TFPrintBarCode.Kreni(TBaza:TDataSet;Tekst:String);
Begin
  FPrintBarCode.Dataset := TBaza;
//  QRLabel1.Caption := tekst;
  QRDBText1.Dataset := TBaza;
  QRDBText2.Dataset := TBaza;
  QRDBText3.Dataset := TBaza;
  QRDBText4.Dataset := TBaza;

//  QRDuckBarcode1.Dataset := TBaza;
  Try
    //FPrintBarCode.preview
    FPrintBarCode.print;
  Finally
    FPrintBarCode.Destroy;
  End;
End;



procedure TFPrintBarCode.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRDBText3.Enabled := (ansiUpperCase(FPrintBarCode.Dataset.fieldByName('SamoBroj').asstring) = 'X');
  QRDBText4.Enabled := (ansiUpperCase(FPrintBarCode.Dataset.fieldByName('samoBroj').asstring) = 'X');


  QRDBText1.Enabled := (ansiUpperCase(FPrintBarCode.Dataset.fieldByName('SamoBroj').asstring) = '');
  QRDBText2.Enabled := (ansiUpperCase(FPrintBarCode.Dataset.fieldByName('samoBroj').asstring) = '');
//  QRDuckBarcode1.Enabled := (ansiUpperCase(FPrintBarCode.Dataset.fieldByName('samoBroj').asstring) = '');

end;

end.
