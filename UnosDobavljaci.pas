unit UnosDobavljaci;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnosTemplate, ImgList, Db, DBTables, RxQuery, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ComCtrls, DBCtrls, ToolWin, RxLookup, RXCtrls,
  ExtCtrls, Mask, MySQLDataset;

type
  TFUnosDobavljaci = class(TFUnosTemplate)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    TDobav: TMySQLDataset;
    TDobavSifra: TAutoIncField;
    TDobavNaziv: TStringField;
    TQSifra: TAutoIncField;
    TQNaziv: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosDobavljaci: TFUnosDobavljaci;

implementation
uses BazeModul;

{$R *.DFM}

end.
