unit PregNapomene1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PregTempl, Db, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBTables,
  MySQLDataset, dxCntner, dxTL, dxDBCtrl, dxDBGrid;

type
  TFPregNapomene1 = class(TFPregTempl)
    Query1: TMySQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPregNapomene1: TFPregNapomene1;

implementation
uses BazeModul;
{$R *.DFM}

end.
