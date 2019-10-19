unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DB, DBTables, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Tabnotbk, RxDBComb, RXLookup,
  RXShell, AppEvent, Placemnt, BDEUtils, RXCtrls, ImgList, lmdctrl,
  lmdeditb, lmdeditc, LMDEdit, lmdclass, lmdnwgui, lmdextcS, lmdstdcS,
  lmdnonvS, ZipMstr, FileCtrl, FileUtil, Wwintl, lmdcompo, lmdcctrl,
  LMDOneInstance, LMDCustomComponent, LMDGlobalHotKey, LMDInformationLabel,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomStatusBar, LMDStatusBar, StrUtils,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDStaticText,
  LMDBaseGraphicButton, LMDCustomShapeButton, LMDShapeButton,
  LMDContainerComponent, LMDBaseDialog, LMDAboutDlg, LMDDirDlg,
  MySQLDataset, dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib, dxDBEdtr,
  Buttons, DateUtils, WebClass, UpitThreaded, LMDCustomScrollBox,
  LMDScrollBox ;

type
  TMainForm = class(TForm)
    CoolBar2: TCoolBar;
    CoolBar1: TCoolBar;
    PopupMenu1: TPopupMenu;
    MENI: TMenuItem;
    Podaciofilmovima1: TMenuItem;
    N2: TMenuItem;
    Postavljanjeparametara1: TMenuItem;
    Cijene1: TMenuItem;
    Postavkeprograma1: TMenuItem;
    Katalogizlistanje1: TMenuItem;
    Obradaposlovanja1: TMenuItem;
    N4: TMenuItem;
    Raznipregledi1: TMenuItem;
    Podacioradnicima1: TMenuItem;
    Izlazizprograma2: TMenuItem;
    Ostalipodaci1: TMenuItem;
    Podaciodobavljaima1: TMenuItem;
    Podacioglumcima1: TMenuItem;
    Podacioreiserima1: TMenuItem;
    Podaciovrstamafilmova1: TMenuItem;
    Podaciodravamaproiz1: TMenuItem;
    Filmovaudugu1: TMenuItem;
    Rauna1: TMenuItem;
    Toplistafilmova1: TMenuItem;
    Saldalanova1: TMenuItem;
    Dnevnoposlovanje1: TMenuItem;
    Periodinoposlovanje1: TMenuItem;
    Neznam1: TMenuItem;
    Pravapristupa1: TMenuItem;
    LMDStatusBar1: TLMDStatusBar;
    LMDInformationLabel2: TLMDInformationLabel;
    LMDSimpleLabel3: TLMDSimpleLabel;
    CoolBar3: TCoolBar;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    Kodkogaj1: TMenuItem;
    Pomoneopcije1: TMenuItem;
    Rezervnakopijabaza1: TMenuItem;
    ZAKLJUIdananjidan1: TMenuItem;
    N1: TMenuItem;
    Jednostavnaizlistanja1: TMenuItem;
    Jednostavnoizdanekazete1: TMenuItem;
    Izlistanjezainventuru1: TMenuItem;
    fdgdf1: TMenuItem;
    Orbisanifilmoviuperiodu1: TMenuItem;
    Promjenaprijavljenogdjel1: TMenuItem;
    N3: TMenuItem;
    Ispravaktekstaugovora1: TMenuItem;
    LMDSimpleLabel4: TLMDSimpleLabel;
    NapravilanovimainfoID1: TMenuItem;
    lanovikojimasuisteklelanarine1: TMenuItem;
    Edit: TEdit;
    ZipMaster1: TZipMaster;
    Svakodnevnanadisk1: TMenuItem;
    Periodinanadiskete1: TMenuItem;
    N11: TMenuItem;
    kopijabazeRacuniXnadisk1: TMenuItem;
    kopijabazeRacuniXnadiskete1: TMenuItem;
    Pregledraunaodlanarina1: TMenuItem;
    PripremabazazaWWWstranice1: TMenuItem;
    N12: TMenuItem;
    SVEPOSUDBELANA2: TMenuItem;
    Prebacivanjepodataka1: TMenuItem;
    Izvozpodatakanadisketu1: TMenuItem;
    Primanjepodatakasadiskete1: TMenuItem;
    Pregledraodlanarinapolanu1: TMenuItem;
    Pregledizlistanjeraunatraipobroju1: TMenuItem;
    N15: TMenuItem;
    Crnalistalanova1: TMenuItem;
    N16: TMenuItem;
    Stornorauna1: TMenuItem;
    Usaglasibazekazete1: TMenuItem;
    Naplatidugovanje1: TMenuItem;
    Vrstelanstva1: TMenuItem;
    Vrstepologa1: TMenuItem;
    Vrstemedija1: TMenuItem;
    Naprednipregledi1: TMenuItem;
    lanova1: TMenuItem;
    Filmova1: TMenuItem;
    Pregledrauna1: TMenuItem;
    N17: TMenuItem;
    Pregledraunaodplaanapougovoru1: TMenuItem;
    N5: TMenuItem;
    Pregledraoduplatapougovorupolanu1: TMenuItem;
    N9: TMenuItem;
    lanstvopougovoru1: TMenuItem;
    Statuslana1: TMenuItem;
    N14: TMenuItem;
    Zadnjeizdavanjekazete1: TMenuItem;
    Zadnjaposudbalana1: TMenuItem;
    Statusfilma1: TMenuItem;
    LMDStaticText16: TLMDStaticText;
    LMDStaticText2: TLMDStaticText;
    LMDStaticText4: TLMDStaticText;
    LMDStaticText3: TLMDStaticText;
    LMDStaticText8: TLMDStaticText;
    LMDStaticText5: TLMDStaticText;
    LMDStaticText6: TLMDStaticText;
    LMDStaticText7: TLMDStaticText;
    LMDStaticText9: TLMDStaticText;
    Nap1: TLMDStaticText;
    Nap2: TLMDStaticText;
    Oprogramu1: TMenuItem;
    Registracijaprograma1: TMenuItem;
    N6: TMenuItem;
    Crneliste1: TMenuItem;
    N7: TMenuItem;
    Pregledpotvrdepobroju1: TMenuItem;
    Pregledpotvrdastornozaduenja1: TMenuItem;
    LMDDirDlg1: TLMDDirDlg;
    OpenDialog1: TOpenDialog;
    N8: TMenuItem;
    NEDIRAJ1: TMenuItem;
    Izradanaljepnica1: TMenuItem;
    Naknadnozakljuidanunazad1: TMenuItem;
    DajPosudbu: TMySQLQuery;
    PrebaciClana: TButton;
    PrebaciFilm: TButton;
    dsSetup: TDataSource;
    SetUp: TMySQLTable;
    dizajnizvjetaja1: TMenuItem;
    Zakljuisveklubove1: TMenuItem;
    webTimer1: TTimer;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    dajNarucene: TMySQLQuery;
    Label6: TLabel;
    Sveposudbefilmakarticafilma1: TMenuItem;
    Pregledizdanihfilmova1: TMenuItem;
    Dizajnreporta2: TMenuItem;
    dajVracanje: TMySQLQuery;
    ZvjezdicaT: TTimer;
    HotKey1: TLMDGlobalHotKey;
    Pregledizdanihpodjelatniku1: TMenuItem;
    Dizajnreporta3: TMenuItem;
    Pregledposlovanjazaodreeniperiod1: TMenuItem;
    poklubu1: TMenuItem;
    podatumu1: TMenuItem;
    poklubu2: TMenuItem;
    podatumu2: TMenuItem;
    LMDSimpleLabel1: TLMDSimpleLabel;
    BitRez: TBitBtn;
    BitWish: TBitBtn;
    dajWListu: TMySQLQuery;
    Kazete21: TMenuItem;
    dajRezervacije: TMySQLQuery;
    Nainkontaktiranja1: TMenuItem;
    Blagdani1: TMenuItem;
    lanovibezuplatapougovoruperiod1: TMenuItem;
    NapLOG: TLMDStaticText;
    Keywordova1: TMenuItem;
    oplistaanrova1: TMenuItem;
    Daniposudbepoiznosu1: TMenuItem;
    Vrsteplaanja1: TMenuItem;
    Pregledposlovanjazaodreeniperiod2: TMenuItem;
    podatumu3: TMenuItem;
    poklubu3: TMenuItem;
    Dizajnreporta1: TMenuItem;
    podatumu4: TMenuItem;
    poklubu4: TMenuItem;
    procedure Izlazizprograma1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure ShowNapomene;
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure MENIClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ZipMaster1Message(Sender: TObject; ErrCode: Integer;
      Message: String);
    procedure LMDStaticText2MouseExit(Sender: TObject);
    procedure LMDStaticText2MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Nap1DblClick(Sender: TObject);
    procedure Nap2DblClick(Sender: TObject);
    procedure KopijaBaza(koja:Integer;Pitaj,RacuniX:Boolean);
    procedure IspraviMatClan;
    procedure IspraviZaduzenja;
    procedure IspraviPosudbu;
    procedure PodesiEAN;
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure PrebaciClanaClick(Sender: TObject);
    procedure PrebaciFilmClick(Sender: TObject);
    procedure webTimer1Timer(Sender: TObject);
    procedure xZaduzi(Sender: TObject);
    procedure onZvjezdica(Sender: TObject);
    procedure HotKey1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InitLow;
    procedure BitRezClick(Sender: TObject);
    procedure DajWishListe(Sender: TObject);
    procedure PojacajButton(koliko: Integer; Button: TBitBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NapLOGDblClick(Sender: TObject);

    function TraziClana_PoBarkodu(barkod:String):boolean;
    function TraziClana_PoSifri(barkod:String):boolean;
    function TraziFilm_BarkodUPosudjenima(barkod:String):boolean;
  private
    { Private declarations }
    ukbaza:integer;

    procedure testdatoteka;
    procedure StisnutEnter;
    procedure Poruka;
    Procedure IzaberiClana;
    procedure PregledDug(Koji:integer);
//    procedure ScanDiskPrg(Koji:integer);
    procedure IspUgovora;
    Procedure PromjenaDjelatnika;
    procedure ZatvoriOtvori;
    procedure ZaInternet;
    procedure NapraviBazu(imedatoteke:String; vSql:TStrings);
    procedure SlanjePrimanje(Koje:Integer);
//    procedure Arhiviraj;
//    procedure DeArhiviraj;
    procedure UcitajNapomene(koja:TLMDStaticText);

  public
    { Public declarations }
    TotalSize1, TotalProgress1, TotalSize2, TotalProgress2: Int64;

    MojThread1Aktivan, MojThreadUpitAktivan: Boolean;
    MojThread1: TIzracunajWeb;
    MojUpit: ThreadUpitClass;

    procedure SrediFormu;
  end;

  function PristupOpciji(TagOpcije:Integer): Boolean;

var
  MainForm: TMainForm;
  BrojNarudzbi, BrojRezervacija, BrojWishLista: Integer;

implementation
uses BazeModul, AppUtils,  Kartica, UnosTemplate, UnosRadnici, Servisi,
     PostavkeDlg, Provjera, Pristup, CijeneDlg, UnosClanovi, Unoskazete, UnosZanrovi,
     UnosReziseri,UnosDobavljaci, UnosGlumci, UnosDrzave, ClanoviDlg, FilmoviDlg,
     KodKojihJEDlg, RadOperateraDlg, PrintUdugu, BrdanaDlg, PrintOpomene,
     PregledSaldoDlg, PrintJednostavnoSVI, PrintJednostavnoIzda, PrintInventura,
     KatalogDlg, BarcodedLG, Lozinka, PregledIstekle, MsgUnit, UnosCrneListe,
     PregSvePosudbeDlg2, DateUtil, IzvozDlg, ImportDlg, PregClanarineClanDlg,
     CrnaListaDlg, PregNapomene1, UnosMediji, UnosVrstePologa, UnosVrstveClanstva,
     PrijaveGRID, UnosStatusCla, UnosStatusFil, LMDCPGet, AbaoutDlg, Odabir_BC4Prt,
     DLG_OdabirDatuma, Share, FilmUkupno, MySQLServer, PojamUnit, IzvjestajTM,
     PregNarucenih, PregSvePosudbeDlg, DLG_Klub, UnosbarCode, PregRezerviranih,
     PregWishLista, UnosBlagdana, UnosNacinaKontakta, PregledDLG, UnosVrstaPlacanja;

{$R *.DFM}

procedure TMainForm.Izlazizprograma1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  LMDSimpleLabel4.Caption := '  ';

  CurrencyString:='';
  NegCurrFormat:=2;
  ThousandSeparator:=',';
  DecimalSeparator:='.';
  CurrencyDecimals:=2;
  DateSeparator:='.';
  ShortDateFormat:='dd.mm.yyyy';
  TimeSeparator:=':';
  BrojNarudzbi:=0;
  BrojRezervacija:=0;
  BrojWishLista:=0;
  MojThread1Aktivan := false;
  MojThreadUpitAktivan:= False;

  if frizerski then
  begin
    Application.Title:='Frizer 2kX';
    LMDStaticText16.Caption:=Application.Title;
    LMDStaticText2.Caption:=' Podaci o klijentima';
    LMDStaticText4.Caption:=' Podaci o uslugama';
    LMDStaticText5.Visible:=False;      // Katalog filmova
    CoolBar1.Bands[1].Visible:=False;   // "Nema narudžbi"
    CoolBar1.Bands[3].Visible:=False;   // "Nema filmova za wish listu"
    webTimer1.Enabled:=False;
  end;

  // MySQL DateFormat - SELECT DATE_FORMAT(datum_field, '%e.%c.%Y %h:%m')
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//Var k:string;
//    das:TDateTime;
begin
  CanClose := False;
  if Confirm('Da li stvarno želite želite izaæi iz programa?') then
    if FKartica.TabCon.Tabs.Count > 0 then MessageDlg('Ima otvorenih kartica zaduženja!!!', mtWarning, [mbOk], 0)
    Else if KojiStroj = 0 then
    begin
         if Confirm('Da li želite ZAKLJUÈITI DNEVNO POSLOVANJE?') then Podaci.Zakljuci(Date, SifraKluba, True);

//         das := Podaci.TabSetUp.FieldByName('ZadnjiputSnimano').AsDateTime;
         Podaci.myDB.Close;

(*         if not MySQL then // stari backup
         begin
           if time > StrToTime('19:50:00') then
           begin
             //utorak, èetvrtak, subota SCAN DISK
            if not xp then
             if (DayOfWeek(date) = 3) or (DayOfWeek(date) = 5) or (DayOfWeek(date) = 7) then
             begin
               ExecWait(Format('%s %s /n',[k, copy(Application.ExeName,1,2)]));
             End;

             // subotom napravi kontrolu baza
             if DayOfWeek(date) = 7 then begin
//                ExecWait(Format('%s -R1 "/A%s" "/P%s"',[ExtractFilePath(Application.ExeName)+'Pdxrbld.exe', Podaci.DatabaseMaster.Aliasname,Lowercase(chr(90)+chr(77)+chr(77)+chr(79)+chr(75)+chr(73))]));
             End;

{             //ako je prošlo 2 dana od snimanja snimi sam
             if (date - das) > 1 then
             begin
                 MessageDlg('Rezervna kopija baza podataka nije napravljena više od 2 dana !'+#13+#13+
                            'Program æe je automatski napraviti SVAKODNEVNU na disku.', mtWarning, [mbOk], 0);
                 KopijaBaza(131,False,False);
             End; }
           End;
           CanClose := True;
         end;*)
         CanClose := True;
    End
    Else CanClose := True;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
    Screen.OnActiveFormChange := nil;

    Logiraj('__ Start TMainForm.FormDestroy - '+BoolToStr(MainForm.MojThread1Aktivan, True)+' '+DateTimeToStr(Now), True);
    if (MainForm.MojThread1 <> nil) and (MainForm.MojThread1Aktivan = true) then   // provjera da neradi Thread za web statistiku
    begin
        Cursor:=crSQLWait;
        MainForm.MojThread1.Terminate;    // pa ga onda ubi
        MainForm.MojThread1.WaitFor;      // wait for it to terminate
    end;
    Logiraj('__ Kraj TMainForm.FormDestroy - '+BoolToStr(MainForm.MojThread1Aktivan, True)+' '+DateTimeToStr(Now), True);
end;

procedure TMainForm.ShowNapomene;
begin
    Edit.visible := (not NemaGa);
    LMDStaticText9.Caption := Klub;

    if poruke then
    begin
        Podaci.tPoruke.Open;
        Podaci.tPoruke.Filter:='sifra_kluba=0';
        Nap1.Caption:=Podaci.tPoruke.Fields[1].AsString;
        Podaci.tPoruke.Filter:='sifra_kluba='+IntToStr(Napomena2Klub);
        Nap2.Caption:=Podaci.tPoruke.Fields[1].AsString;
    end
    else
    begin
        UcitajNapomene(Nap1);
        UcitajNapomene(Nap2);
    end;

    // Uèitaj Podsjetnik
    if logiraj_napomene then
    begin
        UcitajNapomene(NapLOG);
        NapLOG.Visible:=True;
    end else
        NapLOG.Visible:=False;
end;

procedure TMainForm.testdatoteka;
begin
    if MessageDlg('VAŽNA NAPOMENA !!!'+#13+
              'Kod ove opcije svi korisnici na mreži (ako ih ima) trebaju izaæi iz programa '+Podaci.NazivPrograma+'.'+#13+#13+
              'Da li želite nastaviti?', mtConfirmation, [mbYes,mbCancel], 0) = mrYes then
end;

(*
procedure TMainForm.ScanDiskPrg(Koji:integer);
Var k:String;
begin
  if xp then exit;
  case koji of
        1: k := Podaci.TabSetUp.FieldByName('PathScanDisk').asstring;
        2: k := Podaci.TabSetUp.FieldByName('PathDefrag').asstring;
        3: k := Podaci.TabSetUp.FieldByName('PathSpeedisk').asstring;
  End;
  if FileExists(k) then begin
    if PorukaIzlaz then
    begin
      if koji = 1 then FileExecute(k, copy(Application.ExeName,1,2)+' /n', ExtractFilePath(k), esNormal)
      Else FileExecute(k, copy(Application.ExeName,1,2), ExtractFilePath(k), esNormal);
      Application.Terminate;
    End
  End
  Else MessageDlg('Nepostoji '+k+'. Provjerite u postavkama programa !', mtError, [mbOk], 0)
end; *)

procedure TMainForm.IspUgovora;
begin
    if FileExecute('NOTEPAD.EXE', 'Ugovor.txt', ExtractFilePath(Application.ExeName), esNormal) <= 32
        then MessageDlg('Nepostoji Notepad.exe !!!', mtError, [mbOk], 0);
end;

function PristupOpciji(TagOpcije:Integer): Boolean;
begin
  if Podaci.TabPristup.Locate('Tag',TagOpcije,[]) then
  Begin
    if Podaci.TabPristup.FieldByName('SamoVlasnik').asString = 'D' then
    begin
      Result := (ProvjeraDlg.Showmodal = MrOk);
    End
    Else Result := True
  End
  Else Result := True;
end;

procedure TMainForm.MENIClick(Sender: TObject);
Var tagg, i:Integer;
begin
 tagg:=0;

 if Sender.ClassName = 'TMenuItem' then Tagg := (Sender as TMenuItem).Tag
 else if Sender.ClassName = 'TToolButton' then Tagg := (Sender as TToolButton).Tag
 else if Sender.ClassName = 'TLMDStaticText' then Tagg := (Sender as TLMDStaticText).Tag;

 If PristupOpciji(Tagg) then
  Case Tagg of
     1: begin
          BioUnosClana:=0;
          ShowDialog(TFUnosClanova);
          if BioUnosClana>0 then
          begin
                FKartica.ShowM(BioUnosClana, 0);
                FKartica.ShowModal;
          end;
        End;
     2: ShowDialog(TFUnosKazete);
     3: ShowDialog(TFUnosRadnici);
    41: ShowDialog(TFUnosVrste);
    42: ShowDialog(TFUnosDobavljaci);
    43: ShowDialog(TFUnosGlumci);
    44: ShowDialog(TFUnosreziseri);
    45: ShowDialog(TFUnosDrzave);
    46: ShowDialog(TFUnosVrstveClanstva);
    47: ShowDialog(TFUnosVrstePologa);
    48: ShowDialog(TFUnosMediji);
    49: ShowDialog(TFUnosStatusCla);
    50: ShowDialog(TFUnosStatusFil);
    54: ShowDialog(TFUnosVrstaPlacanja);

    57: ShowDialog(TFUnosKontaktiranja); // naèin kontaktiranja èlana

    56: ShowDialog(TFUnosBlagdana); // Šifrarnik blagdana

   145: begin
          Application.CreateForm(TFUnosCrneListe, FUnosCrneListe);
          ShowDialog(TFUnosCrneListe);
        end;

    51: begin
          Application.CreateForm(TFCijeneDlg,FCijeneDlg);
          ShowDialog(TFCijeneDlg);
        end;

    52: ShowDialog(TFPostavkeDlg);  // Postavke programa
    53: ShowDialog(TFPristupDlg);
    55: IspUgovora;
    13: Close;

   107: Podaci.Pregled(2);   //racuni
   144: Podaci.Pregled(3);   //racuni traži po broju
   109: Podaci.PregledPotvrda(1);
   112: Podaci.PregledPotvrda(2);

   115: Podaci.PregRacClanarine(2);  //  Pregled raèuna od èlanarina
   146: Podaci.PregRacClanarine(5);   //  Pregled raèuna od plaèanja po ugovoru
   148: Podaci.PregRacClanarine(6);   //  Pregled raèuna od plaèanja po ugovoru

   143: begin
          Application.CreateForm(TFPregClanarineClanDlg,FPregClanarineClanDlg);
          FPregClanarineClanDlg.NapraviPregled(2, 0);
        end;   //  Pregled raè. od èlanarina po èlanu

   147: begin
          Application.CreateForm(TFPregClanarineClanDlg,FPregClanarineClanDlg);
          FPregClanarineClanDlg.NapraviPregled(5, 0);
        end;   //  Pregled raè. od uplata po ugovoru po èlanu

   111: ShowDialog(TFKodKojihJEDlg);
   130: testdatoteka;

   131: KopijaBaza(131,true,false);
   139: KopijaBaza(139,true,false);
   140: if confirm('Da li stvarno želite pripremiti podatke za WWW stranice?')
            then zainternet;

   801: KopijaBaza(131,true,true);
   802: KopijaBaza(139,true,true);

    71: Podaci.IspisZaklj(0);

    77: if DajDatum.ShowModal=mrOk then
        begin
            ShareUnit.UpitOpen(Podaci.myQuery2, 'SELECT sifrakluba FROM setup WHERE sifrakluba>0', True, True);
            with Podaci.myQuery2 do
            begin
                if not IsEmpty then
                begin
                    i:=0;
                    Label6.Caption:='./.';
                    Label6.Visible:=True;
                    First;
                    While not Eof do
                    Begin
                        Label6.Caption:=Inttostr(i)+'/'+Inttostr(RecordCount);
                        Label6.Refresh;
                        i:=i+1;
                        Podaci.Zakljuci(DajDatum.DatumOd.Date, FieldByName('sifrakluba').AsInteger, False);
                        Next;
                    end;
                    Label6.Visible:=False;
                end;
            end;
        end;
    78: if DajDatum.ShowModal=mrOk then Podaci.Zakljuci(DajDatum.DatumOd.Date, SifraKluba, False);
    79: Podaci.Zakljuci(Date, SifraKluba, True);

    72: Podaci.IspisPoslovanje(0); // Ispis po datumu
   721: Podaci.IspisPoslovanje(2); // Ispis po klubu
    73: Podaci.IspisPoslovanje(1); // Dizajn po datumu
   731: Podaci.IspisPoslovanje(3); // Dizajn po klubu

    82: Podaci.IspisPlacanja(0); // Ispis po datumu
   821: Podaci.IspisPlacanja(2); // Ispis po klubu
    83: Podaci.IspisPlacanja(1); // Dizajn po datumu
   831: Podaci.IspisPlacanja(3); // Dizajn po klubu

    74: Podaci.IzdanoPoKlubu(0); // Ispis
    75: Podaci.IzdanoPoKlubu(1); // Dizajn

    80: Podaci.IzdanoPoDjelatniku(0); // Ispis
    81: Podaci.IzdanoPoDjelatniku(1); // Dizajn

     8:
     begin
        FPregledDLG.Kuda.Visible:=False;
        FPregledDLG.CheckBox1.Visible:=False;
        FPregledDLG.CheckBox2.Visible:=False;

        if FPregledDLG.ShowMpre('Odaberite period') = mrOK then ShowDialog(TFRadOperateraDlg);

        FPregledDLG.Kuda.Visible:=True;
        FPregledDLG.CheckBox1.Visible:=True;
        FPregledDLG.CheckBox2.Visible:=True;
     End;

     9: PromjenaDjelatnika;

   101: PregledDug(0); // Ispis
   102: PregledDug(1); // Dizajn

   110: ShowDialog(TFPregledSaldoDlg);

   151: Begin // kartica èlana
            Application.CreateForm(TFPregSvePosudbeDlg2, FPregSvePosudbeDlg2);
            FPregSvePosudbeDlg2.DoMagic(0);
        end;

   153: Begin // kartica filma
            Application.CreateForm(TFPregSvePosudbeDlg, FPregSvePosudbeDlg);
            FPregSvePosudbeDlg.DoMagic(0);
        end;

   108: Podaci.TopFilmovi;

   113: Podaci.PregledObrisani;
   114: ShowDialog(TFPregledIstekle);

   117: Podaci.StornoRacuna;
   118: Podaci.Usaglasi; // ponovo izraèunaj BrKazeta

   119: Podaci.NaplatiDugovanje('1');
//   120: Podaci.ProvDB(true); // Provjeri strukture baza sa DBS datotekom tj. obriši u registry KEY i izaði iz programa

   152: ShowDialog(TOdabir_BC); // Izrada barkodova

    61: ShowDialog(TFKatalogDlg);

   137: if confirm('Da li stvarno želite napraviti svim èlanovima ID za info box?') then Podaci.NapraviID;
   138: ;//KontrolaBaza;

   141: if confirm('Da li stvarno želite izvesti podatke?') then SlanjePrimanje(1);
   142: if confirm('Da li stvarno želite primiti podatke?') then SlanjePrimanje(2);

   400: ShowDialog(TFAbaoutDlg);
//   401: ShowDialog(TFRegDlg);

   402: begin
        end;

    62: begin
          Application.CreateForm(TFPrintJednostavnoSVI,FPrintJednostavnoSVI);
          Try
            FPrintJednostavnoSVI.preview
          Finally
            FPrintJednostavnoSVI.Destroy;
          End;
        End;
    63: begin
          Application.CreateForm(TFPrintJednostavnoIzda,FPrintJednostavnoIzda);
          Try
            FPrintJednostavnoIzda.preview
          Finally
            FPrintJednostavnoIzda.Destroy;
          End;
        End;
    64: begin
          Application.CreateForm(TFPrintInventura,FPrintInventura);
          Try
            FPrintInventura.Query1.MacroByName('KLUB').AsString:=IntToStr(SifraKluba);
            FPrintInventura.Query1.Open;
            FPrintInventura.Preview;
          Finally
            FPrintInventura.Destroy;
          End;
        End;

       300: begin
              Application.CreateForm(TFPrijaveGRID,FPrijaveGRID);
              FPrijaveGRID.StartPregled('Pregled - Èlanova',1);
            End;

       301: begin
              Application.CreateForm(TFPrijaveGRID,FPrijaveGRID);
              FPrijaveGRID.StartPregled('Pregled - Filmova',2);
            End;

       302: begin
              Application.CreateForm(TFPrijaveGRID,FPrijaveGRID);
              FPrijaveGRID.StartPregled('Pregled - Èlanova po ugovoru',3);
            End;

       303: begin
              Application.CreateForm(TFPrijaveGRID,FPrijaveGRID);
              FPrijaveGRID.StartPregled('Zadnje izdavanje kazete',4);
            End;

       304: begin
              Application.CreateForm(TFPrijaveGRID,FPrijaveGRID);
              FPrijaveGRID.StartPregled('Zadnja posudba èlana',5);
            End;

       305: begin
              Application.CreateForm(TFPrijaveGRID,FPrijaveGRID);
              FPrijaveGRID.StartPregled('Crna lista',6);
            End;

       306: begin
              Application.CreateForm(TFPrijaveGRID,FPrijaveGRID);
              FPrijaveGRID.StartPregled('Kazeta > 2',7);
            End;

       307: begin
              Application.CreateForm(TFPrijaveGRID,FPrijaveGRID);
              FPrijaveGRID.StartPregled('Pregled - Keyword-ova',8);
            End;

       308: begin
              Application.CreateForm(TFPrijaveGRID,FPrijaveGRID);
              FPrijaveGRID.StartPregled('Top lista po žanrovima',9);
            End;

       309: begin
                FPregledDLG.Kuda.Visible:=False;
                FPregledDLG.CheckBox1.Visible:=False;
                FPregledDLG.CheckBox2.Visible:=False;

                if FPregledDLG.ShowMpre('Odaberite period') = mrOK then
                begin
                    Application.CreateForm(TFPrijaveGRID,FPrijaveGRID);
                    FPrijaveGRID.StartPregled('Izdano dana po iznosu (period)',10);
                end;

                FPregledDLG.Kuda.Visible:=True;
                FPregledDLG.CheckBox1.Visible:=True;
                FPregledDLG.CheckBox2.Visible:=True;
            End;

       998: ;// rezervirano za provjeru prava kod ispravka djelatnikID na raèunima - TFPregRacunaCla.DBGrid1KeyUp

       999: begin
               if Confirm('Da li želite ispraviti matièni klub èlanova?') then IspraviMatClan;
//               if Confirm('Da li želite popraviti tablicu BARKODOVA sa izdanim filmovima?') then IspraviZaduzenja;
//               if Confirm('Da li želite popraviti zadnju posudbu èlanova?') then IspraviPosudbu;
//               if Confirm('Da li želite popraviti EAN8 check digit?') then PodesiEAN;
            end;

  End;
 FormActivate(Sender);
end;

procedure TMainForm.IspraviPosudbu;
var biofilter: boolean;
     komada, sada: Integer;
begin
   Label6.Visible:=True;
   with Podaci.TClanovi do
   begin
     DisableControls;
     biofilter:=Filtered;
     Filtered:=False;

     First;
     sada:=1;
     komada:=RecordCount;
     while not eof do
     begin
          Label6.Caption:=IntToStr(sada)+'/'+IntToStr(komada);
          Label6.Refresh;
          DajPosudbu.ParamByName('sifra').Value:=FieldByName('sifra').Value;
          DajPosudbu.Open;
          if not DajPosudbu.IsEmpty then
          begin
               Edit;
               FieldByName('ZadnjaPosudba').Value:=DajPosudbu.FieldByName('ZadnjaPosudba').Value;
               Post;
          end;
          DajPosudbu.Close;
          Next;
          sada:=sada+1;
     end;

     Filtered:=biofilter;
     EnableControls;
   end;
   Label6.Visible:=False;
end;

procedure TMainForm.IspraviMatClan;
var sada, komada: integer;
begin
    ShareUnit.UpitOpen(Podaci.myQuery2,  // Daj sve sifre clanova
    ' SELECT sifra, klubupisa FROM clanovi'
    , False, True);

    Label6.Visible:=True;
    sada:=1;
    komada:=Podaci.myQuery2.RecordCount;

    Podaci.myQuery2.First;
    while not Podaci.myQuery2.Eof do
    begin
        Label6.Caption:=IntToStr(sada)+'/'+IntToStr(komada);
        Label6.Refresh;

        ShareUnit.UpitOpen(Podaci.myQuery1,  // gdje se najviše posuðuje
        ' SELECT k.sifrakluba, COUNT(sifrakluba)'+
        ' FROM koi k'+
        ' WHERE k.sifraclana='+Podaci.myQuery2.FieldByName('sifra').AsString+
        ' GROUP BY k.sifrakluba'+
        ' ORDER BY 2 DESC'+
        ' LIMIT 1', False, True);

        if not Podaci.myQuery1.IsEmpty then
        begin
            Podaci.myQuery2.Edit; // ispravi matièni klub
            Podaci.myQuery2.FieldByName('klubupisa').AsInteger:=Podaci.myQuery1.FieldByName('sifrakluba').AsInteger;
            Podaci.myQuery2.Post;
        end;
        Podaci.myQuery2.Next;
        sada:=sada+1;
    end;
    Label6.Visible:=False;
end;

procedure TMainForm.IspraviZaduzenja;
var i: String;
begin
    ShareUnit.UpitOpen(Podaci.myQuery1,  // oznaæi sve koji nisu posuðeni
    ' UPDATE bcodekazete SET izdano=''N'''+
    ' WHERE BarCode NOT IN (SELECT bcodekaz FROM pos)'+
    ' AND sifra_videokluba='+IntToStr(SifraKluba), True, False);

    ShareUnit.UpitOpen(Podaci.myQuery1,  // oznaæi sve koji su posuðeni
    ' UPDATE bcodekazete, pos SET bcodekazete.izdano=''D'''+
    ' WHERE bcodekazete.BarCode=pos.bcodekaz'+
    ' AND sifra_videokluba='+IntToStr(SifraKluba), True, False);

    ShareUnit.UpitOpen(Podaci.myQuery1,  // daj sve iz Pos a da nema u Barkod
    ' SELECT sifrakazete, bcodekaz FROM pos'+
    ' WHERE BCodeKaz NOT IN (SELECT BarCode FROM bcodekazete)'+
    ' AND SifraKluba='+IntToStr(SifraKluba), False, True);

    with Podaci.myQuery1 do
    begin
        if RecordCount>0 then
        begin
            i:='';
            First;
            while not Eof do
            Begin
                i:=i+#13+Fields[0].AsString+'-'+Fields[1].AsString;
                Next;
            end;
            ShowMessage('Barkodovi koji nepostoje u tablici barkodova:'+i);
        end;
    end;
end;

procedure TMainForm.PodesiEAN;
var biofilter: boolean;
     komada, sada: Integer;
begin       // preði cijelu barkod tablicu i dodaj ean8 check digit na kraj
   with Podaci.TBarcode do
   begin
     DisableControls;
     biofilter:=Filtered;
     Filtered:=False;

     First;
     sada:=1;
     komada:=RecordCount;
     while not eof do
     begin
          Label6.Caption:=IntToStr(sada)+'/'+IntToStr(komada);
          Label6.Refresh;
          Edit;
          FieldByName('barcode').asString:=FieldByName('barcode').asString+ShareUnit.EAN8Check(FieldByName('barcode').asString);
          Post;
          Next;
          sada:=sada+1;
     end;

     Filtered:=biofilter;
     EnableControls;
   end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
    SrediFormu;
    ShowNapomene;
end;

procedure TMainForm.Poruka;
Begin
    MessageDlg('Podatak kojeg ste upisali NE POSTOJI!!!', mtWarning, [mbOk], 0);
    Edit.Text := '';
End;

procedure TMainForm.SrediFormu;
Begin
  MainForm.Edit.Text := '';
  IF MainForm.Edit.Visible then
      MainForm.Edit.SetFocus;
  Panel2.Caption := 'Otvoreno '+IntToStr(FKartica.TabCon.Tabs.Count)+' kartica zaduženja.'
End;

//******************************************************************************************
procedure TMainForm.EditKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then
  Begin
    if Edit.Text = '+' then ZatvoriOtvori
    else if (copy(Edit.Text,1,1) = '*') and (copy(Edit.Text,2,1) <> '*') then
    Begin
           Application.CreateForm(TFFilmoviDlg,FFilmoviDlg);
           FFilmoviDlg.ShowD(copy(Edit.Text, 2, length(Edit.Text)-1), 'NAZIV', True);
           SrediFormu;
    End
    else if copy(Edit.Text,1,2) = '**' then
    Begin
           Application.CreateForm(TFFilmoviDlg,FFilmoviDlg);
           FFilmoviDlg.ShowD(copy(Edit.Text, 3, length(Edit.Text)-1), 'ORGINALNAZIV', True);
           SrediFormu;
    End
    Else StisnutEnter;
  End
  Else
  if (key = #32) and (Edit.Text = '') and (FKartica.TabCon.Tabs.Count > 0) then
  begin
    FKartica.ShowM(-1,0);
    FKartica.ShowModal;
    key := #0;
    SrediFormu;
  End;
end;

procedure TMainForm.StisnutEnter;     // ako je pritisnut ENTER
Begin
    if Edit.Text = '' then
    begin
        SetCursorPos(110,110);
        PopUpMenu1.PopUp(100,100);  // ako je prazan pozovi meni
        SetCursorPos(80,110);
    End
    Else
    if SveBrojevi(Edit.Text) or SveBrojevi2(Edit.Text) then
    begin
        if TraziClana_PoBarkodu(Edit.Text) then             // 1. traži po èlanovima
        Else
        if TraziFilm_BarkodUPosudjenima(Edit.Text) then     // 2. zatim po posuðenim filmovima
        else
        // ako je dužina manja od minimalne dužine barkoda
        if length(Edit.Text) < Podaci.TabSetUp.FieldByName('MinDuzBcode').AsInteger then
        begin
            if TraziClana_PoSifri(Edit.Text) then           // onda nije sigurno BarCode u pitanju
            Else
                Beep;
        end;
    end
    else
        IzaberiClana;

    SrediFormu;
End;

Procedure TMainForm.IzaberiClana;
Begin
  Application.CreateForm(TFClanoviDlg, FClanoviDlg);
  FClanoviDlg.ShowD(Edit.Text, 'imeprezime', True);
  if IzabranClan <> -1 then
  begin
        FKartica.ShowM(IzabranClan, 0);
        FKartica.ShowModal;
  end;
End;

procedure TMainForm.PregledDug(Koji:integer);
var i:integer;
//    klub:string;
begin
    Application.CreateForm(TDLG_OdabirKluba, DLG_OdabirKluba);
    if DLG_OdabirKluba.ShowModal = mrOK then
    begin
        Application.CreateForm(TFBrdanaDlg, FBrdanaDlg);
        if FBrdanaDlg.ShowModal = mrOK then
        begin
            DatumDug := date - FBrdanaDlg.DanaEdit.Value;
            Izvjestaji.KazeteUDugu.Close;
            Izvjestaji.KazeteUDugu.MacroByName('DATDUG').AsString:=''''+FormatDateTime('yyyy-mm-dd', DatumDug)+'''';
            if DLG_OdabirKluba.KlubCombo.Text='Svi klubovi' then
                Izvjestaji.KazeteUDugu.MacroByName('KLUB').AsString:=''
            else Izvjestaji.KazeteUDugu.MacroByName('KLUB').AsString:='AND p.sifrakluba='
                +LeftStr(DLG_OdabirKluba.KlubCombo.Text, Pos(' - ', DLG_OdabirKluba.KlubCombo.Text));
            Izvjestaji.KazeteUDugu.Open;

            if not Izvjestaji.KazeteUDugu.IsEmpty then
            begin
                i:=0;
                Label6.Caption:=IntToStr(i)+'/'+IntToStr(Izvjestaji.KazeteUDugu.RecordCount);
                Label6.Visible:=True;
                while not Izvjestaji.KazeteUDugu.Eof do
                begin
                    Podaci.Naplata(Izvjestaji.KazeteUDugu, 1, Izvjestaji.KazeteUDugu.FieldByName('bcodekaz').AsString, DatumDug);
                    Izvjestaji.KazeteUDugu.Next;
                    i:=i+1;
                    Label6.Caption:=IntToStr(i)+'/'+IntToStr(Izvjestaji.KazeteUDugu.RecordCount);
                    Label6.Refresh;
                end;
                Label6.Visible:=False;
                Izvjestaji.KazeteUDugu.First;
            end;

            if FBrdanaDlg.RadioGroup1.ItemIndex = 0 then
            begin //Popis filmova u dugu
                Izvjestaji.DajFRReport(koji, Izvjestaji.frUDugu, 'WHERE SifraIzvjestaja=6');
            End
            Else
            begin //Opomene za filmove u dugu
                Izvjestaji.DajFRReport(koji, Izvjestaji.frUDugu, 'WHERE SifraIzvjestaja=7');
            End;
(* Application.CreateForm(TFPrintOpomene, FPrintOpomene); Try FPrintOpomene.Preview; Finally FPrintOpomene.Destroy; End; *)

        End;
        FBrdanaDlg.Release;
    end;
    DLG_OdabirKluba.Release;
end;

Procedure TMainForm.PromjenaDjelatnika;
Begin
  Application.CreateForm(TpasswordDlg,PasswordDlg);
  try
   If PasswordDlg.Showmodal = MrOk then
   begin
        Podaci.TabRadnici.Locate('Sifra',VOperater,[]);
        VOperater := Podaci.TabRadnici.fieldByName('Sifra').Value;
        VPrava := Podaci.TabRadnici.FieldByname('Prava').value;
        VRAdnik := Podaci.TabRadnici.FieldByname('ID').value;
        MainForm.Caption:=Podaci.NazivPrograma+' - '+Podaci.TabRadnici.FieldByname('Naziv').value;
        // upisuje u bazu dnev ko se i kada prijavio za rad
        if biljezi then ShareUnit.UpitOpen
           (Podaci.myQuery1,' INSERT INTO dnev (Dogodilose, Datum, Radnik, Br1, Br2, SifraKluba)'+
                            ' VALUES (6, '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+
                            VRadnik+''', 0, 0, '+IntToStr(SifraKluba)+')', true, false);
   End;
  Finally
   PasswordDlg.Release;
  End;
End;

procedure TMainForm.ZipMaster1Message(Sender: TObject; ErrCode: Integer; Message: String);
begin
   MsgForm.RichEdit1.Lines.Append( Message );
   PostMessage( MsgForm.RichEdit1.Handle, EM_SCROLLCARET, 0, 0 );
   Application.ProcessMessages;
   if ErrCode > 0 then ShowMessage( 'Error Msg: ' + Message );
end;

//******************************************************************************************************
//  ovdje ide ZipMaster1Progress
//******************************************************************************************************

procedure TMainForm.KopijaBaza(koja:Integer;Pitaj,RacuniX:Boolean);
begin
  if pitaj then if not Confirm('Da li stvarno želite napraviti rezervnu kopiju podataka?') then exit;
End;

procedure TMainForm.ZatvoriOtvori;
begin
  Screen.Cursor := crHourglass;
  try
    Podaci.myDB.Close;
    Podaci.xfer.Close;
    Podaci.PocetakPrograma;
  finally
    Screen.Cursor := crDefault;
    SrediFormu;
  end;
End;

procedure TMainForm.ZaInternet;
var
  sSQl:TStrings;
  fajl:string;
begin
  if not DirectoryExists(ExtractFilePath(Application.ExeName)+'www') then
        ForceDirectories(ExtractFilePath(Application.ExeName)+'www');
  sSql := TStringList.Create;
  ukbaza := 0;
  try
    sSql.add('SELECT naziv FROM glumci');
    NapraviBazu('glumci',sSql); sSql.Clear;
    sSql.add('SELECT naziv FROM rezija');
    NapraviBazu('reziseri',sSql); sSql.Clear;
    sSql.add('SELECT naziv FROM vrsta');
    NapraviBazu('zanrovi',sSql); sSql.Clear;
    sSql.add('SELECT Sifra, ImePrezime, InfoBoxID FROM clanovi ORDER BY ImePrezime');
    NapraviBazu('clanovi',sSql); sSql.Clear;
    sSql.add('SELECT SifraClana, SifraKazete, Posudjen, Vracen FROM koi');
    NapraviBazu('gledalisu',sSql);
    sSql.Clear;

    // top filmovi
    sSql.add('select count(koi.sifrakazete) as brojac, koi.SifraKazete, kazete.Naziv, vrsta.Naziv');
    sSql.add('FROM koi');
    sSql.add('           INNER JOIN kazete  ON  (koi.SifraKazete = kazete.Sifra)');
    sSql.add('           INNER JOIN vrsta ON  (kazete.Zanr = vrsta.Sifra)');
    sSql.add('where (koi.Posudjen >= "'+datetostr(date-33)+'") and (koi.Posudjen <= "'+datetostr(date)+'")');
    sSql.add('group by koi.sifrakazete, kazete.naziv, vrsta.naziv Order by brojac DESC');
    NapraviBazu('topfilmovi',sSql);
    sSql.Clear;

    //noviteti
    sSql.add('SELECT  kazete.Naziv, kazete.Sifra Broj, vrsta.Naziv Zanr, glumci.Naziv glumac1, glumci_1.Naziv Glumac2, rezija.Naziv rezija, kazete.Kupljen');
    sSql.add('FROM kazete');
    sSql.add('INNER JOIN vrsta ON  (kazete.Zanr = vrsta.Sifra)');
    sSql.add('INNER JOIN glumci ON  (kazete.Glumac1 = glumci.Sifra)');
    sSql.add('INNER JOIN glumci_1 ON  (kazete.Glumac2 = glumci_1.Sifra)');
    sSql.add('INNER JOIN rezija  ON  (kazete.Rezija = rezija.Sifra)');
    sSql.add('where (kazete.Kupljen >= "'+datetostr(date-18)+'") and (kazete.Kupljen <= "'+datetostr(date)+'")');
    sSql.add('ORDER BY Zanr');
    NapraviBazu('noviteti',sSql);
    sSql.Clear;

    //filmovi
    sSql.add('SELECT kazete.Naziv, kazete.Sifra Broj, vrsta.Naziv Zanr, glumci.Naziv Glumac1, glumci_1.Naziv Glumac2, rezija.Naziv rezija, kazete.Kupljen, ''N'' Obrisan');
    sSql.add('FROM kazete');
    sSql.add('INNER JOIN vrsta ON (kazete.Zanr = vrsta.Sifra)');
    sSql.add('INNER JOIN glumci ON (kazete.Glumac1 = glumci.Sifra)');
    sSql.add('INNER JOIN glumci Glumci_1 ON  (kazete.Glumac2 = glumci_1.Sifra)');
    sSql.add('INNER JOIN rezija ON  (kazete.Rezija = rezija.Sifra)');
    sSql.add('WHERE  kazete.Obrisan<>"D" ORDER BY kazete.Naziv');
    NapraviBazu('filmovi',sSql);
    sSql.Clear;
  finally
    sSql.Free;
  end;

  if ukbaza = 8 then confirm('Sve datoteke su uspješno kreirane !!!')
  else exit;
  //*****************************************************************************
  ZipMaster1.Load_Zip_Dll;
  ZipMaster1.Load_Unz_Dll;
  Application.CreateForm(TMsgform,Msgform);
  try
    fajl := 'C:\zaWWW';
    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'TMP') then ForceDirectories(ExtractFilePath(Application.ExeName)+'TMP');
    MsgForm.RichEdit1.Clear;
    MsgForm.Show;
    with ZipMaster1 do
    begin
      AddOptions := [];

      if xp then AddOptions := [AddDiskSpan]
      Else AddOptions := [AddDiskSpanErase];

      TempDir := ExtractFilePath(Application.ExeName)+'TMP';
      ZipFilename := Fajl+'.zip';
      ZipMaster1Message( self, 0, 'DATOTEKA: ' + ZipFilename );
      FSpecArgs.Clear;
      FSpecArgs.add(ExtractFilePath(Application.ExeName)+'www\*.DB');
      try
         Add;
      except
         ShowMessage( 'Greška u dodavanju; Fatal DLL Exception u Osnovnom' ); Exit;
      end;
      ShowMessage( IntToStr( SuccessCnt ) + ' datoteka arhivirano.' );
   end;
  finally
    ZipMaster1.Unload_Zip_Dll;
    ZipMaster1.Unload_Unz_Dll;
    MsgForm.Release;
  End;
End;

procedure TMainForm.NapraviBazu(imedatoteke:String; vSql:TStrings);
var
  DestName: string;
  TabType: TTableType;
  DestTable: TTable;
  RecCount: Longint;
begin
  Screen.Cursor := crHourglass;
  try
    Podaci.Qwww.close;
    Podaci.Qwww.Sql := vSql;
    Podaci.Qwww.open;
  finally
    Screen.Cursor := crDefault;
  end;
  if imedatoteke = 'topfilmovi' then RecCount := 50
  else RecCount := 0;
  TabType := ttParadox;
  if imeDatoteke = 'Kazete2' then
        DestName := ExtractFilePath(Application.ExeName)+'Slanje\'+imedatoteke+'.db'
  else DestName := ExtractFilePath(Application.ExeName)+'www\'+imedatoteke+'.db';
  DestTable := TTable.Create(Self);
  try
    DestTable.TableName := DestName;
//    Podaci.Qwww.
    ExportDataSet(podaci.Dwww.DataSet as TBDEDataSet, DestTable, TabType, '', false, RecCount);
    inc(ukbaza);
  finally
    DestTable.Free;
  end;
End;

procedure TMainForm.SlanjePrimanje(Koje:Integer);
begin
    ShowMessage('Ukinuto zbog nove verzije baze.');
End;

// arhiviranje za slanje
(*procedure TMainForm.Arhiviraj;
var fajl:string;
begin
  ZipMaster1.Load_Zip_Dll;
  ZipMaster1.Load_Unz_Dll;
  Application.CreateForm(TMsgform,Msgform);
  try
    LMDDirDlg1.CaptionTitle:='Odaberite direktorij gdje želite snimiti "slanje.zip" datoteku';
    if LMDDirDlg1.Execute then fajl:=LMDDirDlg1.Path+'\Slanje' else fajl:='A:\Slanje';

    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'TMP') then ForceDirectories(ExtractFilePath(Application.ExeName)+'TMP');
    MsgForm.RichEdit1.Clear;
    MsgForm.Show;
    with ZipMaster1 do
    begin
      AddOptions := [];
      AddOptions := [AddDiskSpanErase];
      TempDir := ExtractFilePath(Application.ExeName)+'TMP';
      ZipFilename := Fajl+'.zip';
      ZipMaster1Message( self, 0, 'DATOTEKA: ' + ZipFilename );
      FSpecArgs.Clear;
      FSpecArgs.add(ExtractFilePath(Application.ExeName)+'Slanje\*.DB');
      try
         Add;
      except
         ShowMessage( 'Greška u dodavanju; Fatal DLL Exception u Osnovnom' ); Exit;
      end;
      ShowMessage( IntToStr( SuccessCnt ) + ' datoteka arhivirano.' );
   end;
  finally
    ZipMaster1.Unload_Zip_Dll;
    ZipMaster1.Unload_Unz_Dll;
    MsgForm.Release;
  End;
End;

procedure TMainForm.DeArhiviraj;
begin
  ZipMaster1.Load_Zip_Dll;
  ZipMaster1.Load_Unz_Dll;
  Application.CreateForm(TMsgform,Msgform);
  try
    MsgForm.RichEdit1.Clear;
    MsgForm.Show;
    with ZipMaster1 do
    begin
      ZipFilename := ExtractFilePath(Application.ExeName)+'Primanje\Slanje_k.zip';
      ZipMaster1Message( self, 0, 'DATOTEKA: ' + ZipFilename );
      ExtrBaseDir := ExtractFilePath(Application.ExeName)+'Primanje';
      try
         Extract;
      except
         ShowMessage( 'Greška u dodavanju; Fatal DLL Exception u Osnovnom' ); Exit;
      end;
      ShowMessage( IntToStr( SuccessCnt ) + ' datoteka arhivirano.' );
   end;
  finally
    ZipMaster1.Unload_Zip_Dll;
    ZipMaster1.Unload_Unz_Dll;
    MsgForm.Release;
  End;
End;  *)

procedure TMainForm.LMDStaticText2MouseExit(Sender: TObject);
begin
  (Sender as TLMDStaticText).Color := clAppWorkSpace;
end;

procedure TMainForm.LMDStaticText2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TLMDStaticText).Color := $00F45B00;
end;

procedure TMainForm.Nap1DblClick(Sender: TObject);
begin
  if KojiStroj = 1 then exit;
  if FileExists('C:\WINDOWS\Notepad.exe') then
  begin
      if poruke then
      begin
        Podaci.tPoruke.Filter:='sifra_kluba=0';
        (Podaci.tPoruke.Fields[1] as TBlobField).SaveToFile(PathLOG+'nap1.txt');
        ExecWait(Format('%s %s',['C:\WINDOWS\Notepad.exe', PathLOG+'nap1.txt']));

        Podaci.tPoruke.Edit;
        (Podaci.tPoruke.Fields[1] as TBlobField).LoadFromFile(PathLOG+'nap1.txt');
        Podaci.tPoruke.Post;

        Nap1.Caption:=Podaci.tPoruke.Fields[1].AsString;
      end
      else
      begin
        ExecWait(Format('%s %s',['C:\WINDOWS\Notepad.exe', PathLOG+'nap1.txt']));
        UcitajNapomene(Nap1);
      end;
  End;
end;

procedure TMainForm.Nap2DblClick(Sender: TObject);
begin
  if KojiStroj = 1 then exit;
  if FileExists('C:\WINDOWS\Notepad.exe') then
  begin
      if poruke then
      begin
        Podaci.tPoruke.Filter:='sifra_kluba='+IntToStr(Napomena2Klub);
        (Podaci.tPoruke.Fields[1] as TBlobField).SaveToFile(PathLOG+'nap2.txt');
        ExecWait(Format('%s %s',['C:\WINDOWS\Notepad.exe', PathLOG+'nap2.txt']));

        Podaci.tPoruke.Edit;
        (Podaci.tPoruke.Fields[1] as TBlobField).LoadFromFile(PathLOG+'nap2.txt');
        Podaci.tPoruke.Post;

        Nap2.Caption:=Podaci.tPoruke.Fields[1].AsString;
      end
      else
      begin
        ExecWait(Format('%s %s',['C:\WINDOWS\Notepad.exe', PathLOG+'nap2.txt']));
        UcitajNapomene(Nap2);
      end;
  End;
end;

procedure TMainForm.UcitajNapomene(koja:TLMDStaticText);
Var Lista:TstringList;
    i:integer;
begin
    koja.Caption := '';

    if not FileExists(PathLOG+koja.Name+'.txt') then exit;
    Lista := TStringList.Create;
    try
        Lista.LoadFromFile(PathLOG+koja.Name+'.txt');
        i := 0;
        While i < Lista.Count do
        begin
            koja.Caption := koja.Caption+ Lista[i]+chr(13);
            inc(i);
        End;
    finally
        Lista.Free;
    end;
end;

procedure TMainForm.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TMainForm.PrebaciClanaClick(Sender: TObject);
begin
    PojamForm.Edit1.Text:='';
    PojamForm.ShowModal;
    if PojamForm.ModRes then
        Podaci.ImportajClana(StrToInt(PojamForm.Edit1.Text));
end;

procedure TMainForm.PrebaciFilmClick(Sender: TObject);
begin
    PojamForm.Edit1.Text:='';
    PojamForm.ShowModal;
    if PojamForm.ModRes then
        Podaci.ImportajFilm(StrToInt(PojamForm.Edit1.Text));
end;

procedure TMainForm.webTimer1Timer(Sender: TObject);
begin
    Logiraj('__ Startanje Timera - '+BoolToStr(MojThread1Aktivan, True)+' '+DateTimeToStr(Now), True);

    if (MojThread1 = nil) or (MojThread1Aktivan = false) then // make sure its not already running
    begin
        MojThread1 := TIzracunajWeb.CreateIt(3);     // kreiraj novi Thread - Priority Level=tpNormal=3
        MojThread1Aktivan := true;                   // da bi izraèunali web statistike
        Logiraj('__ Kreiranje Threda - '+BoolToStr(MojThread1Aktivan, True)+' '+DateTimeToStr(Now), True);
    end;

    if BrojNarudzbi<1 then BitBtn1.Caption:='Nema narudžbi'  // ah, glagoli
    else if BrojNarudzbi=1 then BitBtn1.Caption:='Imate 1 web narudžbu!'
    else if BrojNarudzbi<5 then BitBtn1.Caption:='Imate '+IntToStr(BrojNarudzbi)+' web narudžbe!'
    else BitBtn1.Caption:='Imate '+IntToStr(BrojNarudzbi)+' web narudžbi!';
    PojacajButton(BrojNarudzbi, BitBtn1);

    if BrojRezervacija<1 then BitRez.Caption:='Nema rezervacija'
    else if BrojRezervacija=1 then BitRez.Caption:= 'Imate 1 rezervaciju!'
    else if BrojRezervacija<5 then BitRez.Caption:='Imate '+IntToStr(BrojRezervacija)+' rezervacije!'
    else BitRez.Caption:='Imate '+IntToStr(BrojRezervacija)+' rezervacija!';
    PojacajButton(BrojRezervacija, BitRez);

    if BrojWishLista<1 then BitWish.Caption:='Nema filmova za wish listu'
    else if BrojWishLista=1 then BitWish.Caption:= '1 na wish listi'
    else if BrojWishLista<5 then BitWish.Caption:='Wishlista = '+IntToStr(BrojWishLista)+' filma'
    else BitWish.Caption:='Wishlista = '+IntToStr(BrojWishLista)+' filmova';
    PojacajButton(BrojWishLista, BitWish);
end;

procedure TMainForm.PojacajButton(koliko: Integer; Button: TBitBtn);
begin
    if koliko>0 then
    begin
        Button.Font.Color:=clRed;
        Button.Font.Style:=[fsBold];
        Beep;
    end
    else
    begin
        Button.Font.Color:=clWhite;
        Button.Font.Style:=[];
    end;
end;

procedure TMainForm.xZaduzi(Sender: TObject);
begin
    webTimer1.Enabled:=False;

    Application.CreateForm(TFNaruceni, FNaruceni);

    FNaruceni.qDetNarudzbi.SQL.LoadFromFile(PathSQL+'DetaljiNarucene.sql');
    FNaruceni.qDetNarudzbi.SQL.Add('AND b.sifra_videokluba='+IntToStr(SifraKluba));
    FNaruceni.qDetNarudzbi.SQL.Add('ORDER BY r.sifraclana');
    FNaruceni.qDetNarudzbi.Open;
    FNaruceni.DBGrid1.DoPerfectFit;

    FNaruceni.qDetVracanja.SQL.LoadFromFile(PathSQL+'DetaljiVracanje.sql');
    FNaruceni.qDetVracanja.SQL.Add('AND p.sifrakluba='+IntToStr(SifraKluba));
    FNaruceni.qDetVracanja.SQL.Add('ORDER BY p.sifraclana');
    FNaruceni.qDetVracanja.Open;
    FNaruceni.DBGrid2.DoPerfectFit;

    FNaruceni.ShowModal; // otvori izbornik

    if WebTimer<>'0' then webTimer1.Enabled:=True;
    Edit.SetFocus;
end;

procedure TMainForm.onZvjezdica(Sender: TObject);
begin
    Label6.Visible:=False;
    Label6.Caption:='./.';
    ZvjezdicaT.Enabled:=False;
end;

procedure TMainForm.HotKey1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Top10 then
    begin
        if biljezi then
        begin
            if zvjezdica then     // 8=Gasi zvjezdicu
            begin
                ShareUnit.UpitOpen(Podaci.myQuery1,' INSERT INTO dnev (Dogodilose, Datum, Radnik, Br1, Br2, SifraKluba)'+
                        ' VALUES (8, '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+
                        VRadnik+''', 0, 0, '+IntToStr(SifraKluba)+')', true, false);
                LMDStaticText9.Font.Color:=clNavy;
            end
            else                  // 7=Pali zvjezdicu
            begin
                ShareUnit.UpitOpen(Podaci.myQuery1,' INSERT INTO dnev (Dogodilose, Datum, Radnik, Br1, Br2, SifraKluba)'+
                        ' VALUES (7, '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+
                        VRadnik+''', 0, 0, '+IntToStr(SifraKluba)+')', true, false);
                LMDStaticText9.Font.Color:=clRed;
            end;
        end;
        zvjezdica:=not zvjezdica;

        // prikazi info od zvjezdice
        Label6.Visible:=True;
        if zvjezdica then
        begin
            ShareUnit.UpitOpen(Podaci.myQuery1,
                'SELECT SUM(cifra) FROM racuni2 '+
                'WHERE Datum BETWEEN '''+FormatDateTime('yyyy-mm-dd', Today)+''' AND '+
                ''''+FormatDateTime('yyyy-mm-dd', Tomorrow)+''' '+
                'AND sifrakluba='+IntToStr(SifraKluba), True, True);
            Label6.Caption:=Podaci.myQuery1.Fields[0].AsString;
        end
        else
        begin
            ShareUnit.UpitOpen(Podaci.myQuery1,
                'SELECT SUM(cifra) FROM racuni '+
                'WHERE Datum BETWEEN '''+FormatDateTime('yyyy-mm-dd', Today)+''' AND '+
                ''''+FormatDateTime('yyyy-mm-dd', Tomorrow)+''' '+
                'AND sifrakluba='+IntToStr(SifraKluba), True, True);
            Label6.Caption:=Podaci.myQuery1.Fields[0].AsString+' - Off';
        end;
        ZvjezdicaT.Enabled:=True;
    end
    else zvjezdica:=False;
end;

procedure TMainForm.InitLow;
Begin
   if low_rights then // iskljuèi "rich" opcije, web i sl.
   begin
        MainForm.webTimer1.Enabled:=False;    // nemoj provjeravati web narudžbe
//        MainForm.CoolBar1.Bands[2].Visible:=False;    // sakrij broj web narudžbi
        MainForm.CoolBar1.Bands[3].Visible:=False;    // sakrij wishlistu

//        MainForm.PrebaciClana.Visible:=False; // iskljuèi "Stari èlan" button
//        MainForm.PrebaciFilm.Visible:=False; // iskljuèi "Stari film" button

        // nema potvrda
        MainForm.Pregledpotvrdepobroju1.Visible:=False;
        MainForm.Pregledpotvrdastornozaduenja1.Visible:=False;
        MainForm.N7.Visible:=False;  // za ljepši izgled
        // ima još u postavkama

        // nema drugih klubova
        FKartica.TabWishLista.Enabled:=False;// nema wish liste taba
        FKartica.TabPosudbe.Enabled:=False;  // Nema drugih posudbi taba
        FKartica.BitBtn4.Visible:=False;     // "Na Wish listu" button
        // ima još u UnosbarCode.ShowMBcode
   end;
end;

procedure TMainForm.BitRezClick(Sender: TObject);
begin
    webTimer1.Enabled:=False;

    Application.CreateForm(TFRezervirani, FRezervirani);

    FRezervirani.qDetRezervacija.Open;
    FRezervirani.qSveRezervacije.Open;
    FRezervirani.DBGrid1.DoPerfectFit;

    FRezervirani.ShowModal; // otvori izbornik

    if WebTimer<>'0' then webTimer1.Enabled:=True;
    Edit.SetFocus;
end;

procedure TMainForm.DajWishListe(Sender: TObject);
begin
    webTimer1.Enabled:=False;

    Application.CreateForm(TfPregledWishLista, fPregledWishLista);

    fPregledWishLista.qDetWLista.Open;
    fPregledWishLista.qSveWListe.Open;
    fPregledWishLista.DBGrid1.DoPerfectFit;

    fPregledWishLista.ShowModal; // otvori izbornik

    if WebTimer<>'0' then webTimer1.Enabled:=True;
    Edit.SetFocus;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Cursor:=crSQLWait;
end;

procedure TMainForm.NapLOGDblClick(Sender: TObject);
begin
    if Confirm('Da li ste sigurni da želite obrisati Podsjetnik?') then
    begin
        if FileExists(PathLOG+'NapLOG.txt') then
            DeleteFile(PathLOG+'NapLOG.txt');  // obriši faj za logiranje podsjetnika
        FileClose(FileCreate(PathLOG+'NapLOG.txt'));           // napravi novi fajl (prazni) i zatvori ga
        AssignFile(Napomena_Log, PathLOG+'NapLOG.txt');
        ShowNapomene;
    end;
end;

function TMainForm.TraziClana_PoBarkodu(barkod:String):boolean;
begin
    Podaci.TClanovi.Close;
    Podaci.TClanovi.MacroByName('WHERE').AsString:='WHERE barcode='''+barkod+'''';
    Podaci.TClanovi.Open;
    if not Podaci.TClanovi.IsEmpty then
    begin
        FKartica.ShowM(Podaci.TClanovi.FieldByName('Sifra').Value,0);
        FKartica.ShowModal;
        Result:=True;
    end
    else
        Result:=False;
end;

function TMainForm.TraziClana_PoSifri(barkod:String):boolean;
Var I, Code: Integer;
begin
    Val(barkod, I, Code);
    if code = 0 then
    begin
        Podaci.TClanovi.Close;
        Podaci.TClanovi.MacroByName('WHERE').AsString:='WHERE sifra='+IntToStr(i);
        Podaci.TClanovi.Open;
        if not Podaci.TClanovi.IsEmpty then
        begin
            FKartica.ShowM(i,0);
            FKartica.ShowModal;
            Result:=True;
        end
        Else
        begin
            Result:=False;
            Poruka;  // "Nije naðen podatak"
        end;
    end
    else
        Result:=False;
end;

function TMainForm.TraziFilm_BarkodUPosudjenima(barkod:String):boolean;
begin
    ShareUnit.UpitOpen(Podaci.myQuery1,
        'SELECT SifraClana, SifraKazete, SifraKluba FROM pos WHERE BCodeKaz='''+barkod+'''', False, True);
    If not Podaci.myQuery1.IsEmpty then
    begin
        if Podaci.myQuery1.FieldByName('SifraKluba').AsInteger<>SifraKluba then
        begin
            Beep;
            ShowMessage('Film je posuðen u drugom klubu!');
            Result:=False;
        end
        else
        begin
            Result:=True;
            FKartica.ShowM(Podaci.myQuery1.FieldByName('SifraClana').Value, Podaci.myQuery1.FieldByName('SifraKazete').Value);
            FKartica.ShowModal;
        end;
    end
    else
        Result:=False;
end;

End.



