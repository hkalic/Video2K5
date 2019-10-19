unit RadOperateraDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, Db, RxLookup, quickrpt, QRExtra,  Qrctrls,
  DBTables, MySQLDataset;

type
  TFRadOperateraDlg = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Btnizlaz: TBitBtn;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    LookCombo: TRxDBLookupCombo;
    Label1: TLabel;
    DataSource2: TDataSource;
    tabradnici2: TMySQLDataset;
    qDnev: TMySQLQuery;
    dsDnev: TDataSource;
    procedure BtnizlazClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LookComboChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    cFilterRadnik : String;
    procedure PostaviFilter;
  public
    { Public declarations }
  end;

var
  FRadOperateraDlg: TFRadOperateraDlg;

implementation
Uses BazeModul, PrintFormeUnosa, PregledDLG;
{$R *.DFM}

procedure TFRadOperateraDlg.BtnizlazClick(Sender: TObject);
begin
    Close;
end;

procedure TFRadOperateraDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then Close;
end;

procedure TFRadOperateraDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TFRadOperateraDlg.FormCreate(Sender: TObject);
begin
    tabradnici2.Open;
    qDnev.Close;
//    qDnev.MacroByName('WHERE').AsString:='WHERE DogodiloSe=3';
    qDnev.MacroByName('WHERE').AsString:='WHERE datum BETWEEN '''+FormatDateTime('yyyy-mm-dd hh:mm:ss', FPregledDLG.DatumOd.Date)+''''+' AND '''+FormatDateTime('yyyy-mm-dd hh:mm:ss', FPregledDLG.DatumDo.Date)+'''';
    qDnev.MacroByName('ORDER').AsString:='ORDER BY datum';
    qDnev.Open;
    PostaviFilter;
    qDnev.Last;
end;

procedure TFRadOperateraDlg.LookComboChange(Sender: TObject);
begin
    cFilterRadnik := '';
    if LookCombo.Value <> '' then
        cFilterRadnik := 'Radnik = '+chr(39)+ tabradnici2.FieldByname('ID').asstring+chr(39);
    PostaviFilter;
end;

procedure TFRadOperateraDlg.PostaviFilter;
Var cAnd:String;
begin
    qDnev.Filtered := False;
    if cFilterRadnik <> '' then cAnd := ' and '
    else cAnd := '';
    qDnev.Filter := cFilterRadnik+cAnd+'DogodiloSe = '+inttostr(RadioGroup1.ItemIndex+2);
    qDnev.Filtered := True;
    qDnev.Last;
end;

procedure TFRadOperateraDlg.RadioGroup1Click(Sender: TObject);
begin
  DBGrid1.Columns[4].Visible := (RadioGroup1.ItemIndex = 1);
  DBGrid1.Columns[3].Visible := (RadioGroup1.ItemIndex = 1);
  if RadioGroup1.ItemIndex = 2 then DBGrid1.Columns[3].title.caption := 'Film broj'
  Else DBGrid1.Columns[3].title.caption := 'Èlan broj';

  if RadioGroup1.ItemIndex = 3 then
  begin
    DBGrid1.Columns[4].Visible := true;
    DBGrid1.Columns[4].title.caption := 'popust'
  End
  Else DBGrid1.Columns[4].title.caption := 'Dug vraæen';

  if RadioGroup1.ItemIndex = 4 then DBGrid1.Columns[3].Visible := False;
  PostaviFilter;
end;

procedure TFRadOperateraDlg.BitBtn1Click(Sender: TObject);
var
  aReport : TCustomQuickRep;
  FieldList: TStringList;
  nIdx:Integer;
begin
  FieldList := TStringList.Create;

  for nIdx := 0 to DBGrid1.Columns.Count - 1 do
          if DBGrid1.Columns[nIdx].Visible then FieldList.Add(DBGrid1.Columns[nIdx].FieldName);

  areport := TFprintFormeUnosa.Create(Self);
  case RadioGroup1.ItemIndex of
      0: (aReport as TFprintFormeUnosa).Naziv := 'Pregled ISPRAVAKA KARTICE';
      1: (aReport as TFprintFormeUnosa).Naziv := 'Pregled PROMJENE SALDA ÈLANOVA';
      2: (aReport as TFprintFormeUnosa).Naziv := 'Pregled BRISANJA BARCODE-a';
      3: (aReport as TFprintFormeUnosa).Naziv := 'Pregled promjena èlanskog popusta';
      4: (aReport as TFprintFormeUnosa).Naziv := 'Pregled prijave djelatnika za rad';

  End;

  try
    QRCreateList(aReport, Self, qDnev, '', FieldList);
    aReport.Preview;
  finally
    aReport.Free;
    if FieldList <> nil then FieldList.Free;
  End;
end;

end.
