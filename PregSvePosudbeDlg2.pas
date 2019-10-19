unit PregSvePosudbeDlg2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PregTempl, Db, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBTables,
  RXSpin, MySQLDataset, dxCntner, dxTL, dxDBCtrl, dxDBGrid;

type
  TFPregSvePosudbeDlg2 = class(TFPregTempl)
    SpinEd: TRxSpinEdit;
    Label1: TLabel;
    Button1: TButton;
    Panel2: TPanel;
    Query1: TMySQLQuery;
    Query1SifraClana: TIntegerField;
    Query1SifraKazete: TIntegerField;
    Query1Naziv: TMySQLStringField;
    Query1Popust: TFloatField;
    Query1VrstaRacuna: TSmallintField;
    Query1Datum: TDateTimeField;
    Query1DatumPos: TDateTimeField;
    Query1Dan: TFloatField;
    Query1Svaki: TFloatField;
    Query1Vikend: TFloatField;
    Query1Blagdan: TFloatField;
    Query1BrDan: TIntegerField;
    Query1BrSvaki: TIntegerField;
    Query1BrVikend: TIntegerField;
    Query1BrBlagdan: TIntegerField;
    Query1TrebaoJePlatiti: TFloatField;
    Edit1: TEdit;
    Label2: TLabel;
    Query1TrebaoJePlatiti2: TFloatField;
    Query1brojracuna: TMySQLStringField;
    procedure Button1Click(Sender: TObject);
    procedure SpinEdKeyPress(Sender: TObject; var Key: Char);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DoMagic(clan: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPregSvePosudbeDlg2: TFPregSvePosudbeDlg2;

implementation
Uses BazeModul, PregledDlg;
{$R *.DFM}

procedure TFPregSvePosudbeDlg2.DoMagic(clan: integer);
begin
  SpinEd.Value:=clan;
  if clan<>0 then
  begin
    Screen.Cursor := crHourglass;
    Try
      if FPregledDLG.ShowMpre('Šta je sve gledo u periodu.') = mrOK then
      begin
        Query1.Close;
        Query1.MacroByName('BRC').AsString:=IntToStr(clan);
        Query1.MacroByName('ODKAD').AsString:=''''+FormatDateTime('yyyy-mm-dd hh:mm:ss', FPregledDLG.DatumOd.Date)+'''';
        Query1.MacroByName('DOKAD').AsString:=''''+FormatDateTime('yyyy-mm-dd hh:mm:ss', FPregledDLG.DatumDo.Date)+'''';
        Query1.Open;
        Edit1.Text:=IntToStr(Query1.RecordCount);
      end;
    Finally
      Screen.Cursor := crDefault;
    end;
  end;
  if not Self.Visible then ShowModal;
end;

procedure TFPregSvePosudbeDlg2.Button1Click(Sender: TObject);
begin
    DoMagic(SpinEd.AsInteger);
end;

procedure TFPregSvePosudbeDlg2.SpinEdKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
    begin
        selectnext(sender as twincontrol,True,true);
        key:=#0;
    end;
end;

procedure TFPregSvePosudbeDlg2.Loguj(Dataset: TMySQLDatasetBase;
  var SQL: String; var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TFPregSvePosudbeDlg2.FormCreate(Sender: TObject);
begin
//  inherited;
end;

end.
