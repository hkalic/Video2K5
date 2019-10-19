unit FilmUkupno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MySQLDataset, StdCtrls, Mask, DBCtrls, ExtCtrls, dxDBGrid,
  dxTL, dxDBCtrl, dxCntner, dxDBTLCl, dxGrClms;

type
  TFUkupnoFilm = class(TForm)
    qFilmUkupno: TMySQLQuery;
    dsFUkupno: TDataSource;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label28: TLabel;
    DBEdit5: TDBEdit;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1barcode: TdxDBGridMaskColumn;
    dxDBGrid1fmedij: TdxDBGridMaskColumn;
    dxDBGrid1izdano: TdxDBGridMaskColumn;
    dxDBGrid1posudio: TdxDBGridColumn;
    dxDBGrid1nazivkluba: TdxDBGridMaskColumn;
    dxDBGrid1fstatus: TdxDBGridMaskColumn;
    dxDBGrid1SifraKluba: TdxDBGridColumn;
    Edit1: TEdit;
    dxDBGrid1DatumPos: TdxDBGridDateColumn;
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure dxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowD(film: Integer);
  end;

var
  FUkupnoFilm: TFUkupnoFilm;

implementation

uses Main, BazeModul;

{$R *.dfm}

procedure TFUkupnoFilm.ShowD(film: Integer);
begin
    Edit1.Text:=IntToStr(film);
    qFilmUkupno.MacroByName('FILM').AsString:=IntToStr(film);
    qFilmUkupno.Open;

    if qFilmUkupno.LocateRecord('sifra_videokluba', IntToStr(SifraKluba), [], True) then
        dxDBGrid1.FocusedNode.Expand(False);
    ShowModal;
end;

procedure TFUkupnoFilm.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TFUkupnoFilm.dxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=27 then Close;
end;

procedure TFUkupnoFilm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

end.
