unit PregNarucenih;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MySQLDataset, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, quickrpt, Qrctrls, QRExtra, Menus, StrUtils;

type
  TFNaruceni = class(TForm)
    Panel1: TPanel;
    DBGrid1: TwwDBGrid;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Btnizlaz: TBitBtn;
    DataSource1: TDataSource;
    qClanovi: TMySQLQuery;
    qDetNarudzbi: TMySQLQuery;
    qDetNarudzbisifra: TAutoIncField;
    qDetNarudzbisifrakazete: TIntegerField;
    qDetNarudzbibarcode: TMySQLStringField;
    qDetNarudzbiknaziv: TMySQLStringField;
    qDetNarudzbimnaziv: TMySQLStringField;
    qDetNarudzbisifraclana: TIntegerField;
    qDetNarudzbiselected: TBooleanField;
    qDetNarudzbiimeprezime: TMySQLStringField;
    qDetNarudzbidatum: TMySQLStringField;
    qDetNarudzbistatusflag: TMySQLStringField;
    Shape1: TShape;
    Label2: TLabel;
    IspisPopup: TPopupMenu;
    naPOSprinter1: TMenuItem;
    naWindowsprinter1: TMenuItem;
    qDetVracanja: TMySQLQuery;
    DataSource2: TDataSource;
    DBGrid2: TwwDBGrid;
    qDetVracanjasifranebitna: TAutoIncField;
    qDetVracanjasifrakazete: TIntegerField;
    qDetVracanjabcodekaz: TMySQLStringField;
    qDetVracanjafilm: TMySQLStringField;
    qDetVracanjamedij: TMySQLStringField;
    qDetVracanjadatumpos: TDateTimeField;
    qDetVracanjasifraclana: TIntegerField;
    qDetVracanjaimeprezime: TMySQLStringField;
    qDetVracanjavracanje: TMySQLStringField;
    qDetVracanjaselected: TBooleanField;
    Panel2: TPanel;
    Label3: TLabel;
    Shape2: TShape;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    IspisPopup2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuClick(Sender: TObject);
    procedure BtnizlazClick(Sender: TObject);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    function ProvjeriCF(Clan, BFilma:String):Boolean;
    procedure DBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Printaj(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNaruceni: TFNaruceni;

implementation
Uses BazeModul, PrintFormeUnosa, PojamUnit, FilmUkupno, Share, Kartica, Main,
  UnosbarCode, DLG_OdabirDatuma;

{$R *.dfm}

procedure TFNaruceni.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i, j, k, check: integer;
    upit_bcode, upit_pos, upit_kazete, upit_rez, upit_rez1, upit_rez2, barkod, upit_pos_solid: String;
begin
    if key=27 then Close
    else if key=VK_F9 then
    begin
        if DBGrid1.SelectedList.Count>0 then
        begin
            upit_bcode:='UPDATE bcodekazete SET Izdano=''D'' '+#13+'WHERE barcode IN (';
            upit_pos:='INSERT INTO pos (SifraClana, SifraKazete, bcodekaz, DatumPos, Operater, SifraKluba)'+#13+'VALUES ';
            upit_pos_solid:='INSERT INTO pos_solid (SifraClana, SifraKazete, bcodekaz, DatumPos, Operater, SifraKluba)'+#13+'VALUES ';
            upit_kazete:='';
            upit_rez1:='UPDATE rezervacija SET statusflag=''Y'' WHERE sifra IN ('; // za zadužene rezervacije
            upit_rez2:='UPDATE rezervacija SET statusflag=''S'' WHERE sifra IN ('; // za zadužene dostave

		    qDetNarudzbi.DisableControls;
            qDetVracanja.DisableControls;

            check:=0; j:=0; k:=0;
		    for i:= 0 to DBGrid1.SelectedList.Count-1 do
            begin
			    qDetNarudzbi.GotoBookmark(DBGrid1.SelectedList.items[i]);
                barkod:=qDetNarudzbi.FieldByName('barcode').AsString;

                // Da li se film može zadužiti
                FKartica.qZaPosuditi.Close;
                FKartica.qZaPosuditi.MacroByName('SIFRAKAZETE').AsString:=qDetNarudzbi.FieldByName('sifrakazete').AsString;
                FKartica.qZaPosuditi.MacroByName('KLUB').AsString:=IntToStr(SifraKluba);
                FKartica.qZaPosuditi.Open;
                if FKartica.qZaPosuditi.FieldByName('ZaIzdati').AsInteger=0 then
                begin
                    MessageDlg('Sve kazete su posuðene!!!', mtWarning, [mbOk], 0);
                    barkod:='0';
                end
                else
                // ruèno odabiranje barkoda po šifri
                begin
                    Application.CreateForm(TFUnosbarCode, FUnosbarCode);
                    try
                        barkod:=FUnosbarCode.OdaberiBKod(qDetNarudzbi.FieldByName('sifrakazete').AsInteger, 0, ' - '+qDetNarudzbi.FieldByName('k.naziv').AsString);
                    except
                        Exit;
                        barkod:='0';
                    end;
                End;
                FKartica.qZaPosuditi.Close;

                // provjera posuðenosti ili slièno
                if (ProvjeriCF(qDetNarudzbi.FieldByName('sifraclana').AsString, barkod)) and (barkod<>'0') then
                begin
                    // prvo naði i oznaèi IZDAN u tBarkodova
                    upit_bcode:=upit_bcode+''''+barkod+''', ';

                    // upiši u bazu POSudbi
                    upit_pos:=upit_pos+'('+
                        qDetNarudzbi.FieldByName('sifraclana').AsString+', '+qDetNarudzbi.FieldByName('sifrakazete').asString+', '''+
                        barkod+''', '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '+
                        IntToStr(VOperater)+', '+IntToStr(SifraKluba)+'), ';

                    // upiši u bazu POSudbi_SOLID
                    upit_pos_solid:=upit_pos_solid+'('+
                        qDetNarudzbi.FieldByName('sifraclana').AsString+', '+qDetNarudzbi.FieldByName('sifrakazete').asString+', '''+
                        barkod+''', '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '+
                        IntToStr(VOperater)+', '+IntToStr(SifraKluba)+'), ';

                    // zatim poveæaj IZDANOKOP u bazi filmova za taj film
                    upit_kazete:=upit_kazete+'UPDATE kazetedetail SET IzdanoKop=IzdanoKop+1 WHERE SifraKazete='+
                        qDetNarudzbi.FieldByName('sifrakazete').AsString+
                        ' AND SifraFirme='+IntToStr(SifraFirme)+';'+#13;

                    // oznaka za isporuèenu narudžbu
                    if qDetNarudzbi.FieldByName('statusflag').AsString='X' then
                    begin
                        upit_rez1:=upit_rez1+qDetNarudzbi.FieldByName('sifra').AsString+', ';
                        Inc(j); // brojaè da se vidi da li je bilo rezervacija bez dostave
                    end
                    else if qDetNarudzbi.FieldByName('statusflag').AsString='D' then
                    begin
                        upit_rez2:=upit_rez2+qDetNarudzbi.FieldByName('sifra').AsString+', ';
                        Inc(k); // brojaè da se vidi da li je bilo rezervacija bez dostave
                    end;

                    Inc(check);
                end;
            end;

            if check>0 then // ako je svaka kazeta pogrešna onda ništa pa netreba ovo dolje
            begin
                //obriši zadnji karakter od svakog stringa pa ih spoji u jedan upit
                Delete(upit_bcode, length(upit_bcode)-1, 2);
                Delete(upit_pos, length(upit_pos)-1, 2);
                Delete(upit_pos_solid, length(upit_pos_solid)-1, 2);
                Delete(upit_kazete, length(upit_kazete)-1, 2);
                Delete(upit_rez1, length(upit_rez1)-1, 2);
                Delete(upit_rez2, length(upit_rez2)-1, 2);
                upit_bcode:=upit_bcode+')';
                upit_rez1:=upit_rez1+')';
                upit_rez2:=upit_rez2+')';

                if j>0 then upit_rez:=upit_rez1;
                if (j>0) and (k>0) then upit_rez:=upit_rez+';'+#13;
                if k>0 then upit_rez:=upit_rez+upit_rez2;

                try
                    ShareUnit.UpitOpen(Podaci.myQuery1,
                        upit_bcode+';'+#13+upit_pos+';'+#13+upit_pos_solid+';'+#13+upit_kazete+';'+#13+upit_rez+';'+#13, True, False);
                except on E: Exception do
                begin
                    Logiraj(Podaci.myQuery1.Name+'::Error - TPregNarucenih.DBGrid1KeyUp: '+E.Message, True);
                end;
                end;
            End
            else ShowMessage('Svi zahtjevi su odbijeni!');

            qDetNarudzbi.Close;
            qDetVracanja.Close;
            DBGrid1.UnselectAll;
            DBGrid2.UnselectAll;
            qDetNarudzbi.Open;
            qDetVracanja.Open;
            qDetVracanja.EnableControls;
		    qDetNarudzbi.EnableControls;
        end
        else ShowMessage('Nema odabranih podataka za obradu!')
    end
    else if key=VK_F11 then
    begin
        Application.CreateForm(TFUkupnoFilm, FUkupnoFilm);
        FUkupnoFilm.ShowD(qDetNarudzbi.FieldByName('sifrakazete').AsInteger);
    end
    else if key=VK_F5 then
    begin
        if DajDatum.ShowModal=mrOk then
        begin
            try
                ShareUnit.UpitOpen(Podaci.myQuery1,
                    'UPDATE rezervacija SET datum='''+DateToStr(DajDatum.DatumOd.Date)+''''+
                    ' WHERE sifra='+qDetNarudzbi.FieldByName('sifra').AsString, True, False);
            except on E: Exception do
                begin
                    Logiraj(Podaci.myQuery1.Name+'::Error - TPregNarucenih.PromjenaDatuma: '+E.Message, True);
                end;
            end;
            qDetNarudzbi.Close;
            qDetVracanja.Close;
            DBGrid1.UnselectAll;
            DBGrid2.UnselectAll;
            qDetNarudzbi.Open;
            qDetVracanja.Open;
        end;
    end
    else if key=VK_DELETE then
    begin
      if MessageDlg('Da li ste sigurni da želite obrisati naruèene filmove?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
        if DBGrid1.SelectedList.Count>0 then
        begin
            upit_rez:='UPDATE rezervacija SET statusflag=''Z'' WHERE sifra IN (';
            qDetNarudzbi.DisableControls;
            for i:= 0 to DBGrid1.SelectedList.Count-1 do
            begin
                qDetNarudzbi.GotoBookmark(DBGrid1.SelectedList.items[i]);
                // oznaka za isporuèenu narudžbu
                upit_rez:=upit_rez+qDetNarudzbi.FieldByName('sifra').AsString+', ';
            end;
            Delete(upit_rez, length(upit_rez)-1, 2);
            upit_rez:=upit_rez+')';
            try
                ShareUnit.UpitOpen(Podaci.myQuery1, upit_rez, True, False);
            except on E: Exception do
                begin
                    Logiraj(Podaci.myQuery1.Name+'::Error - TPregNarucenih.DBGrid1KeyUp: '+E.Message, True);
                end;
            end;
            MainForm.webTimer1Timer(MainForm.webTimer1);
        End
        else ShowMessage('Nema odabranih podataka za obradu!');

        qDetNarudzbi.Close;
        qDetVracanja.Close;
        DBGrid1.UnselectAll;
        DBGrid2.UnselectAll;
        qDetNarudzbi.Open;
        qDetVracanja.Open;
        qDetVracanja.EnableControls;
        qDetNarudzbi.EnableControls;
      end;
    end;
end;

procedure TFNaruceni.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TFNaruceni.MenuClick(Sender: TObject);
var
  aReport : TCustomQuickRep;
  FieldList: TStringList;
  nIdx, tagg: Integer;
  ImeKazete, ImeMedija : String;
  Ekran: Boolean;
begin
    Tagg:=(Sender as TMenuItem).Tag;
    Case Tagg of
        2: // za Windows printer - QReport - GORNjI GRID
        begin
            FieldList := TStringList.Create;

            for nIdx := 0 to DBGrid1.FieldCount - 1 do
                FieldList.Add(DBGrid1.Columns[nIdx].FieldName);

            areport := TFprintFormeUnosa.Create(Self);
            (aReport as TFprintFormeUnosa).Naziv := Caption;
            try
                QRCreateList(aReport, Self, DataSource1.DataSet, '', FieldList);
                aReport.Preview;
            finally
                aReport.Free;
                if FieldList <> nil then FieldList.Free;
            End;
        End;

        3: // za Windows printer - QReport - DOLjNjI GRID
        begin
            FieldList := TStringList.Create;

            for nIdx := 0 to DBGrid2.FieldCount - 1 do
                FieldList.Add(DBGrid2.Columns[nIdx].FieldName);

            areport := TFprintFormeUnosa.Create(Self);
            (aReport as TFprintFormeUnosa).Naziv := Caption;
            try
                QRCreateList(aReport, Self, DataSource2.DataSet, '', FieldList);
                aReport.Preview;
            finally
                aReport.Free;
                if FieldList <> nil then FieldList.Free;
            End;
        End;

        1: // za POS printer - RAW na LPT port - ZA GORNjI GRID
        begin
            Ekran:=False;
            Podaci.PripremiPrinter(Ekran);
            try
                with qDetNarudzbi do
                begin
                    DisableControls;
                    First;
                    writeln(lst, #13#10);
                    writeln(lst, StringOfChar('-', 40));
                    writeln(lst, ShareUnit.CEnterStr(podaci.sstr('PREGLED NARUÈENIH FILMOVA'),40));
                    writeln(lst, ShareUnit.CEnterStr(DateTimeToStr(Now),40));
                    writeln(lst, StringOfChar('-', 40));
                    writeln(lst, #13#10);
                    writeln(lst, podaci.sstr(' # - šifra - ime èlana'));
                    writeln(lst, podaci.sstr('šifra - naziv filma        - medij'));
                    writeln(lst, StringOfChar('-', 40));

                    while not Eof do
                    begin
                        ImeKazete:=podaci.sstr(FieldByName('k.naziv').AsString);
                        SetLength(ImeKazete,18);
                        ImeMedija:=podaci.sstr(FieldByName('m.naziv').AsString);
                        SetLength(ImeMedija,18);

                        writeln(lst, ShareUnit.CEnterStr(podaci.sstr(IntToStr(RecNo+1)+'.'),3)
                                +'_ '+ShareUnit.CEnterStr(podaci.sstr(FieldByName('sifraclana').AsString),6)
                                +'_ '+LeftStr(podaci.sstr(FieldByName('imeprezime').AsString),27));
                        writeln(lst, ShareUnit.CEnterStr(podaci.sstr(FieldByName('sifrakazete').AsString),6)
                                +'_ '+ImeKazete+'_ '+ImeMedija);
                        Next;
                    end;
                    writeln(lst, StringOfChar('-', 40));
                    EnableControls;
                end;
                Podaci.NaKraju(Ekran, False, 0);
            finally
                closefile(lst);
            end;
        end;

        4: // za POS printer - RAW na LPT port - ZA DOLjNjI GRID
        begin
            Ekran:=False;
            Podaci.PripremiPrinter(Ekran);
            try
                with qDetVracanja do
                begin
                    DisableControls;
                    First;
                    writeln(lst, #13#10);
                    writeln(lst, StringOfChar('-', 40));
                    writeln(lst, ShareUnit.CEnterStr(podaci.sstr('PREGLED NARUÈENIH FILMOVA'),40));
                    writeln(lst, ShareUnit.CEnterStr(DateTimeToStr(Now),40));
                    writeln(lst, StringOfChar('-', 40));
                    writeln(lst, #13#10);
                    writeln(lst, podaci.sstr(' # - šifra - ime èlana'));
                    writeln(lst, podaci.sstr('šifra - naziv filma        - medij'));
                    writeln(lst, StringOfChar('-', 40));

                    while not Eof do
                    begin
                        ImeKazete:=podaci.sstr(FieldByName('k.naziv').AsString);
                        SetLength(ImeKazete,18);
                        ImeMedija:=podaci.sstr(FieldByName('m.naziv').AsString);
                        SetLength(ImeMedija,18);

                        writeln(lst, ShareUnit.CEnterStr(podaci.sstr(IntToStr(RecNo+1)+'.'),3)
                                +'_ '+ShareUnit.CEnterStr(podaci.sstr(FieldByName('sifraclana').AsString),6)
                                +'_ '+LeftStr(podaci.sstr(FieldByName('imeprezime').AsString),27));
                        writeln(lst, ShareUnit.CEnterStr(podaci.sstr(FieldByName('sifrakazete').AsString),6)
                                +'_ '+ImeKazete+'_ '+ImeMedija);
                        Next;
                    end;
                    writeln(lst, StringOfChar('-', 40));
                    EnableControls;
                end;
                Podaci.NaKraju(Ekran, False, 0);
            finally
                closefile(lst);
            end;
        end;
    end;
end;

procedure TFNaruceni.BtnizlazClick(Sender: TObject);
begin
    Close;
end;

procedure TFNaruceni.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

function TFNaruceni.ProvjeriCF(Clan, BFilma:String):Boolean;
begin
    if SmijePosuditi then // da li èlan može posudi film
    begin
        qClanovi.Close;
        qClanovi.MacroByName('WHERE').AsString:='WHERE sifra='+Clan;
        qClanovi.Open;

        if qClanovi.FieldByName('Duzan').Value < 0 then
        begin
            MessageDlg('Saldo èlana '+Clan+'-'+qClanovi.FieldByName('imeprezime').AsString+' je u minusu, te nema pravo podizati kazete dok ne podmiri dug!', mtWarning, [mbOk], 0);
            Result:=False;
            Exit;
        End else Result:=True;
    end;

    // Da li se barkod može zadužiti
    FKartica.qProvjeraBCoda.Close;
    FKartica.qProvjeraBCoda.MacroByName('WHERE').AsString:=
        ' WHERE sifra_videokluba='+IntToStr(SifraKluba)+
        ' AND barcode='''+BFilma+'''';
    FKartica.qProvjeraBCoda.Open;

    FKartica.qProvjeraRezervacija2.Close;  // provjera rezervacija
    FKartica.qProvjeraRezervacija2.MacroByName('KOD').AsString:='barcode='''+BFilma+'''';
    FKartica.qProvjeraRezervacija2.Open;

    if not FKartica.qProvjeraBCoda.IsEmpty then
    begin
        if FKartica.qProvjeraBCoda.FieldByName('izdano').AsString='D' then
        begin
            ShowMessage('Film '+BFilma+' je veæ posuðen.');
            Result:=False;
            Exit;
        end
        else Result:=True;
    end
    else
    begin
        ShowMessage('Film '+BFilma+' nije u ovom klubu ili nepostoji.');
        Result:=False;
        Exit;
    end;

    if not FKartica.qProvjeraRezervacija2.IsEmpty then // ovo je provjera da li je nešto rezervirano
        if Confirm('Film je rezerviro '+Podaci.ImeCl(FKartica.qProvjeraRezervacija2.FieldByName('sifraclana').AsInteger, 3)+' za '+
                    DateToStr(FKartica.qProvjeraRezervacija2.FieldByName('zeljenidatum').AsDateTime)+#13+#13+'Da li ga svejedno želite iznajmiti?') then
            Result:=True
        else
        begin
            Result:=False;
            Exit;
        end;
end;

procedure TFNaruceni.DBGrid1CalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
    case (Sender as TwwDBGrid).Tag of
    1:
     begin
        if (Sender as TwwDBGrid).DataSource.DataSet.FieldByName('statusflag').AsString='D' then
        begin
            ABrush.Color:=clRed;
            if Highlight then AFont.Color:=clYellow
            else AFont.Color:=clBlack;
        end
        else
        begin
            if Highlight then
            begin
                AFont.Color:=clBlue;
                ABrush.Color:=clSkyBlue;
            end
            else
            begin
                AFont.Color:=clBlack;
                ABrush.Color:=clBtnFace;
            end;
        end;
     end;
    2:
     begin
        if (Sender as TwwDBGrid).DataSource.DataSet.FieldByName('vracanje').AsString='D' then
        begin
            if Highlight then
            begin
                AFont.Color:=clBlue;
                ABrush.Color:=clAqua;
            end
            else
            begin
                AFont.Color:=clBlack;
                ABrush.Color:=clBtnFace;
            end;
        end
        else
        begin
            if Highlight then
            begin
                AFont.Color:=clBlue;
                ABrush.Color:=clSkyBlue;
            end
            else
            begin
                AFont.Color:=clBlack;
                ABrush.Color:=clBtnFace;
            end;
        end;
     end;
    end;
end;

procedure TFNaruceni.BitBtn1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    IspisPopup.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFNaruceni.DBGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i: integer;
    upit_rez, upit_rez2: String;
    bilo_zaduzenje, bilo_zaduzenje2: Boolean;
begin
    if key=27 then Close
    else if key=VK_F9 then
    begin
        if (Sender as TwwDBGrid).SelectedList.Count>0 then
        begin
            (Sender as TwwDBGrid).DataSource.DataSet.DisableControls;
            bilo_zaduzenje:=False;
            bilo_zaduzenje2:=False;
            if (Sender as TwwDBGrid).Tag=1 then
            begin
                upit_rez:='UPDATE rezervacija SET statusflag=''Y'' WHERE sifra IN (';
                upit_rez2:='UPDATE rezervacija SET statusflag=''S'' WHERE sifra IN (';
            end
            else
            begin
//                upit_rez:='UPDATE pos SET vracanje=''N'' WHERE sifranebitna IN (';
//                upit_rez2:='';
            end;

            for i:= 0 to (Sender as TwwDBGrid).SelectedList.Count-1 do
            begin
                (Sender as TwwDBGrid).DataSource.DataSet.GotoBookmark((Sender as TwwDBGrid).SelectedList.items[i]);

                case (Sender as TwwDBGrid).Tag of
                2:  FKartica.ShowM((Sender as TwwDBGrid).DataSource.DataSet.FieldByName('sifraclana').AsInteger,
                                   (Sender as TwwDBGrid).DataSource.DataSet.FieldByName('sifrakazete').AsInteger);

                1:  if FKartica.ZaduziFilm((Sender as TwwDBGrid).DataSource.DataSet.FieldByName('sifrakazete').AsString,
                                            (Sender as TwwDBGrid).DataSource.DataSet.FieldByName('sifraclana').AsString, False) then
                    begin
                        // oznaèi sada staru narudžbu da je ostvarena (ako je bilo uspješno zaduženje)
                        if (Sender as TwwDBGrid).DataSource.DataSet.FieldByName('statusflag').AsString='X' then
                        begin
                            upit_rez:=upit_rez+(Sender as TwwDBGrid).DataSource.DataSet.FieldByName('sifra').AsString+', '; // za narudžbu
                            bilo_zaduzenje:=True;
                        end
                        else if (Sender as TwwDBGrid).DataSource.DataSet.FieldByName('statusflag').AsString='D' then
                        begin
                            upit_rez2:=upit_rez+(Sender as TwwDBGrid).DataSource.DataSet.FieldByName('sifra').AsString+', '; // za narudžbu sa dostavom
                            bilo_zaduzenje2:=True;
                        end;
                    end;
                end;
            end;

            if bilo_zaduzenje then
            begin
                Delete(upit_rez, length(upit_rez)-1, 2);
                upit_rez:=upit_rez+')';
            end
            else upit_rez:='';

            if bilo_zaduzenje2 then
            begin
                Delete(upit_rez2, length(upit_rez2)-1, 2);
                upit_rez2:=upit_rez2+')';
            end
            else upit_rez2:='';

            try
                if bilo_zaduzenje or bilo_zaduzenje2 then ShareUnit.UpitOpen(Podaci.myQuery1, upit_rez+'; '+#13+upit_rez2, True, False);
            except on E: Exception do
                begin
                        Logiraj(Podaci.myQuery1.Name+'::Error - TPregNarudžbi.Zaduži: '+E.Message, True);
                end;
            end;

            (Sender as TwwDBGrid).UnselectAll;
            (Sender as TwwDBGrid).DataSource.DataSet.Close;
            (Sender as TwwDBGrid).DataSource.DataSet.Open;
            (Sender as TwwDBGrid).DataSource.DataSet.EnableControls;
            MainForm.webTimer1Timer(MainForm.webTimer1);
            MainForm.SrediFormu;
        End
        else ShowMessage('Nema odabranih podataka za obradu!');
    end
    else if key=VK_F11 then
    begin
        Application.CreateForm(TFUkupnoFilm, FUkupnoFilm);
        FUkupnoFilm.ShowD(qDetVracanja.FieldByName('sifrakazete').AsInteger);
    end
    else if key=VK_DELETE then
    begin
      if MessageDlg('Da li ste sigurni da želite obrisati naruèene filmove?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
        if DBGrid2.SelectedList.Count>0 then
        begin
            upit_rez:='UPDATE pos SET vracanje=''N'' WHERE sifranebitna IN (';
            qDetVracanja.DisableControls;
            for i:= 0 to DBGrid2.SelectedList.Count-1 do
            begin
                qDetVracanja.GotoBookmark(DBGrid2.SelectedList.items[i]);
                upit_rez:=upit_rez+qDetVracanja.FieldByName('sifranebitna').AsString+', ';
            end;
            Delete(upit_rez, length(upit_rez)-1, 2);
            upit_rez:=upit_rez+')';
            try
                ShareUnit.UpitOpen(Podaci.myQuery1, upit_rez, True, False);
            except on E: Exception do
            begin
                Logiraj(Podaci.myQuery1.Name+'::Error - TPregNarucenih.DBGrid2KeyUp: '+E.Message, True);
            end;
            end;
            MainForm.webTimer1Timer(MainForm.webTimer1);
        End
        else ShowMessage('Nema odabranih podataka za obradu!');

        qDetVracanja.Close;
        DBGrid1.UnselectAll;
        qDetVracanja.Open;
        qDetVracanja.EnableControls;
      end;
    end;
end;
(*
oznaka za rezervaciju               - X
oznaka za rezervaciju s dostavom    - D

oznaka za zadužene rezervacije      - Y
oznaka za zadužene dostave          - S

oznaka za isporuèenu rezervaciju    - Z   ???

oznaka za brisanje                  - B
*)

procedure TFNaruceni.Printaj(Sender: TObject);
begin
    case (sender as TBitBtn).Tag of
    1: Podaci.DataSet2HTML(DataSource1);
    2: Podaci.DataSet2HTML(DataSource2);
    end;
end;

end.
