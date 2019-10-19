unit PregSvePosudbeDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PregTempl, DB, MySQLDataset, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  StdCtrls, Buttons, ExtCtrls, dxDBTLCl, dxGrClms, RXSpin;

type
  TFPregSvePosudbeDlg = class(TFPregTempl)
    Query1: TMySQLQuery;
    DBGrid1sifrakazete: TdxDBGridMaskColumn;
    DBGrid1barcode: TdxDBGridMaskColumn;
    DBGrid1sifraclana: TdxDBGridMaskColumn;
    DBGrid1imeprezime: TdxDBGridMaskColumn;
    DBGrid1posudjen: TdxDBGridDateColumn;
    DBGrid1vracen: TdxDBGridDateColumn;
    DBGrid1nazivkluba: TdxDBGridMaskColumn;
    DBGrid1naziv: TdxDBGridMaskColumn;
    Label1: TLabel;
    SpinEd: TRxSpinEdit;
    Button1: TButton;
    Label2: TLabel;
    Edit1: TEdit;
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure SpinEdKeyPress(Sender: TObject; var Key: Char);
    procedure DoMagic(film: integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPregSvePosudbeDlg: TFPregSvePosudbeDlg;

implementation
Uses BazeModul, PregledDlg;

{$R *.dfm}

procedure TFPregSvePosudbeDlg.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TFPregSvePosudbeDlg.Button1Click(Sender: TObject);
begin
    DoMagic(SpinEd.AsInteger);
end;

procedure TFPregSvePosudbeDlg.SpinEdKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
    begin
        selectnext(sender as twincontrol,True,true);
        key:=#0;
    end;
end;

procedure TFPregSvePosudbeDlg.DoMagic(film: integer);
begin
  SpinEd.Value:=film;
  if film<>0 then
  begin
    Screen.Cursor := crHourglass;
    Try
      if FPregledDLG.ShowMpre('Tko je sve gledo u periodu.') = mrOK then
      begin
        Query1.Close;
        Query1.MacroByName('BRF').AsString:=IntToStr(film);
        Query1.MacroByName('PERIOD').AsString:='AND k.posudjen BETWEEN '''+
            FormatDateTime('yyyy-mm-dd hh:mm:ss', FPregledDLG.DatumOd.Date)+''' AND '''+
            FormatDateTime('yyyy-mm-dd hh:mm:ss', FPregledDLG.DatumDo.Date)+'''';
        Query1.Open;
        Query1.EnableControls;
        Query1.First;
        Edit1.Text:=IntToStr(Query1.RecordCount);
      end;
    Finally
      Screen.Cursor := crDefault;
    end;
  end;

  if not Self.Visible then ShowModal;
end;

procedure TFPregSvePosudbeDlg.FormCreate(Sender: TObject);
begin
//  inherited;
end;

end.
