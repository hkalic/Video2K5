unit PregledSaldoDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PregTempl, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Db, DBTables,
  dxCntner, dxTL, dxDBCtrl, dxDBGrid, MySQLDataset;

type
  TFPregledSaldoDlg = class(TFPregTempl)
    Query1: TMySQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPregledSaldoDlg: TFPregledSaldoDlg;

implementation
uses BazeModul;
{$R *.DFM}

end.
