unit BazeModul;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DbiTypes, DBTables, Math, servisi, ExtCtrls, ImgList, Menus,
  Placemnt, DbPrgrss, AppEvent, RXShell, Registry, dxmdaset, Wwdbgrid,
  IniFiles, CPort, variants, MySQLDataset, MySQLServer, FR_Class, DateUtils,
  LMDCustomComponent, LMDDBExport, LMDFileCtrl, ZipMstr;

type
  TPodaci = class(TDataModule)
    ImageList1: TImageList;
    Dclanovi: TDataSource;
    DFilmovi: TDataSource;
    DBarcode: TDataSource;
    DZaduz: TDataSource;
    DRacuni: TDataSource;
    Dwww: TDataSource;
    MemData: TdxMemData;
    MemDataNaziv: TStringField;
    MemDataSifra: TAutoIncField;
    MemDataIzdano: TIntegerField;
    MemDataVraceno: TIntegerField;
    ComPort1: TComPort;
    DSRacuni: TDataSource;
    myDB: TMySQLServer;
    TabSetUp: TMySQLTable;
    myQuery1: TMySQLQuery;
    qRacuni: TMySQLQuery;
    qRacuniDet: TMySQLQuery;
    TCrnaLista: TMySQLTable;
    Qwww: TMySQLQuery;
    TabIndex: TMySQLTable;
    TPosudbe: TMySQLTable;
    TabCijene: TMySQLTable;
    TabPristup: TMySQLTable;
    tabradnici: TMySQLTable;
    QPOs: TMySQLQuery;
    QKoi2: TMySQLQuery;
    qTemp: TMySQLQuery;
    qKTemp1: TMySQLQuery;
    qKTemp2: TMySQLQuery;
    TZak: TMySQLDataset;
    TRacuni: TMySQLDataset;
    TRacuniDet: TMySQLDataset;
    TZaduz: TMySQLDataset;
    TZaduzDet: TMySQLDataset;
    TFilmovi: TMySQLDataset;
    TFilmovicSlobodan: TBooleanField;
    TFilmoviSifra: TAutoIncField;
    TFilmoviNaziv: TStringField;
    TFilmoviKategorija: TSmallintField;
    TKoi: TMySQLDataset;
    TPotvrda: TMySQLDataset;
    TDnev: TMySQLDataset;
    TClanovi: TMySQLDataset;
    TBarcode: TMySQLDataset;
    xfer: TDatabase;
    oldClanovi: TTable;
    oldKazete: TTable;
    tPoruke: TMySQLTable;
    QKoi: TMySQLQuery;
    myQuery2: TMySQLQuery;
    TFilmDet: TMySQLDataset;
    TFilmDetSifra: TAutoIncField;
    TFilmDetSifraKazete: TIntegerField;
    TFilmDetSifraFirme: TSmallintField;
    TFilmDetBrKazeta: TSmallintField;
    TFilmDetIzdatPuta: TSmallintField;
    TFilmDetIzdanoKop: TSmallintField;
    TFilmDetBrRacuna: TMySQLStringField;
    TFilmDetDobavljac: TIntegerField;
    TFilmDetKupljen: TDateField;
    TFilmDetCijenaKn: TFloatField;
    TFilmDetCijenaDEM: TFloatField;
    TFilmDetObrisan: TMySQLStringField;
    TFilmDetDatumBrisanja: TDateTimeField;
    TFilmDetZaradioDEM: TFloatField;
    TFilmDetDatumPlacanja: TDateField;
    TFilmDetAzurirano: TDateTimeField;
    TFilmDetZaradioKN: TFloatField;
    TFilmDetPravaVrijedeDo: TDateField;
    TFilmDetSifraStatusFilma: TIntegerField;
    TFilmDetKupljenoKazeta: TIntegerField;
    DFilmDet: TDataSource;
    TMediji: TMySQLDataset;
    DMediji: TDataSource;
    Tvrsta: TMySQLDataset;
    DVrsta: TDataSource;
    Trezb: TMySQLDataset;
    Drez: TDataSource;
    TGlumac: TMySQLDataset;
    DGlumac: TDataSource;
    TDrzav: TMySQLDataset;
    DDrzav: TDataSource;
    TDobav: TMySQLDataset;
    DDobav: TDataSource;
    tZanr: TMySQLDataset;
    dsZanr: TDataSource;
    TStatFilma: TMySQLDataset;
    DStatFilma: TDataSource;
    Trez: TMySQLDataset;
    SaveDlg: TSaveDialog;
    DBExport: TLMDDBExport;
    tVrstePlacanja: TMySQLTable;
    tVrstePlacanjaSifra: TAutoIncField;
    tVrstePlacanjaNazivPlacanja: TMySQLStringField;
    tVrstePlacanjaAktivan: TMySQLStringField;
    dsVrstePlacanja: TDataSource;
    s: TLMDFileCtrl;
    ZipMaster1: TZipMaster;
    procedure PodaciCreate(Sender: TObject);
    procedure EditUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure TFilmoviCalcFields(DataSet: TDataSet);
    procedure TBarcodeBeforeDelete(DataSet: TDataSet);
    procedure DbiSaveAfterPost(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure TRacuniAfterClose(DataSet: TDataSet);
    procedure TZaduzAfterOpen(DataSet: TDataSet);
    procedure TZaduzAfterClose(DataSet: TDataSet);
    procedure myDBAfterConnect(Sender: TObject);
    procedure myDBLogin(Server: TMySQLServer; LoginParams: TStrings);
    procedure myDBBeforeConnect(Sender: TObject);
    procedure TFilmoviAfterOpen(DataSet: TDataSet);
    procedure TFilmoviAfterClose(DataSet: TDataSet);
    procedure tabradniciBeforeOpen(DataSet: TDataSet);

  private
    varAdresaCl:String;
    StanjeSalda :Currency;
    procedure Zaglavlje(dat:String);
    procedure NacrtajZaduz;
    Procedure NacrtajRacun(broj_racuna:String);
    procedure ProvjeraPorta;
    Function  daliide(koji:Integer;lab:String):Boolean;

  public
    NazivPrograma:String;
    SrchFld: TField;

    procedure DataSet2HTML(ds: TDataSource);
    Function  ImeCl(br,odakle:Integer):String;
    Function  NazivFilma(upit:String; bc:boolean):String;
    procedure PocetakPrograma;
    procedure NaKraju(Ekran, IzPregleda:Boolean; IspisujeSe:Integer);
    Function  sStr(s:String):String;
    procedure PripremiPrinter(Ekran:Boolean);
    Procedure Otvoriindex(s:string);
    Procedure Pregled(koji:Integer);
    Procedure PregledPotvrda(koji:Integer);
    Procedure SrediSaldo(Clan:Integer;Povrat,Novi:Currency);

    function ZaduziRezervaciju(Grid: TwwDBGrid):boolean;
    function ZaduziWishListu(Grid: TwwDBGrid):boolean;
    Function WishLista2Rezervacija(Grid: TwwDBGrid):Boolean;
    Function Rezervacija2WishLista(Grid: TwwDBGrid):Boolean;

    Procedure NaplatiClanarinu(vClan,vPopust:Integer);
    Procedure NaplatiOsiguranje(vClan,vPopust:Integer);
    Procedure NaplatiDugovanje(clan:string);

    Function  Naplata(DataSet: TDataSet; Cijenik: Integer; barCode: String; datPos: TDateTime):Currency;
    Function  Naplata1(DataSet: TDataSet; Cijenik: Integer; barCode: String; datPos: TDateTime):Currency;
    Function  Naplata2(DataSet: TDataSet; Cijenik: Integer; barCode: String; datPos: TDateTime):Currency;
    Function  DalijeBlagdan(datum: TDate):Boolean;

    Procedure Zakljuci(datum: TDate; Klub:integer; ImaDijalog: Boolean);
    Procedure IspisZaklj(koje:integer);
    Procedure IspisPoslovanje(koje:integer);
    Procedure IspisPlacanja(koje:integer);
    Procedure IzdanoPoKlubu(koje:integer);
    Procedure IzdanoPoDjelatniku(koje:integer);
    procedure TopFilmovi;

    procedure PregledObrisani;
    procedure NapraviID;
    function  PopuniNule3(X:String;Koliko:Integer): String;
    Procedure PregRacClanarine(koji:Integer);
    Procedure StornoRacuna;
    Procedure Usaglasi;
    Procedure ImportajClana(i: Integer);
    Procedure ImportajFilm(i: Integer);
    Function  DajRezervacije(sifra:string):Boolean;

    function  LOGRotate(ime, prefix:string):Integer;
    Function  SpakirajFile(ime, prefix, gdje: string):boolean;

  published
    destructor Destroy; override;
  end;

  function Confirm(Msg: string): Boolean;

  Procedure Odabir(F:TformClass;Field:Tfield);

  Procedure OtvoriJu(baza,FilterJe,IndexJe:String);

  Function SveBrojevi(Txt:String):Boolean;
  Function SveBrojevi2(Txt:String):Boolean;

  procedure IspZaduz(brZad:Integer);
  procedure IspRacun(broj_racuna: String);
  procedure IspPotvrdu(vrsta, brojPotvrde:Integer; naEkran: Boolean);
  procedure ChkBool(Value: Boolean; const Msg: String);
  function  ExecWait(const Cmd: String): Integer;
  procedure PukoPozivKontrole(greska:String);
  function  IsInteger(const s: string): boolean;
  function  StarostGodina(Rodjen:TDateTime): Integer;
  procedure Logiraj(LOGText: String; Continue: Boolean);
  procedure DodajPodsjetnik(LOGText: String);
  procedure LogirajNaplatu(zapis: String);

const
  {Declare constants we're interested in}
  DigitChars = ['0'..'9'];
//  AlphaChars = ['A'..'Z','a'..'z'];
  AlphaChars = ['A'..'Z'];
  eKeyViol = 9729;
  eRequiredFieldMissing = 9732;
  eForeignKey = 9733;
  eDetailsExist = 9734;
  cInsert = 3;
  cEdit = 4;
  cDelete = 5;
  cOpen = 6;
  daaa  = 23834;    //True
  neee  = 31431;    //False

  regkey = '\SOFTWARE\Microsoft\Ole';

  cNeovlasteno = 'Pokušaj neovlaštenog pristupa !'+#13+#13+
                 'Niste ovlašteni da pristupite ovoj opciji.';

var
  Podaci: TPodaci;
  VPrava:Integer;
  Voperater:Integer;
  VRadnik:String[4];
  Zoran:String;
  izPopravka,IdeSaldoRacun :Boolean;
  KojiStroj:Integer;
  Klub, IzabranFilm, IzabranBarkod:String;
  IzabranClan:Integer;
  lst:TextFile;
  IspravakKartice:Boolean;
  DatumDug:TDateTime;
  SmijePosuditi:Boolean;
  BioUnosClana: Integer;
  PutHDD,PutDisketa:String;
  SmijuSlova:Boolean;
  IzKartice, IzOdabiraF :Boolean;
  Kclan, Kfilm, VrstaPlacanja :Integer;
  Dalibor, Biljezi, cross, CrnaLista, orao : Boolean;
  vTextDugovanja,vTextDugovanjaUgovor: String;
  MaxPosudba:Integer;
  PathBIN, PathINI, PathSQL, PathLOG: string;
  mojCharSet, mojCollation, limit_po_zanru: string;
  default_KategorijaBarkoda, default_StatusBarkoda, default_MedijBarkoda, default_Top10, RNzaglavlje: string;
  alijas, serv, baza, user, Loz, ide_lib, ide_schema, WebTimer:String;
  BlagdanVikendu, XP, NemaGa, Top10, zvjezdica: Boolean;
  VideoModifier:longint;
  Registriran, logiraj_upite, logiraj_napomene, deadlock, testNaplata: Boolean;
  DbiSave:Boolean;
  SifraKluba, SifraFirme, Napomena2Klub, KojaNaplata:Integer;
  MySQL, poruke, DrugiKlubovi, FRizDB, low_rights, frizerski:Boolean;
  Parametri: TIniFile;
  SQL_Log, Test_naplate, Napomena_Log: TextFile;

implementation

uses Main, StrUtils, PBZConsts, UnosTemplate, Lozinka, DateUtil,
     PregledDLG, PrikazEkranDLG, AppUtils, ClanarinaDlg, PlatioJeDlg, printPoslovanje1,
     PrintTOPfilmovi, fileutil, PregledObrisaniDlg, PostavkeDlg,
     PregRacunaCla, DugovanjeDlg, RekDlg, VratitiDoDlg, OsiguranjeDlg,
     Share, VracanjeDlg, RXSpin, IzvjestajTM, Kartica, BDE;

{$R *.DFM}

function Confirm(Msg: string): Boolean;
begin
  Result := MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

Procedure Odabir(F:TformClass;Field:Tfield);
  var Dlg: TForm;
begin
  UnosStyle:=FsNormal;
  Application.CreateForm(F, Dlg);
  With DLG As TfUnosTemplate do
   try
   Sifra:=Field.Value;
   Visible:=False;
   IF ShowModal in [mrOk, mrYes] Then
   begin
    Field.Value:=Sifra;
   end;
  finally
    Dlg.Free;
  end;
 end;

function TPodaci.PopuniNule3(X:String;Koliko:Integer): String;
Var i:Integer;
Begin
  Result := '';
  if Length(X) = Koliko then Result := X
  Else
  Begin
    for i := 1 to (Koliko-Length(X)) do Result := result + '0';
    Result := Result + x;
  End;
End;

Procedure TPodaci.Otvoriindex(s:string);
begin
 TabIndex.active:=false;
 TabIndex.IndexFieldNames := '';
 TabIndex.Filter := '';
 TabIndex.Filtered := False;
 TabIndex.Tablename:=s;
 TabIndex.active:=true;
end;

Procedure OtvoriJu(baza, FilterJe, IndexJe:String);
Begin
  Podaci.TabIndex.active:=false;
  Podaci.TabIndex.IndexFieldNames := '';
  Podaci.TabIndex.Filtered := False;
  Podaci.TabIndex.Tablename:=Baza;
  Podaci.TabIndex.IndexFieldNames := IndexJe;
  Podaci.TabIndex.Filter := FilterJe;
  Podaci.TabIndex.Filtered := True;
  Podaci.TabIndex.active:=true;
  Podaci.TabIndex.First;
End;

{The following code fragment will execute any program, DOS
or 32-bit, and wait until the called program has finished
running.
----------------------------------------------------------- }
procedure ChkBool(Value: Boolean; const Msg: String);
begin
  If (Value = false) then raise exception.create(Msg);
end;

{ Source: Dmitriy Anisimkov <ts@quadrat.omsk.su> }
function ExecWait(const Cmd: String): Integer;
var
  ProcessInfo: TProcessInformation;
  hProcess: THandle;
  ReturnCode: Integer;
  StartupInfo: TStartupInfo;
begin
  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  ChkBool(CreateProcess(nil, PChar(Cmd), nil, nil, False,
          CREATE_DEFAULT_ERROR_MODE + NORMAL_PRIORITY_CLASS,
          NIL, NIL, StartupInfo, ProcessInfo),
          'Error during CreateProcess');
  hProcess := ProcessInfo.hProcess; // save the process handle
  //Close the thread handle as soon as it is no longer needed
  CloseHandle(ProcessInfo.hThread);
  ReturnCode := WaitForSingleObject(hProcess, INFINITE);
  ChkBool(dword(ReturnCode) <> WAIT_FAILED, 'Error in WaitForSingleObject');
  // The process terminated
  ChkBool(GetExitCodeProcess(hProcess, dword(Result)), 'Error in GetExitCodeProcess');
  // Close the process handle as soon as it is no longer needed
  ChkBool(CloseHandle(hProcess), 'Error in process Close Handle');
end;

procedure TPodaci.ProvjeraPorta;
begin
  // ako se radi o POS printerima treba inicijalizirati PORT
  if KojiStroj=0 then
  begin
    if ((TabSetUp.FieldByName('RacuniNa').AsInteger = 1) or (TabSetUp.FieldByName('RacuniNa').AsInteger = 2)) and
    not (TabSetUp.FieldByName('Port').AsString = 'LPT1') then
    begin
        ComPort1.Port := TabSetUp.FieldByName('Port').AsString;
        if ComPort1.Connected then ComPort1.Close
        else ComPort1.Open;
        ComPort1.Close;
    End;
  end
  else
  begin
    if ((TabSetUp.FieldByName('RacuniNa2').AsInteger = 1) or (TabSetUp.FieldByName('RacuniNa2').AsInteger = 2)) and
    not (TabSetUp.FieldByName('Port2').AsString = 'LPT1') then
    begin
        ComPort1.Port := TabSetUp.FieldByName('Port2').AsString;
        if ComPort1.Connected then ComPort1.Close
        else ComPort1.Open;
        ComPort1.Close;
    End;
  end;
End;

procedure TPodaci.PodaciCreate(Sender: TObject);
begin
    PocetakPrograma;
end;

procedure TPodaci.EditUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
var
  Key: Variant;
const
  UpdErrMsg = '%s.'#13#10'Discard the edits to %S %S and continue updating?';
begin
  if UpdateKind = ukDelete then
    Key := Dataset.Fields[0].OldValue else
    Key := Dataset.Fields[0].NewValue;
  if MessageDlg(Format(UpdErrMsg, [E.Message, DataSet.Fields[0].DisplayLabel, Key]),
    mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
    UpdateAction := uaSkip else
    UpdateAction := uaAbort;
end;

function StarostGodina(Rodjen:TDateTime): Integer;
Var  Year, Month, Day: Word;
begin
  Result := -1;
  if ValidDate(Rodjen) then
  begin
    DecodeDate(Rodjen, Year, Month, Day);
    Result := CurrentYear-Year;
  end;
End;

function DaNe(X:Boolean): String;
Begin
  if x Then Result := 'X'
  Else Result := '  X';
End;

Function SveBrojevi(Txt:String):Boolean;
Begin
   result := (txt[1] in DigitChars) and (txt[length(txt)] in DigitChars);
End;

function IsInteger(const s: string): boolean;
var
 E: Integer;
 NotUsed: integer;
begin
  Val(S, NotUsed, E);
  result := E = 0;
end;

Function SveBrojevi2(Txt:String):Boolean;
Var a1,a2,a3,a4:Boolean;
Begin
  if Smijuslova then
  begin
      a1 := length(txt) = 7;
      a2 := (txt[7] in AlphaChars);
      a3 := (txt[6] in DigitChars);
      a4 := (txt[1] in DigitChars);
      Result := a1 and a2 and a3 and a4;
  End
  Else Result := False;
End;

procedure TPodaci.TFilmoviCalcFields(DataSet: TDataSet);
begin
//   TFilmovicSlobodan.Value := (TFilmoviBrKazeta.AsInteger - TFilmoviIzdanoKop.AsInteger) > 0;
end;

// Funkcije zajednièke od ispisa
Function TPodaci.sStr(s:String):String;
Begin
    if TabSetUp.FieldByName('KodnaStranica').Value = 0 Then Result := C852To437(s)
    Else Result := AnToNat(s);
End;

procedure TPodaci.Zaglavlje(dat:String);
begin
    if TabSetUp.FieldByName('NazivPoduzeca').asstring <> '' then
        WriteLn(Lst,ShareUnit.CEnterStr(sstr(TabSetUp.FieldByName('NazivPoduzeca').asstring),40));
    if TabSetUp.FieldByName('Adresa2').asstring <> '' then
        WriteLn(Lst,ShareUnit.CenterStr(sstr(TabSetUp.FieldByName('Adresa2').asstring),40));
    WriteLn(Lst,ShareUnit.CenterStr(sstr(TabSetUp.FieldByName('NazivKluba').asstring),40));
    WriteLn(Lst,ShareUnit.CenterStr(sstr(TabSetUp.FieldByName('Adresa1').asstring),40));
    WriteLn(Lst,#13);
    WriteLn(Lst,'Vlasnik: '+sstr(TabSetUp.FieldByName('Vlasnik').asstring));
    WriteLn(Lst,LeftStr(TabSetUp.FieldByName('MBO').asstring,20),dat:20);
    if TabSetUp.FieldByName('ObveznikPDV').AsString='N' then
        WriteLn(Lst,'Porezni obveznik nije u sustavu PDV-a');
    WriteLn(Lst,'');                                             //StringOfChar(' ',20-Length(dat))+
End;

procedure IspZaduz(brZad:Integer);
begin
    Podaci.TZaduz.Close;
    Podaci.TZaduz.MacroByName('WHERE').AsString:='WHERE Sifra='+IntToStr(brZad);
    Podaci.TZaduz.Open;

    if Podaci.TZaduz.IsEmpty then
    begin
        ShowMessage('Nepostoji zaduženje pod brojem '+IntToStr(brZad));
        Exit;
    end;

    Podaci.PripremiPrinter(False);
    try
        Podaci.NacrtajZaduz;
        Podaci.NaKraju(False,False,0);
    finally
        closefile(lst);
    End;
End;

procedure TPodaci.NacrtajZaduz;
Var s,sl:String;
    i:Integer;
begin
  Zaglavlje(TZaduz.FieldByName('Datum').asstring);
  WriteLn(Lst,ShareUnit.CenterStr(sstr('POTVRDA O ZADUŽENJU broj : ')+TZaduz.FieldByName('Sifra').asstring,40));
  writeln(lst,ImeCl(TZaduz.FieldByName('SifraClana').AsInteger,0));
  writeln(lst,varAdresaCl);
  writeln(lst,sstr('Posudio je slijedeæe kazete (filmove)'));
  writeln(lst,StringOfChar('-', 40));
  TZaduzDet.First;
  s := '';
  i := 0;
  while not TZaduzDet.Eof do
  begin
       inc(i);
       sl := ' ';
       if sl = '' then sl := ' ';
       s := s + copy(TZaduzDet.FieldByName('DatumPos').asstring,1,6)+'-'+
                RightStr(TZaduzDet.FieldByName('SifraKazete').asstring,4)+ sl;
       if i < 3 then s := s+', ';
       TZaduzDet.Next;
       if (i = 3) or (TZaduzDet.Eof) then
       begin
         writeln(lst,s);
         i := 0;
         s := '';
       End;
  End;
  writeln(lst,'');
  writeln(lst,sstr('te svojim potpisom to i potvrðuje.')+#13#10#10);
  writeln(lst,leftStr('Radnik : '+sstr(TZaduz.FieldByName('Radnik').asstring),15),StringOfChar('_', 18):24);
  writeln(lst,sstr('(potpis èlana)'):37);
End;

Procedure TPodaci.SrediSaldo(Clan:Integer; Povrat, Novi:Currency);
Var z,i,j: Currency;
    upit: String;
begin
    ShareUnit.UpitOpen(Podaci.myQuery1,
    ' SELECT Duzan FROM clanovi WHERE sifra='+IntToStr(Clan), True, True);
    z:=Podaci.myQuery1.FieldByName('Duzan').AsCurrency;

    if povrat > 0 then
    begin
        i:=povrat;
        j:=0;
    end
    Else if Novi > 0 then
    begin
        i:= 0;
        j:=novi;
    end;

    if povrat > 0 then z:=z+povrat
    Else if Novi > 0 then z:=z-Novi;

    upit:=' UPDATE clanovi SET Duzan='+CurrToStr(z)+' WHERE sifra='+IntToStr(Clan);

    if biljezi then upit:=upit+';'+#13+
    ' INSERT INTO dnev (Dogodilose, Datum, Radnik, Clan, Br1, Br2, SifraKluba)'+
    ' VALUES (3, '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+VRadnik+''', '+
    IntToStr(Clan)+', '+FloatToStr(i)+', '+FloatToStr(j)+', '+IntToStr(SifraKluba)+');';

    try
        ShareUnit.UpitOpen(Podaci.myQuery1, upit, True, False)
    except
    on E: Exception do
        begin
//            Loguj(myQuery1, '::Error - TPodaci.SrediSaldo: '+E.Message, True);
        End;
    End;
End;

Procedure TPodaci.NaplatiClanarinu(vClan,vPopust:Integer);
Var pa: Integer;
    VrijediDo: Tdate;
    IznosClanarine: Currency;
    sljedeci, rac_master: String;
begin
  tVrstePlacanja.Close; // naði default vrstu plaèanja
  tVrstePlacanja.Open;
  tVrstePlacanja.LocateRecord('NazivPlacanja', IntToStr(VrstaPlacanja), [], True);

  Application.CreateForm(TFClanarinaDlg,FClanarinaDlg);
  FClanarinaDlg.CurrencyEdit1.Value := Podaci.tabSetUp.FieldByName('IznosClanarine').Value;
  pa := FClanarinaDlg.Showmodal;
  IznosClanarine := FClanarinaDlg.CurrencyEdit1.Value;
  VrijediDo := FClanarinaDlg.DOdatuma.date;

  If (pa = mrAbort) or (pa = mrCancel) then
  begin
    Application.CreateForm(TFPlatioJeDlg,FPlatioJeDlg);
    FPlatioJeDlg.CurrencyEdit1.Value := IznosClanarine;
    If FPlatioJeDlg.Showmodal = mrOk then SrediSaldo(vClan, 0, IznosClanarine-FPlatioJeDlg.Platio.Value);
    FPlatioJeDlg.Release;
  End;
  FClanarinaDlg.Release;

    try
        ShareUnit.UpitOpen(Podaci.myQuery1,
        ' UPDATE clanovi SET ClanarinaVrijediDo='''+FormatDateTime('yyyy-mm-dd',VrijediDo)+''''+
        ' WHERE sifra='+IntToStr(vClan), True, False);

        // napravi novi RAÈUN
        // naði sljedeæi broj raèuna
        FVracanjeDlg.qMaxRacun.TableName:='racuni';
        FVracanjeDlg.qMaxRacun.ParamByName('SifraKluba').AsInteger:=SifraKluba;
        FVracanjeDlg.qMaxRacun.Open;
        if FVracanjeDlg.qMaxRacun.FieldByName('racun').IsNull then sljedeci:='1' else
            sljedeci:=FVracanjeDlg.qMaxRacun.FieldByName('racun').Asstring;
        FVracanjeDlg.qMaxRacun.Close;
        rac_master:=ShareUnit.PopuniXljevo(IntToStr(SifraKluba),'0',2)+'-'+ShareUnit.PopuniXljevo(sljedeci,'0',6);

        ShareUnit.UpitOpen(Podaci.myQuery1,
        ' INSERT INTO racuni '+
        ' (SifraKluba, BrojRacuna, VrstaRacuna, Datum, Radnik, SifraClana, Popust, Cifra, StopaPoreza, Duzan, VrstaPlacanja)'+
        ' VALUES ('+IntToStr(SifraKluba)+', '''+rac_master+''','+
        ' 2, '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+VRadnik+''', '+IntToStr(vClan)+','+
        ' '+IntToStr(vPopust)+', '+CurrToStr(IznosClanarine)+','+
        ' '+Podaci.tabSetUp.FieldByName('IznosPoreza').AsString+','+
        ' '+ImeCl(vClan, 4)+','+
        ' '+IntToStr(Podaci.tVrstePlacanja.FieldByName('Sifra').AsInteger)+')', True, False);

        if TabSetUp.FieldByName('postojiprinterracuni').AsString='D' then IspRacun(rac_master);
    except
        on E: Exception do
        begin
//            Loguj(Podaci.myQuery1, '::Error - TPodaci.NaplatiClanarinu: '+E.Message, True);
        end;
    End;
End;

procedure IspRacun(broj_racuna: String);
begin
    Podaci.PripremiPrinter(False);
    try
        Podaci.NacrtajRacun(broj_racuna);
        if not Podaci.qRacuni.IsEmpty then
            Podaci.NaKraju(False, False, 1);
    finally
        Podaci.qRacuni.Close;
        closefile(lst);
    end;
End;

Procedure TPodaci.NacrtajRacun(broj_racuna:String);
var a:Double;
begin
//    RNzaglavlje:='RAÈUN BROJ : ';

    qRacuni.Close;
    qRacuni.TableName:='racuni';
    qRacuni.MacroByName('KLUB').AsString:=IntToStr(SifraKluba);
    qRacuni.ParamByName('BROJ').AsString:=''''+broj_racuna+'''';
    qRacuni.Open;
    if not qRacuni.IsEmpty then
    begin
        qRacuniDet.Close;
        qRacuniDet.TableName:='racunidetail';
        qRacuniDet.MacroByName('SIFRAMASTER').AsString:=qRacuni.FieldByName('Sifra').AsString;
        qRacuniDet.Open;

        Zaglavlje(DateToStr(qRacuni.FieldByName('datum').AsDateTime));
// vsratRacuna = 3 je storno raèun

        if qRacuni.FieldByName('VrstaRacuna').Value = 3 then
            WriteLn(Lst,ShareUnit.CenterStr(sstr(RNzaglavlje+' '+qRacuni.FieldByName('brojracuna').AsString+'   --> STORNO'),40))
        else WriteLn(Lst,ShareUnit.CenterStr(sstr(RNzaglavlje+' '+qRacuni.FieldByName('brojracuna').AsString),40));

        writeln(lst, ImeCl(qRacuni.FieldByName('SifraClana').AsInteger, 0));
        case qRacuni.FieldByName('VrstaRacuna').Value of
        2:  begin// èlanarine
                writeln(lst,#13#10#10);
                writeln(lst,sstr('Naplata èlanarine u iznosu:'),Format('%m', [qRacuni.FieldByName('Cifra').asFloat]):10,' Kn' );
                writeln(lst,StringOfChar('-', 40));
                writeln(lst,'SVEUKUPNO:':27,Format('%m', [qRacuni.FieldByName('Cifra').asFloat]):10,' Kn');

//                if TabSetUp.FieldByName('ObveznikPDV').AsString='D' then
                    if TabSetUp.FieldByName('IznosPoreza').AsInteger>0 then
                    // izraèunavanje ukupno PDV-a=A-(A/(1+(PDV/100)))
                        writeln(lst,sstr('Uraèunat PDV '+TabSetUp.FieldByName('IznosPoreza').AsString+'%:'):27,Format('%m',
                        [(qRacuni.FieldByName('Cifra').asFloat-(qRacuni.FieldByName('Cifra').asFloat/(1+(TabSetUp.FieldByName('IznosPoreza').AsInteger/100))))]):10,' Kn');

                writeln(lst,'Radnik : '+sstr(qRacuni.FieldByName('Radnik').AsString));
                if (IdeSaldoRacun) and (StanjeSalda<>0) then writeln(lst,sstr('Trenutni saldo èlana:'):21,Format('%m', [StanjeSalda]):12);
            End;

        4:  begin // DUGOVANJE
                writeln(lst,#13#10#10);
                writeln(lst,sstr(vTextDugovanja+':'):27,Format('%m', [qRacuni.FieldByName('Cifra').asFloat]):10,' Kn' );

                // naði broj raèuna po šifri raèuna
                ShareUnit.UpitOpen(Podaci.myQuery2,
                ' SELECT brojracuna FROM racuni WHERE sifra='+qRacuni.FieldByName('Popust').asString
                , True, True);

                if qRacuni.FieldByName('Popust').asInteger <> 0 then
                    writeln(lst,sstr('(po raèunu broj: '+myQuery2.FieldByName('brojracuna').AsString+')'):27);

                writeln(lst,StringOfChar('-', 40));
                writeln(lst,'SVEUKUPNO:':27,Format('%m', [qRacuni.FieldByName('Cifra').asFloat]):10,' Kn');

//                if TabSetUp.FieldByName('ObveznikPDV').AsString='D' then
                    if TabSetUp.FieldByName('IznosPoreza').AsInteger>0 then
                    // izraèunavanje ukupno PDV-a
                        writeln(lst,sstr('Uraèunat PDV '+TabSetUp.FieldByName('IznosPoreza').AsString+'%:'):27,Format('%m',
                        [(qRacuni.FieldByName('Cifra').asFloat-(qRacuni.FieldByName('Cifra').asFloat/(1+(TabSetUp.FieldByName('IznosPoreza').AsInteger/100))))]):10,' Kn');

                writeln(lst,'Radnik : '+sstr(qRacuni.FieldByName('Radnik').asstring));
                if (IdeSaldoRacun) and (StanjeSalda<>0) then writeln(lst,sstr('Trenutni saldo èlana:'):21,Format('%m', [StanjeSalda]):12);
            End;

        5:  begin // NAPLATA PO UGOVORU
                writeln(lst,#13#10#10);
                writeln(lst,sstr(vTextDugovanjaUgovor+':'):27,Format('%m', [qRacuni.FieldByName('Cifra').asFloat]):10,' Kn' );

                if qRacuni.FieldByName('Popust').asInteger <> 0 then
                    writeln(lst,sstr('(po ugovoru broj: '+qRacuni.FieldByName('Popust').asString+')'):27);

                writeln(lst,StringOfChar('-', 40));
                writeln(lst,'SVEUKUPNO:':27,Format('%m', [qRacuni.FieldByName('Cifra').asFloat]):10,' Kn');

//                if TabSetUp.FieldByName('ObveznikPDV').AsString='D' then
                    if TabSetUp.FieldByName('IznosPoreza').AsInteger>0 then
                    // izraèunavanje ukupno PDV-a
                        writeln(lst,sstr('Uraèunat PDV '+TabSetUp.FieldByName('IznosPoreza').AsString+'%:'):27,Format('%m',
                        [(qRacuni.FieldByName('Cifra').asFloat-(qRacuni.FieldByName('Cifra').asFloat/(1+(TabSetUp.FieldByName('IznosPoreza').AsInteger/100))))]):10,' Kn');

                writeln(lst,'Radnik : '+sstr(qRacuni.FieldByName('Radnik').asstring));
                if (IdeSaldoRacun) and (StanjeSalda<>0) then writeln(lst,sstr('Trenutni saldo èlana:'):21,Format('%m', [StanjeSalda]):12);
            End;

        6:  begin // osiguranje od uništenja
                writeln(lst,#13#10#10);
                writeln(lst,sstr('Naplata godišnje naknade za'));
                writeln(lst,sstr('uništene i ošteæene medije:'),Format('%m', [qRacuni.FieldByName('Cifra').asFloat]):10,' Kn' );
                writeln(lst,StringOfChar('-', 40));
                writeln(lst,'SVEUKUPNO:':27,Format('%m', [qRacuni.FieldByName('Cifra').asFloat]):10,' Kn');

//                if TabSetUp.FieldByName('ObveznikPDV').AsString='D' then
                    if TabSetUp.FieldByName('IznosPoreza').AsInteger>0 then
                    // izraèunavanje ukupno PDV-a
                        writeln(lst,sstr('Uraèunat PDV '+TabSetUp.FieldByName('IznosPoreza').AsString+'%:'):27,Format('%m',
                        [(qRacuni.FieldByName('Cifra').asFloat-(qRacuni.FieldByName('Cifra').asFloat/(1+(TabSetUp.FieldByName('IznosPoreza').AsInteger/100))))]):10,' Kn');

                writeln(lst,'Radnik : '+sstr(qRacuni.FieldByName('Radnik').asstring));
                if (IdeSaldoRacun) and (StanjeSalda<>0) then writeln(lst,sstr('Trenutni saldo èlana:'):21,Format('%m', [StanjeSalda]):12);
            End;


      1,3:  Begin // 1- Normalni raèun   3- Normalni raèun STORNO
                writeln(lst,StringOfChar('-', 40));
                writeln(lst,'Dat.pos.    Naziv filma');
                writeln(lst,'  broj dana       cijena       Ukupno Kn');
                writeln(lst,StringOfChar('-', 40));

                qRacuniDet.First;
                a:=0;
                while not qRAcuniDet.Eof do
                begin
                    writeln(lst,DateToStr(qRacuniDet.fieldByname('DatumPos').value)+'  '+
                        NazivFilma(qRacuniDet.fieldByname('SifraKazete').AsString, False));

                    if qRacuniDet.FieldByName('brDan').asInteger > 0 then
                        writeln(lst,IntToStr(qRacuniDet.fieldByname('BrDAn').asinteger):10,
                                Format('%m', [qRacuniDet.FieldByName('Dan').asFloat]):14,
                                Format('%m', [qRacuniDet.fieldByname('BrDAn').asinteger * qRacuniDet.FieldByName('Dan').asFloat]):16);

                    if qRacuniDet.FieldByName('brSvaki').asInteger > 0 then
                        writeln(lst,IntToStr(qRacuniDet.fieldByname('BrSvaki').asinteger):10,
                                Format('%m', [qRacuniDet.FieldByName('Svaki').asFloat]):14,
                                Format('%m', [qRacuniDet.fieldByname('BrSvaki').asinteger * qRacuniDet.FieldByName('Svaki').asFloat]):16);

                    if qRacuniDet.FieldByName('brVikend').asInteger > 0 then
                        writeln(lst,IntToStr(qRacuniDet.fieldByname('BrVikend').asinteger):10,
                                Format('%m', [qRacuniDet.FieldByName('Vikend').asFloat]):14,
                                Format('%m', [qRacuniDet.fieldByname('BrVikend').asinteger * qRacuniDet.FieldByName('Vikend').asFloat]):16);

                    if qRacuniDet.FieldByName('brBlagdan').asInteger > 0 then
                        writeln(lst,IntToStr(qRacuniDet.fieldByname('BrBlagdan').asinteger):10,
                                Format('%m', [qRacuniDet.FieldByName('Blagdan').asFloat]):14,
                                Format('%m', [qRacuniDet.fieldByname('BrBlagdan').asinteger * qRacuniDet.FieldByName('Blagdan').asFloat]):16);

                    a:=a+qRacuniDet.fieldByname('BrDAn').asinteger * qRacuniDet.FieldByName('Dan').asFloat+
                        qRacuniDet.fieldByname('BrSvaki').asinteger * qRacuniDet.FieldByName('Svaki').asFloat+
                        qRacuniDet.fieldByname('BrVikend').asinteger * qRacuniDet.FieldByName('Vikend').asFloat+
                        qRacuniDet.fieldByname('BrBlagdan').asinteger * qRacuniDet.FieldByName('Blagdan').asFloat;

                    qRacuniDet.next;
                End;
                writeln(lst,StringOfChar('-', 40));
                writeln(lst,'Popust':17,
                       Format('%m', [qRacuni.FieldByName('Popust').asFloat])+' % -':11,
                       Format('%m', [a-qRacuni.FieldByName('Cifra').asFloat]):12);
                writeln(lst,StringOfChar('-', 29):40);
                writeln(lst,leftStr('Radnik : '+sstr(qRacuni.FieldByName('Radnik').AsString),15),
                       'SVEUKUPNO:':13,Format('%m', [qRacuni.FieldByName('Cifra').asFloat]):12);

//                if TabSetUp.FieldByName('ObveznikPDV').AsString='D' then
                    if TabSetUp.FieldByName('IznosPoreza').AsInteger>0 then
                    // izraèunavanje ukupno PDV-a
                        writeln(lst,sstr('Uraèunat PDV '+TabSetUp.FieldByName('IznosPoreza').AsString+'%:'):27,Format('%m',
                        [(qRacuni.FieldByName('Cifra').asFloat-(qRacuni.FieldByName('Cifra').asFloat/(1+(TabSetUp.FieldByName('IznosPoreza').AsInteger/100))))]):10,' Kn');

                if (IdeSaldoRacun) and (StanjeSalda<>0) then writeln(lst,sstr('Trenutni saldo èlana:'):21,Format('%m', [StanjeSalda]):12);
            End;
        End;
        qRacuniDet.Close;
    End else ShowMessage('Raèun broj '+broj_racuna+' nepostoji!');
//    qRacuni.Close;
End;

Function TPodaci.NazivFilma(upit:String; bc:boolean):String;
Begin
    if bc then
        ShareUnit.UpitOpen(myQuery1,'SELECT k.Naziv FROM kazete k, bcodekazete b WHERE k.sifra=b.sifrakazete AND k.barcode='''+upit+''''
        , True, False)
    else
        ShareUnit.UpitOpen(myQuery1,'SELECT Naziv FROM kazete WHERE Sifra='+upit, True, False);
    Result:=sstr(myQuery1.FieldByName('Naziv').AsString);
End;

Function TPodaci.ImeCl(br, odakle:Integer):String;
Begin
    Result := 'Èlan: ';
    varAdresaCl := 'Adresa: ';

    ShareUnit.UpitOpen(myQuery1,'SELECT ImePrezime, Adresa, Duzan, MjStanovanja FROM clanovi WHERE Sifra='+IntToStr(br), True, False);

    if (odakle = 0) and (TabSetUp.FieldByName('ImeNaRacunu').Value='D') then
        Result:=Result +'('+inttostr(br)+')  '+myQuery1.FieldByName('ImePrezime').asstring
    else if odakle = 2 then // za potvrdu: br.èlana+ImePrezime + trim na 40
        begin
            Result:='Èlan: '+IntToStr(br)+' '+myQuery1.FieldByName('ImePrezime').AsString;
            SetLength(Result,40);
        end
    else if odakle = 3 then // za èisto ime èlana
        Result:=myQuery1.FieldByName('ImePrezime').asstring
    else if odakle = 4 then // za dugovanje (saldo) èlana
        Result:=FloatToStr(myQuery1.FieldByName('Duzan').AsCurrency)
    Else Result := 'Èlan broj : '+inttostr(br);

    varAdresaCl := sstr(varAdresaCl+myQuery1.FieldByName('Adresa').asstring+', '+myQuery1.FieldByName('MjStanovanja').asstring);
    StanjeSalda := myQuery1.FieldByName('Duzan').asCurrency;

    if odakle<>3 then Result := sStr(Result);  // promjeni kodnu stranicu
End;

Function TPodaci.Naplata(DataSet: TDataSet; Cijenik:Integer; barCode: String; datPos:TDateTime):Currency;
begin
    case KojaNaplata of
        1: Result:=Naplata1(DataSet, Cijenik, barCode, datPos);
        2: Result:=Naplata2(DataSet, Cijenik, barCode, datPos);
        else
        begin
            ShowMessage('Parametri naplate nisu ispravni!!!!');
            Application.Terminate;
        end;
    end;
end;

Function TPodaci.Naplata1(DataSet: TDataSet; Cijenik:Integer; barCode: String; datPos:TDateTime):Currency;
var PrviDan, NaredniDani, BrojBlagdana, BrojVikenda, Razlika, brputa: Integer;
    pv, podan: Integer;
    vNijeGot: Boolean;
    vDatPos: TDateTime;
Begin
    if DataSet <> nil then vDatPos := DataSet.FieldByName('DatumPos').Value
    Else vDatPos := datPos;

    PrviDan := 0;
    NaredniDani := 0;
    BrojVikenda := 0;
    brojBlagdana := 0;
    Razlika := DaysInPeriod(Date, vDatPos) -1;

 // ako je danas nedjelja povecaj razliku kao da vraca u ponedjeljak
    if DayOfWeek(date) = 1 then inc(razlika);

    if TabSetUp.FieldByName('VikendJe').AsInteger = 1 then
        Pv := 5  // vikend je PETAK - NEDJELJA
    Else
        Pv := 6; // vikend je SUBOTA - NEDJELJA
    vnijegot := True;
    brputa := 0;

//---------------------------------------------------------------------------
// naplata sa SUB na NED
// ShowMessage(inttostr(razlika));
    If (razlika = 0) OR (razlika = 1) then PrviDan := 1
    ELSE
    begin
     // ako je datum posudbe unutar datuma blagdana tada
//    if vDatPos <> TabSetUp.FieldByName('BlagdanDo').Value then ;

        IF (vDatPos >= TabSetUp.FieldByName('BlagdanOd').Value) and (vDatPos <= TabSetUp.FieldByName('BlagdanDo').Value) then
        begin
            inc(BrojBlagdana);
            vDatPos := TabSetUp.FieldByName('BlagdanDo').Value;
            if vDatPos < date then
                Razlika := DaysInPeriod(Date, vDatPos) -1
            Else
                razlika := 0;
        End;

        if razlika <> 0 then
        begin
            Podan := DayOfWeek(vDatPos) - 1;
            IF Podan < Pv then
            begin
                inc(Podan);
                dec(Razlika);
                Prvidan := 1;
                inc(brputa);
            End
            Else
                if (Razlika < 5) and (DayOfWeek(date) = 1) then
                begin
                  //inc(Podan); Razlika := Razlika - 1; Prvidan := 1; inc(brputa);
                End;

            WHILE vnijegot and (razlika > 0) do
            begin
                if vdatpos + brputa = TabSetUp.FieldByName('BlagdanOd').Value then
                begin
                    inc(BrojBlagdana);
                    Razlika := Razlika - (TabSetUp.FieldByName('BlagdanDo').Value - TabSetUp.FieldByName('BlagdanOd').Value);
                    if razlika <> 0 then
                    begin
                        Podan:= DayOfWeek(TabSetUp.FieldByName('BlagdanDo').Value);
                        dec(Podan);
                    End;
                    inc(BRPUTA);
                End
                else
                begin
                    CASE podan of
                      0:    begin  // OVO JE NEDJELJA
                               If TabSetUp.FieldByName('VikendJe').asinteger = 1 then
                                    Narednidani:=Narednidani-2
                               Else
                               IF TabSetUp.FieldByName('VikendJe').asinteger = 2 then
                               begin
                                    dec(Narednidani);
                               end;
                               If NaredniDani < 0 then narednidani:=0;
                               inc(BrojVikenda);
                             End;
                      1,2,3,4,5,6: Inc(narednidani);
                    END; //end case
                    dec(Razlika);
                    inc(brputa);
                    IF poDan = 6 then PoDan := 0 ELSE inc(PoDan); // daj sljedeæi dan
                End; // else begin
                IF razlika = 0 then vnijegot := False;
            End;   // END DO
        end;
    End;
//---------------------------------------------------------------------------
// confirm('Prvi dan '+inttostr(PrviDan)+#13+'Naredni dan '+inttostr(NaredniDani)+#13+'Vikenda  '+inttostr(BrojVikenda) );

    ShareUnit.UpitOpen(myQuery1,
    ' SELECT c.Dan, c.Svaki, c.Vikend, c.Blagdan'+
    ' FROM bcodekazete b, cijene c'+
    ' WHERE b.BarCode='''+barCode+''''+
//    ' AND b.sifra_videokluba='+IntToStr(SifraKluba)+
    ' AND c.kategorija=b.kategorija'+
    ' AND c.cijenik='+IntToStr(Cijenik), True, True);

    if not myQuery1.IsEmpty then
        Result:=(PrviDan*myQuery1.FieldByName('Dan').AsCurrency)+
                (NaredniDani*myQuery1.FieldByName('Svaki').AsCurrency)+
                (BrojVikenda*myQuery1.FieldByName('Vikend').AsCurrency)+
                (BrojBlagdana*myQuery1.FieldByName('Blagdan').AsCurrency)
        else Result:=0;

//    ShowMessage(CurrToStr(Result));

    if DataSet <> nil then // ako je iz Reporta onda ne bilježi u POS
    begin
        ShareUnit.UpitOpen(myQuery1,
        ' UPDATE pos SET CijenaDan='+myQuery1.FieldByName('Dan').AsString+','+
        ' CijenaSvaki='+myQuery1.FieldByName('Svaki').AsString+','+
        ' CijenaVikend='+myQuery1.FieldByName('Vikend').AsString+','+
        ' CijenaBlagdan='+myQuery1.FieldByName('Blagdan').AsString+','+
        ' PrviDan='+IntToStr(PrviDan)+','+
        ' Naredni='+IntToStr(NaredniDani)+','+
        ' Vikenda='+IntToStr(BrojVikenda)+','+
        ' Blagdana='+IntToStr(BrojBlagdana)+','+
        ' Iznos='+CurrToStr(Result)+
        ' WHERE bcodekaz='''+barCode+'''', True, False);
    End;

    if TestNaplata then
    begin
        LogirajNaplatu('_'+barCode+'='+CurrToStr(Result)+'___________________________________DatPos='+DataSet.FieldByName('DatumPos').AsString+'___');
        LogirajNaplatu('STARA -> PRVI DAN='+ShareUnit.PopuniXljevo(IntToStr(PrviDan),' ',3)
            +' | NAREDNI DAN='+ShareUnit.PopuniXljevo(IntToStr(NaredniDani),' ',3)
            +' | BROJ BLAGDANA='+ShareUnit.PopuniXljevo(IntToStr(BrojBlagdana),' ',3)
            +' | BROJ VIKENDA='+ShareUnit.PopuniXljevo(IntToStr(BrojVikenda),' ',3));
//        Naplata2(DataSet, Cijenik, barCode, DataSet.FieldByName('DatumPos').AsDateTime);
    end;
End;

Function TPodaci.Naplata2(DataSet: TDataSet; Cijenik:Integer; barCode: String; datPos:TDateTime):Currency;
var PrviDan, NaredniDani, BrojBlagdana, BrojVikenda: Integer;
    DuzinaVikenda, brputa, RazlikaDana, TrenutniDan, i: Integer;
    NijeGotovo, Blagdan: Boolean;
    DatumPosudbe, TrenutniDatum: TDateTime;
    TimeLine: Array of string;
    rezultat, dani: String;
begin
    // postavi poèetne vrijednosti
    if DataSet = nil then
        DatumPosudbe:=datPos
    Else
        DatumPosudbe:=DataSet.FieldByName('DatumPos').AsDateTime;

    TrenutniDatum:=DatumPosudbe;
    PrviDan:=0;
    NaredniDani:=0;
    BrojBlagdana:=0;
    BrojVikenda:=0;
    RazlikaDana:=0;

    if TabSetUp.FieldByName('VikendJe').AsInteger = 1 then
        DuzinaVikenda:=5  // vikend je PETAK - NEDJELJA
    Else
        DuzinaVikenda:=6; // vikend je SUBOTA - NEDJELJA


    if DatumPosudbe>Now then
    begin
        NijeGotovo:=False;
        ShowMessage('Nešto nevalja sa datumom posudbe ('+DateTimeToStr(DatumPosudbe)+') i vraèanja ('+DateTimeToStr(Now)+')!!!');
    end
    else
    begin
        RazlikaDana:=DaysInPeriod(Date, DatumPosudbe)-1;
//ShowMessage(DateToStr(DatumPosudbe)+'-'+DateToStr(Date));
    end;

    SetLength(TimeLine,RazlikaDana+1);

    case RazlikaDana of
        0: // isti dan posudbe i vraèanja
        begin
            NijeGotovo:=False;
            TimeLine[0]:='1';
        end;

        1: // samo jedan dan držan film
        begin
            NijeGotovo:=False;
            TimeLine[0]:='-';
            TimeLine[1]:='D';
        end;

        else
        begin
            TimeLine[0]:='-';
            TimeLine[1]:='D';
            NijeGotovo:=True;
        end;
    end; // end case

    TrenutniDatum:=IncDay(TrenutniDatum,1); // TrenutniDatum kasni jedan dan za TimeLine[i]

    if NijeGotovo then
    begin
        For i:=2 to High(TimeLine) do
        begin
            if (DayOfWeek(TrenutniDatum)=1) or (DayOfWeek(TrenutniDatum)=7) then
            begin
                if (TimeLine[i-1]='B') and DaLiJeBlagdan(IncDay(TrenutniDatum,-1))
                    and (DayOfWeek(IncDay(TrenutniDatum,-1))=6) then // u PET bio BLAGDAN?
                begin
                    TimeLine[i]:='D';
                end
                else
                begin
                    TimeLine[i-1]:='-';
                    TimeLine[i]:='V';
                end;
            end
            else
                TimeLine[i]:='D';

            if DaLiJeBlagdan(TrenutniDatum) then  // BLAGDAN dan ranije?
            begin
                case DayOfWeek(TrenutniDatum) of
                2: // PONEDJELJAK
                    begin
                        if BlagdanVikendu then
                        begin
                            TimeLine[i-1]:='-';
                            TimeLine[i]:='V';
                        end;
                    end;

                3,4,5,6: // UTO, SRI, ÈET, PET
                    begin
                        TimeLine[i-1]:='-';
                        TimeLine[i]:='B';
                    end;
                end; // end case
            end;

            TrenutniDatum:=IncDay(TrenutniDatum,1);
        end; // end For
    end;

    rezultat:='';
    For i:=0 to High(TimeLine) do
    begin
        rezultat:=rezultat+TimeLine[i];
        if TimeLine[i]='1' then Inc(PrviDan)
        else if TimeLine[i]='D' then Inc(NaredniDani)
        else if TimeLine[i]='B' then Inc(BrojBlagdana)
        else if TimeLine[i]='V' then Inc(BrojVikenda);
    end;

    dani:='';
    if DataSet = nil then
        DatumPosudbe:=datPos
    Else
        DatumPosudbe:=DataSet.FieldByName('DatumPos').AsDateTime;
    For i:=0 to RazlikaDana do
    begin
        //ShowMessage(DateTimeToStr(TrenutniDatum));
        case DayOfWeek(TrenutniDatum) of
        3: dani:=dani+'N';
        4: dani:=dani+'P';
        5: dani:=dani+'U';
        6: dani:=dani+'S';
        7: dani:=dani+'È';
        1: dani:=dani+'P';
        2: dani:=dani+'S';
        end;
        TrenutniDatum:=IncDay(TrenutniDatum,1);
    end;

    ShareUnit.UpitOpen(myQuery1,      // naði cjenik
    ' SELECT c.Dan, c.Svaki, c.Vikend, c.Blagdan'+
    ' FROM bcodekazete b, cijene c'+
    ' WHERE b.BarCode='''+barCode+''''+
//    ' AND b.sifra_videokluba='+IntToStr(SifraKluba)+
    ' AND c.kategorija=b.kategorija'+
    ' AND c.cijenik='+IntToStr(Cijenik), True, True);

    if not myQuery1.IsEmpty then
        Result:=(PrviDan*myQuery1.FieldByName('Dan').AsCurrency)+
                (NaredniDani*myQuery1.FieldByName('Svaki').AsCurrency)+
                (BrojVikenda*myQuery1.FieldByName('Vikend').AsCurrency)+
                (BrojBlagdana*myQuery1.FieldByName('Blagdan').AsCurrency)
        else Result:=0;

    if DataSet <> nil then // ako je iz Reporta onda ne bilježi u POS
    begin
        ShareUnit.UpitOpen(myQuery1,
        ' UPDATE pos SET CijenaDan='+myQuery1.FieldByName('Dan').AsString+','+
        ' CijenaSvaki='+myQuery1.FieldByName('Svaki').AsString+','+
        ' CijenaVikend='+myQuery1.FieldByName('Vikend').AsString+','+
        ' CijenaBlagdan='+myQuery1.FieldByName('Blagdan').AsString+','+
        ' PrviDan='+IntToStr(PrviDan)+','+
        ' Naredni='+IntToStr(NaredniDani)+','+
        ' Vikenda='+IntToStr(BrojVikenda)+','+
        ' Blagdana='+IntToStr(BrojBlagdana)+','+
        ' Iznos='+CurrToStr(Result)+
        ' WHERE bcodekaz='''+barCode+'''', True, False);
    End;

    if TestNaplata then
    begin
        LogirajNaplatu('_'+barCode+'='+CurrToStr(Result)+'_____DatPos='+DataSet.FieldByName('DatumPos').AsString+'___');
        LogirajNaplatu(dani);
        LogirajNaplatu(rezultat);
    end;

end;

procedure TPodaci.NaKraju(Ekran, IzPregleda:Boolean; IspisujeSe:Integer);
Var i:Integer;
    dug_mj, placeno_rata, iznos_rate, placeno: Currency;
Begin
    if IdeSaldoRacun then  // podaci o saldu od plaèanja èlanarina
    begin
      try
        iznos_rate:=FKartica.qDajVrstuUgovora.FieldByName('IznosUgovora').AsCurrency/12;
        placeno:=FKartica.qDajVrstuUgovora.FieldByName('placeno').AsCurrency;
        placeno_rata:=placeno/iznos_rate;
        dug_mj:=MonthSpan(FKartica.qDajVrstuUgovora.FieldByName('Datum').AsDateTime, Now);
        if dug_mj>(12-placeno_rata) then dug_mj:=(12-placeno_rata);

        writeln(lst,'Trenutni saldo:', Format('%m', [FKartica.qClan.FieldByName('Duzan').AsFloat]):10,' Kn');
        writeln(lst,'Plaèeno:', Format('%m', [placeno]):10,' Kn');
        if dug_mj>placeno_rata then writeln(lst,'Molimo vas da platite '+CurrToStr(dug_mj)+' zaostalu ratu.');
        WriteLn(Lst,'');
      except
      end;
    end;

    if IspisujeSe = 1 then // zadnji redovi na raèunu iz setup tablice
    begin
        if TabSetUp.FieldByName('Zadnji1').AsString <> '' then
            WriteLn(Lst,ShareUnit.CenterStr(sstr(TabSetUp.FieldByName('zadnji1').AsString),40));
        if TabSetUp.FieldByName('Zadnji2').AsString <> '' then
            WriteLn(Lst,ShareUnit.CenterStr(sstr(TabSetUp.FieldByName('zadnji2').AsString),40));
    End;

    if ekran or IzPregleda then
    begin
        WriteLn(Lst,'');
        WriteLn(Lst,ShareUnit.CenterStr('- - - - - - - - -',40));
        WriteLn(Lst,'');
        WriteLn(Lst,'');
        WriteLn(Lst,'');
        WriteLn(Lst,'');
        WriteLn(Lst,'');
    End
    Else
    begin
        if KojiStroj=0 then
        begin
            case TabSetUp.FieldByName('RacuniNa').Value of
                1: Begin      //EPSON TM 300
                     WriteLn(Lst,#13+#10+#10+#10+#10+#10+#10+#10+#10+#10);
                     WriteLn(Lst,#27+'i');
                     if IspisujeSe = 1 then //ako se ipisuje racun otvori ladicu
                          if TabSetUp.FieldByName('Ladica').Value='D' then
                              if TabSetUp.FieldByName('PinZaKasu').Value = 2 then Write(Lst,#27+'p'+#0+#50+#200)
                              Else Write(Lst,#27+'p'+#1+#50+#200)
                   End;
                0: Begin      //matrièni A4
                     if TabSetUp.FieldByName('BrojRazmaka').Value = 0 then Write(Lst,#27#12) //EJECT
                     Else For i := 1 to TabSetUp.FieldByName('BrojRazmaka').asinteger do WriteLn(Lst,'');
                   End;
                2: Begin      //STAR SP 200
                     For i := 1 to 8 do WriteLn(Lst,'');
                     if TabSetUp.FieldByName('Ladica').Value='D' then Write(Lst,#27+#7)
                   End;
            End;
        END
        else
        begin
            case TabSetUp.FieldByName('RacuniNa2').Value of
                1: Begin      //EPSON TM 300
                     WriteLn(Lst,#13+#10+#10+#10+#10+#10+#10+#10+#10+#10);
                     WriteLn(Lst,#27+'i');
                     if IspisujeSe = 1 then //ako se ipisuje racun otvori ladicu
                          if TabSetUp.FieldByName('Ladica').Value='D' then
                              if TabSetUp.FieldByName('PinZaKasu').Value = 2 then Write(Lst,#27+'p'+#0+#50+#200)
                              Else Write(Lst,#27+'p'+#1+#50+#200)
                   End;
                0: Begin      //matrièni A4
                     if TabSetUp.FieldByName('BrojRazmaka').Value = 0 then Write(Lst,#27#12) //EJECT
                     Else For i := 1 to TabSetUp.FieldByName('BrojRazmaka').asinteger do WriteLn(Lst,'');
                   End;
                2: Begin      //STAR SP 200
                     For i := 1 to 8 do WriteLn(Lst,'');
                     if TabSetUp.FieldByName('Ladica').Value='D' then Write(Lst,#27+#7)
                   End;
            End;
        end;
    End;
End;

procedure TPodaci.PripremiPrinter(Ekran:Boolean);
Begin
  if Ekran Then
  begin
//    if not FileExists('ispis.txt') then FileCreate('ispis.txt');
    assignfile(lst,'ispis.txt');
  end
  Else if KojiStroj=0 then AssignFile(lst, TabSetUp.FieldByName('Port').AsString)
        else AssignFile(lst, TabSetUp.FieldByName('Port2').AsString);
  rewrite(lst);
  if KojiStroj=0 then
  begin
    if TabSetUp.FieldByName('RacuniNa').Value = 0 then
    begin
        Write(Lst,#27#15); //condenz za A4 printer
        if TabSetUp.FieldByName('BrojRazmaka').Value = 0 then Write(Lst,#27+'C'+#24); //duljina stranice 24 reda
    End;
  end
  else
  begin
    if TabSetUp.FieldByName('RacuniNa2').Value = 0 then
    begin
        Write(Lst,#27#15); //condenz za A4 printer
        if TabSetUp.FieldByName('BrojRazmaka').Value = 0 then Write(Lst,#27+'C'+#24); //duljina stranice 24 reda
    End;
  end;
End;

// forma za PREGLED RAÈUNA ***********************************************************
Function TPodaci.daliide(koji:Integer;lab:String):Boolean;
begin
  if koji = 3 then Result := true
  Else Result := (FPregledDLG.ShowMpre(Lab) = mrOK);
End;

Procedure TPodaci.Pregled(koji:Integer);
Var lab,brra,stor:String;
    IzborKuda,Ekran,BiouX:Boolean;
Begin
  FPregledDLG.Label3.Visible := True; FPregledDLG.DatumDo.Visible := true;

  if KojiStroj=0 then Izborkuda := (Podaci.TabSetUp.FieldByName('Port').asString = 'LPT1')
  else Izborkuda := (Podaci.TabSetUp.FieldByName('Port2').asString = 'LPT1');

  FPregledDLG.Kuda.Visible := IzborKuda;
  if koji = 1 then lab := 'Pregled izdanih zaduženja za period.'
  Else begin
         lab := 'Pregled izdanih raèuna za period.';
//         if FileExists(ExtractFilePath(Application.ExeName)+'BAZEX\Racuni.db') then FPregledDLG.CheckBox1.Visible := True;
         FPregledDLG.CheckBox1.Checked := False;
         FPregledDLG.CheckBox2.Visible := True;
         FPregledDLG.CheckBox2.Checked := False;
       End;

  if DaLiIde(koji,lab) then

    if (koji = 2) or (koji = 3) then
    begin // pregled RAÈUNA
           brra := '';
           if koji = 3 then brra := inputbox('Broj raèuna','Upišite broj raèuna koji želite izlistati?','');
           try
             if FPregledDLG.CheckBox2.Checked then stor := ' and VrstaRacuna = 3'
             else stor :='';
             if koji = 3 then TRacuni.MacroByName('WHERE').AsString:='WHERE brojracuna='''+brra+''''
             else TRacuni.MacroByName('WHERE').AsString:='WHERE datum>='''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumOd.Date)+''''+
                                    ' and datum<='''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumDo.Date)+' 23:59:59'''
                                    +stor+' AND sifrakluba='+IntToStr(SifraKluba);
             TRacuni.Open;
             if TRacuni.RecordCount > 0 then
             begin
               Screen.Cursor := crHourglass;
               if izborKuda then Ekran := (FPregledDLG.Kuda.ItemIndex = 0)
               else Ekran := True;

               try
                 Podaci.PripremiPrinter(Ekran);
                 TRacuni.First;
                 while not TRacuni.Eof do
                 begin
                     Podaci.NacrtajRacun(TRacuni.FieldByName('brojracuna').AsString);
                     Podaci.NaKraju(Ekran,True,1);
                     TRacuni.Next;
                 End;
               Finally
                 closefile(lst);
                 Screen.Cursor := crDefault;
               End;
               if IzborKuda then
               begin
                    if Ekran then ShowDialog(TFPrikazEkranDLG);
               End else ShowDialog(TFPrikazEkranDLG);
             End else ShowMessage('Raèun broj '+brra+' nepostoji!');
           Finally
             TRacuni.Close;
             FPregledDLG.CheckBox1.Visible := False;
           End;
         End;   // end pregled raèuna
  FPregledDLG.CheckBox1.Visible := False;
  FPregledDLG.CheckBox2.Visible := False;
End;

Procedure TPodaci.Zakljuci(datum :TDate; Klub:integer; ImaDijalog: Boolean);
Var vN,vL,dN,dV:Currency;
    Redovi:TStrings;
    sada :String;
Begin
  sada:=FormatDateTime('yyyy-mm-dd', datum);
  TZak.Close;
  TZak.MacroByName('WHERE').AsString:='WHERE DATE(Datum)='''+sada+''' AND sifrakluba='+IntToStr(Klub);
  TZak.Open;

  if not TZak.IsEmpty then
  begin
    if ImaDijalog then
    begin
        if confirm('VAŽNA NAPOMENA !!!'+#13+#13+
               'Sa '+DateToStr(datum)+' datumom STANJE je veæ zakljuèeno u '+Timetostr(Tzak.FieldByname('Sati').Value)+' sati.'+#13+#13+
               'Da li želite ponovo zakljuèiti '+DateToStr(datum)+' dan?') then TZak.Edit
        Else exit;
    end
    else TZak.Edit;
  End
  Else
  begin
    if ImaDijalog then
    begin
        if confirm('Sa '+DateToStr(datum)+' datumom NEMA ZAKLJUÈENOG STANJA !!!'+#13+#13+
                   'Da li želite zakljuèiti '+DateToStr(datum)+' dan?') then TZak.Insert
        Else exit;
    end
    else TZak.Insert;
  end;

  Screen.Cursor := crHourglass;
  try
    Tzak.FieldByname('Datum').Value := sada;
    Tzak.FieldByname('Sati').Value  := IncSecond(now,1);
    Tzak.FieldByname('Radnik').Value := vRadnik;
    Tzak.FieldByname('StopaPoreza').Value := TabSetUp.FieldByName('IznosPoreza').Value;
    Tzak.FieldByname('SifraKluba').Value := IntToStr(klub);

    // izbroj upisanih èlanova
    ShareUnit.UpitOpen(myQuery1,'SELECT COUNT(*) komada FROM clanovi'+
        ' WHERE datumupisa='''+sada+''' AND KlubUpisa='+IntToStr(klub), False, True);
    Tzak.FieldByname('UpisanoClanova').AsInteger:=myQuery1.Fields[0].AsInteger;

    // vani je još KAZETA : Broj recorda u Pos - neraèunaj ako je unazad brojanje
//    if DateTimeToStr(datum)<>DateTimeToStr(Date) then // nema smisla ako se radi unazad
//    begin
//        ShareUnit.UpitOpen(myQuery1,'SELECT COUNT(*) komada FROM pos', False, True);
//        Tzak.FieldByname('VaniKazeta').AsInteger:=myQuery1.Fields[0].AsInteger;
//    end;

    // danas VRAÈENO kazeta : Date
    qKTemp1.ParamByName('Datum').AsString:=sada;
    qKTemp1.ParamByName('Klub').AsString:=IntToStr(klub);
    qKTemp1.Open;
    Tzak.FieldByname('Vraceno').AsInteger := qKTemp1.RecordCount;
    qKTemp1.Close;

    // IZDANO KAZETA : Date
    qTemp.ParamByName('Datum').AsString:=sada;
    qTemp.ParamByName('Klub').AsString:=IntToStr(klub);
    qTemp.Open;
    qKTemp2.ParamByName('Datum').AsString:=sada;
    qKTemp2.ParamByName('Klub').AsString:=IntToStr(klub);
    qKTemp2.Open;
    Tzak.FieldByname('izdano').AsInteger := qTemp.RecordCount+qKTemp2.RecordCount;
    qTemp.Close;
    qKTemp2.Close;
//------------------ NOVI SISTEM OBRADE ---------------------------------------------------------------------
    ShareUnit.UpitOpen(myQuery1,'SELECT * FROM medij', False, True);
    MemData.Open;
    MemData.LoadFromDataSet((myQuery1 as TDataSet));

     MemData.First;
     while not MemData.Eof do
     begin
          qkoi.ParamByName('Datum').AsString:=sada;
          qkoi.ParamByName('Medij').Value := MemDataSifra.Value;
          qkoi.ParamByName('Klub').Value := IntToStr(klub);

          qkoi2.ParamByName('Datum').AsString:=sada;
          qkoi2.ParamByName('Medij').Value := MemDataSifra.Value;
          qkoi2.ParamByName('Klub').Value := IntToStr(Klub);

          qPos.ParamByName('Datum').AsString:=sada;
          qPos.ParamByName('Medij').Value := MemDataSifra.Value;
          qPos.ParamByName('Klub').Value := IntToStr(klub);

          MemData.Edit;
// danas VRAÈENO iz KOI po MEDIJU
          qkoi.Open;
          MemDataVraceno.Value := qkoi.RecordCount;
// danas IZDANO iz KOI po MEDIJU
          qkoi2.Open;
// danas IZDANO iz POS po MEDIJU
          qPos.Open;
          MemDataIzdano.Value := qkoi2.RecordCount + qpos.RecordCount;

          MemData.Post;
          qkoi.Close;
          qPos.Close;
          qkoi2.Close;

          MemData.Next;
     End;
    try
      redovi := TStringList.Create;
      MemData.First;
      while not MemData.Eof do
      begin
          if MemDataIzdano.AsInteger+MemDataVraceno.AsInteger > 0 then
               Redovi.Add(MemDataNaziv.AsString+': izdano='+IntToStr(MemDataIzdano.AsInteger)+', vraceno='+IntToStr(MemDataVraceno.AsInteger));
          MemData.Next;
      End;
      Tzak.FieldByname('A1').Assign(redovi);
    finally
      redovi.Free;
      MemData.Close;
    End;
//------------------------------------------------------------------------------------------

    ShareUnit.UpitOpen(myQuery1,
    'SELECT Sifra, BrojRacuna, VrstaRacuna, Cifra FROM racuni '+
    'WHERE CAST(Datum AS DATE)='''+sada+''' AND SifraKluba='+IntToStr(Klub), False, True);
    myQuery1.First;

    vN := 0;
    while not myQuery1.Eof do
    begin
        // raèuni sa VrstaRacuna = 3 su storno i njih ne raèunaj u promet
         if myQuery1.FieldByName('VrstaRacuna').AsInteger <> 3 then
           vN := vN + myQuery1.FieldByName('Cifra').Value;
         myQuery1.Next;
    End;
    Tzak.FieldByname('ZbirRacuniL').Value := vN;
    myQuery1.First;
    Tzak.FieldByname('OdBroja').Value := myQuery1.FieldByName('BrojRacuna').Value;
    myQuery1.Last;
    Tzak.FieldByname('DoBroja').Value := myQuery1.FieldByName('BrojRacuna').Value;

    // baza DNEV
    ShareUnit.UpitOpen(myQuery1,
        'SELECT DogodiloSe, Br1, Br2 FROM dnev WHERE CAST(Datum AS DATE)='''+sada+''' AND SifraKluba='+IntToStr(klub), False, True);
    myQuery1.First;

    vl := 0;   dn := 0;    dV := 0;
    while not myQuery1.Eof do
    begin
         if myQuery1.FieldByName('DogodiloSe').AsInteger = 1 then
               vL := vL + myQuery1.FieldByName('Br1').Value
         Else if myQuery1.FieldByName('DogodiloSe').AsInteger = 3 then
               begin
                    dn := dn + myQuery1.FieldByName('Br2').Value;  // novi dugovi
                    dv := dv + myQuery1.FieldByName('Br1').Value;  // vraæanje duga
               End;
         myQuery1.Next;
    End;

    Tzak.FieldByname('StvorenoDuga').Value := dN;
    Tzak.FieldByname('VracenoDuga').Value := dv;
    Tzak.FieldByname('ZbirSviRacuni').Value := vN + vL;   // iznos raèuna +

    if TabSetUp.FieldByName('SaldaUtjecu').Value='D' then
        Tzak.FieldByname('BlagajnaKn').Value:=(vN+vL+dv)-dn
    Else
        Tzak.FieldByname('BlagajnaKn').Value:=(vN+vL);

    Tzak.FieldByname('BlagajnaDem').Value := Tzak.FieldByname('BlagajnaKn').Value / TabSetUp.FieldByName('tecajDem').Value;
  Finally
    Screen.Cursor := crDefault;
  End;
  Tzak.Post;
End;

Procedure TPodaci.IspisZaklj(koje:integer);
Var lab, sada: String;
    IzborKuda, Ekran, saldo: Boolean;
    a: Double;
    i: Integer;
Begin
  FPregledDLG.Label3.Visible := False;
  FPregledDLG.DatumDo.Visible := False;

  if KojiStroj=0 then Izborkuda := (Podaci.TabSetUp.FieldByName('Port').asString = 'LPT1')
  else Izborkuda := (Podaci.TabSetUp.FieldByName('Port2').asString = 'LPT1');

  FPregledDLG.Kuda.Visible := IzborKuda;
  if koje = 0 then lab := 'Ispis zakljuènice za datum.'
  Else lab := 'OBRADA DNEVNOG POSLOVANJA *';

  if FPregledDLG.ShowMpre(Lab) = mrOK then
  begin
     Dalibor := true;
     sada:=FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumOd.Date);

     TZak.Close;
     TZak.MacroByName('WHERE').AsString:='WHERE DATE(Datum)='''+sada+''' AND SifraKluba='+IntToStr(SifraKluba);
     TZak.Open;
     if not TZak.IsEmpty then
     begin
           if confirm('Sa datumom '+DateToStr(Tzak.FieldByname('Datum').Value)+' podaci su zakljuèeni u '+TimeToStr(Tzak.FieldByname('Sati').Value)+' sati.'+#13+#13+
                      'Da li želite ponovo zakljuèiti '+DateToStr(Tzak.FieldByname('Datum').Value)+' datum?') then Zakljuci(Date, SifraKluba, True);
     End
     Else
     begin
           if confirm('Datum '+DateTostr(FPregledDLG.DatumOd.date)+' NIJE ZAKLJUÈEN!!!'+#13+
                      'Da li želite zakljuèiti '+DateToStr(Tzak.FieldByname('Datum').Value)+' datum?') then Zakljuci(FPregledDLG.DatumOd.Date, SifraKluba, True);
           exit;
     End;

    Screen.Cursor := crHourglass;
    if izborKuda then Ekran := (FPregledDLG.Kuda.ItemIndex = 0)
    else Ekran := True;

    if koje = 0 then
    begin
           try
              Podaci.PripremiPrinter(Ekran);
              writeln(lst,ShareUnit.CEnterStr(StringOfChar('*', 20),40));
              WriteLn(Lst,ShareUnit.CEnterStr(sstr('*   ZAKLJUÈNICA    *'),40));
              writeln(lst,ShareUnit.CEnterStr(StringOfChar('*', 20),40));
              writeln(lst,'');
              Zaglavlje('');
              writeln(lst,'Stanje zakljuèeno : '+DateTostr(Tzak.FieldByname('Datum').Value)+'  '+
                           Timetostr(Tzak.FieldByname('Sati').Value)+#13+#10);
              writeln(lst,'DNEVO POSLOVANJE za '+DateTostr(FPregledDLG.DatumOd.date));
              writeln(lst,StringOfChar('-', 40));
              writeln(lst,'Blagajna DNEVNI PROMET :',Format('%m', [Tzak.FieldByName('ZbirRacuniL').asFloat])+' Kn':16);
              // Izraèun PDV-a
              a := Tzak.FieldByName('ZbirRacuniL').asFloat
                -(Tzak.FieldByName('ZbirRacuniL').asFloat * Tzak.FieldByName('StopaPoreza').Value / (100+Tzak.FieldByName('StopaPoreza').Value));

              if TabSetUp.FieldByName('IznosPoreza').AsInteger>0 then
              begin
                a := Tzak.FieldByName('ZbirRacuniL').asFloat/(1+(Tzak.FieldByName('StopaPoreza').Value/100));
                writeln(lst,'P D V iznosi           :',Format('%m', [Tzak.FieldByName('ZbirRacuniL').asFloat-a])+' Kn':16);
                writeln(lst,'UKUPNO BEZ POREZA      :',Format('%m', [a])+' Kn':16,#13+#10);
              end;

              writeln(lst,StringOfChar('-', 40));
              writeln(lst,ShareUnit.CEnterStr(sstr('Izdani RAÈUNI od broja:'),40));
              writeln(lst,ShareUnit.CEnterStr(Tzak.FieldByName('OdBroja').AsString+' do '+Tzak.FieldByName('DoBroja').AsString,40));
              writeln(lst,ShareUnit.CEnterStr(StringOfChar('*', 20),40));

//              if cross then
                    writeln(lst,'Izdano (svi mediji)....: '+inttostr(Tzak.FieldByname('Izdano').asinteger),#13+#10);

              writeln(lst,sstr('Upisano novih èlanova..: ')+inttostr(Tzak.FieldByname('UpisanoClanova').asinteger),#13+#10);
              writeln(lst,sstr('Stvoreno duga..........: '),Format('%m', [Tzak.FieldByname('Stvorenoduga').asfloat]):15,#13+#10);
              writeln(lst,sstr('Vraæeno duga...........: '),Format('%m', [Tzak.FieldByname('Vracenoduga').asfloat]):15,#13+#10);

              for i := 1 to 10 do writeln(lst,'');

              saldo:=IdeSaldoRacun; // ovo je zbog ispisa SALDA èlanova
              IdeSaldoRacun:=False; // koje naravno neide na ZAKLJUÈAK
              //Podaci.NaKraju(Ekran,True,2); // zbog SALDA
              IdeSaldoRacun:=saldo; // vrati staro stanje ispisa SALDA èlanova

            Finally
              closefile(lst);
              Screen.Cursor := crDefault;
            End;
         End;

    if IzborKuda then
    begin
      if Ekran then ShowDialog(TFPrikazEkranDLG);
    End else ShowDialog(TFPrikazEkranDLG);
  End; // ako je stiso ok
  FPregledDLG.DatumDo.Visible := True;
  FPregledDLG.Label3.Visible := True;
End;

Procedure TPodaci.IspisPoslovanje(koje:integer);
var tempstr: string;
begin
    FPregledDLG.Label3.Visible := True;
    FPregledDLG.DatumDo.Visible := True;
    FPregledDLG.Kuda.Visible := False;
    if FPregledDLG.ShowMpre('Pregled poslovanja za period?') = mrOK then
    begin
        myQuery1.Close;
        if (koje=2) or (koje=3) then    // ... po klubu
        begin
            myQuery1.SQL.LoadFromFile(PathSQL+'IspisPoslovanja1.sql');
            tempstr:='WHERE SifraIzvjestaja=10';
            koje:=koje-2;               // 'koje' može biti samo 1 ili 0
        end
        else
        begin                           // ... po datumu
            myQuery1.SQL.LoadFromFile(PathSQL+'IspisPoslovanja.sql');
            tempstr:='WHERE SifraIzvjestaja=1';
        end;

        myQuery1.MacroByName('DATOD').AsString:=''''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumOd.Date)+'''';
        myQuery1.MacroByName('DATDO').AsString:=''''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumDo.Date)+' 23:59:59''';
        myQuery1.Open;

        Izvjestaji.DajFRReport(koje, Izvjestaji.Poslovanje, tempstr);
    End;
End;

Procedure TPodaci.IspisPlacanja(koje:integer);
var tempstr: string;
begin
    FPregledDLG.Label3.Visible := True;
    FPregledDLG.DatumDo.Visible := True;
    FPregledDLG.Kuda.Visible := False;
    if FPregledDLG.ShowMpre('Pregled poslovanja za period?') = mrOK then
    begin
        myQuery1.Close;
        if (koje=2) or (koje=3) then    // ... po klubu
        begin
            myQuery1.SQL.LoadFromFile(PathSQL+'IspisPlacanja1.sql');
            tempstr:='WHERE SifraIzvjestaja=11';
            koje:=koje-2;               // 'koje' može biti samo 1 ili 0
        end
        else
        begin                           // ... po datumu
            myQuery1.SQL.LoadFromFile(PathSQL+'IspisPlacanja.sql');
            tempstr:='WHERE SifraIzvjestaja=12';
        end;

        myQuery1.MacroByName('DATOD').AsString:=''''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumOd.Date)+'''';
        myQuery1.MacroByName('DATDO').AsString:=''''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumDo.Date)+' 23:59:59''';
        myQuery1.MacroByName('FIRMA').AsString:=IntToStr(SifraFirme);
        myQuery1.Open;

        Izvjestaji.DajFRReport(koje, Izvjestaji.Poslovanje, tempstr);
    End;
end;

Procedure TPodaci.IzdanoPoKlubu(koje:integer);
begin
    FPregledDLG.Label3.Visible := True;
    FPregledDLG.DatumDo.Visible := True;
    FPregledDLG.Kuda.Visible := False;
    if FPregledDLG.ShowMpre('Pregled izdanih po klubu za period?') = mrOK then
    begin
        With myQuery1 do
        begin
            Close;
            SQL.LoadFromFile(PathSQL+'MedijiPoKlubu.sql');
            MacroByName('DATOD').AsString:=''''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumOd.Date)+'''';
            MacroByName('DATDO').AsString:=''''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumDo.Date)+' 23:59:59''';
            Open;
        end;
        With myQuery2 do
        begin
            Close;
            SQL.LoadFromFile(PathSQL+'ZanrPoKlubu.sql');
            MacroByName('DATOD').AsString:=''''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumOd.Date)+'''';
            MacroByName('DATDO').AsString:=''''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumDo.Date)+' 23:59:59''';
            Open;
        end;

        frVariables['OdDatum']:=FormatDateTime('dd-mm-yyyy', FPregledDLG.DatumOd.Date);
        frVariables['DoDatum']:=FormatDateTime('dd-mm-yyyy', FPregledDLG.DatumDo.Date);
        Izvjestaji.DajFRReport(koje, Izvjestaji.Poslovanje, 'WHERE SifraIzvjestaja=8');
    End;
End;

Procedure TPodaci.IzdanoPoDjelatniku(koje:integer);
begin
    FPregledDLG.Label3.Visible := True;
    FPregledDLG.DatumDo.Visible := True;
    FPregledDLG.Kuda.Visible := False;
    if FPregledDLG.ShowMpre('Pregled izdanih medija po djelatniku?') = mrOK then
    begin
        With myQuery1 do
        begin
            Close;
            SQL.LoadFromFile(PathSQL+'MedijiPoDjelatniku.sql');
            MacroByName('DATOD').AsString:=''''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumOd.Date)+' 00:00:00''';
            MacroByName('DATDO').AsString:=''''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumDo.Date)+' 23:59:59''';
            Open;
        end;
        With myQuery2 do
        begin
            Close;
            SQL.LoadFromFile(PathSQL+'Izdano-FLATpoDjelatniku.sql');
            MacroByName('DATOD').AsString:=''''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumOd.Date)+' 00:00:00''';
            MacroByName('DATDO').AsString:=''''+FormatDateTime('yyyy-mm-dd', FPregledDLG.DatumDo.Date)+' 23:59:59''';
            Open;
        end;

        frVariables['OdDatum']:=FormatDateTime('dd-mm-yyyy', FPregledDLG.DatumOd.Date);
        frVariables['DoDatum']:=FormatDateTime('dd-mm-yyyy', FPregledDLG.DatumDo.Date);
        Izvjestaji.DajFRReport(koje, Izvjestaji.Poslovanje, 'WHERE SifraIzvjestaja=9');
    End;
End;

procedure TPodaci.TopFilmovi;
begin
 if FPregledDLG.ShowMpre('Top filmovi za period izdavanja.') = mrOK then
 begin
   Application.CreateForm(TFPrintTOPfilmovi,FPrintTOPfilmovi);
   FPrintTOPfilmovi.Query1.Params[0].value := FPregledDLG.DatumOd.Date;         //fromdate
   FPrintTOPfilmovi.Query1.Params[1].value := FPregledDLG.DatumDo.Date;         //fromdate
   FPrintTOPfilmovi.qrLabel9.caption := datetostr(FPregledDLG.DatumOd.Date);
   FPrintTOPfilmovi.qrLabel11.caption := datetostr(FPregledDLG.DatumDo.Date);
   Try
     if FPregledDLG.Kuda.ItemIndex = 0 then FPrintTOPfilmovi.preview
     Else FPrintTOPfilmovi.preview;
   Finally
     FPrintTOPfilmovi.Destroy;
   End;
 End;
end;

procedure TPodaci.TBarcodeBeforeDelete(DataSet: TDataSet);
begin
  If not PristupOpciji(900) then raise exception.create(cNeovlasteno)
  else ShareUnit.UpitOpen(Podaci.myQuery1,
        ' INSERT INTO dnev (Dogodilose, Datum, Radnik, Clan, Br1, Br2, SifraKluba)'+
        ' VALUES (4, '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+VRadnik+''', '+
        IntToStr(Dataset.FieldByName('sifrakazete').AsInteger)+', 0, 0, '+IntToStr(SifraKluba)+')', true, false);
end;

procedure TPodaci.PregledObrisani;
begin
 if FPregledDLG.ShowMpre('Obrisani filmovi u periodu.') = mrOK then
 begin
   Screen.Cursor := crHourglass;
   Try
      OtvoriJu('kazete','datumbrisanja >= '+chr(39)+DateToStr(FPregledDLG.DatumOd.Date)+chr(39)+' and datumbrisanja <= '+chr(39)+DateToStr(FPregledDLG.DatumDo.Date)+chr(39),'naziv');
   Finally
      Screen.Cursor := crDefault;
   End;
   ShowDialog(TFPregledObrisaniDlg);
 End;
end;

procedure TPodaci.NapraviID;
var u:integer;
begin
  try
    Screen.Cursor := crHourglass;
    Otvoriindex('clanovi');
    TClanovi.First;
    Randomize;
    while not TClanovi.Eof do
    begin
      if TClanovi.FieldByName('InfoBoxID').asstring = '' then
      begin
       repeat
          u := Random(9999);
       Until u >= 10;
       TClanovi.Edit;
       TClanovi.FieldByName('InfoBoxID').value :=PopuniNule3(inttostr(u),4)+
                                                 PopuniNule3(inttostr(TClanovi.fieldbyname('Sifra').asinteger),4);
       TClanovi.Post;
      End;
      TClanovi.Next;
    End;
  Finally
    Screen.Cursor := crDefault;
  End;
End;

procedure PukoPozivKontrole(greska:String);
Begin
    MessageDlg('Došlo je do greške: '+greska+#13+#13+
             'Potrebno je da ponovo pokrenete program '+Podaci.NazivPrograma+'.'+#13+
             'Molimo vas da ako se greška ponovi na istom mjestu'+#13+
             'da obvjestite programere. Hvala'
             , mtError, [mbOK], 0);

//    Podaci.DatabaseMaster.CloseDatasets;

    izPopravka := True;
    Application.Terminate;
End;

Procedure TPodaci.StornoRacuna;
Var brra, upit, dodatak: String;
    vPlatitiDo:TDateTime;
Begin
  brra := inputbox('Storniranje raèuna', 'Upišite broj raèuna koji želite STORNIRATI.','');
  if (brra='') or (Length(brra)<>9) then exit;

  qRacuni.Close;
  qRacuni.MacroByName('KLUB').AsString:=IntToStr(SifraKluba);
  qRacuni.MacroByName('BROJ').AsString:=''''+brra+'''';
  qRacuni.Open;

  if not qRacuni.IsEmpty then
  begin
    If qRacuni.FieldByName('VrstaRacuna').AsInteger = 3 then
    begin
      MessageDlg('Raèun pod brojem '+brra+' veæ je STORNIRAN!', mtError, [mbOK], 0);
      Exit;
    End;

    if not confirm('Da li stvarno želite stornirati raèun broj '+ brra) then exit;

    Application.CreateForm(TFVratitiDoDlg, FVratitiDoDlg); // Povrat duga æe izvršiti do
    if confirm('Da li želite prebaciti iznos storno raèuna na èlana (kao storno dugovanje)?') then
    begin
        FVratitiDoDlg.rb3.Checked:=True;
        FVratitiDoDlg.Label6.Caption:='Razlog storna raèuna';
    end
    else
    begin
        FVratitiDoDlg.rb3.Enabled:=False;
        FVratitiDoDlg.RNDatum.Enabled:=False;
        FVratitiDoDlg.RNCifra.Enabled:=False;
        FVratitiDoDlg.RNBroj.Enabled:=False;
        FVratitiDoDlg.Label1.Enabled:=False;
        FVratitiDoDlg.Label2.Enabled:=False;
        FVratitiDoDlg.Label3.Enabled:=False;
        FVratitiDoDlg.Label4.Enabled:=False;
        FVratitiDoDlg.Label5.Enabled:=False;
        FVratitiDoDlg.Platitcedo.Enabled:=False;
        FVratitiDoDlg.Ostalo.Enabled:=False;
//        FVratitiDoDlg.Label6.Caption:='Razlog storna raèuna';
    end;

    if FVratitiDoDlg.Showmodal=mrOK then
    begin
        vPlatitiDo:= FVratitiDoDlg.Platitcedo.Date;

        upit:='UPDATE racuni SET VrstaRacuna=3 WHERE sifra='+qRacuni.FieldByName('sifra').AsString+';'+#13;

        dodatak:='';

        if FVratitiDoDlg.rb3.Checked then
            upit:=upit+'UPDATE clanovi SET'+
            ' StornoDug='+qRacuni.FieldByName('Cifra').AsString+','+
            ' StornoRacBr='''+qRacuni.FieldByName('BrojRacuna').AsString+''','+
            ' StornoRacDatum='''+FormatDateTime('yyyy-mm-dd', qRacuni.FieldByName('Datum').AsDateTime)+''','+
            ' StornoPlatitiDo='''+FormatDateTime('yyyy-mm-dd', vPlatitiDo)+''''+
            ' WHERE sifra='+qRacuni.FieldByName('SifraClana').AsString+';'+#13;

        upit:=upit+' INSERT INTO potvrda'+
        ' (SifraRacuna, DatumPotvrde, SifraClana, DRadnik, Vrsta';
        if FVratitiDoDlg.rb1.Checked then upit:=upit+', ARazlog'
        else if FVratitiDoDlg.rb2.Checked then upit:=upit+', BRazlog'
        else if FVratitiDoDlg.rb3.Checked then
        begin
            upit:=upit+', CRazlog, CDatum, CIznos, COstatak, CPlatitiDo';
            dodatak:=', '''+FormatDateTime('yyyy-mm-dd', qRacuni.FieldByName('Datum').AsDateTime)+''''+
                     ', '+qRacuni.FieldByName('Cifra').AsString+
                     ', '+CurrToStr(FVratitiDoDlg.Ostalo.Value)+
                     ', '''+FormatDateTime('yyyy-mm-dd', vPlatitiDo)+'''';
        end
        else if FVratitiDoDlg.rb4.Checked then upit:=upit+', DRazlog'
        else if FVratitiDoDlg.rb5.Checked then
        begin
            upit:=upit+', ERazlog, EKoji';
            dodatak:=', '''+FVratitiDoDlg.razlog.Text+'''';
        end;

        upit:=upit+') VALUES ('+qRacuni.FieldByName('Sifra').AsString+
            ', '''+FormatDateTime('yyyy-mm-dd hh:mm:ss', Now)+''''+
            ', '+qRacuni.FieldByName('SifraClana').AsString+
            ', '''+VRadnik+''', 1, ''D'''+dodatak+')';

        ShareUnit.UpitOpen(myQuery1, upit, True, False);
    end;

    if TabSetUp.FieldByName('PotvrdaStornoRN').Value='D' then
    begin
        ShareUnit.UpitOpen(myQuery1,
        'SELECT MAX(SifraPotvrde) AS SifraPotvrde FROM potvrda WHERE sifraracuna='+qRacuni.FieldByName('Sifra').AsString, True, True);
        if TabSetUp.FieldByName('postojiprinterracuni').AsString='D' then
            IspPotvrdu(1, myQuery1.FieldByName('SifraPotvrde').AsInteger, False); //1=za storno RN
    end;

    if confirm('Da li želite ponovo ispisati raèun broj: '+brra) then IspRacun(brra);

    if FVratitiDoDlg.rb3.Checked then
        if confirm('Da li želite ODMAH naplatiti dio iznosa kao dugovanje?') then
            NaplatiDugovanje(qRacuni.FieldByName('SifraClana').AsString);

    FVratitiDoDlg.Release;
  End
  else MessageDlg('Raèun pod brojem '+ brra+' ne postoji!', mtError, [mbOK], 0);
End;

Procedure IspPotvrdu(vrsta, brojPotvrde:Integer; naEkran: Boolean);
var vklub: String;
Begin
  with Podaci do
  begin
    TPotvrda.Close;
    TPotvrda.MacroByName('WHERE').AsString:='WHERE SifraPotvrde='+IntToStr(brojPotvrde);
    TPotvrda.Open;
    if TPotvrda.IsEmpty then
    begin
        ShowMessage('Nepostoji potvrda pod brojem '+IntToStr(brojPotvrde));
        TPotvrda.Filtered:=False;
        Exit;
    end;

    if vrsta=1 then
    begin
        TRacuni.Close;
        TRacuni.MacroByName('WHERE').AsString:='WHERE Sifra='+TPotvrda.FieldByName('SifraRacuna').AsString;
        TRacuni.Open;

        if TRacuni.IsEmpty then
        begin
            ShowMessage('Nepostoji raèun pod brojem '+IntToStr(brojPotvrde)+' za potvrdu '+IntToStr(brojPotvrde));
            Exit;
        end;
    end
    else if vrsta=2 then
    begin
        TZaduz.Close;
        TZaduz.MacroByName('WHERE').AsString:='WHERE Sifra='+TPotvrda.FieldByName('SifraRacuna').AsString;
        TZaduz.Open;

        if TZaduz.IsEmpty then
        begin
            ShowMessage('Nepostoji zaduženje pod brojem '+IntToStr(brojPotvrde)+' za potvrdu '+IntToStr(brojPotvrde));
            Exit;
        end;
    end;

//    PripremiPrinter(True);
    PripremiPrinter(naEkran);
    try
        Zaglavlje(TPotvrda.FieldByName('DatumPotvrde').AsString);

        WriteLn(Lst,ShareUnit.CenterStr(sstr('POTVRDA BROJ: ')+TPotvrda.FieldByName('SifraPotvrde').AsString,40));
        WriteLn(Lst,#13);
        WriteLn(Lst,StringOfChar('-', 40));
        WriteLn(Lst,#13);
        WriteLn(Lst,'Prema naputku porezne uprave Osijek');
        WriteLn(Lst,'izjavljujem da film/ove:'); // upisati

        if vrsta=1 then
        begin
            TRacuniDet.Close;
            TRacuniDet.MacroByName('WHERE').AsString:='WHERE sifraracuna='+TPotvrda.FieldByName('SifraRacuna').AsString;
            TRacuniDet.Open;
            while not TRacuniDet.Eof do
            begin
                WriteLn(Lst,'('+IntToStr(TRacuniDet.FieldByName('SifraKazete').AsInteger)+') '+NazivFilma(TRacuniDet.FieldByName('SifraKazete').AsString, False));
                TRacuniDet.Next;
            end;
        end
        else if vrsta=2 then
        begin
            TZaduzDet.First;
            while not TZaduzDet.Eof do
            begin
                WriteLn(Lst,'('+IntToStr(TZaduzDet.FieldByName('SifraKazete').AsInteger)+') '+NazivFilma(TZaduzDet.FieldByName('SifraKazete').AsString, False));
                TZaduzDet.Next;
            end;
//            TzaduzDet.Filtered:=False;
        end;

        WriteLn(Lst,#13);
        WriteLn(Lst,sstr('nisam pogledao/la i platio/la iz razloga'));

        if TPotvrda.FieldByName('ARazlog').Value='D' then
        begin
            WriteLn(Lst,sstr('što je film tehnièki neupotrebljiv.'));
        end
        else if TPotvrda.FieldByName('BRazlog').Value='D' then
        begin
            WriteLn(Lst,sstr('što sam se za vrijeme odabira filma'));
            WriteLn(Lst,sstr('predomislio/la i odabrao/la drugi film.'));
        end
        else if TPotvrda.FieldByName('CRazlog').Value='D' then
        begin
            WriteLn(Lst,sstr('što sam filmove posuðene dana ')+FormatDateTime('dd.mm.yyyy',TRacuni.FieldByName('Datum').AsDateTime):10);
            WriteLn(Lst,sstr('pogleda/la, te mi je za njih izdan raèun'));
            WriteLn(Lst,'broj ',TRacuni.FieldByName('Sifra').AsString:11,' u iznosu ',Format('%m',[TRacuni.FieldByName('Cifra').asFloat]):12,'Kn');
            WriteLn(Lst,sstr('Po istom raèunu sam ostao/la dužan/dužna'));
            WriteLn(Lst,Format('%m',[TPotvrda.FieldByName('COstatak').asFloat]):9,sstr('Kn koje æu platit do '),TPotvrda.FieldByName('CDatum').AsString:10);
        end
        else if TPotvrda.FieldByName('DRazlog').Value='D' then
        begin
            vklub:=TabSetUp.FieldByName('NazivKluba').AsString;
            SetLength(vklub,27);
            WriteLn(Lst,sstr('što mi je krivo zadužen film greškom'));
            WriteLn(Lst,sstr('djelatnika "'+vklub+'"'));
            WriteLn(Lst,#13#13);
            WriteLn(Lst,StringOfChar('_',40));
            WriteLn(Lst,ShareUnit.CenterStr(sstr('(potpis djelatnika)'),40));
        end
        else if TPotvrda.FieldByName('ERazlog').Value='D' then
        begin
            vklub:=TPotvrda.FieldByName('EKoji').AsString;
            SetLength(vklub,40);
            WriteLn(Lst,#13);
            WriteLn(Lst,vklub);
//            WriteLn(Lst,StringOfChar('_',40));
            WriteLn(Lst,ShareUnit.CenterStr(sstr('(neki drugi razlog neplaæanja)'),40));
        end else exit;

        WriteLn(Lst,#13);
        WriteLn(Lst,'U Osijeku, '+TPotvrda.FieldByName('DatumPotvrde').AsString:10);
        WriteLn(Lst,#13#13);
        WriteLn(Lst,'RADNO MJESTO:___________________________');
        WriteLn(Lst,#13);
        WriteLn(Lst,ImeCl(TPotvrda.FieldByName('SifraClana').AsInteger,2));
        WriteLn(Lst,#13#13);
        WriteLn(Lst,sstr('Potpis èlana:___________________________'));
        WriteLn(Lst,#13#13);

        Podaci.NaKraju(naEkran,False,0); // na ekran, nije pregled, bez zadnjih redova

//WriteLn(Lst,'                                        ');//40 karaktera
    finally
        CloseFile(Lst);
        TPotvrda.Filtered:=False;
    end;
  End;
  if naEkran then ShowDialog(TFPrikazEkranDLG); // na ekran
end;

Procedure TPodaci.Usaglasi;
Begin
  try
    Screen.Cursor := crSQLWait;
    ShareUnit.UpitOpen(myQuery1,'SELECT sifra, brkazeta FROM kazete', True, True);
    myQuery1.First;
    MainForm.Label6.Visible:=True;
    while not myQuery1.Eof do
    begin
        MainForm.Label6.Caption:=IntToStr(myQuery1.RecNo)+'/'+IntToStr(myQuery1.RecordCount);
        MainForm.Label6.Refresh;
        ShareUnit.UpitOpen(myQuery2,'select count(b.sifrakazete) komada from bcodekazete b, statusfilma s'+
                                    ' where b.sifrakazete='+IntToStr(myQuery1.FieldByName('sifra').AsInteger)+
                                    ' and b.status=s.sifra and s.zbroj=1', True, True);
        myQuery1.Edit;
        myQuery1.FieldByName('BrKazeta').AsInteger:=myQuery2.FieldByName('komada').AsInteger;
        myQuery1.Post;
        myQuery1.Next;
    End;
  Finally
    ShowMessage('Gotovo!!!');
    MainForm.Label6.Caption:='-/-';
    MainForm.Label6.Visible:=False;
    myQuery1.Close;
    Screen.Cursor := crDefault;
  End;
End;

Procedure TPodaci.NaplatiDugovanje(clan:string);
Var pa, aClan:Integer;
    IznosDuga,StariIznos:Currency;
    vPlatitiDo:TDateTime;
    sljedeci, rac_master, apoRacunu, SifraRacuna: String;
begin
  tVrstePlacanja.Close; // naði default vrstu plaèanja
  tVrstePlacanja.Open;
  tVrstePlacanja.LocateRecord('NazivPlacanja', IntToStr(VrstaPlacanja), [], True);

  Application.CreateForm(TFDugovanjeDlg, FDugovanjeDlg);
  ShareUnit.UpitOpen(myQuery2,
  ' SELECT StornoDug, StornoRacBr, StornoRacDatum, StornoPlatitiDo FROM clanovi WHERE sifra='+clan, False, True);
  FDugovanjeDlg.CurrencyEdit1.Value:=myQuery2.FieldByName('StornoDug').AsCurrency;
  FDugovanjeDlg.ClanEdit.AsInteger:=StrToInt(clan); // defaultni èlan
  FDugovanjeDlg.PoRacunuEdit.Text:=myQuery2.FieldByName('StornoRacBr').AsString;

  pa := FDugovanjeDlg.Showmodal;
  If pa = mrAbort then exit;

  // ako nije okinut upit onda ga sam startaj
  if not FDugovanjeDlg.qImaRacun.Active then FDugovanjeDlg.PoRacunuEditExit(FDugovanjeDlg.PoRacunuEdit);

  SifraRacuna:=FDugovanjeDlg.qImaRacun.FieldByName('sifra').AsString;

  IznosDuga  :=FDugovanjeDlg.CurrencyEdit1.Value;
  aClan      :=FDugovanjeDlg.ClanEdit.AsInteger;
  aPoRacunu  :=FDugovanjeDlg.PoRacunuEdit.Text;
  vPlatitiDo :=FDugovanjeDlg.Platitcedo.Date;
  SifraRacuna:=FDugovanjeDlg.qImaRacun.FieldByName('sifra').AsString;

  FDugovanjeDlg.Release;

  if (aPoRacunu='') or (aPoRacunu='00-000000') then Exit;

  if IznosDuga = 0 then
  begin
    MessageDlg('Ne možete naplatiti dugovanje na 0,00 Kn!', mtError, [mbOK], 0);
    Exit;
  End;

  TClanovi.Close;
  TClanovi.MacroByName('WHERE').AsString:='WHERE sifra='+IntToStr(aClan);
  TClanovi.Open;
  if TClanovi.IsEmpty then
  begin
    MessageDlg('Èlan broj '+inttostr(aClan)+' ne postoji!', mtError, [mbOK], 0);
    Exit;
  End;

  If TClanovi.FieldByName('StornoDug').AsCurrency = 0 then
  begin
    MessageDlg('Èlanov dug po storno raèunu iznosi 0.00 Kn, te mu neæe biti umanjen.', mtError, [mbOK], 0);
    Exit;
  End;

 try
    // napravi novi RAÈUN za naplatu dugovanja
    // naði sljedeæi broj raèuna
    FVracanjeDlg.qMaxRacun.TableName:='racuni';
    FVracanjeDlg.qMaxRacun.ParamByName('SifraKluba').AsInteger:=SifraKluba;
    FVracanjeDlg.qMaxRacun.Open;
    if FVracanjeDlg.qMaxRacun.FieldByName('racun').IsNull then sljedeci:='1' else
        sljedeci:=FVracanjeDlg.qMaxRacun.FieldByName('racun').AsString;
    FVracanjeDlg.qMaxRacun.Close;
    rac_master:=ShareUnit.PopuniXljevo(IntToStr(SifraKluba),'0',2)+'-'+ShareUnit.PopuniXljevo(sljedeci,'0',6);

    StariIznos:=TClanovi.FieldByName('StornoDug').AsCurrency;

    If iznosDuga > StariIznos then
    begin
        MessageDlg('Upisali ste veæi povrat od samog duga. Povrat æe biti jednak dugu.', mtError, [mbOK], 0);
        IznosDuga:=StariIznos;
    End else
    if StariIznos = IznosDuga then
    begin
            TClanovi.Edit;
            TClanovi.FieldByName('StornoDug').AsInteger := 0;
            TClanovi.FieldByName('StornoRacBr').value := null;
            TClanovi.FieldByName('StornoRacDatum').value := null;
            TClanovi.FieldByName('StornoPlatitiDo').value := null;
            TClanovi.Post;

            FKartica.LMDEdit.Color:=clInfoBk;
    End
    Else
    Begin
            TClanovi.Edit;
            TClanovi.FieldByName('StornoDug').value := StariIznos-IznosDuga;
            if vPlatitiDo <> 0 then TClanovi.fieldByName('StornoPlatitiDo').value := vPlatitiDo;
            TClanovi.Post;
    End;

    ShareUnit.UpitOpen(Podaci.myQuery1,
    ' INSERT INTO racuni '+
    ' (SifraKluba, BrojRacuna, VrstaRacuna, Datum, Radnik, SifraClana, Popust, Cifra, StopaPoreza, Duzan, VrstaPlacanja)'+
    ' VALUES ('+IntToStr(SifraKluba)+', '''+rac_master+''','+
    ' 4, '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+VRadnik+''', '+IntToStr(aClan)+','+
    ' '+SifraRacuna+', '+CurrToStr(IznosDuga)+','+
    ' '+Podaci.tabSetUp.FieldByName('IznosPoreza').AsString+','+
    ' '+ImeCl(aClan, 4)+','+
    ' '+IntToStr(Podaci.tVrstePlacanja.FieldByName('Sifra').AsInteger)+')', True, False);

    if TabSetUp.FieldByName('postojiprinterracuni').AsString='D' then IspRacun(rac_master);
 except
    on E: Exception do
    begin
//        Loguj(Podaci.myQuery1, '::Error - TPodaci.NaplatiDugovanje: '+E.Message, True);
    end;
 End;
End;

Procedure TPodaci.PregRacClanarine(Koji:Integer);
Var Naslov :String;
Begin
  FPregledDLG.Label3.Visible := True;
  FPregledDLG.DatumDo.Visible := true;
  FPregledDLG.Kuda.Visible := False;
  case koji of
    5: naslov := 'Pregled raèuna od plaèanja po UGOVORU';
    6: naslov := 'Èlanovi koji nisu imali uplatu po ugovoru u periodu';
    Else naslov := 'Pregled izdanih raèuna ÈLANARINE.';
  end;

  if FPregledDLG.ShowMpre(naslov) = mrOK then
  begin
    Application.CreateForm(TFPregRacunaCla,FPregRacunaCla);
    FPregRacunaCla.ShowMPregled(DateToStr(FPregledDLG.DatumOd.Date),DateToStr(FPregledDLG.DatumDo.Date),koji,naslov);
  End;
End;

procedure TPodaci.PocetakPrograma;
Var i, j, ret:Integer;
    daKontr:Boolean;
begin
 // naði path baze
 IzKartice  := False;
 IzOdabiraF := False;
 izPopravka := False;
 dakontr := False;
 KojiStroj := 0;

// Params:=TStringList.Create;
// Session.GetAliasParams(DatabaseMaster.AliasName, Params);
// PathBaze:=Params.Values['PATH']+'\';
// Params.Free;

 PathINI:=ExtractFilePath(Application.ExeName);
 PathSQL:=ExtractFilePath(Application.ExeName)+'SQL\';
 PathLOG:=ExtractFilePath(Application.ExeName)+'LOG\';

 DbiSave:=False;

 Zoran :=LowerCase(chr(90)+chr(77)+chr(77)+chr(79)+chr(75)+chr(73)); //zmmoki

 if FileExists(PathINI+'\INI\Klub.ini') then Parametri:=TIniFile.Create(PathINI+'\INI\Klub.ini')
 else
 begin
     ShowMessage('Ne postoji '+PathINI+'\INI\Klub.ini'+' fajl!!!');
     Application.Destroy;
 end;
 SifraKluba:=StrToInt(Parametri.ReadString('Klub', 'Sifra', '1'));
 if Parametri.ReadString('Klub', 'Poruke', '1')='1' then poruke:=True else poruke:=False;
 Napomena2Klub:=SifraKluba;
 if Parametri.ReadString('Klub', 'PokaziCijeluKarticu', '0')='1' then DrugiKlubovi:=True else DrugiKlubovi:=False;
 if Parametri.ReadString('Klub', 'ReportIzBaze', '0')='1' then FRizDB:=True else FRizDB:=False;
 limit_po_zanru:=Parametri.ReadString('Klub', 'TopPoZanru', '10');

 alijas:=Parametri.ReadString('Baza', 'Alias', 'Video');
 if Parametri.ReadString('Baza', 'MySQL', '0')='1' then MySQL:=True else MySQL:=False;
 serv:=Parametri.ReadString('Baza', 'Host', '217.160.227.32');
 baza:=Parametri.ReadString('Baza', 'DB', 'webit--www-video-cross-hr');
 user:=Parametri.ReadString('Baza', 'User', 'videocross');
 Loz:=Parametri.ReadString('Baza', 'Pass', 'KdL3vMfx');
 ide_lib:=Parametri.ReadString('Baza', 'library', '0');
 ide_schema:=Parametri.ReadString('Baza', 'Schema', '0');
 KojaNaplata:=StrToInt(Parametri.ReadString('Klub', 'Naplata', '2'));
 mojCharSet:=Parametri.ReadString('Baza', 'Charset', 'utf8');
 mojCollation:=Parametri.ReadString('Baza', 'Collation', 'utf8_general_ci');

 default_KategorijaBarkoda:=Parametri.ReadString('Default', 'KategorijaBarkoda', '19');
 default_StatusBarkoda:=Parametri.ReadString('Default', 'StatusBarkoda', '3');
 default_MedijBarkoda:=Parametri.ReadString('Default', 'MedijBarkoda', '2');
 default_Top10:=Parametri.ReadString('Default', 'TopZanrova', '10');
 VrstaPlacanja:=StrToInt(Parametri.ReadString('Default', 'VrstaPlacanja', '1'));
 RNzaglavlje:=Parametri.ReadString('Default', 'ZaglavljeRacuna', 'RAÈUN BROJ : ');

 if Parametri.ReadString('Baza', 'LOG', '0')='1' then
 begin
    if not FileExists(PathLOG+'SQL.log') then FileCreate(PathLOG+'SQL.log');     // logiranje SQL upita
    j:=LOGRotate(PathLOG+'SQL.log', 'SQL'); // j=velièina LOG-a

    AssignFile(SQL_Log, PathLOG+'SQL.log');
    try
        Append(SQL_Log);
    except
    end;
    Writeln(SQL_Log, '::Startan program - '+DateTimeToStr(Now));
    Flush(SQL_Log);
    CloseFile(SQL_Log);

    if not FileExists(PathLOG+'naplata.log') then FileCreate(PathLOG+'naplata.log'); // logiranje naplate (po danima)
    j:=LOGRotate(PathLOG+'naplata.log', 'VN'); // j=velièina LOG-a

    AssignFile(Test_naplate, PathLOG+'naplata.log');
    Append(Test_naplate);
    Writeln(Test_naplate, '_______________________________________________');
    Writeln(Test_naplate, '::Startan program - '+DateTimeToStr(Now));
    Flush(Test_naplate);
    CloseFile(Test_naplate);

    logiraj_upite:=True;
    if Parametri.ReadString('Baza', 'deadlock', '0')='1' then deadlock:=True else deadlock:=False;
    testNaplata:=True;
 end
 else
 begin
    logiraj_upite:=False;
    deadlock:=False;
    testNaplata:=False;
 end;

 if Parametri.ReadString('Klub', 'Podsjetnik', 'nema')='sve' then      // logiranje napomena
 begin
    if FileExists(PathLOG+'NapLOG.txt') then j:=LOGRotate(PathLOG+'NapLOG.txt', 'NAP'); // j=velièina LOG-a

    AssignFile(Napomena_Log, PathLOG+'NapLOG.txt');
    Append(Napomena_Log);

    Writeln(Napomena_Log, '::Startan program - '+DateTimeToStr(Now));
    Writeln(Napomena_Log, '_______________________________________________');
//    Writeln(Napomena_Log, 'velièina LOGa = '+FloatToStrF(j/1024, ffFixed, 7, 2)+' KB');
    Flush(Napomena_Log);
    CloseFile(Napomena_Log);

    logiraj_napomene:=True;
 end
 else
    logiraj_napomene:=False;

 if Parametri.ReadString('Klub', 'Top10', '0')='1' then Top10:=True else Top10:=False;

 myDB.Host:=serv;
 myDB.Port:=3306;
 myDB.DatabaseName:=baza;
 myDB.UserName:=user;
 myDB.Password:=Loz;
 if ide_schema='1' then
    myDB.Options:=[coLongPassword,coLongFlag,coNoSchema,coInteractive,coProtocol41,coMultiQueries,soCloseOnChildren]
 else
    myDB.Options:=[coLongPassword,coLongFlag,coInteractive,coProtocol41,coMultiQueries,soCloseOnChildren];

//BACKUP se radi svaki put kada se program pokrene
//  if KojiStroj<>1 then
//  begin
//    MessageDlg('Program æe je automatski napraviti SVAKODNEVNU rezervnu kopiju baza podataka.', mtWarning, [mbOk], 0);
//    MainForm.KopijaBaza(131,False,False);
//  end;

    if not Session.IsAlias(alijas) then
    begin
        ShowMessage('Nemate alias za MySql bazu!');
        Application.Terminate;
    end;

    if MainForm.PrebaciClana.Visible or MainForm.PrebaciFilm.Visible then
    begin
        xfer.AliasName:=alijas;
        try
            if not xfer.Connected then xfer.Open;
        except
            ShowMessage('Paradox baza sa aliasa "'+alijas+'" nije dostupna!');
            Application.Terminate;
        end;
    end;

    myDB.Connect;

    TabSetUp.Filter:='SifraKluba='+IntToStr(SifraKluba);
    TabSetUp.Filtered:=True;
    TabSetUp.Open;
    if TabSetUp.RecordCount=0 then // dodatna kontrola
    begin
        ShowMessage('Ne postoji video klub sa šifrom '+IntToStr(SifraKluba));
        Application.Destroy;
    end;

    if Parametri.ReadString('Klub', 'ProvjeraPorta', '1')='1' then ProvjeraPorta;

    MainForm.Obradaposlovanja1.enabled := KojiStroj <> 1;
    MainForm.Pomoneopcije1.enabled := KojiStroj <> 1;
    MainForm.Postavljanjeparametara1.enabled := KojiStroj <> 1;

    if kojistroj = 0 then MainForm.LMDSimpleLabel3.caption := 'Prvi'
    Else MainForm.LMDSimpleLabel3.caption := 'Drugi';

    if Top10 then
        try
            MainForm.HotKey1.HotKey:=TextToShortCut(TabSetUP.FieldByName('top10').AsString);
        except
            MainForm.HotKey1.HotKey:=TextToShortCut('Shift+Ctrl+A');
        end;
//    ShowMessage(ShortCutToText(MainForm.HotKey1.HotKey));

    CrnaLista:=True;
    Klub:=TabSetUP.FieldByName('NazivKluba').AsString;
    NazivPrograma:='VIDEO 2kX';
    SifraFirme:=TabSetUp.FieldByName('SifraFirme').AsInteger;
    PutHDD:=TabSetUp.FieldByName('PathHDD').AsString;
    PutDisketa:=TabSetUp.FieldByName('PathFloppy').AsString;
    vTextDugovanja:=TabSetUp.FieldByName('Zadnji3').AsString;
    vTextDugovanjaUgovor:=TabSetUp.FieldByName('TekstNaplataUgovor').AsString;
    if TabSetUp.FieldByName('XP').Value='D' then XP:=True else XP:=False;
    if TabSetUp.FieldByName('VrstaPoslovnice').Value='F' then frizerski:=True else frizerski:=False;
    if TabSetUp.FieldByName('shrinkUI').Value='D' then low_rights:=True else low_rights:=False; // ako je cross onda sva prava na menije (web narudžbe i ostalo)
    if TabSetUp.FieldByName('BlagdanVikendu').Value='D' then
    begin
        BlagdanVikendu:=True;
        MainForm.LMDSimpleLabel1.Caption:='Dodaj blagdan vikendu';
    end
    else
    begin
        BlagdanVikendu:=False;
        MainForm.LMDSimpleLabel1.Caption:='Blagdan je normalan';
    end;

    MaxPosudba:= TabSetUp.FieldByName('PrvoDizanjeMax').AsInteger;

    orao:=False;
    Dalibor:=False;

    try if TabSetUp.FieldByName('SaldoMinus').Value='D' then SmijePosuditi:=True else SmijePosuditi:=False;
    except SmijePosuditi := False;
    end;

    try if TabSetUp.FieldByName('Biljezi').Value='D' then Biljezi:=True else Biljezi:=False;
    except Biljezi := False;
    end;

    try if TabSetUp.FieldByName('cross').Value='D' then cross:=True else cross:=False;
    except cross := False;
    end;

    try if TabSetUp.FieldByName('SaldoRacun').Value='D' then IdeSaldoRacun:=True else IdeSaldoRacun:=False;
    except IdeSaldoRacun := False;
    end;

    try if TabSetUp.FieldByName('SmijuSlova').Value='D' then SmijuSlova:=True else SmijuSlova:=False;
    except SmijuSlova := False;
    end;

//*************************************************************************************************************
  Registriran := False;
  NemaGa := False;
  MainForm.Registracijaprograma1.enabled := (not Registriran);
//*************************************************************************************************************

    TabPristup.Open;
    tabradnici.Open;

    Application.CreateForm(TpasswordDlg,PasswordDlg);
    If PasswordDlg.Showmodal <> MrOk then
    begin
        Application.Terminate;
        Exit;
    end;
    PasswordDlg.Release;

//             TabRadnici.Filter:='SifraFirme='+IntToStr(SifraFirme);
//             TabRadnici.Filtered:=True;
    TabRadnici.Locate('Sifra',VOperater,[]);
    VOperater := TabRadnici.fieldByName('Sifra').Value;
    VPrava := TabRadnici.FieldByname('Prava').value;
    VRAdnik := TabRadnici.FieldByname('ID').value;
    MainForm.Caption:=NazivPrograma+' - '+TabRadnici.FieldByname('Naziv').value;

    WebTimer:=Parametri.ReadString('Klub', 'provjeraweba', '0');
    if WebTimer<>'0' then   // pokretanje WebTimera
    begin
        MainForm.webTimer1Timer(MainForm.webTimer1);
        MainForm.webTimer1.Enabled:=True;
        MainForm.webTimer1.Interval:=StrToInt(WebTimer);
    end
    else
        MainForm.webTimer1.Enabled:=False;

    MainForm.dajNarucene.SQL.LoadFromFile(PathSQL+'IzbrojNarucene.sql');
    MainForm.dajNarucene.SQL.Add(#13+'AND b.sifra_videokluba='+IntToStr(SifraKluba));

    // upisuje u bazu dnev ko se i kada prijavio za rad
    if biljezi then ShareUnit.UpitOpen
        (myQuery1,' INSERT INTO dnev (Dogodilose, Datum, Radnik, Br1, Br2, SifraKluba)'+
                  ' VALUES (6, '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+
                  VRadnik+''', 0, 0, '+IntToStr(SifraKluba)+')', true, false);

    IzabranClan:= -1;
    IzabranFilm:='-1';
    IzabranBarkod:='-1';
    zvjezdica:=False;

    frLocale.LoadDll(PathINI+'\INI\FR_Eng.dll');       // load english resources 4 FastReport

  tZanr.Open;
  Trez.Open;
  TVrsta.Open;
  TGlumac.Open;
  TDrzav.Open;
  TStatFilma.Open;
  TDobav.Open;
  TMediji.Open;
  tVrstePlacanja.Open;
end;

procedure TPodaci.DbiSaveAfterPost(DataSet: TDataSet);
begin
  if DbiSave then
    DbiSaveChanges((DAtaset as Ttable).handle);
// DbiSaveChanges saves all buffered changes to disk and makes the table (temporary) permanent.
end;

Procedure TPodaci.NaplatiOsiguranje(vClan,vPopust:Integer);
Var pa:Integer;
    VrijediDo:Tdate;
    IznosClanarine:Currency;
    sljedeci, rac_master: String;
begin
  tVrstePlacanja.Close; // naði default vrstu plaèanja
  tVrstePlacanja.Open;
  tVrstePlacanja.LocateRecord('NazivPlacanja', IntToStr(VrstaPlacanja), [], True);

  Application.CreateForm(TFOsiguranjeDlg,FOsiguranjeDlg);
  FOsiguranjeDlg.CurrencyEdit1.Value := Podaci.tabSetUp.FieldByName('IznosOsiguranja').Value;
  pa := FOsiguranjeDlg.Showmodal;
  IznosClanarine := FOsiguranjeDlg.CurrencyEdit1.Value;
  VrijediDo := FOsiguranjeDlg.DOdatuma.date;

  If pa = mrAbort then
  begin
    Application.CreateForm(TFPlatioJeDlg,FPlatioJeDlg);
    FPlatioJeDlg.CurrencyEdit1.Value := IznosClanarine;
    If FPlatioJeDlg.Showmodal = mrOk then
        SrediSaldo(vClan,0,IznosClanarine-FPlatioJeDlg.Platio.Value);
    FPlatioJeDlg.Release;
  End;
  FOsiguranjeDlg.Release;

    try
        ShareUnit.UpitOpen(Podaci.myQuery1,
        ' UPDATE clanovi SET OsiguranjeVrijediDo='''+FormatDateTime('yyyy-mm-dd',VrijediDo)+''''+
        ' WHERE sifra='+IntToStr(vClan), True, False);

        // napravi novi RAÈUN
        // naði sljedeæi broj raèuna
        FVracanjeDlg.qMaxRacun.TableName:='racuni';
        FVracanjeDlg.qMaxRacun.ParamByName('SifraKluba').AsInteger:=SifraKluba;
        FVracanjeDlg.qMaxRacun.Open;
        if FVracanjeDlg.qMaxRacun.FieldByName('racun').IsNull then sljedeci:='1' else
            sljedeci:=FVracanjeDlg.qMaxRacun.FieldByName('racun').Asstring;
        FVracanjeDlg.qMaxRacun.Close;
        rac_master:=ShareUnit.PopuniXljevo(IntToStr(SifraKluba),'0',2)+'-'+ShareUnit.PopuniXljevo(sljedeci,'0',6);

        ShareUnit.UpitOpen(Podaci.myQuery1,
        ' INSERT INTO racuni '+
        ' (SifraKluba, BrojRacuna, VrstaRacuna, Datum, Radnik, SifraClana, Popust, Cifra, StopaPoreza, Duzan, VrstaPlacanja)'+
        ' VALUES ('+IntToStr(SifraKluba)+', '''+rac_master+''','+
        ' 6, '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+VRadnik+''', '+IntToStr(vClan)+','+
        ' '+IntToStr(vPopust)+', '+CurrToStr(IznosClanarine)+','+
        ' '+Podaci.tabSetUp.FieldByName('IznosPoreza').AsString+','+
        ' '+ImeCl(vClan, 4)+','+
        ' '+IntToStr(Podaci.tVrstePlacanja.FieldByName('Sifra').AsInteger)+')', True, False);

        if TabSetUp.FieldByName('postojiprinterracuni').AsString='D' then IspRacun(rac_master);
    except
        on E: Exception do
        begin
//            Loguj(Podaci.myQuery1, '::Error - TPodaci.NaplatiOsiguranje: '+E.Message, True);
        end;
    End;
End;

Procedure TPodaci.PregledPotvrda(koji:Integer);
var brPotvrde: String;
begin
    brPotvrde:=InputBox('Broj potvrde','Upišite broj potvrde koju želite izlistati?','');
    if brPotvrde<>'' then
        IspPotvrdu(koji, StrToInt(brPotvrde), True); // "koji" na ekran - 1=Storno raèuna
end;

procedure TPodaci.DataModuleDestroy(Sender: TObject);
begin
     Parametri.Free;
//     Napomena_Log.Free;
//     SQL_Log.Free;
//     Test_naplate.Free;
end;

procedure DodajPodsjetnik(LOGText: String);
Begin
    Append(Napomena_Log);
    Writeln(Napomena_Log, LOGText);
    Flush(Napomena_Log);
    CloseFile(Napomena_Log);
end;

procedure Logiraj(LOGText: String; Continue: Boolean);
begin
    if logiraj_upite then
    begin
        Append(SQL_Log);
        Writeln(SQL_Log, LOGText);
        Flush(SQL_Log);
        CloseFile(SQL_Log);
    end;

    if not Continue then
    begin
        PukoPozivKontrole(LOGText);
        Exit;
    end;
end;

procedure TPodaci.Loguj(Dataset: TMySQLDatasetBase; var SQL: String; var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure LogirajNaplatu(zapis: String);
begin
    if testNaplata then
    begin
//        Test_naplate.Append(zapis);
//        Test_naplate.SaveToFile(PathLOG+'naplata.log');

        AssignFile(Test_naplate, PathLOG+'naplata.log');
        Append(Test_naplate);
        Writeln(Test_naplate, zapis);
        Flush(Test_naplate);
        CloseFile(Test_naplate);

    end;
end;

procedure TPodaci.TRacuniAfterClose(DataSet: TDataSet);
begin
    TRacuniDet.Close;
end;

procedure TPodaci.TZaduzAfterOpen(DataSet: TDataSet);
begin
    TZaduzDet.Close;
    if not TZaduz.FieldByName('Sifra').IsNull then
    begin
        TZaduzDet.MacroByName('WHERE').AsString:='WHERE SifraZaduz='+TZaduz.FieldByName('Sifra').AsString;
        TZaduzDet.Open;
    end;
end;

procedure TPodaci.TZaduzAfterClose(DataSet: TDataSet);
begin
    TZaduzDet.Close;
end;

procedure TPodaci.myDBAfterConnect(Sender: TObject);
begin
//    ShowMessage('After Connect-'+myDB.Host+'-'+myDB.DatabaseName);
//    ShowMessage('server='+myDB.ServerVersion+', client='+myDB.ClientVersion);
    Logiraj('::server='+myDB.ServerVersion+', client='+myDB.ClientVersion, True);

    // podesi CLIENT character set i collation
    if mojCharSet<>'default' then
    ShareUnit.UpitOpen(myQuery1,
        ' SET character_set_server = '+mojCharSet+','+
        ' collation_server = '+mojCollation+','+
        ' character_set_database = '+mojCharSet+','+
        ' collation_database = '+mojCollation+','+
        ' character_set_results = '+mojCharSet+','+
        ' character_set_client = '+mojCharSet+','+
        ' character_set_connection = '+mojCharSet+','+
        ' collation_connection = '+mojCollation+';', False, True);
end;

procedure TPodaci.myDBLogin(Server: TMySQLServer; LoginParams: TStrings);
begin
    with Server do
    begin
        if ide_lib='1' then DriverKind:=dtLibrary
        else DriverKind:=dtDirect;
        LoginParams.Clear;
        LoginParams.Append('host='+serv);
        LoginParams.Append('port=3306');
        LoginParams.Append('user='+user);
        LoginParams.Append('password='+Loz);
    end;
end;

procedure TPodaci.myDBBeforeConnect(Sender: TObject);
begin
    if myDB.Connected then ShowMessage('spojen prije');

    with (Sender as TMySQLServer) do
    begin
        if ide_lib='1' then DriverKind:=dtLibrary
        else DriverKind:=dtDirect;
        Params.Clear;
        Params.Append('host='+serv);
        Params.Append('port=3306');
        Params.Append('user='+user);
        Params.Append('password='+Loz);
    end;
end;

Procedure TPodaci.ImportajClana(i: Integer);
var poruka: String;
begin
    poruka:='';
    oldClanovi.Filter:='sifra='+IntToStr(i);
    oldClanovi.Filtered:=True;
    oldClanovi.Open;

    if oldClanovi.RecordCount=1 then
    begin
(*        // provjeri da li je veæ upisan èlan sa JMBGom
        ShareUnit.UpitOpen(myQuery1,
            ' SELECT sifra, imeprezime, jmbg, osobna, barcode '+
            ' FROM clanovi WHERE jmbg='''+oldClanovi.FieldByName('jmbg').AsString+'''', False, True);
        if not myQuery1.IsEmpty then
        begin
            myQuery1.First;
            while not myQuery1.Eof do
            begin
                poruka:=poruka+#13+'Postoji upisan èlan sa '+myQuery1.FieldByName('jmbg').AsString+' JMBGOM ('
                +myQuery1.FieldByName('sifra').AsString+'-'+myQuery1.FieldByName('imeprezime').AsString+').';
                myQuery1.Next;
            end;
        end;

        // provjeri da li je veæ upisan èlan sa OSOBNOM
        ShareUnit.UpitOpen(myQuery1,
            ' SELECT sifra, imeprezime, jmbg, osobna, barcode '+
            ' FROM clanovi WHERE osobna='''+oldClanovi.FieldByName('osobna').AsString+'''', False, True);
        if not myQuery1.IsEmpty then
        begin
            myQuery1.First;
            while not myQuery1.Eof do
            begin
                poruka:=poruka+#13+'Postoji upisan èlan sa '+myQuery1.FieldByName('osobna').AsString+' OSOBNOM ('
                +myQuery1.FieldByName('sifra').AsString+'-'+myQuery1.FieldByName('imeprezime').AsString+').';
                myQuery1.Next;
            end;
        end;

        // provjeri da li je veæ upisan èlan sa BARKODOM
        ShareUnit.UpitOpen(myQuery1,
            ' SELECT sifra, imeprezime, jmbg, osobna, barcode '+
            ' FROM clanovi WHERE barcode='''+oldClanovi.FieldByName('barcode').AsString+'''', False, True);
        if not myQuery1.IsEmpty then
        begin
            myQuery1.First;
            while not myQuery1.Eof do
            begin
                poruka:=poruka+#13+'Postoji upisan èlan sa '+myQuery1.FieldByName('barcode').AsString+' BARKODOM ('
                +myQuery1.FieldByName('sifra').AsString+'-'+myQuery1.FieldByName('imeprezime').AsString+').';
                myQuery1.Next;
            end;
        end;
*)
        if poruka='' then
        begin
            ShowMessage('Prije nego što nastavimo, molim vas da provjerite u drugim klubovima'
                +#13+'koliki je saldo èlana, dug, da li ima ugovor i da te podatke'
                +#13+'naknadno po potrebi ispravite. Na kraju provjerite STATUS i POLOG ÈLANA.');
            if Confirm('Da li želite nastaviti sa kopiranjem starog èlana: '+oldClanovi.FieldByName('imeprezime').AsString+'?') then
            begin
                ShareUnit.UpitOpen(myQuery1,
                'INSERT INTO clanovi '+
                '(imeprezime, adresa, mjstanovanja, telefon, jmbg, osobna, duzan, ovlast1, ovlast2, ovlast3, popust, '+
                'popustvrijedido, brojzaduz, barcode, napomena, azurirano, djelatnik, napomena2, datumupisa, klubupisa, infoboxid, '+
                'clanarinavrijedido, stornodug, stornoracbr, stornoracdatum, stornoplatitido, email, mobitel, napomena3, '+
                'sms, vrstapologa, pologvrijedido, prvaposudba, statuspougovoru, statusclana, sifstatuspougovoru, '+
                'datumizmemail, datumizmmob, osiguranjevrijedido, zadnjaposudba) '+
                'VALUES ('''+oldClanovi.FieldByName('imeprezime').AsString+''', '+
                ''''+oldClanovi.FieldByName('adresa').AsString+''', '+
                ''''+oldClanovi.FieldByName('mjstanovanja').AsString+''', '+
                ''''+oldClanovi.FieldByName('telefon').AsString+''', '+
                ''''+oldClanovi.FieldByName('jmbg').AsString+''', '+
                ''''+oldClanovi.FieldByName('osobna').AsString+''', '+
                oldClanovi.FieldByName('duzan').AsString+', '+
                ''''+oldClanovi.FieldByName('ovlast1').AsString+''', '+
                ''''+oldClanovi.FieldByName('ovlast2').AsString+''', '+
                ''''+oldClanovi.FieldByName('ovlast3').AsString+''', '+
                oldClanovi.FieldByName('popust').AsString+', '+
                ''''+FormatDateTime('yyyy-mm-dd', oldClanovi.FieldByName('popustvrijedido').AsDateTime)+''', '+
                '0, '+
                ''''+oldClanovi.FieldByName('barcode').AsString+''', '+
                ''''+oldClanovi.FieldByName('napomena').AsString+''', '+
                ''''+FormatDateTime('yyyy-mm-dd hh:mm:ss', Now)+''', '+
                IntToStr(Voperater)+', '+
                ''''+oldClanovi.FieldByName('napomena2').AsString+''', '+
                ''''+FormatDateTime('yyyy-mm-dd', oldClanovi.FieldByName('datumupisa').AsDateTime)+''', '+
                IntToStr(SifraKluba)+', '+
                ''''+oldClanovi.FieldByName('infoboxid').AsString+''', '+
                ''''+FormatDateTime('yyyy-mm-dd', oldClanovi.FieldByName('clanarinavrijedido').AsDateTime)+''', '+
                '0, null, null, null,'+ // storno shits
                ''''+oldClanovi.FieldByName('email').AsString+''', '+
                ''''+oldClanovi.FieldByName('mobitel').AsString+''', '+
                ''''+oldClanovi.FieldByName('napomena3').AsString+''', '+
           //     ''''+oldClanovi.FieldByName('email').AsString+''', '+
                ''''+oldClanovi.FieldByName('sms').AsString+''', '+
                ShareUnit.IfSQLIntNull(oldClanovi.FieldByName('vrstapologa'))+', '+
                ''''+FormatDateTime('yyyy-mm-dd', oldClanovi.FieldByName('pologvrijedido').AsDateTime)+''', '+
                ''''+oldClanovi.FieldByName('prvaposudba').AsString+''', '+
                ''''+oldClanovi.FieldByName('statuspougovoru').AsString+''', '+
                ''''+oldClanovi.FieldByName('statusclana').AsString+''', '+
                ''''+oldClanovi.FieldByName('sifstatuspougovoru').AsString+''', '+
                ''''+FormatDateTime('yyyy-mm-dd', oldClanovi.FieldByName('datumizmemail').AsDateTime)+''', '+
                ''''+FormatDateTime('yyyy-mm-dd', oldClanovi.FieldByName('datumizmmob').AsDateTime)+''', '+
                ''''+FormatDateTime('yyyy-mm-dd', oldClanovi.FieldByName('osiguranjevrijedido').AsDateTime)+''', '+
                ''''+FormatDateTime('yyyy-mm-dd', oldClanovi.FieldByName('zadnjaposudba').AsDateTime)+''')', True, False);
            end;
        end
        else ShowMessage(poruka);
    end
    else ShowMessage('U starim podacima ne postoji èlan sa šifrom '+IntToStr(i));
end;

Procedure TPodaci.ImportajFilm(i: Integer);
var poruka: String;
begin
    poruka:='';
    oldKazete.Filter:='sifra='+IntToStr(i);
    oldKazete.Filtered:=True;
    oldKazete.Open;

    if oldKazete.RecordCount=1 then
    begin
      // provjeri da li je film obrisan
      if (oldKazete.FieldByName('obrisan').AsString='T')
        or (oldKazete.FieldByName('obrisan').AsString='D')
        or oldKazete.FieldByName('obrisan').AsBoolean then
          poruka:='Film '+IntToStr(i)+'-'+oldKazete.FieldByName('naziv').AsString+' je obrisan!';

      if poruka='' then
      begin
        ShowMessage('Prije nego što nastavimo, molim vas da provjerite da film "'+#13+
                oldKazete.FieldByName('naziv').AsString+'" veæ nije upisan!');
        if Confirm('Da li želite nastaviti sa prebacivanjem filma: '+oldKazete.FieldByName('naziv').AsString+'?') then
        begin
// treba podesiti da se kompenzira dodatak TKazeteDetail
            ShareUnit.UpitOpen(myQuery1,
                'INSERT INTO kazete '+
                '(Naziv, Zanr, Vrijeme, Rezija, Glumac1, Glumac2, BrRacuna, Drzava, Dobavljac, Proizveden, '+
                'Kupljen, CijenaKn, CijenaDEM, Kategorija, Obrisan, DatumBrisanja, DatumPlacanja, Azurirano, '+
                'Djelatnik, OrginalNaziv, VrstaMedija, PravaVrijedeDo, SifraStatusFilma, KupljenoKazeta, PodZanr) '+
                'VALUES ('+
                ''''+oldKazete.FieldByName('naziv').AsString+''', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('Zanr'))+', '+
                ''''+oldKazete.FieldByName('Vrijeme').AsString+''', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('Rezija'))+', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('Glumac1'))+', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('Glumac2'))+', '+
                ''''+oldKazete.FieldByName('BrRacuna').AsString+''', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('Drzava'))+', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('Dobavljac'))+', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('Proizveden'))+', '+
                ''''+FormatDateTime('yyyy-mm-dd',oldKazete.FieldByName('Kupljen').AsDateTime)+''', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('CijenaKn'))+', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('CijenaDEM'))+', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('Kategorija'))+', '+
                '''N'', '+ // obrisan
                ''''+FormatDateTime('yyyy-mm-dd', oldKazete.FieldByName('DatumBrisanja').AsDateTime)+''', '+
                ''''+FormatDateTime('yyyy-mm-dd', oldKazete.FieldByName('DatumPlacanja').AsDateTime)+''', '+
                ''''+FormatDateTime('yyyy-mm-dd hh:mm:ss', Now)+''', '+
                IntToStr(Voperater)+', '+
                ''''+oldKazete.FieldByName('OrginalNaziv').AsString+''', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('VrstaMedija'))+', '+
                ''''+FormatDateTime('yyyy-mm-dd', oldKazete.FieldByName('PravaVrijedeDo').AsDateTime)+''', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('SifraStatusFilma'))+', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('KupljenoKazeta'))+', '+
                ShareUnit.IfSQLIntNull(oldKazete.FieldByName('PodZanr'))+')', True, False);
        end;
      end
      else ShowMessage(poruka);
    end
    else ShowMessage('U starim podacima ne postoji film sa šifrom '+IntToStr(i));
end;

Function TPodaci.DaLiJeBlagdan(datum: TDate):Boolean;
begin
    ShareUnit.UpitOpen(myQuery2, 'SELECT NazivBlagdana FROM blagdani WHERE DatumBlagdana='''+FormatDateTime('yyyy-mm-dd', datum)+'''', False, True);
    if myQuery2.IsEmpty then
        Result:=False
    else
        Result:=True;
end;

procedure TPodaci.TFilmoviAfterOpen(DataSet: TDataSet);
begin
    TFilmDet.Open;
end;

procedure TPodaci.TFilmoviAfterClose(DataSet: TDataSet);
begin
    TFilmDet.Close;
end;

procedure TPodaci.tabradniciBeforeOpen(DataSet: TDataSet);
begin
     TabRadnici.Filter:='SifraFirme='+IntToStr(SifraFirme);
     TabRadnici.Filtered:=True;
end;

destructor TPodaci.Destroy;
begin
    Logiraj('__ Start DESTROY DataModul - '+BoolToStr(MainForm.MojThread1Aktivan, True)+' '+DateTimeToStr(Now), True);
    if (MainForm.MojThread1 <> nil) and (MainForm.MojThread1Aktivan = true) then   // provjera da neradi Thread za web statistiku
    begin
        MainForm.MojThread1.Terminate;    // pa ga onda ubi
        MainForm.MojThread1.WaitFor;      // wait for it to terminate
    end;
    Logiraj('__ Kraj DESTROY DataModul - '+BoolToStr(MainForm.MojThread1Aktivan, True)+' '+DateTimeToStr(Now), True);

    inherited destroy;
end;

Function TPodaci.ZaduziRezervaciju(Grid: TwwDBGrid):Boolean;
var i: integer;
    upit_rez: String;
    popis: Array of array of string;
begin
        if Grid.SelectedList.Count>0 then
        begin
            Grid.DataSource.DataSet.DisableControls;
            Result:=False;
            upit_rez:='UPDATE rezervacija2 SET status=''zaduzeno'' WHERE sifra IN (';

            SetLength(popis, Grid.SelectedList.Count, 4);
            for i:= 0 to Grid.SelectedList.Count-1 do
            begin
                Grid.DataSource.DataSet.GotoBookmark(Grid.SelectedList.items[i]);
                popis[i,0]:=Grid.DataSource.DataSet.FieldByName('sifrakazete').AsString;
                popis[i,1]:=Grid.DataSource.DataSet.FieldByName('film').AsString; // film
                popis[i,2]:=Grid.DataSource.DataSet.FieldByName('sifra').AsString;
                popis[i,3]:=Grid.DataSource.DataSet.FieldByName('sifraclana').AsString;
            end;

            for i:= 0 to Grid.SelectedList.Count-1 do
            begin
//                Grid.DataSource.DataSet.GotoBookmark(Grid.SelectedList.items[i]);
                if FKartica.ZaduziFilm(popis[i,0], popis[i,3], False) then
                begin
                        // oznaèi sada staru rezervaciju da je ostvarena (ako je bilo uspješno zaduženje)
                        upit_rez:=upit_rez+popis[i,2]+', ';
                        Result:=True;
                end;
            end;
            Delete(upit_rez, length(upit_rez)-1, 2);
            upit_rez:=upit_rez+')';

            try
                if Result then ShareUnit.UpitOpen(Podaci.myQuery1, upit_rez, True, False);
            except on E: Exception do
                begin
                        Logiraj(Podaci.myQuery1.Name+'::Error - Podaci.ZadužiRezervaciju: '+E.Message, True);
                end;
            end;

            Grid.UnselectAll;
            Grid.DataSource.DataSet.Close;
            Grid.DataSource.DataSet.Open;
            Grid.DataSource.DataSet.EnableControls;
        End
        else ShowMessage('Nema odabranih podataka za obradu!');
end;

Function TPodaci.ZaduziWishListu(Grid: TwwDBGrid):Boolean;
var i: integer;
    upit_rez: String;
    popis: Array of array of string;
begin
        if Grid.SelectedList.Count>0 then
        begin
            Grid.DataSource.DataSet.DisableControls;
            Result:=False;
            upit_rez:='DELETE FROM whishlista WHERE id IN (';

            SetLength(popis, Grid.SelectedList.Count, 4);
            for i:= 0 to Grid.SelectedList.Count-1 do
            begin
                Grid.DataSource.DataSet.GotoBookmark(Grid.SelectedList.items[i]);
                popis[i,0]:=Grid.DataSource.DataSet.FieldByName('sifrafilma').AsString;
                popis[i,1]:=Grid.DataSource.DataSet.FieldByName('film').AsString; // k.naziv
                popis[i,2]:=Grid.DataSource.DataSet.FieldByName('id').AsString;
                popis[i,3]:=Grid.DataSource.DataSet.FieldByName('sifraclana').AsString;
            end;

            for i:= 0 to Grid.SelectedList.Count-1 do
            begin
//                Grid.DataSource.DataSet.GotoBookmark(Grid.SelectedList.items[i]);

                if FKartica.ZaduziFilm(popis[i,0], popis[i,3], False) then
                begin
                        // obriši sada staru wishlistu da je ostvarena (ako je bilo uspješno zaduženje)
                        upit_rez:=upit_rez+popis[i,2]+', ';
                        Result:=True;
                end;
            end;
            Delete(upit_rez, length(upit_rez)-1, 2);
            upit_rez:=upit_rez+')';

            try
                if Result then ShareUnit.UpitOpen(Podaci.myQuery1, upit_rez, True, False);
            except on E: Exception do
                begin
                        Logiraj(Podaci.myQuery1.Name+'::Error - Podaci.ZadužiWishListu: '+E.Message, True);
                end;
            end;

            Grid.UnselectAll;
            Grid.DataSource.DataSet.Close;
            Grid.DataSource.DataSet.Open;
            Grid.DataSource.DataSet.EnableControls;
            FKartica.LMDEdit.SetFocus;
        End
        else ShowMessage('Nema odabranih podataka za obradu!');
end;

Function TPodaci.WishLista2Rezervacija(Grid: TwwDBGrid):Boolean;
var i: integer;
    upit_rez: String;
begin
        if Grid.SelectedList.Count>0 then
        begin
            Grid.DataSource.DataSet.DisableControls;
            Result:=False;
            upit_rez:='DELETE FROM whishlista WHERE id IN (';

            for i:= 0 to Grid.SelectedList.Count-1 do
            begin
                Grid.DataSource.DataSet.GotoBookmark(Grid.SelectedList.items[i]);
                if FKartica.RezervirajFilm(Grid.DataSource.DataSet.FieldByName('sifrafilma').AsString, False) then
                begin
                    upit_rez:=upit_rez+Grid.DataSource.DataSet.FieldByName('id').AsString+', ';
                    Result:=True;
                end;
            end;
            Delete(upit_rez, length(upit_rez)-1, 2);
            upit_rez:=upit_rez+')';

            if Result then
                try
                    ShareUnit.UpitOpen(Podaci.myQuery1, upit_rez, True, False);
                except on E: Exception do
                begin
                        Logiraj(Podaci.myQuery1.Name+'::Error - Podaci.WishLista2Rezervacija: '+E.Message, True);
                end;
            end;

            Grid.UnselectAll;
            Grid.DataSource.DataSet.Close;
            Grid.DataSource.DataSet.Open;
            Grid.DataSource.DataSet.EnableControls;
            FKartica.LMDEdit.SetFocus;
        End
        else ShowMessage('Nema odabranih podataka za obradu!');
end;

Function TPodaci.Rezervacija2WishLista(Grid: TwwDBGrid):Boolean;
var i: integer;
    upit_rez: String;
begin
        if Grid.SelectedList.Count>0 then
        begin
            Grid.DataSource.DataSet.DisableControls;
            Result:=False;
            upit_rez:='DELETE FROM rezervacija2 WHERE sifra IN (';

            for i:= 0 to Grid.SelectedList.Count-1 do
            begin
                Grid.DataSource.DataSet.GotoBookmark(Grid.SelectedList.items[i]);
                FKartica.StaviNaWListu(Grid.DataSource.DataSet.FieldByName('sifrakazete').AsString, false);
                upit_rez:=upit_rez+Grid.DataSource.DataSet.FieldByName('sifra').AsString+', ';
                Result:=True;
            end;
            Delete(upit_rez, length(upit_rez)-1, 2);
            upit_rez:=upit_rez+')';

            try
                if Result then ShareUnit.UpitOpen(Podaci.myQuery1, upit_rez, True, False);
            except on E: Exception do
                begin
                        Logiraj(Podaci.myQuery1.Name+'::Error - Podaci.ZadužiRezervaciju: '+E.Message, True);
                end;
            end;

            Grid.UnselectAll;
            Grid.DataSource.DataSet.Close;
            Grid.DataSource.DataSet.Open;
            Grid.DataSource.DataSet.EnableControls;
        End
        else ShowMessage('Nema odabranih podataka za obradu!');
end;

procedure TPodaci.DataSet2HTML(ds: TDataSource);
begin
    DBExport.DataSource:=ds;
    if SaveDlg.Execute then DBExport.SaveToFile(SaveDlg.FileName);
end;

function TPodaci.DajRezervacije(sifra:string):boolean;
begin
    // provjera web rezervacija filma
    ShareUnit.UpitOpen(Qwww,
    'SELECT r.sifraclana, c.imeprezime, r.statusflag, k.sifra, k.naziv '+
    'FROM rezervacija r, clanovi c, kazete k '+
    'WHERE r.sifraclana=c.sifra '+
    'AND r.sifrakazete=k.sifra '+
    'AND r.sifrakazete IN ('+sifra+') '+
    'AND r.statusflag IN (''P'',''X'',''D'')'
    , False, True);

    // provjera obiènih rezervacija filma
    ShareUnit.UpitOpen(myQuery1,
    'SELECT r.sifraclana, c.imeprezime, r.dostava, k.sifra, k.naziv, r.sifra_videokluba '+
    'FROM rezervacija2 r, clanovi c, kazete k '+
    'WHERE r.status=''rezervirano'' '+
    'AND r.sifraclana=c.sifra '+
    'AND r.sifrakazete=k.sifra '+
    'AND r.sifrakazete IN ('+sifra+') '+
    'AND DATE(r.ZeljeniDatum)=CURDATE() '+
    'AND r.status=''rezervirano'''
    , False, True);

    // provjera wishlista filma
    ShareUnit.UpitOpen(myQuery2,
    'SELECT w.sifraclana, c.imeprezime, w.status, k.sifra, k.naziv, w.vrstamedija '+
    'FROM whishlista w, clanovi c, kazete k '+
    'WHERE w.status=''aktivan'' '+
    'AND w.sifraclana=c.sifra '+
    'AND w.sifrafilma=k.sifra '+
    'AND w.sifrafilma IN ('+sifra+') '+
    'AND w.status=''aktivan'''
    , False, True);

    if Qwww.RecordCount+myQuery1.RecordCount+myQuery2.RecordCount=0 then Result:=False else Result:=True;
end;

function TPodaci.LOGRotate(ime, prefix:string):Integer;
var SearchRec: TSearchRec;
begin
    try
        if FindFirst(ime, faAnyFile, SearchRec) = 0 then
            Result := SearchRec.Size;
        FindClose(SearchRec);

        if Result > 1048576 then // 1 MB
//        if Result > 1024 then // 1 KB
        begin
            // zip it and copy it to BAK
            if SpakirajFile(ime, prefix, PathLOG+'BAK') then
            begin
                DeleteFile(ime);              // obriši faj za logiranje podsjetnika
                FileClose(FileCreate(ime));   // napravi novi fajl (prazni) i zatvori ga
                Result:=0;                    // velièina LOG fajla
            end;
        end;
    except
        Result:=-1;
    end;
end;

Function TPodaci.SpakirajFile(ime, prefix, gdje: string):boolean;
var datum: string;
begin
    ZipMaster1.Load_Zip_Dll;
//    ZipMaster1.Load_Unz_Dll;
    try
        if not DirectoryExists(gdje) then ForceDirectories(gdje); // kreiraj BAK direktorij

        ZipMaster1.AddOptions := [];
//            if xp then AddOptions := [AddDiskSpan] Else AddOptions := [AddDiskSpanErase];

        ZipMaster1.TempDir := PathLOG;
        datum := '';
        DateTimeToString(datum, 'ddmmyymmnnss', Now);
        ZipMaster1.ZipFilename:=gdje+'\'+prefix+'_'+datum+'.zip';

        ZipMaster1.FSpecArgs.Clear;
        ZipMaster1.FSpecArgs.Add(ime);
        try
            ZipMaster1.Add;
            Result:=True;
        except
            Result:=False;
            Exit;
        end;

    finally
            ZipMaster1.Unload_Zip_Dll;
//            ZipMaster1.Unload_Unz_Dll;
    end;
end;

end.





