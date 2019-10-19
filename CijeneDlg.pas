unit CijeneDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwtable, ExtCtrls,
  StdCtrls, Buttons, MySQLDataset;

type
  TFCijeneDlg = class(TForm)
    Panel1: TPanel;
    wwDataSource1: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    Panel2: TPanel;
    Btnizlaz: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    wwTable1: TMySQLTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnizlazClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MySQLTable1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCijeneDlg: TFCijeneDlg;

implementation
Uses BazeModul, ObjasnjenjeDlg;
{$R *.DFM}

procedure TFCijeneDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if wwDataSource1.State in DsEditModes then
        wwDataSource1.dataSet.Post;
    wwTable1.Active := False;
    Action := caFree;
end;


procedure TFCijeneDlg.FormCreate(Sender: TObject);
begin
    wwTable1.Active := True;
end;

procedure TFCijeneDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFCijeneDlg.BtnizlazClick(Sender: TObject);
begin
    Close;
end;

procedure TFCijeneDlg.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TFObjasnjenjeDlg,FObjasnjenjeDlg);
    FObjasnjenjeDlg.Showmodal;
    FObjasnjenjeDlg.Release;
    Close;
end;

procedure TFCijeneDlg.MySQLTable1BeforePost(DataSet: TDataSet);
begin
    wwTable1.FieldByName('Azurirano').Value:= Date;
end;

end.
