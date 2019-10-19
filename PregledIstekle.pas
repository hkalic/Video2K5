unit PregledIstekle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PregTempl, Db, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBTables,
  MySQLDataset, dxCntner, dxTL, dxDBCtrl, dxDBGrid;

type
  TFPregledIstekle = class(TFPregTempl)
    Query1: TMySQLQuery;
    procedure Query1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPregledIstekle: TFPregledIstekle;

implementation
Uses BazeModul;

{$R *.DFM}

procedure TFPregledIstekle.Query1BeforeOpen(DataSet: TDataSet);
begin
  inherited;
    Query1.MacroByName('DATUM').AsString:=''''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+'''';

end;

end.
