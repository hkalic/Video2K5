unit PregWishLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DB,
  MySQLDataset;

type
  TfPregledWishLista = class(TForm)
    DBGrid1: TwwDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Btnizlaz: TBitBtn;
    Panel2: TPanel;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    DBGrid2: TwwDBGrid;
    ds1: TDataSource;
    qDetWLista: TMySQLQuery;
    qDetWListaselected: TBooleanField;
    ds2: TDataSource;
    qSveWListe: TMySQLQuery;
    qDetWListaid: TAutoIncField;
    qDetWListasifrafilma: TIntegerField;
    qDetWListanaziv: TMySQLStringField;
    qDetWListamedij: TMySQLStringField;
    qDetWListavrijemeunosa: TDateTimeField;
    qDetWListasifraclana: TIntegerField;
    qDetWListaimeprezime: TMySQLStringField;
    qDetWListastatus: TMySQLStringField;
    qSveWListeselected: TBooleanField;
    qSveWListesifrafilma: TIntegerField;
    qSveWListenaziv: TMySQLStringField;
    qSveWListemedij: TMySQLStringField;
    qSveWListevrijemeunosa: TDateTimeField;
    qSveWListesifraclana: TIntegerField;
    qSveWListeimeprezime: TMySQLStringField;
    qSveWListeid: TAutoIncField;
    qSveWListestatus: TMySQLStringField;
    Label2: TLabel;
    Label4: TLabel;
    procedure BtnizlazClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qDetWListaBeforeOpen(DataSet: TDataSet);
    procedure qDetWListaExecSQL(Dataset: TMySQLDatasetBase;
      var SQL: String; var Continue: Boolean);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DajPonovo;
    procedure Printaj(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPregledWishLista: TfPregledWishLista;

implementation
Uses BazeModul, Share, Kartica, Main, FilmUkupno, DLG_OdabirDatuma;

{$R *.dfm}

procedure TfPregledWishLista.BtnizlazClick(Sender: TObject);
begin
    Close;
end;

procedure TfPregledWishLista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TfPregledWishLista.qDetWListaBeforeOpen(DataSet: TDataSet);
begin
    (DataSet as TMySQLQuery).MacroByName('KLUB').AsString:=IntToStr(SifraKluba);
end;

procedure TfPregledWishLista.qDetWListaExecSQL(Dataset: TMySQLDatasetBase;
  var SQL: String; var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TfPregledWishLista.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i, j, k, check: integer;
    bilo_zaduzenje: Boolean;
    upit_bcode, upit_pos, upit_kazete, upit_rez, upit_rez1, upit_rez2, barkod, upit_pos_solid: String;
begin
    if key=27 then Close
    else if key=VK_F9 then
    begin
        bilo_zaduzenje:=Podaci.ZaduziRezervaciju((Sender as TwwDBGrid));
        if bilo_zaduzenje then
        begin
            MainForm.webTimer1Timer(MainForm.webTimer1);
            MainForm.SrediFormu;
        end;
    end
    else if key=VK_F11 then
    begin
        Application.CreateForm(TFUkupnoFilm, FUkupnoFilm);
        FUkupnoFilm.ShowD((Sender as TwwDBGrid).DataSource.DataSet.FieldByName('sifrafilma').AsInteger);
    end
    else if key=VK_F5 then
    begin
    end
    else if key=VK_DELETE then
    begin
      if MessageDlg('Da li ste sigurni da želite obrisati ove filmove sa wish liste?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
        if (Sender as TwwDBGrid).SelectedList.Count>0 then
        begin
            upit_rez:='DELETE FROM whishlista WHERE id IN (';
            (Sender as TwwDBGrid).DataSource.DataSet.DisableControls;
            check:=0;
            for i:= 0 to (Sender as TwwDBGrid).SelectedList.Count-1 do
            begin
                (Sender as TwwDBGrid).DataSource.DataSet.GotoBookmark((Sender as TwwDBGrid).SelectedList.items[i]);
                upit_rez:=upit_rez+(Sender as TwwDBGrid).DataSource.DataSet.FieldByName('id').AsString+', ';
            end;
            Delete(upit_rez, length(upit_rez)-1, 2);
            upit_rez:=upit_rez+')';
            try
                ShareUnit.UpitOpen(Podaci.myQuery1, upit_rez, True, False);
            except on E: Exception do
            begin
                Logiraj(Podaci.myQuery1.Name+'::Error - TPregWishLista.DBGridKeyUp: '+E.Message, True);
            end;
            end;
            MainForm.webTimer1Timer(MainForm.webTimer1);
        End
        else ShowMessage('Nema odabranih podataka za obradu!');

        (Sender as TwwDBGrid).UnselectAll;
        DajPonovo;
        (Sender as TwwDBGrid).DataSource.DataSet.EnableControls;
      end;
    end;
end;

procedure TfPregledWishLista.DajPonovo;
Begin
    qDetWLista.Close;
    qDetWLista.Open;
    qSveWListe.Close;
    qSveWListe.Open;
end;

procedure TfPregledWishLista.Printaj(Sender: TObject);
begin
    case (sender as TBitBtn).Tag of
    1: Podaci.DataSet2HTML(ds1);
    2: Podaci.DataSet2HTML(ds2);
    end;
end;

end.
