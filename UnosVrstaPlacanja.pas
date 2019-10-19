unit UnosVrstaPlacanja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnosTemplate, DB, MySQLDataset, ImgList, StdCtrls, Buttons,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, DBCtrls, ToolWin, Mask;

type
  TFUnosVrstaPlacanja = class(TFUnosTemplate)
    TVrstePlacanja: TMySQLDataset;
    TVrstePlacanjaSifra: TAutoIncField;
    TVrstePlacanjaNazivPlacanja: TMySQLStringField;
    TVrstePlacanjaAktivan: TMySQLStringField;
    TQSifra: TAutoIncField;
    TQNazivPlacanja: TMySQLStringField;
    TQAktivan: TMySQLStringField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosVrstaPlacanja: TFUnosVrstaPlacanja;

implementation

{$R *.dfm}

end.
