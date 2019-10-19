unit UnosTemplate;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons,
  DBCtrls, Mask, DBLists, RxDBComb,Servisi, ToolEdit, RXDBCtrl, RXLookup,
  Placemnt, RxQuery, ComCtrls, Tabnotbk, ToolWin, RXCtrls, quickrpt, QRExtra,
  Qrctrls, ImgList, MySQLDataset;

type
  TFUnosTemplate = class(TObrijForm)
    DQ: TDataSource;
    DS: TDataSource;
    Pregled: TPageControl;
    Tpregled: TTabSheet;
    Tunos: TTabSheet;
    TBar: TToolBar;
    DBNavigator3: TDBNavigator;
    BtnNovi: TToolButton;
    BtnIzmijeni: TToolButton;
    BtnObrisi: TToolButton;
    BtnIzlaz: TToolButton;
    BtnIspis: TToolButton;
    PanelGrid: TPanel;
    DBGrid11: TRxDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnSpremi: TBitBtn;
    BtnCancel: TBitBtn;
    BtnPovratak: TBitBtn;
    LbLStanje: TLabel;
    ImageList2: TImageList;
    TQ: TMySQLQuery;
    procedure ModalOK(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSStateChange(Sender: TObject);
    procedure KeyChange(Sender: TObject);
    procedure DBGrid11CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure DBGrid11TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure PregledChange(Sender: TObject);
    procedure TsAfterEdit(DataSet: TDataSet);
    procedure TQAfterOpen(DataSet: TDataSet);
    procedure SetMacro(MacroName, Value: string);
    procedure BtnNoviClick(Sender: TObject);
    procedure BtnIzmijeniClick(Sender: TObject);
    procedure BtnSpremiClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnIzlazClick(Sender: TObject);
    procedure BtnPovratakClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid11KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Kdown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnObrisiClick(Sender: TObject);
    procedure DBGrid11GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Kpress(Sender: TObject; var Key: Char);
    procedure aBeforeDelete(DataSet: TDataSet);
    procedure aBeforeEdit(DataSet: TDataSet);
    procedure aBeforeInsert(DataSet: TDataSet);
    procedure BtnIspisClick(Sender: TObject);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure DBGrid11DblClick(Sender: TObject);
  private
    BioEdit : Boolean;
    Procedure SelectPrvi;
    Procedure PostaviDBEdit;
    procedure StanjeBatona(Sender: TObject);

    function  Getsifra: Variant;
    procedure Setsifra(N: Variant);

  public
    property sifra: Variant read Getsifra write Setsifra;
  end;

var
  FUnosTemplate: TFUnosTemplate;
  UnosStyle:TFormStyle;
implementation

uses BazeModul, PrintFormeUnosa, PojamUnit;
{$R *.DFM}

function TFUnosTemplate.Getsifra: Variant;
begin
    if Pregled.ActivePage = TPregled then Result:=DQ.dataset.fieldbyname('Sifra').Value
    Else Result:=DS.dataset.fieldbyname('Sifra').Value
end;

procedure TFUnosTemplate.Setsifra(N: Variant);
begin
    DQ.dataset.Locate('Sifra',N, []);
end;

procedure TFUnosTemplate.ModalOK(Sender: TObject);
begin
    ModalResult := mrOK;
end;

Procedure TfUnosTemplate.PostaviDBEdit;
Var i:Integer;
begin
    For i:= 0 to Panel1.ControlCount -1 do
        if Panel1.Controls[i].ClassName = 'TDBEdit' then
            (Panel1.controls[i] as tdbedit).OnKeyDown:=KDown;
end;

procedure TFUnosTemplate.FormCreate(Sender: TObject);
Var I:Integer;
    I2, Code: Integer;
    s1, koje, NameOfField: String;
begin
    PostaviDBEdit;
    TBar.Parent := TPregled;
    Pregled.ActivePage:=Tpregled;
    FormStyle:=UnosStyle;
    BioEdit := False;

    if Podaci.TabRadnici.FieldByName('Vlasnik').Value='D' then  // samo vlasnik može brisati
        DBNavigator3.VisibleButtons:=[nbFirst,nbPrior,nbNext,nbLast,nbDelete,nbRefresh]
    else
        DBNavigator3.VisibleButtons:=[nbFirst,nbPrior,nbNext,nbLast,nbRefresh];

    TQ.TableName:=TMySQLDataSet(DS.Dataset).TableName;

    if IzOdabiraF then
    begin
        Pregled.ActivePage:=TUnos;
        TQ.MacroByName('WHERE').AsString:='WHERE k.sifra='+IntToStr(Kfilm);

        PregledChange(nil);
    End;

    NameOfField:=TQ.Fields[0].FieldName;
    for i:=0 to TQ.FieldCount-1 do
        if TQ.Fields[i].Tag=1 then NameOfField:=TQ.Fields[i].FieldName;

    SetMacro('ORDER', NameOfField);
end;

procedure TFunosTemplate.SetMacro(MacroName, Value: string);
begin
  with TQ do
  begin
    MacroByName(MacroName).AsString := 'ORDER BY '+Value;

    DisableControls;
    Screen.Cursor:=CrSQLWait;
    try
      Close;
      Open;
    finally
      EnableControls;
      Screen.Cursor:=CrDefault;
    end;
  end;
//  DS.DataSet.Open;
end;

procedure TFUnosTemplate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    TMySQLDataSet(DS.Dataset).Close;
    Action:=CaFree;
end;

procedure TFUnosTemplate.DSStateChange(Sender: TObject);
begin
    StanjeBatona(Sender);

    if Ds.State = DsEdit then LbLStanje.Caption := 'Izmjena podataka'
    Else if Ds.State = DsInsert then LbLStanje.Caption := 'Unos novog'
        Else LbLStanje.Caption := '';
    LblStanje.Visible :=  LbLStanje.Caption <> '';
end;

procedure TFUnosTemplate.StanjeBatona(Sender: TObject);
begin
    BtnSpremi.Enabled:=Ds.State in DsEditModes;
    BtnCancel.Enabled:=BtnSpremi.Enabled;
    BtnNovi.Enabled := not (Ds.State in DsEditModes);
    BtnIzmijeni.Enabled := BtnNovi.Enabled;

    BtnObrisi.Enabled := BtnNovi.Enabled;
    BtnIspis.Enabled := BtnNovi.Enabled and not (Pregled.ActivePage = TUnos);

    BtnPovratak.Enabled := BtnNovi.Enabled;
    BtnIzlaz.Enabled := BtnNovi.Enabled;
    DBNavigator3.Enabled := BtnNovi.Enabled;
end;

procedure TFUnosTemplate.KeyChange(Sender: TObject);
begin
    SetMacro('ORDER', TQ.Fields[0].FieldName);
end;

procedure TFUnosTemplate.DBGrid11CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
    Enabled := (Field <> nil) and not (Field is TBlobField);
end;

procedure TFUnosTemplate.DBGrid11TitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
begin
    if (Field <> nil) then SetMacro('ORDER', Field.FieldName);
end;

Procedure TfUnosTemplate.SelectPrvi;
Var i:Integer;
begin
    For i:= 0 to Panel1.ControlCount -1 do
        if Panel1.Controls[i].Tag AND 128 = 128 then
        begin
            TwinControl(Panel1.Controls[i]).SetFocus;
            Exit;
        end;
end;

procedure TFUnosTemplate.PregledChange(Sender: TObject);
begin
    If  Pregled.ActivePage = TUnos then
    begin
        DBNavigator3.Visible := True;
        BtnNovi.Visible := True;
        BtnIzmijeni.Visible := True;
        TBar.Parent := TUnos;

        TMySQLDataset(DS.DataSet).MasterSource:=DQ;
        TMySQLDataset(DS.DataSet).Open;
    end
    else if Pregled.ActivePage = Tpregled then
    begin
        TMySQLDataset(DS.DataSet).Close;
        TMySQLDataset(DS.DataSet).MasterSource:=nil;

        DBGrid11.Parent := PanelGrid;
        DBNavigator3.Visible := True;
        BtnNovi.Visible := True;
        BtnIzmijeni.Visible := True;
        if bioEdit then KeyChange(Nil);
        BioEdit := False;
        TBar.Parent := TPregled;
    end;
end;

procedure TFUnosTemplate.TsAfterEdit(DataSet: TDataSet);
begin
     SelectPrvi;
end;

procedure TFUnosTemplate.TQAfterOpen(DataSet: TDataSet);
Var I:Integer;
begin
    With DS.DataSet do // postavi nazive kolona i sakri nepotrebne
        for I := 0 to FieldCount - 1 do
        if Ds.DataSet.Fields[i].Visible then
            With TQ.FieldByName(Fields[I].FieldName) do
            begin
                if Ds.DataSet.Fields[i].Visible then
                begin
                    DisplayLabel:=Fields[i].DisplayLabel;
                    EditMask:=Fields[I].EditMask;
                    TQ.FieldByName(Fields[I].FieldName).Visible:=Ds.DataSet.Fields[i].Visible;
                End;
            end;
end;

procedure TFUnosTemplate.BtnNoviClick(Sender: TObject);
begin
    If Pregled.ActivePage <> TUnos then
    begin
      Pregled.ActivePage := TUnos;
      PregledChange(nil);
    End;
    Ds.Dataset.Append;
end;

procedure TFUnosTemplate.BtnIzmijeniClick(Sender: TObject);
begin
    If Pregled.ActivePage <> TUnos then
    begin
      Pregled.ActivePage := TUnos;
      PregledChange(nil);
    End;
    Ds.DataSet.Edit;
end;

procedure TFUnosTemplate.BtnSpremiClick(Sender: TObject);
begin
    ds.dataset.post;
    BioEdit := True;
//  if FormStyle = FsNormal then ModalOK(Sender);
end;

procedure TFUnosTemplate.BtnCancelClick(Sender: TObject);
begin
    Ds.DataSet.Cancel;
    if FormStyle = FsNormal then ModalOK(Sender);
end;

procedure TFUnosTemplate.FormActivate(Sender: TObject);
begin
    StanjeBatona(Sender);
end;

procedure TFUnosTemplate.BtnIzlazClick(Sender: TObject);
begin
    Close;
end;

procedure TFUnosTemplate.BtnPovratakClick(Sender: TObject);
begin
    Pregled.ActivePage := TPregled;
    PregledChange(nil);
end;

procedure TFUnosTemplate.Kdown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Case Key of
        VK_Up:
        begin
            selectnext(sender as twincontrol, False, true);
            key:=0;
        End;
        VK_Down, VK_return:
        begin
            selectnext(sender as twincontrol, True, true);
            key:=0;
        End;
    End;
end;

procedure TFUnosTemplate.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then
    begin
        If  Pregled.ActivePage = TUnos then
            if (Ds.State in DsEditModes) then Ds.DataSet.Cancel
                else BtnPovratakClick(Sender)
        Else Close;
    End;
end;

procedure TFUnosTemplate.DBGrid11KeyPress(Sender: TObject; var Key: Char);
var s: string;
    dummy: TField;
    ima: Boolean;
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

            if DBGrid11.SelectedField.DataType<>ftString then
                TQ.Locate(DBGrid11.SelectedField.FieldName, s, [])
            else
            begin
                if ima then
                    TQ.LocateRecordOption(DBGrid11.SelectedField.FieldName, s, [loPartialKey], True, [loNext, loTextSearch], dummy)
                else
                    TQ.Locate(DBGrid11.SelectedField.FieldName, s, [loPartialKey]);
            end;
        end;
     end;
end;

procedure TFUnosTemplate.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_F5 then BtnNoviClick(Sender)
    else if Key = VK_F6 then BtnIzmijeniClick(Sender)
    else if Key = VK_Return then
    begin
        Pregled.ActivePage := TUnos;
        PregledChange(nil);
    end;
end;

procedure TFUnosTemplate.BtnObrisiClick(Sender: TObject);
begin
  If  Pregled.ActivePage <> TUnos then
    begin
      Pregled.ActivePage := TUnos;
      PregledChange(nil);
    End;
 if MessageDlg('Da li stvarno želite obrisati podatak?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     Ds.Dataset.Delete;
     BioEdit := True;
  End;
end;

procedure TFUnosTemplate.DBGrid11GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
    Background := $00B8EDFA;

    if Highlight then
    begin
        AFont.Color := clHighlightText;
        if DBGrid11.Focused then
            Background := clHighlight
        else Background := clGray;
    end;
end;

procedure TFUnosTemplate.Kpress(Sender: TObject; var Key: Char);
begin
    if key =#13 then begin selectnext(sender as twincontrol,true,true); key:=#0; end;
end;

procedure TFUnosTemplate.aBeforeDelete(DataSet: TDataSet);
begin
//  if not PristupBazi(dataSet.Tag,cDelete) then raise exception.create(cNeovlasteno);
end;

procedure TFUnosTemplate.aBeforeEdit(DataSet: TDataSet);
begin
//  if not PristupBazi(dataSet.Tag,cEdit) then raise exception.create(cNeovlasteno);
end;

procedure TFUnosTemplate.aBeforeInsert(DataSet: TDataSet);
begin
//  if not PristupBazi(dataSet.Tag,cInsert) then raise exception.create(cNeovlasteno);
end;

procedure TFUnosTemplate.BtnIspisClick(Sender: TObject);
var
  aReport : TCustomQuickRep;
begin
  areport := TFprintFormeUnosa.Create(Self);
  (aReport as TFprintFormeUnosa).Naziv := Caption;
  try
    QRCreateList(aReport, Self, Tq, '', nil);
    aReport.Preview;
  finally
    aReport.Free;
  End;
end;

procedure TFUnosTemplate.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TFUnosTemplate.DBGrid11DblClick(Sender: TObject);
begin
    Pregled.ActivePage := TUnos;
    PregledChange(nil);
end;

end.
