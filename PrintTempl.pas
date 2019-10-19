{ QuickReport list template }

unit PrintTempl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls;

type                                
  TFPrintTempl = class(TQuickRep)
    PageFooterBand1: TQRBand;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel5: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    procedure FprintFormeUnosaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
//    procedure SetNaziv2(N: String);
  public
    { Public declarations }
//    property naziv2: String write SetNaziv;
  end;

var
  FPrintTempl: TFPrintTempl;

implementation

uses BazeModul;

{$R *.DFM}

procedure TFPrintTempl.FprintFormeUnosaBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRLabel22.caption := Podaci.TabSetUp.FieldByname('NazivKluba').AsString;
  QRLabel23.caption := Podaci.TabSetUp.FieldByname('Adresa1').AsString;
  QRLabel24.caption := Podaci.TabSetUp.FieldByname('Telefon').AsString;
end;

end.
