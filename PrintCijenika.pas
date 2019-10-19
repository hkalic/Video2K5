unit PrintCijenika;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PrintTempl, Qrctrls, QuickRpt, ExtCtrls;

type
  TFPrintCijenika = class(TFPrintTempl)
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRMemo1: TQRMemo;
    QRLabel4: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrintCijenika: TFPrintCijenika;

implementation
Uses BazeModul, ObjasnjenjeDlg;
{$R *.DFM}

procedure TFPrintCijenika.QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  case Podaci.TabCijene.FieldByName('Cijenik').value of
      1: QRMemo1.Lines := FObjasnjenjeDlg.Memo1.Lines;
      2: QRMemo1.Lines := FObjasnjenjeDlg.Memo2.Lines;
      3: QRMemo1.Lines := FObjasnjenjeDlg.Memo3.Lines;
  End;
end;

procedure TFPrintCijenika.ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel4.caption := 'Cijenik se primjenjuje od '+datetostr(FObjasnjenjeDlg.wwDBDateTimePicker1.Date)+' god.';
end;

end.
