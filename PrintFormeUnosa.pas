{ QuickReport list template }

unit PrintFormeUnosa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls;

type                                
  TFprintFormeUnosa = class(TQuickRep)
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
    procedure SetNaziv(N: String);
  public
    { Public declarations }
    property naziv: String write SetNaziv;
  end;

var
  FprintFormeUnosa: TFprintFormeUnosa;

implementation
Uses BazeModul;
{$R *.DFM}




procedure TFprintFormeUnosa.SetNaziv(N: String);
begin
    QRLabel5.caption := N;
    QRLabel3.caption := N;
End;

procedure TFprintFormeUnosa.FprintFormeUnosaBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRLabel22.caption := Podaci.TabSetUp.FieldByname('NazivKluba').AsString;
  QRLabel23.caption := Podaci.TabSetUp.FieldByname('Adresa1').AsString;
  QRLabel24.caption := Podaci.TabSetUp.FieldByname('Telefon').AsString;
end;

end.
