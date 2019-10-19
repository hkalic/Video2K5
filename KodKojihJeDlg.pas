unit KodKojihJeDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  lmdctrl, lmdeditb, lmdeditc, LMDEdit, StdCtrls, ExtCtrls, Grids, DBGrids,
  Db, Mask, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  DBTables, DBCtrls, MySQLDataset;

type
  TFKodKojihJEDlg = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    dsPos: TDataSource;
    ed1: TMaskEdit;
    Label5: TLabel;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1ifralana: TdxDBGridMaskColumn;
    dxDBGrid1ifrakazete: TdxDBGridMaskColumn;
    dxDBGrid1Imeprezime: TdxDBGridMaskColumn;
    dxDBGrid1Barkodlana: TdxDBGridMaskColumn;
    dxDBGrid1Barkodkazete: TdxDBGridMaskColumn;
    dxDBGrid1Datum: TdxDBGridDateColumn;
    MaskEdit1: TMaskEdit;
    Label6: TLabel;
    MaskEdit2: TMaskEdit;
    Label7: TLabel;
    MaskEdit3: TMaskEdit;
    Label8: TLabel;
    DBText1: TDBText;
    dsKazete: TDataSource;
    DBText2: TDBText;
    qPos: TMySQLQuery;
    tKazete: TMySQLDataset;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Ed1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FKodKojihJEDlg: TFKodKojihJEDlg;

implementation
Uses BazeModul;
{$R *.DFM}

procedure TFKodKojihJEDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFKodKojihJEDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFKodKojihJEDlg.FormCreate(Sender: TObject);
begin
//  Podaci.Otvoriindex('pos');
//  Podaci.TabIndex.Close;
end;

procedure TFKodKojihJEDlg.Ed1KeyPress(Sender: TObject; var Key: Char);
var s:String;
begin
  s:=(Sender as TMaskEdit).text;
  if (key = #13) and (s<>'') then
  begin
    if SveBrojevi(s) then
    begin
      tKazete.Active:=False;
      qPos.Close;
      case (Sender as TMaskEdit).Tag of
        1: qPos.MacroByName('WHERE').AsString:='WHERE pos.Sifrakazete='+s;
        2: qPos.MacroByName('WHERE').AsString:='WHERE pos.BcodeKaz='''+s+'''';
        3: qPos.MacroByName('WHERE').AsString:='WHERE pos.SifraClana='+s;
        4: qPos.MacroByName('WHERE').AsString:='WHERE clanovi.BarCode='''+s+'''';
      end;
      qPos.Open;
      tKazete.Active:=True;
    end;
    (Sender as TMaskEdit).text := '';
  End;
end;

end.
