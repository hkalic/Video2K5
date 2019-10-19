unit FilmoviDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBTables, Wwtable, Wwdatsrc,
  Wwdbigrd, Wwdbgrid, MySQLDataset;

type
  TFFilmoviDlg = class(TForm)
    Panel2: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    wwDBGrid1: TwwDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
    TFilm: TMySQLQuery;
    TFilmSifra: TIntegerField;
    TFilmNaziv: TMySQLStringField;
    TFilmOrginalNaziv: TMySQLStringField;
    TFilmNazivZanra: TMySQLStringField;
    TFilmcOznaka: TStringField;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    TFilmrazDVD: TIntegerField;
    TFilmrazVHS: TIntegerField;
    TFilmObrisan: TMySQLStringField;
    TBrKazeta: TMySQLQuery;
    ds2: TDataSource;
    TFilmBrKazeta: TSmallintField;
    TIzdano: TMySQLQuery;
    ds3: TDataSource;
    TFilmIzdanoKop: TSmallintField;
    TuDVD: TMySQLQuery;
    ds4: TDataSource;
    TFilmuDVD: TSmallintField;
    TuVHS: TMySQLQuery;
    ds5: TDataSource;
    TFilmuVHS: TSmallintField;
    TDVD: TMySQLQuery;
    ds6: TDataSource;
    TVHS: TMySQLQuery;
    ds7: TDataSource;
    TFilmDVD: TSmallintField;
    TFilmVHS: TSmallintField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TFilmCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure wwDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure wwDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DajKlub(Dataset: TMySQLDatasetBase; AMacro: String;
      var AValue: String; var ADefault: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowD(traz, pokojem:string; modal:Boolean);
  end;

var
  FFilmoviDlg: TFFilmoviDlg;

implementation
Uses AppUtils, BazeModul, Unoskazete, PojamUnit, FilmUkupno,
  PregSvePosudbeDlg;
{$R *.DFM}

procedure TFFilmoviDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    IzabranFilm:='-1';
    Close;
  end
  Else
  if key = #13 then
  begin
    if TFilm.IsEmpty then
        IzabranFilm:='-1'
    else
        IzabranFilm:=TFilm.FieldByName('Sifra').AsString;
    Close;
  End;
end;

procedure TFFilmoviDlg.FormActivate(Sender: TObject);
begin
  IzabranFilm:='-1';
  TFilmBrKazeta.visible := not orao;
  if orao then TFilmIzdanoKop.visible:=not orao
  else if Podaci.TabSetUp.FieldByName('IzdaneVidljive').Value='D' then TFilmIzdanoKop.Visible:=True
       else TFilmIzdanoKop.Visible:=False;
end;

procedure TFFilmoviDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TFFilmoviDlg.TFilmCalcFields(DataSet: TDataSet);
begin
  TFilmrazDVD.AsInteger:=TFilm.FieldByName('uDVD').AsInteger-TFilm.FieldByName('DVD').AsInteger;
  TFilmrazVHS.AsInteger:=TFilm.FieldByName('uVHS').AsInteger-TFilm.FieldByName('VHS').AsInteger;

  TFilmcOznaka.Value := ' ';
  if TFilm.FieldByName('obrisan').Value='D' then
    TFilmcOznaka.Value := 'obr.'
  else
  if ((TFilm.FieldByName('uDVD').AsInteger+TFilm.FieldByName('uVHS').AsInteger)=0)
  and (TFilm.FieldByName('BrKazeta').AsInteger>0) then
    TFilmcOznaka.Value := ' 2. '
  else
  if ((TFilmrazDVD.AsInteger <= 0) // ukupno-izdano<=0 po klubu
  and (TFilmrazVHS.AsInteger <= 0)) then
    TFilmcOznaka.Value := 'vani';
end;

procedure TFFilmoviDlg.ShowD(traz, pokojem:string; modal:Boolean);
begin
    TFilm.Close;
//    TFilm.MacroByName('KLUB').AsString:=IntToStr(SifraKluba);

    if UpperCase(pokojem)='SIFRA' then
    begin
//        TFilm.MacroByName('DIST').AsString:='';
        TFilm.MacroByName('STA').AsString:='k.sifra>='+traz;
//                                         +' AND d.sifrafirme='+IntToStr(SifraFirme);
        TFilm.MacroByName('ORDER').AsString:='ORDER BY k.sifra';
        TFilm.MacroByName('LIMIT').AsString:='LIMIT 20';
    end
    Else
    if UpperCase(pokojem)='ORGINALNAZIV' then
    begin
//        TFilm.MacroByName('DIST').AsString:='DISTINCT';
        TFilm.MacroByName('STA').AsString:='k.OrginalNaziv LIKE '''+UpperCase(traz)+'%''';
//                                         +' AND d.sifrafirme='+IntToStr(SifraFirme);
        TFilm.MacroByName('ORDER').AsString:='ORDER BY k.OrginalNaziv';
        TFilm.MacroByName('LIMIT').AsString:='';
    end
    else
//    if UpperCase(pokojem)='NAZIV' then
    begin
//        TFilm.MacroByName('DIST').AsString:='DISTINCT';
        TFilm.MacroByName('STA').AsString:='k.Naziv LIKE '''+UpperCase(traz)+'%''';
//                                         +' AND d.sifrafirme='+IntToStr(SifraFirme);
        TFilm.MacroByName('ORDER').AsString:='ORDER BY k.Naziv';
        TFilm.MacroByName('LIMIT').AsString:='';
    end;

    TFilm.Open;
    if modal then ShowModal;
end;

procedure TFFilmoviDlg.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F12 then
  begin
   try
    IzOdabiraF := True;
    Kfilm := TFilm.FieldByName('Sifra').Value;
    ShowDialog(TFUnosKazete);
   finally
    IzOdabiraF := False;
   End;
  End;
end;

procedure TFFilmoviDlg.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
    if (Field.name = 'TFilmNaziv') or (Field.name = 'TFilmSifra') then
    begin
//  ABrush.Color := clRed;  {Change the background color to ...}
        if highlight then AFont.Color:=clWhite {Change the pen color to ...}
        else AFont.Color:=clWindowText;
        if TFilmcOznaka.Value=' ' then AFont.Style:=[fsBold];
        AFont.Size:=10;
    end;

    if TFilmcOznaka.Value='obr.' then AFont.Color:=clGray // ako je film obrisan onda ...
    else if TFilmcOznaka.Value='vani' then
    begin // ako je film vani onda ...
        AFont.Color:=clRed;
        AFont.Style:=[fsItalic];
    end
    else if TFilmcOznaka.Value=' 2. ' then
    begin
        AFont.Color:=clSilver;
        AFont.Style:=[fsItalic];
    end
    else if TFilmcOznaka.Value=' ' then
    begin
//        if (Field=TFilmvaniVHS) then
        if (Field=TFilmrazVHS) then
        begin
            if (TFilmrazVHS.AsInteger <= 0) then
                ABrush.Color:=clRed
            else ABrush.Color:=clGreen;
            AFont.Color:=clWhite;
            AFont.Style:=[fsBold];
        end;

//        if (Field=TFilmvaniDVD) then
        if (Field=TFilmrazDVD) then
        begin
            if (TFilmrazDVD.AsInteger <= 0) then
                ABrush.Color:=clRed
            else ABrush.Color:=clGreen;
            AFont.Color:=clWhite;
            AFont.Style:=[fsBold];
        end;
    end;
end;

procedure TFFilmoviDlg.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TFFilmoviDlg.wwDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     if Key in ['A'..'Z','a'..'z','0'..'9','š','ð','è','æ','ž','Š','Ð','Ž','Æ','È','%'] then
     begin
        PojamForm.Edit1.Text:=Key;
        PojamForm.Edit1.SelStart:=1;
        PojamForm.ShowModal;
        if PojamForm.ModRes then ShowD(PojamForm.Edit1.Text, wwDBGrid1.SelectedField.FieldName, False);
     end;
end;

procedure TFFilmoviDlg.wwDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_F11 then
    begin
        Application.CreateForm(TFUkupnoFilm, FUkupnoFilm);
        FUkupnoFilm.ShowD(wwDBGrid1.Fields[1].AsInteger);
    end
    else if key=VK_F10 then
    begin
        Application.CreateForm(TFPregSvePosudbeDlg, FPregSvePosudbeDlg);
        FPregSvePosudbeDlg.DoMagic(wwDBGrid1.Fields[1].AsInteger);
    end;
end;

procedure TFFilmoviDlg.DajKlub(Dataset: TMySQLDatasetBase;
  AMacro: String; var AValue: String; var ADefault: Boolean);
begin
    if AMacro='KLUB' then
        Dataset.MacroByName(AMacro).AsString:=IntToStr(SifraKluba);
end;

end.
