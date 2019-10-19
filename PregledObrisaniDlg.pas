unit PregledObrisaniDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PregTempl, Db, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, dxCntner,
  dxTL, dxDBCtrl, dxDBGrid;

type
  TFPregledObrisaniDlg = class(TFPregTempl)
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPregledObrisaniDlg: TFPregledObrisaniDlg;

implementation
Uses BazeModul;
{$R *.DFM}

procedure TFPregledObrisaniDlg.FormActivate(Sender: TObject);
begin
  inherited;
  Label1.Caption := 'Ukupno obrisanih filmova '+inttostr(Podaci.TabIndex.RecordCount);
end;

end.
