unit CrnaListaDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PregTempl, DB, MySQLDataset, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  StdCtrls, Buttons, ExtCtrls;

type
  TFCrnaListaDlg = class(TFPregTempl)
    Table1: TMySQLQuery;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCrnaListaDlg: TFCrnaListaDlg;

implementation
uses BazeModul, PojamUnit;

{$R *.dfm}

end.
