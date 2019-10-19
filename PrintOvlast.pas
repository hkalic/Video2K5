unit PrintOvlast;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TFPrintOvlast = class(TQuickRep)
    TitleBand1: TQRBand;
    red1: TQRLabel;
    QRLabel3: TQRLabel;
    red3: TQRLabel;
    QRLabel4: TQRLabel;
    red4: TQRLabel;
    QRLabel5: TQRLabel;
    red6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    red8: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    procedure FPrintOvlastBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  FPrintOvlast: TFPrintOvlast;

implementation
Uses BazeModul;
{$R *.DFM}

procedure TFPrintOvlast.FPrintOvlastBeforePrint(Sender: TCustomQuickRep;var PrintReport: Boolean);
begin
  Red1.Caption := Podaci.TabSetUp.FieldByName('NazivPoduzeca').asstring+' '+
                  Podaci.TabSetUp.FieldByName('NazivKluba').asstring+', '+
                  Podaci.TabSetUp.FieldByName('Adresa1').asstring;

  red3.Caption := Podaci.TClanovi.FieldByName('ImePrezime').asstring;
  red4.Caption := Podaci.TClanovi.FieldByName('Adresa').asstring+' '+
                  Podaci.TClanovi.FieldByName('Mjstanovanja').asstring;
  red6.Caption := Podaci.TClanovi.FieldByName('Osobna').asstring;
  red8.Caption := Podaci.TabSetUp.FieldByName('SamoMjesto').asstring;

  QRLabel2.Caption := Podaci.TClanovi.FieldByName('Ovlast1').asstring;
  QRLabel14.Caption := Podaci.TClanovi.FieldByName('Ovlast2').asstring;
  QRLabel18.Caption := Podaci.TClanovi.FieldByName('Ovlast3').asstring;
  QRLabel7.Caption := '';
  QRLabel16.Caption := '';
  QRLabel20.Caption := '';


end;

end.
