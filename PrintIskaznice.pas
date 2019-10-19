unit PrintIskaznice;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Jpeg, Db, MemTable;

type
  TFPrintIskaznice = class(TQuickRep)
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
  private
    TTemp : TMemoryTable;
  public
    procedure PrintKartica(Slika:TPicture;idbr,klub1,adresa1,tel1:string);
  end;

var
  FPrintIskaznice: TFPrintIskaznice;

implementation

{$R *.DFM}

procedure TFPrintIskaznice.PrintKartica(Slika:TPicture;idbr,klub1,adresa1,tel1:string);
var  a:TFieldDefs;
begin
  TTemp := TMemoryTable.Create(self);
  TTemp.DataBaseName := 'DBvideo';
  TTemp.TableName := 'Temp2';
  TTemp.SessionName := 'Default';
  TTemp.Name := 'TTemp';



  try
    TTemp.Close;
    a := TTemp.FieldDefs;
    a.Add('BarC',ftString, 8, False);
    TTemp.Open;
    TTemp.Insert;
    TTemp.FieldByName('BarC').Value := idbr;
    TTemp.Post;

    QRLabel3.Caption := idbr;
    QRImage1.Picture := Slika;

    QRLabel1.Caption := klub1;
    QRLabel5.Caption := adresa1;
    QRLabel6.Caption := 'Tel. '+tel1;


//    QRDuckBarcode1.Dataset := TTemp;
    Try
      FPrintIskaznice.print;
       //FPrintIskaznice.preview;
    Finally
      FPrintIskaznice.Destroy;
    End;

  finally
//    TTemp.Free;
  End;

End;

end.
