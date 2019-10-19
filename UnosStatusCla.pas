unit UnosStatusCla;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnosTemplate, ImgList, Db, DBTables, RxQuery, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ComCtrls, DBCtrls, ToolWin, RxLookup, RXCtrls,
  ExtCtrls, Mask, MySQLDataset;

type
  TFUnosStatusCla = class(TFUnosTemplate)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    TStatus: TMySQLDataset;
    TStatusSifra: TAutoIncField;
    TStatusNaziv: TStringField;
    TQSifra: TAutoIncField;
    TQNaziv: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosStatusCla: TFUnosStatusCla;

implementation
uses BazeModul;

{$R *.DFM}

end.
