unit UnosZanrovi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnosTemplate, Db, DBTables, ImgList, RxQuery, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ComCtrls, DBCtrls, ToolWin, RxLookup, RXCtrls,
  ExtCtrls, Mask, MySQLDataset;

type
  TFUnosVrste = class(TFUnosTemplate)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    TVrste: TMySQLDataset;
    TVrsteSifra: TAutoIncField;
    TVrsteNaziv: TStringField;
    TQSifra: TAutoIncField;
    TQNaziv: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosVrste: TFUnosVrste;

implementation
uses BazeModul;

{$R *.DFM}

end.
