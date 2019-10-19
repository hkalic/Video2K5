unit UnosDrzave;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnosTemplate, ImgList, Db, DBTables, RxQuery, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ComCtrls, DBCtrls, ToolWin, RxLookup, RXCtrls,
  ExtCtrls, Mask, MySQLDataset;

type
  TFUnosDrzave = class(TFUnosTemplate)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    TDrzav: TMySQLDataset;
    TDrzavSifra: TAutoIncField;
    TDrzavNaziv: TStringField;
    TDrzavSkraceno: TStringField;
    TQSifra: TAutoIncField;
    TQNaziv: TStringField;
    TQSkraceno: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosDrzave: TFUnosDrzave;

implementation
uses BazeModul;

{$R *.DFM}

end.
