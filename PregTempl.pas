unit PregTempl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, Db, RxLookup, quickrpt, QRExtra,
  MySQLDataset, Qrctrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid;

type
  TFPregTempl = class(TForm)
    Panel1: TPanel;
    Btnizlaz: TBitBtn;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TdxDBGrid;
    procedure BtnizlazClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPregTempl: TFPregTempl;

implementation
Uses BazeModul, PrintFormeUnosa, PojamUnit;
{$R *.DFM}

procedure TFPregTempl.BtnizlazClick(Sender: TObject);
begin
    Close;
end;

procedure TFPregTempl.FormKeyPress(Sender: TObject; var Key: Char);
begin
//    if key = #27 then Close;
end;

procedure TFPregTempl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TFPregTempl.BitBtn1Click(Sender: TObject);
var
  aReport : TCustomQuickRep;
  FieldList: TStringList;
  nIdx:Integer;
begin
  FieldList := TStringList.Create;

  for nIdx := 0 to DBGrid1.ColumnCount - 1 do
          if DBGrid1.Columns[nIdx].Visible then FieldList.Add(DBGrid1.Columns[nIdx].FieldName);

  areport := TFprintFormeUnosa.Create(Self);
  (aReport as TFprintFormeUnosa).Naziv := Caption;
  try
    QRCreateList(aReport, Self, DataSource1.DataSet, '', FieldList);
    aReport.Preview;
  finally
    aReport.Free;
    if FieldList <> nil then FieldList.Free;
  End;
end;

procedure TFPregTempl.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TFPregTempl.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var s: string;
    ima: Boolean;
    dummy: TField;
begin
     if Key in ['A'..'Z','a'..'z','0'..'9','š','ð','è','æ','ž','Š','Ð','Ž','Æ','È','%'] then
     begin
        PojamForm.Edit1.Text:=Key;
        PojamForm.Edit1.SelStart:=1;
        PojamForm.ShowModal;
        if PojamForm.ModRes then
        begin
            s:=PojamForm.Edit1.Text;
            if Pos('%', s) > 0 then ima:=True else ima:=False;
            if ima then
                while Pos('%', s) > 0 do Delete(s, Pos('%', s), 1);     // obriši sve '%'

            if DBGrid1.FocusedField.DataType<>ftString then
                (DataSource1.DataSet as TMySQLQuery).LocateRecordOption(DBGrid1.FocusedField.FieldName, s, [], True, [loNext], dummy)
            else (DataSource1.DataSet as TMySQLQuery).LocateRecordOption(DBGrid1.FocusedField.FieldName, s, [loPartialKey], True, [loNext], dummy);
        end;
     end;
end;

procedure TFPregTempl.FormCreate(Sender: TObject);
begin
    Screen.Cursor := crHourglass;
    (DataSource1.DataSet).Open;
    Screen.Cursor := crDefault;
end;

procedure TFPregTempl.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=27 then Close;
end;

end.
