unit ClanoviDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, DB, MySQLDataset;

type
  TFClanoviDlg = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    Dclanovi: TDataSource;
    Clanovi: TMySQLQuery;
    Label2: TLabel;
    Label1: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowD(traz:string; pokojem:string; modal:Boolean);
  end;

var
  FClanoviDlg: TFClanoviDlg;

implementation
Uses BazeModul, PojamUnit, PregSvePosudbeDlg2;
{$R *.DFM}

procedure TFClanoviDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    IzabranClan:=-1;
    Close;
  end
  Else if key = #13 then
       begin
         if not Clanovi.IsEmpty then IzabranClan:=Clanovi.FieldByName('Sifra').AsInteger;
         Close;
       End;
end;

procedure TFClanoviDlg.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TFClanoviDlg.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if Key in ['A'..'Z','a'..'z','0'..'9','š','ð','è','æ','ž','Š','Ð','Ž','Æ','È','%'] then
     begin
        PojamForm.Edit1.Text:=Key;
        PojamForm.Edit1.SelStart:=1;
        PojamForm.ShowModal;
        if PojamForm.ModRes then ShowD(PojamForm.Edit1.Text, DBGrid1.SelectedField.FieldName, False);
     end;
end;

procedure TFClanoviDlg.ShowD(traz:string; pokojem:string; modal:Boolean);
begin
    Clanovi.Close;

    if pokojem = 'sifra' then
    begin
        Clanovi.MacroByName('UVJET').AsString:='AND c.sifra>='+traz;
        Clanovi.MacroByName('ORDER').AsString:='ORDER BY c.sifra';
        Clanovi.MacroByName('LIMIT').AsString:='LIMIT 30';
    end
    Else // sve ostalo po ImePrezime
//    if pokojem = 'imeprezime' then
    begin
        Clanovi.MacroByName('UVJET').AsString:='AND c.imeprezime LIKE '''+UpperCase(traz)+'%''';
        Clanovi.MacroByName('ORDER').AsString:='ORDER BY c.imeprezime';
        Clanovi.MacroByName('LIMIT').AsString:='';
    end;

    Clanovi.Open;
    if modal then ShowModal;
end;
procedure TFClanoviDlg.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_F10 then
    begin
        Application.CreateForm(TFPregSvePosudbeDlg2, FPregSvePosudbeDlg2);
        FPregSvePosudbeDlg2.DoMagic(Clanovi.FieldByName('sifra').AsInteger);
    end;
end;

end.
