unit UnosNacinaKontakta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnosTemplate, DB, MySQLDataset, ImgList, StdCtrls, Buttons,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, DBCtrls, ToolWin, Mask;

type
  TFUnosKontaktiranja = class(TFUnosTemplate)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    MySQLDataset1: TMySQLDataset;
    TQSifra: TAutoIncField;
    TQNaziv: TMySQLStringField;
    MySQLDataset1Sifra: TAutoIncField;
    MySQLDataset1Naziv: TMySQLStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosNacinaKontaktiranja: TFUnosKontaktiranja;

implementation

uses BazeModul;
{$R *.dfm}

end.
