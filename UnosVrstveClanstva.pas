unit UnosVrstveClanstva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnosTemplate, ImgList, Db, DBTables, RxQuery, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ComCtrls, DBCtrls, ToolWin, RxLookup, RXCtrls,
  ExtCtrls, Mask, MySQLDataset;

type
  TFUnosVrstveClanstva = class(TFUnosTemplate)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    TVrstaClanstva: TMySQLDataset;
    TVrstaClanstvaSifra: TAutoIncField;
    TVrstaClanstvaNaziv: TStringField;
    TQSifra: TAutoIncField;
    TQNaziv: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosVrstveClanstva: TFUnosVrstveClanstva;

implementation
uses BazeModul;

{$R *.DFM}

end.
