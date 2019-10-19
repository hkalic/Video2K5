unit ImportDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls;

type
  TFImportDlg = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Table1: TTable;
    DataSource1: TDataSource;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImportDlg: TFImportDlg;

implementation

{$R *.DFM}

end.
