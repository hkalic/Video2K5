unit DLG_OdabirMedija;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MySQLDataset, Grids, DBGrids;

type
  TfOdabirMedija = class(TForm)
    qDajMedije: TMySQLQuery;
    ds1: TDataSource;
    DBGrid1: TDBGrid;
    qDajMedijenaziv: TMySQLStringField;
    qDajMedijesifra: TIntegerField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOdabirMedija: TfOdabirMedija;

implementation
Uses BazeModul;

{$R *.dfm}

// and b.sifra_videokluba=[KLUB]


procedure TfOdabirMedija.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=27 then ModalResult:=mrAbort;
end;

procedure TfOdabirMedija.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TfOdabirMedija.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then ModalResult:=mrOk
    else if key=27 then ModalResult:=mrAbort;
end;

end.
