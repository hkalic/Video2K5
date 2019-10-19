unit UnosStatusFil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnosTemplate, ImgList, Db, DBTables, RxQuery, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ComCtrls, DBCtrls, ToolWin, RxLookup, RXCtrls,
  ExtCtrls, Mask, MySQLDataset;

type
  TFUnosStatusFil = class(TFUnosTemplate)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    TStatFil: TMySQLDataset;
    TStatFilSifra: TAutoIncField;
    TStatFilNaziv: TStringField;
    TQSifra: TAutoIncField;
    TQNaziv: TMySQLStringField;
    TQZbroj: TSmallintField;
    TStatFilZbroj: TSmallintField;
    Label1: TLabel;
    DBEdit3: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosStatusFil: TFUnosStatusFil;

implementation
Uses BazeModul;

{$R *.DFM}

end.
