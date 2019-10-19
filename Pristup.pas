unit Pristup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwtable, ExtCtrls,
  StdCtrls, Buttons, MySQLDataset;

type
  TFPristupDlg = class(TForm)
    Panel1: TPanel;
    wwDataSource1: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    Panel2: TPanel;
    Btnizlaz: TBitBtn;
    Label1: TLabel;
    wwTable1: TMySQLDataset;
    wwTable1Sifra: TAutoIncField;
    wwTable1Tag: TIntegerField;
    wwTable1Naziv: TMySQLStringField;
    wwTable1SamoVlasnik: TMySQLStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnizlazClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPristupDlg: TFPristupDlg;

implementation
Uses BazeModul;
{$R *.DFM}

procedure TFPristupDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if wwDataSource1.State in DsEditModes then
        wwDataSource1.dataSet.Post;
    wwTable1.Active := False;
    Action := caFree;
end;


procedure TFPristupDlg.FormCreate(Sender: TObject);
begin
    wwTable1.Active := True;
end;

procedure TFPristupDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then Close;
end;

procedure TFPristupDlg.BtnizlazClick(Sender: TObject);
begin
    Close;
end;

end.
