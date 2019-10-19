unit PregRezerviranih;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MySQLDataset, Grids, Wwdbgrid, StdCtrls, Buttons,
  ExtCtrls, Wwdbigrd, LMDCustomComponent, LMDDBExport;

type
  TFRezervirani = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Btnizlaz: TBitBtn;
    DBGrid1: TwwDBGrid;
    Panel2: TPanel;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    DBGrid2: TwwDBGrid;
    qDetRezervacija: TMySQLQuery;
    qDetRezervacijaselected: TBooleanField;
    ds1: TDataSource;
    qDetRezervacijasifra: TAutoIncField;
    qDetRezervacijasifrakazete: TIntegerField;
    qDetRezervacijabarcode: TMySQLStringField;
    qDetRezervacijanaziv: TMySQLStringField;
    qDetRezervacijavrijemerezervacije: TDateTimeField;
    qDetRezervacijasifraclana: TIntegerField;
    qDetRezervacijaimeprezime: TMySQLStringField;
    qDetRezervacijadostava: TMySQLStringField;
    qDetRezervacijazeljenidatum: TDateField;
    qSveRezervacije: TMySQLQuery;
    BooleanField1: TBooleanField;
    ds2: TDataSource;
    qSveRezervacijesifra: TAutoIncField;
    qSveRezervacijesifrakazete: TIntegerField;
    qSveRezervacijebarcode: TMySQLStringField;
    qSveRezervacijenaziv: TMySQLStringField;
    qSveRezervacijezeljenidatum: TDateField;
    qSveRezervacijevrijemerezervacije: TDateTimeField;
    qSveRezervacijesifraclana: TIntegerField;
    qSveRezervacijeimeprezime: TMySQLStringField;
    qSveRezervacijedostava: TMySQLStringField;
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure qDetRezervacijaBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnizlazClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qSveRezervacijeBeforeOpen(DataSet: TDataSet);
    procedure Printaj(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRezervirani: TFRezervirani;

implementation
Uses BazeModul, Share, Kartica, Main, FilmUkupno, DLG_OdabirDatuma;

{$R *.dfm}

procedure TFRezervirani.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TFRezervirani.qDetRezervacijaBeforeOpen(DataSet: TDataSet);
begin
    qDetRezervacija.MacroByName('DODATAK').AsString:='AND r.sifra_videokluba='+IntToStr(SifraKluba)+
    ' AND r.zeljenidatum='''+FormatDateTime('yyyy-mm-dd', Now)+'''';
end;

procedure TFRezervirani.qSveRezervacijeBeforeOpen(DataSet: TDataSet);
begin
    qSveRezervacije.MacroByName('DODATAK').AsString:='AND r.sifra_videokluba='+IntToStr(SifraKluba);
end;

procedure TFRezervirani.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TFRezervirani.BtnizlazClick(Sender: TObject);
begin
    Close;
end;

procedure TFRezervirani.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i: integer;
    bilo_zaduzenje: Boolean;
    upit_rez: String;
begin
    if key=27 then Close
    else if key=VK_F9 then
    begin
        bilo_zaduzenje:=Podaci.ZaduziRezervaciju((Sender as TwwDBGrid));
        if bilo_zaduzenje then
        begin
            MainForm.webTimer1Timer(MainForm.webTimer1);
            MainForm.SrediFormu;

            qDetRezervacija.Close;
            qDetRezervacija.Open;
            qSveRezervacije.Close;
            qSveRezervacije.Open;
        end;
    end
    else if key=VK_F11 then
    begin
        Application.CreateForm(TFUkupnoFilm, FUkupnoFilm);
        FUkupnoFilm.ShowD((Sender as TwwDBGrid).DataSource.DataSet.FieldByName('sifrakazete').AsInteger);
    end
    else if key=VK_F5 then
    begin
        if DajDatum.ShowModal=mrOk then
        begin
            try
                ShareUnit.UpitOpen(Podaci.myQuery1,
                    'UPDATE rezervacija2 SET zeljenidatum='''+FormatDateTime('yyyy-mm-dd',DajDatum.DatumOd.Date)+''''+
//                    ', vrijemerezervacije='''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''''+
                    ' WHERE sifra='+(Sender as TwwDBGrid).DataSource.DataSet.FieldByName('sifra').AsString, True, False);
            except on E: Exception do
                begin
                    Logiraj(Podaci.myQuery1.Name+'::Error - TPregRezervacija.PromjenaDatuma: '+E.Message, True);
                end;
            end;
            qDetRezervacija.Close;
            qDetRezervacija.Open;
            qSveRezervacije.Close;
            qSveRezervacije.Open;
        end;
    end
    else if key=VK_DELETE then
    begin
      if MessageDlg('Da li ste sigurni da želite obrisati rezervacije filmova?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
        if (Sender as TwwDBGrid).SelectedList.Count>0 then
        begin
            upit_rez:='UPDATE rezervacija2 SET status=''obrisano'' WHERE sifra IN (';
            (Sender as TwwDBGrid).DataSource.DataSet.DisableControls;
            for i:= 0 to (Sender as TwwDBGrid).SelectedList.Count-1 do
            begin
                (Sender as TwwDBGrid).DataSource.DataSet.GotoBookmark((Sender as TwwDBGrid).SelectedList.items[i]);
                upit_rez:=upit_rez+(Sender as TwwDBGrid).DataSource.DataSet.FieldByName('sifra').AsString+', ';
            end;
            Delete(upit_rez, length(upit_rez)-1, 2);
            upit_rez:=upit_rez+')';
            try
                ShareUnit.UpitOpen(Podaci.myQuery1, upit_rez, True, False);
            except on E: Exception do
            begin
                Logiraj(Podaci.myQuery1.Name+'::Error - TPregRezervacija.DBGridKeyUp: '+E.Message, True);
            end;
            end;
            MainForm.webTimer1Timer(MainForm.webTimer1);
        End
        else ShowMessage('Nema odabranih podataka za obradu!');

        (Sender as TwwDBGrid).UnselectAll;
        (Sender as TwwDBGrid).DataSource.DataSet.Close;
        (Sender as TwwDBGrid).DataSource.DataSet.Open;
        (Sender as TwwDBGrid).DataSource.DataSet.EnableControls;
      end;
    end;
end;

procedure TFRezervirani.Printaj(Sender: TObject);
begin
    case (sender as TBitBtn).Tag of
    1: Podaci.DataSet2HTML(ds1);
    2: Podaci.DataSet2HTML(ds2);
    end;
end;

end.

