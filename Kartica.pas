unit Kartica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, ToolWin, Grids, DBGrids, Wwdbigrd,
  Wwdbgrid, DBCtrls, Db, Wwdatsrc, DBTables, Wwtable, Mask, wwdbedit,
  lmdctrl, lmdeditb, lmdeditc, LMDEdit, jpeg, DBIProcs, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxDBELib, ToolEdit, LMDCustomComponent,
  LMDContainerComponent, LMDBaseDialog, LMDCalendarDlg, LMDCustomButton,
  LMDButton, variants, Buttons, MySQLDataset, RxLookup;

type
  TFKartica = class(TForm)
    DStatus: TDataSource;
    LMDCalendarDlg1: TLMDCalendarDlg;
    DClan: TDataSource;
    DPOS: TDataSource;
    qZaPosuditi: TMySQLQuery;
    qClan: TMySQLQuery;
    TStatus: TMySQLTable;
    qPos: TMySQLQuery;
    qPossifrakazete: TIntegerField;
    qPosdatumpos: TDateTimeField;
    qPosFilm: TMySQLStringField;
    qPosVMedij: TMySQLStringField;
    qPosDjel: TMySQLStringField;
    qPosbcodekaz: TMySQLStringField;
    qPossifraNebitna: TAutoIncField;
    qPosiznos: TFloatField;
    qPosPrviDan: TIntegerField;
    qPosNaredni: TIntegerField;
    qPosVikenda: TIntegerField;
    qPosBlagdana: TIntegerField;
    qPosCijenaDan: TFloatField;
    qPosCijenaSvaki: TFloatField;
    qPosCijenaVikend: TFloatField;
    qPosCijenaBlagdan: TFloatField;
    qPosVrati: TBooleanField;
    qClanSifra: TAutoIncField;
    qClanImePrezime: TMySQLStringField;
    qClanDuzan: TFloatField;
    qClanPopust: TSmallintField;
    qClanPopustVrijediDo: TDateField;
    qClanBrojZaduz: TIntegerField;
    qClanBarCode: TMySQLStringField;
    qClanNapomena: TMySQLStringField;
    qClanNapomena2: TMySQLStringField;
    qClanDatumUpisa: TDateField;
    qClanInfoBoxID: TMySQLStringField;
    qClanClanarinaVrijediDo: TDateTimeField;
    qClanStornoDug: TFloatField;
    qClanStornoRacDatum: TDateField;
    qClanStornoPlatitiDo: TDateField;
    qClanNapomena3: TMySQLStringField;
    qClanStatusPoUgovoru: TMySQLStringField;
    qClanStatusClana: TIntegerField;
    qClanSifStatusPoUgovoru: TIntegerField;
    qClanOvlast1: TMySQLStringField;
    qClanOvlast2: TMySQLStringField;
    qClanOvlast3: TMySQLStringField;
    qClanOsiguranjeVrijediDo: TDateField;
    qClanJmbg: TMySQLStringField;
    qClanAdresa: TMySQLStringField;
    qClanMjStanovanja: TMySQLStringField;
    qClanTelefon: TMySQLStringField;
    qClanPrvaPosudba: TMySQLStringField;
    Panel1: TPanel;
    Label1: TLabel;
    TabCon: TTabControl;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label8: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label54: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    Label58: TLabel;
    Label61: TLabel;
    Panel4: TPanel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit11: TDBEdit;
    Panel7: TPanel;
    Image1: TImage;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    ObrisiFace: TLMDButton;
    ObrisiClanarinu: TLMDButton;
    ObrisiPopust: TLMDButton;
    Panel3: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    Label33: TLabel;
    LMDEdit: TEdit;
    wwDBGrid1: TwwDBGrid;
    wwIButton1: TwwIButton;
    Panel6: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Label49: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    qPossifraclana: TIntegerField;
    qClanStornoRacBr: TMySQLStringField;
    qProvjeraBCoda: TMySQLQuery;
    DrugiFilmovi: TMySQLQuery;
    dsDrugi: TDataSource;
    DrugiFilmovisifrakazete: TIntegerField;
    DrugiFilmovidatumpos: TDateTimeField;
    DrugiFilmoviFilm: TMySQLStringField;
    DrugiFilmoviVMedij: TMySQLStringField;
    DrugiFilmovibcodekaz: TMySQLStringField;
    DrugiFilmoviNazivKluba: TMySQLStringField;
    qDajVrstuUgovora: TMySQLQuery;
    dsVrstaUgovora: TDataSource;
    qProvjeraRezervacija: TMySQLQuery;
    Label62: TLabel;
    Label64: TLabel;
    qProvjeraRezervacija2: TMySQLQuery;
    qRezrvirano: TMySQLQuery;
    dsRezervirano: TDataSource;
    qRezrviranosifrakazete: TIntegerField;
    qRezrviranoFilm: TMySQLStringField;
    qRezrviranozeljenidatum: TDateField;
    qRezrviranoNazivKluba: TMySQLStringField;
    qRezrviranodostava: TMySQLStringField;
    PageControl1: TPageControl;
    TabRezervacija: TTabSheet;
    Panel8: TPanel;
    Label66: TLabel;
    RezervaEdit: TEdit;
    wwDBGrid2: TwwDBGrid;
    TabPosudbe: TTabSheet;
    TabWishLista: TTabSheet;
    uDrugimKlubovima: TwwDBGrid;
    gWishList: TwwDBGrid;
    qWishList: TMySQLQuery;
    dsWishList: TDataSource;
    qWishListsifraclana: TIntegerField;
    qWishListimeprezime: TMySQLStringField;
    qWishListsifrafilma: TIntegerField;
    qWishListmedij: TMySQLStringField;
    Panel9: TPanel;
    Label63: TLabel;
    WishL: TEdit;
    BitBtn1: TBitBtn;
    qRezrviranosifra: TAutoIncField;
    qWishListid: TAutoIncField;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    qRezrviranosifraclana: TIntegerField;
    qClanMobitel: TMySQLStringField;
    qWishListSelected: TBooleanField;
    qRezrviranoSelected: TBooleanField;
    qWishListfilm: TStringField;
    qClanemail: TMySQLStringField;
    Label10: TLabel;
    DBEdit12: TDBEdit;
    LMDButton1: TLMDButton;
    Label56: TLabel;
    Label57: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    LMDButton2: TLMDButton;
    LMDButton3: TLMDButton;
    qClanSocialStatus: TSmallintField;
    TFacebook: TMySQLDataset;
    DFacebook: TDataSource;
    RxDBLookupCombo3: TRxDBLookupCombo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabConChange(Sender: TObject);
    procedure LMDEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TPosAfterEdit(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ObrisiClick(Sender: TObject);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure qClanAfterOpen(DataSet: TDataSet);
    procedure DajF11(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDeactivate(Sender: TObject);
    procedure qRezrviranoAfterOpen(DataSet: TDataSet);
    procedure DrugiFilmoviAfterOpen(DataSet: TDataSet);
    procedure qWishListAfterOpen(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);
    procedure ZadRezervaciju(Sender: TObject);
    procedure ZadWishListu(Sender: TObject);
    procedure gWishListCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure ZamjeniREZ_WISH(Sender: TObject);
    procedure VratiSe(Sender: TObject);
    procedure FinalKey(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZatvoriEdit(Sender: TObject);
  private
    { Private declarations }
    staza:String;
    Prikslika, JaviDaJeIstekla, JaviZaOsiguranje:Boolean;
    InputString: string;

    procedure ZatvoriKarticu;
    function  SnimiKarticu:Integer;
    procedure StisnutEnt(t:integer);
    procedure Poruka;
    Function  IzvadiBroj(tb:String):Integer;
    function  PopuniNule2(X:String; Koliko:Integer): String;
    procedure Prika;
  public
    { Public declarations }
    NoviBCode:String;
    procedure ShowM(Clan, Film:Integer);
    Function  ProvjereFilma(BrFilm:Integer):Boolean;
    Procedure IzaberiFilm(film:String; t:integer);
    Function  ZaduziFilm(BrFilm, Clan:String; bc:Boolean):Boolean;
    procedure StaviNaWListu(BrFilm:String; bc:Boolean);
    function RezervirajFilm(BrFilm:String; bc:Boolean):boolean;
  end;

var
  FKartica: TFKartica;

implementation

Uses BazeModul, Main, AppUtils, DateUtil, FilmoviDlg, VracanjeDlg, DaliGledoDlg, SaldoDlg,
     IspravakKDlg,IzmjenaPopustDlg, IskaznicaDlg, UnosClanovi, ClanstvoPoUgovoru, PostavkeDlg,
     VratitiDoDlg, UnosbarCode, Share, FilmUkupno, UnosCrneListe,
     UnosTemplate, DLG_OdabirDatuma, DLG_OdabirMedija, DLG_Combo;

{$R *.DFM}

procedure TFKartica.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

function TFKartica.PopuniNule2(X:String;Koliko:Integer): String;
Var i:Integer;
Begin
  Result := '';
  if Length(X) = Koliko then Result := X
  Else Begin
    for i := 1 to (Koliko-Length(X)) do Result := result + '0';
    Result := Result + x;
  End;
End;

procedure TFKartica.FormCreate(Sender: TObject);
begin
    if frizerski then
    begin
        Label1.Caption:='Otvorene kartice klijenata:';
        Label2.Caption:='Zaduži klijenta sa:';
        Label33.Caption:='broj ili naziv usluge ili oèitaj barcode akcije';
        TabWishLista.Visible:=False;
        TabPosudbe.Visible:=False;
        BitBtn4.Visible:=False;

        FVracanjeDlg.Caption:='NAPLATA usluga';
//        FVracanjeDlg.Label54.Caption:='Status klijenta:';
//        FVracanjeDlg.Label7.Caption:='Status klijenta po ugovoru :';

    end;

    if kojistroj = 0 then staza := ExtractFilePath(Application.ExeName)+'Slike\'
    Else
    begin
        try
            staza := Podaci.TabSetUp.FieldByName('SlikeDrugi').AsString+'\';
        except
            staza := '';
        End;
    End;
//    ShowMessage(staza+'c'+PopuniNule2(inttostr(1351),5)+'.jpg');

    if Podaci.TabSetUp.FieldByName('Slike').Value='D' then Prikslika:=True else Prikslika:=False;
    if Podaci.TabSetUp.FieldByName('NaplatiClanarinu').Value='D' then JaviDaJeIstekla:=True else JaviDaJeIstekla:=False;
    if Podaci.TabSetUp.FieldByName('NaplatiOsiguranje').Value='D' then JaviZaOsiguranje:=True else JaviZaOsiguranje:=False;

//    DaljePosudjeno.Visible:=DrugiKlubovi;
    uDrugimKlubovima.Visible:=DrugiKlubovi;
end;

procedure TFKartica.FormActivate(Sender: TObject);
begin
    if Podaci.TabSetUp.FieldByName('PopustVidljiv').Value='D' then Label12.Visible:=True else Label12.Visible:=False;
    DBEdit10.Visible := Label12.Visible;
    Label61.Enabled := Label12.Visible;
    DBEdit23.Enabled := Label12.Visible;
    ObrisiPopust.Enabled := Label12.Visible;

    if Podaci.TabSetUp.FieldByName('NaplatiClanarinu').Value='D' then Label11.Enabled:=True else Label11.Enabled:=False;
    DBEdit15.Enabled := Label11.Enabled;
    ObrisiClanarinu.Enabled := Label11.Enabled;

    if Podaci.TabSetUp.FieldByName('NaplatiOsiguranje').Value='D' then Label58.Enabled:=True else Label58.Enabled:=False;

    LMDEdit.text := '';
    LMDEDit.SetFocus;

    qPosVrati.Visible:=False;
end;

Function TFKartica.IzvadiBroj(tb:String):Integer;
begin
  if tb[1] = '*' then result := strToInt(copy(tb,2,length(tb)-1))
  Else result := strToInt(tb);
End;

procedure TFKartica.ShowM(Clan, Film:Integer);
Var i: Integer;
    poruka, temp: String;
begin
    if Clan = -1 then
    begin
        TabCon.TabIndex := 0;   // otvori prvoga
        temp:=TabCon.Tabs[0];   // privremeni string
        while Pos('*', temp) > 0 do Delete(temp, Pos('*', temp), 1); // obriši '*' zbog konverzije u integer
        Clan:=StrToInt(temp);   // i postavi šifru èlana
    end
    Else
    begin
         i := TabCon.Tabs.IndexOf(inttostr(Clan));    //traži da li postoji
         if i = -1 then i := TabCon.Tabs.IndexOf('*'+IntToStr(Clan));
         if i = -1 then
         begin
            TabCon.Tabs.Add(IntToStr(Clan));
            TabCon.TabIndex := TabCon.Tabs.Count-1;
         End
         Else TabCon.TabIndex := i;
    End;

    qClan.Close;
    qClan.ParamByName('clan').Value:=Clan;
    qClan.Open;
    if qClan.IsEmpty then Exit;

    qPos.ParamByName('Klub').Value:=SifraKluba;
    qPos.ParamByName('Sifra').Value:=Clan;
    if qPos.State=dsInactive then qPos.Open;
    if TStatus.State=dsInactive then TStatus.Open;
    if TFacebook.State=dsInactive then TFacebook.Open;

    if film <> 0 then FVracanjeDlg.ShowMvracanje(film);

    poruka:='';

    If crnaLista then
    begin
        Podaci.TCrnaLista.Close;
        Podaci.TCrnaLista.MacroByName('WHERE').AsString:='WHERE ImePrezime='''+qClan.FieldByName('ImePrezime').AsString+'''';
        Podaci.TCrnaLista.Open;
        if not Podaci.TCrnaLista.IsEmpty then
              poruka:=poruka+'UPISAN JE NA CRNU LISTU!!!'+#13+#13+Podaci.TCrnaLista.fieldByName('Napomena').AsString;;
    end;

//    if Podaci.tabSetUp.FieldByName('NaplatiClanarinu').Value='D' then JaviDaJeIstekla:=True else JaviDaJeIstekla:=False;
    if Podaci.tabSetUp.FieldByName('NaplatiOsiguranje').Value='D' then JaviZaOsiguranje:=True else JaviZaOsiguranje:=False;

(*    if JaviDaJeIstekla then
        if qClan.FieldByName('ClanarinaVrijediDo').asString <> '' then
            if qClan.FieldByName('ClanarinaVrijediDo').Value < date then
                poruka:=poruka+#13+'- istekla èlanarina!'; *)

    if JaviZaOsiguranje then
        if qClan.FieldByName('OsiguranjeVrijediDo').asString <> '' then
            if qClan.FieldByName('OsiguranjeVrijediDo').Value < date then
                poruka:=poruka+#13+'- isteklo osiguranje!';

    if (qClan.FieldByName('Popust').AsInteger<>0) then
    begin
        if (qClan.FieldByName('Duzan').AsInteger<=0) then
        begin
            if (qDajVrstuUgovora.FieldByName('naziv').AsString<>'') and (qClan.FieldByName('ClanarinaVrijediDo').Value < date) then
                poruka:=poruka+#13+'- Èlan nije platio ratu ugovora! Tražite plaèanje.';
        end
        else
            if qDajVrstuUgovora.FieldByName('naziv').AsString='' then           // nema ugovor
            begin
                qClan.Edit;
                qClan.FieldByName('Popust').AsInteger:=0;
                qClan.FieldByName('PopustVrijediDo').AsString:='';
                qClan.FieldByName('ClanarinaVrijediDo').AsString:='';
                qClan.Post;

                if qClan.FieldByName('ClanarinaVrijediDo').Value < date then    // istekla èlanarina
                    poruka:=poruka+#13+'- Istekao popust!'
                else
                if qClan.FieldByName('ClanarinaVrijediDo').IsNull then
                    poruka:=poruka+#13+'- Èlanu je istekao popust od èlanarine.'; // ako je istekao saldo od uèlanjena
            end;
// *************************************************************************
        if qDajVrstuUgovora.FieldByName('naziv').AsString='' then
        begin
        // ****
        end
        else
        begin
            if (qClan.FieldByName('ClanarinaVrijediDo').IsNull) then            // nema èlanarine
            begin
                if qClan.FieldByName('Duzan').AsInteger<=0 then
                    poruka:=poruka+#13+'- Predložiti uplatu novog salda ili'
                                  +#13+'otvaranje neke od vrijednosnih kartica.';
            end
            else
            if qClan.FieldByName('ClanarinaVrijediDo').Value < date then        // istekla èlanarina
                poruka:=poruka+#13+'- istekao popust!';
        end;
    end;

    if (qClan.FieldByName('Telefon').AsString='') or (qClan.FieldByName('Telefon').IsNull) then
        poruka:=poruka+#13+'- nema upisan fiksni telefon';

    if (qClan.FieldByName('Mobitel').AsString='') or (qClan.FieldByName('Mobitel').IsNull) then
        poruka:=poruka+#13+'- nema upisan mobilni telefon';

    if (qClan.FieldByName('email').AsString='') or (qClan.FieldByName('email').IsNull) then
        poruka:=poruka+#13+'- nema upisan email';

    if (qClan.FieldByName('SocialStatus').AsInteger=0) or (qClan.FieldByName('SocialStatus').IsNull) then
        poruka:=poruka+#13+'- nema odreðen Facebook status';

    if poruka<>'' then
    begin
        DodajPodsjetnik('Èlan: ('+IntToStr(Clan)+') '+qClan.FieldByName('ImePrezime').AsString+poruka);
        MessageDlg('Èlan: ('+IntToStr(Clan)+') '+qClan.FieldByName('ImePrezime').AsString+poruka, mtWarning, [mbOk], 0);
    end;

    if qClan.FieldByName('StornoDug').AsFloat>0 then LMDEdit.Color:=clRed
    else LMDEdit.Color:=clInfoBk;

    // da li èlan ima rezervacija
    qRezrvirano.Close;
    qRezrvirano.MacroByName('CLAN').AsString:=IntToStr(clan);
    qRezrvirano.Open;

    // da li èlan ima WishListu
    qWishList.Close;
    qWishList.MacroByName('CLAN').AsString:=IntToStr(clan);
    qWishList.Open;
    Prika;
end;

procedure TFKartica.Prika;
begin
  if PrikSlika then
  begin
    try
      Image1.Picture.LoadFromFile(staza+'c'+PopuniNule2(inttostr(qClan.FieldByName('Sifra').Value),5)+'.jpg');
    except
      Image1.Picture := nil;
    End;
  End;
end;

procedure TFKartica.TabConChange(Sender: TObject);
var i: integer;
begin
    i:=IzvadiBroj(TabCon.Tabs[TabCon.TabIndex]);

    qPos.Close;
    qClan.Close;
    qClan.ParamByName('clan').Value:=i;
    qClan.Open;
    qPos.ParamByName('Sifra').Value:=i;
    qPos.Open;

    if qClan.FieldByName('StornoDug').AsFloat>0 then LMDEdit.Color:=clRed // ako èlan ima storno dug
    else LMDEdit.Color:=clInfoBk;

    if not Podaci.TCrnaLista.IsEmpty then // ako je èlan na crnoj listi
    begin
        Label64.Caption:='Skini èlana sa crne liste!!!';
        Label64.Color:=clRed;
    end
    else
    begin
        Label64.Caption:='Stavi èlana na crnu listu';
        Label64.Color:=clBtnFace;
    end;

    Prika;  // slika èlana
    LMDEdit.text := '';
    if LMDEDit.Visible then LMDEDit.SetFocus;

    // da li èlan ima rezervacija
    qRezrvirano.Close;
    qRezrvirano.MacroByName('CLAN').AsString:=IntToStr(i);
    qRezrvirano.Open;

    // da li èlan ima WishListu
    qWishList.Close;
    qWishList.MacroByName('CLAN').AsString:=IntToStr(i);
    qWishList.Open;
end;

procedure TFKartica.LMDEditKeyPress(Sender: TObject; var Key: Char);
var i:Integer;
begin
  If (key = #13) and ((Sender as TEdit).Text = '') then
  begin
    if frizerski and (qPos.RecordCount>0) then
    begin
        if Confirm('Niste naplatili svoje usluge'+#13+'Da li želite zatvoriti karticu?') then
            ZatvoriKarticu;
    end
    else ZatvoriKarticu;
  end
  Else If key = #13 then StisnutEnt((Sender as Tedit).Tag)
       else if (key = #32) and ((Sender as TEdit).Text = '') and (TabCon.Tabs.Count > 1) then
            begin
              i := TabCon.TabIndex+1;
              if TabCon.Tabs.Count = i then TabCon.TabIndex := 0
              Else TabCon.TabIndex := i;
              TabConChange(nil);
              key := #0;
            End;
end;

procedure TFKartica.Poruka;
Begin
    MessageDlg('Podatak koji ste upisali NE POSTOJI!!!', mtWarning, [mbOk], 0);
    LMDEdit.Text:='';
    RezervaEdit.Text:='';
End;

Procedure TFKartica.IzaberiFilm(film:String; t:integer);
Begin
    Application.CreateForm(TFFilmoviDlg,FFilmoviDlg);
    if copy(film, 1, 2) = '**' then
        FFilmoviDlg.ShowD(copy(film,3,length(film)-1), 'ORGINALNAZIV', True)
    Else FFilmoviDlg.ShowD(film, 'NAZIV', True);
    if IzabranFilm <> '-1' then
        case t of
            1:  RezervirajFilm(IzabranFilm, False);
            2:  StaviNaWListu(IzabranFilm, False);
            else ZaduziFilm(IzabranFilm, '', False);
        end;
End;

procedure TFKartica.StisnutEnt(t:integer);
Var I, Code: Integer;
    key_value: String;
begin
    case t of
        1:  key_value:=RezervaEdit.Text;
        2:  key_value:=WishL.Text;
        else key_value:=LMDEdit.Text;
    end;

    if SmijePosuditi then
       if qClan.FieldByName('Duzan').Value < 0 then
       begin
            MessageDlg('Saldo èlana je u minusu, te nema pravo podizati kazete dok ne podmiri dug!', mtWarning, [mbOk], 0);
            if t=0 then
            begin
                LMDEdit.text := '';
                LMDEDit.SetFocus;
            end
            else
            begin
                RezervaEdit.text := '';
                RezervaEdit.SetFocus;
            end;

            exit;
       End;

    if length(key_value) < Podaci.TabSetUp.FieldByName('MinDuzBcode').AsInteger then
    begin
    // nije BarCode u pitanju
        Val(key_value, I, Code);
        if code = 0 then
        begin
            case t of
                1:  RezervirajFilm(IntToStr(I), False);
                2:  StaviNaWListu(IntToStr(I), False);
                else ZaduziFilm(IntToStr(I), '', False);
            end;
        end
        else
        begin
            //IzOdabiraF:=True;
            if copy(key_value,1,1) = '*' then
            Begin
                Application.CreateForm(TFFilmoviDlg,FFilmoviDlg);
                FFilmoviDlg.ShowD(copy(key_value, 2, length(key_value)-1), 'ORGINALNAZIV', True);
            End
            else
            Begin
                Application.CreateForm(TFFilmoviDlg,FFilmoviDlg);
                FFilmoviDlg.ShowD(copy(key_value, 1, length(key_value)-1), 'NAZIV', True);
            End;
            if IzabranFilm<>'-1' then
            begin
                case t of
                    1:  RezervirajFilm(IzabranFilm, False);
                    2:  StaviNaWListu(IzabranFilm, False);
                    else ZaduziFilm(IzabranFilm, '', False);
                end;
            end;
        end;
    End
    // moguæe je da se radi o BarCode-u
    Else
    Begin
        if SveBrojevi(key_value) or SveBrojevi2(key_value) then // naði koji je barkod od kazete
        begin
            case t of
                1:  RezervirajFilm(key_value, True);
                2:  StaviNaWListu(key_value, True);
                else ZaduziFilm(key_value, '', True);
            end;
        end
        Else IzaberiFilm(key_value, t);
    end;

    case t of
        0: begin
                LMDEdit.text := '';
                LMDEDit.SetFocus;
                qPos.Close;
                qPos.Open;
           end;

        1: begin
                RezervaEdit.text := '';
                RezervaEdit.SetFocus;
                qRezrvirano.Close;
                qRezrvirano.Open;
           end;

        2: begin
                WishL.Text := '';
                WishL.SetFocus;
                qWishList.Close;
                qWishList.Open;
           end;
    end;
end;

Function TFKartica.ProvjereFilma(BrFilm:Integer):Boolean;
Begin
  // 1. da li je obrisan, 2. da li ima slobodnih kopija, 3. dali je gledao
  Result := True;
  if Podaci.TFilmDetObrisan.Value='D' then
  begin
    Result := False;
    MessageDlg('Film je obrisan!!!', mtWarning, [mbOk], 0);
  End
  Else
  begin
     qZaPosuditi.Close;
     qZaPosuditi.MacroByName('SIFRAKAZETE').AsString:=IntToStr(BrFilm);
     qZaPosuditi.MacroByName('KLUB').AsString:=IntToStr(SifraKluba);
     qZaPosuditi.Open;
     if qZaPosuditi.FieldByName('ZaIzdati').AsInteger=0 then
     begin
         Result := False;
         MessageDlg('Sve kazete su posuðene!!!', mtWarning, [mbOk], 0);
     End
     Else
     begin
        ShareUnit.UpitOpen(Podaci.myQuery1,
        ' SELECT SifraClana'+
        ' FROM koi'+
        ' WHERE SifraClana='+qClan.FieldByName('Sifra').AsString+
        ' AND Sifrakazete='+IntToStr(brFilm), False, True);
        if not Podaci.myQuery1.IsEmpty then
            Result := Confirm('Èlan je veæ gledao film'+#13
                      +Podaci.sStr(Podaci.NazivFilma(IntToStr(BrFilm), False))+'.'+#13+'Da li želi ponovo?');
     end;
     qZaPosuditi.Close;
  end;
End;

procedure TFKartica.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var ak, sifra_zaduzenja : Integer;
    a:Word;
    InputString2:String;
begin
  if Shift = [ssCtrl] then
  begin
     case key of
        VK_F2 : If PristupOpciji(902) then
                begin
                        if confirm('Da li stvarno želite promjeniti ÈLANARINU?') then
                        begin
                                if LMDCalendarDlg1.Execute then
                                Begin
                                        qClan.Edit;
                                        qClan.FieldByName('ClanarinaVrijediDo').AsDateTime := LMDCalendarDlg1.DateValue;
                                        qClan.Post;
                                end;
                        End;
                        Exit;
                End;

        VK_F6 : If PristupOpciji(902) then
                Begin
                        if confirm('Da li stvarno želite promjeniti OSIGURANJE?') then
                        begin
                                if LMDCalendarDlg1.Execute then
                                Begin
                                        qClan.Edit;
                                        qClan.FieldByName('OsiguranjeVrijediDo').AsDateTime := LMDCalendarDlg1.DateValue;
                                        qClan.Post;
                                end;
                        End;
                        Exit;
                end;

        VK_F8 : Begin
                  Podaci.NaplatiDugovanje(qClan.FieldByName('Sifra').AsString);
                  qClan.Refresh;
                  exit;
                End;

        VK_F12: Begin
                  ShowDialog(TFClanstvoPoUgovoru);
                  exit;
                End;

        VK_F9:  Begin
                  Podaci.StornoRacuna;
                  exit;
                End;

        VK_F10: Begin // prebaci/skini èlana na crnu listu
                  If crnaLista then
                  begin
                    Podaci.TCrnaLista.Close;
                    Podaci.TCrnaLista.MacroByName('WHERE').AsString:='WHERE ImePrezime='''+qClan.FieldByName('ImePrezime').AsString+'''';
                    Podaci.TCrnaLista.Open;
                    if not Podaci.TCrnaLista.IsEmpty then
                    begin
                        if Confirm('Èlan: '+qClan.FieldByName('ImePrezime').AsString+#13+#13+
                        'DA LI STE SIGURNI DA ÈLANA HOÈETE'+#13+'   SKINITI SA CRNE LISTE?'+#13+Podaci.TCrnaLista.fieldByName('Napomena').AsString) then
                        begin
                            ShareUnit.UpitOpen(Podaci.myQuery1,
                            ' DELETE FROM crnalista WHERE sifra='+Podaci.TCrnaLista.FieldByName('sifra').AsString, True, False);
                            //TabCon. promjena boje
                        end;
                    end
                    else
                    begin
                        InputString:= InputBox('Upišite napomenu za crnu listu', qClanImePrezime.AsString, '');
                        ShareUnit.UpitOpen(Podaci.myQuery1,
                        ' INSERT INTO crnalista (ImePrezime, Napomena, DatumUpisa, Telefon1, Telefon2)'+
                        ' VALUES ('''+qClanImePrezime.AsString+''', '''+InputString+''', '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+qClanTelefon.AsString+''', '''')',
                        True, False);
                    end;
                    Exit;
                  End;
                end;

        VK_F11: if Confirm('Da li stvarno želite vratiti saldo na nulu?'+#13+#13+'iznos neæe biti prenešen u stanje blagajne.') then
                begin
                    InputString:= InputBox('Vrati saldo na 0 (nula)', 'Upišite PASSWORD!', '');
                    if AnsiUpperCase(InputString) = 'GORAN' then
                    begin
                        qClan.Edit;
                        qClan.FieldByName('Duzan').value := 0;
                        qClan.Post;
                    End;
                End;

     End;
  End;

case key of
    VK_F1 : Begin // promjena NAPOMENA3
                DlgCombo.DajCombo('nacinkontaktiranja');
                if DlgCombo.ShowModal=mrOK then
                begin
                    ShareUnit.UpitOpen(Podaci.myQuery1,
                                    'UPDATE clanovi SET napomena3='''+DlgCombo.ComboTablica.FieldByname('Naziv').AsString+''' '+
                                    'WHERE sifra='+IntToStr(qClan.FieldByName('Sifra').AsInteger), True, False);
                    qClan.Close;
                    qClan.Open;
                end;
            End;

    VK_F8 : Begin // promjena salda
              Application.CreateForm(TFSaldoDLG,FSaldoDLG);
              If FSaldoDLG.Showmodal = MrOk then
                   Podaci.SrediSaldo(qClan.FieldByName('Sifra').AsInteger, FSaldoDLG.povrat.Value, FSaldoDLG.novi.Value);
              FSaldoDLG.Release;
              qClan.Refresh;
            End;

    VK_F7 : // ispiši zaduženje
            if Podaci.TabSetUp.FieldByName('PostojiPrinterRacuni').Value='D' then
            begin
                if TabCon.TabIndex<>-1 then
                    if copy(TabCon.Tabs[TabCon.TabIndex],1,1) = '*' then SnimiKarticu;
                IspZaduz(qClan.FieldByName('BrojZaduz').Value);
            end;

    VK_F5 : If PristupOpciji(903) then // ispravak kartice
            begin
              FKartica.qPos.Close;
              FKartica.qPos.Open;

              sifra_zaduzenja:=SnimiKarticu;
              
              Application.CreateForm(TFIspravakKDlg, FIspravakKDlg);
              FIspravakKDlg.ShowModal;

              if IspravakKartice then
              begin
                if copy(TabCon.Tabs[TabCon.TabIndex],1,1) <> '*' then      // oznaèi karticu sa '*'
                    TabCon.Tabs[TabCon.TabIndex] := '*'+TabCon.Tabs[TabCon.TabIndex];

                if Podaci.TabSetUp.FieldByName('PotvrdaStornoRN').Value='D' then // ispis potvrde?
                begin
                    ShareUnit.UpitOpen(Podaci.myQuery1,
                    ' SELECT MAX(SifraPotvrde) AS SifraPotvrde FROM potvrda WHERE SifraRacuna='+IntToStr(sifra_zaduzenja), True, True);
                    if Podaci.TabSetUp.FieldByName('postojiprinterracuni').AsString='D' then
                        IspPotvrdu(2, Podaci.myQuery1.Fields[0].AsInteger, False); //2=za storno Zaduz
                end;

                try
                    If not PristupOpciji(900) then raise exception.create(cNeovlasteno)
                    else ShareUnit.UpitOpen(Podaci.myQuery1,
                        ' INSERT INTO dnev (Dogodilose, Datum, Radnik, Clan, Br1, Br2, SifraKluba)'+
                        ' VALUES (2, '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+VRadnik+''', '+
                        IntToStr(qClan.FieldByName('Sifra').AsInteger)+', '+IntToStr(sifra_zaduzenja)+', '+IntToStr(SnimiKarticu)+', '+
                        IntToStr(SifraKluba)+')', true, false);
                except
                on E: Exception do
                begin
                    Logiraj(Podaci.myQuery1.Name+'::Error - TPodaci.ispravak kartice: '+E.Message, False);
                end;
                End;
              End;
            End;

    VK_F9 : begin
                qPos.Close;
                qPos.Open;
                if qPos.RecordCount > 0 then FVracanjeDlg.ShowMvracanje(0);
            end;

    VK_F10 : ShowDialog(TFDaliGledoDlg); // da li je gledao

    VK_F2 :  if Podaci.tabSetUp.FieldByName('NaplatiClanarinu').Value='D' then
                  if confirm('Da li stvarno želite naplatiti èlanarinu?') then
                  begin
                        Podaci.NaplatiClanarinu(qClan.fieldByName('Sifra').value, qClan.fieldByName('Popust').value);
                        qClan.Refresh;
                        LMDEdit.SetFocus;
                  End;

    VK_F6 : begin
                  if confirm('Da li stvarno želite naplatiti osiguranje?') then
                  begin
                        Podaci.NaplatiOsiguranje(qClan.fieldByName('Sifra').value, qClan.fieldByName('Popust').value);
                        qClan.Refresh;
                        LMDEdit.SetFocus;
                  End;
                  exit;
            End;

    VK_F4 :  If PristupOpciji(901) then
             begin
                ak := qClan.FieldByName('popust').asinteger;
                qClan.Edit;
                if ShowDialog(TFIzmjenaPopustDlg) then
                begin
                  if qClan.FieldByName('popust').value = null then qClan.FieldByName('popust').value := 0;
                  qClan.Post;
                  if ak <> qClan.fieldByName('popust').asinteger then
                  begin
                  try
                    ShareUnit.UpitOpen(Podaci.myQuery1,
                        ' INSERT INTO dnev (Dogodilose, Datum, Radnik, Clan, Br1, Br2, SifraKluba)'+
                        ' VALUES (5, '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+VRadnik+''', '+
                        IntToStr(qClan.FieldByName('Sifra').AsInteger)+', '+IntToStr(ak)+
                        ', 0, '+IntToStr(SifraKluba)+')', true, false);
                  except
                    on E: Exception do
                    begin
                        Logiraj(Podaci.myQuery1.Name+'::Error - PristupOpciji(901): '+E.Message, True);
                    end;
                  End;
                  End;

                End
                Else qClan.cancel;
             End;

    VK_F3 : begin
              //ShowDialog(TFIskaznicaDlg);
              NoviBCode := '';
              Application.CreateForm(TFIskaznicaDlg,FIskaznicaDlg);
              FIskaznicaDlg.ShowMIskaznica(Image1.Picture,staza+'c'+PopuniNule2(inttostr(qClan.FieldByName('Sifra').Value),5)+'.jpg',qClan.FieldByName('InfoBoxID').asstring,
              Podaci.TabSetUp.FieldByname('NazivKluba').AsString,Podaci.TabSetUp.FieldByname('Adresa1').AsString,
              Podaci.TabSetUp.FieldByname('Telefon').AsString);
              if NoviBCode <> '' then
              begin
                qClan.Edit;
                qClan.FieldByName('BarCode').Value := NoviBCode;
                qClan.Post;
              End;
              Prika;
            End;

    VK_F12 : begin
              try
               BioUnosClana := 0;
               IzKartice := True;
               Kclan := qClan.FieldByName('Sifra').Value;
               ShowDialog(TFUnosClanova);
               qClan.refresh;
              finally
               IzKartice := False;
              End;
             End;
  End;
end;

function TFKartica.RezervirajFilm(BrFilm:String; bc:Boolean):boolean;
var dostava, barkod: String;
begin
// dodaj input za željeni datum, da li je film raspoloživ za rezervaciju
    if bc then DajDatum.Caption:='Rezervacija filma '+Podaci.NazivFilma(BrFilm, True)+' za datum'
    else DajDatum.Caption:='Rezervacija filma '+Podaci.NazivFilma(BrFilm, False)+' za datum';

    if DajDatum.ShowModal=mrOk then
    begin
        if Confirm('Da li želite dostavu?') then dostava:='da' else dostava:='ne';

        if bc then
        begin
            barkod:=BrFilm;
            qProvjeraBCoda.Close;
            qProvjeraBCoda.MacroByName('WHERE').AsString:=
                ' WHERE b.sifra_videokluba='+IntToStr(SifraKluba)+
                ' AND b.barcode='''+barkod+''''+
                ' AND b.status=s.sifra';
            qProvjeraBCoda.Open;

            BrFilm:=qProvjeraBCoda.FieldByName('sifrakazete').AsString;
        end;

        ShareUnit.UpitOpen(Podaci.myQuery1,
            'INSERT INTO rezervacija2 (sifraclana, sifrakazete, vrijemerezervacije, zeljenidatum, dostava, status, sifra_videokluba) '+
            'VALUES ('+qClan.FieldByName('Sifra').AsString+', '+BrFilm+', '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '''+
            FormatDateTime('yyyy-mm-dd',DajDatum.DatumOd.Date)+''', '''+dostava+''', ''rezervirano'', '+IntToStr(SifraKluba)+')',
            True, False);

        qRezrvirano.Close;
        qRezrvirano.Open;
        Result:=True;
    end
    else Result:=False;

    RezervaEdit.Text:='';
    DajDatum.Caption:='Odaberite datuma';  // vrati default Caption
end;

procedure TFKartica.StaviNaWListu(BrFilm:String; bc:Boolean);
var barkod, medij: String;
begin
    if bc then
    begin
        barkod:=BrFilm;
        qProvjeraBCoda.Close;
        qProvjeraBCoda.MacroByName('WHERE').AsString:=
                ' WHERE b.sifra_videokluba='+IntToStr(SifraKluba)+
                ' AND b.barcode='''+barkod+''''+
                ' AND b.status=s.sifra';
        qProvjeraBCoda.Open;

        BrFilm:=qProvjeraBCoda.FieldByName('sifrakazete').AsString;
        medij:=qProvjeraBCoda.FieldByName('sifra_medija').AsString;
    end
    else
    begin
//        fOdabirMedija.qDajMedije.MacroByName('KLUB').AsString:=IntToStr(SifraKluba);
        fOdabirMedija.qDajMedije.MacroByName('FILM').AsString:=BrFilm;
        fOdabirMedija.qDajMedije.Open;

        if fOdabirMedija.qDajMedije.RecordCount>1 then
        begin
            if fOdabirMedija.ShowModal=mrOk then
                medij:=fOdabirMedija.qDajMedije.FieldByName('sifra').AsString
            else
                Exit;
        end
        else
            medij:=fOdabirMedija.qDajMedije.FieldByName('sifra').AsString;

        fOdabirMedija.qDajMedije.Close;
    end;

    ShareUnit.UpitOpen(Podaci.myQuery1,
            'INSERT INTO whishlista (sifraclana, sifrafilma, vrstamedija, status) '+
            'VALUES ('+qClan.FieldByName('Sifra').AsString+', '+BrFilm+', '+medij+', ''aktivan'')',
            True, False);

    qWishList.Close;
    qWishList.Open;
    WishL.Text:='';
end;

function TFKartica.ZaduziFilm(BrFilm, Clan:String; bc:Boolean):Boolean;
var ImaKazeta: Integer;
    barkod, upit: String;
Begin
  if clan='' then clan:=qClan.FieldByName('Sifra').AsString
  else ShowM(StrToInt(Clan), 0); // otvori karticu èlana

  if MaxPosudba > 0 then
  begin
        if (qPos.RecordCount = MaxPosudba) and (qClan.FieldByName('PrvaPosudba').Value='D') then
        begin
          MessageDlg('Èlanu je ovo prva posudba, te nemože diæi više od '+IntToStr(MaxPosudba)+' kazeta.', mtConfirmation, [mbOK], 0);
          Result:=False;
          Exit;
        End;
  End;

  if bc then
  begin
    qProvjeraRezervacija.Close;   // web narudžba
    qProvjeraRezervacija.MacroByName('KOD').AsString:=''''+BrFilm+'''';
    qProvjeraRezervacija.Open;

    qProvjeraRezervacija2.Close;  // rezervacija
    qProvjeraRezervacija2.MacroByName('KOD').AsString:='barcode='''+BrFilm+'''';
    qProvjeraRezervacija2.MacroByName('CLAN').AsString:=Clan;
    qProvjeraRezervacija2.Open;

    qProvjeraBCoda.Close;
    qProvjeraBCoda.MacroByName('WHERE').AsString:=
        ' WHERE b.sifra_videokluba='+IntToStr(SifraKluba)+
        ' AND b.barcode='''+BrFilm+''''+
        ' AND b.status=s.sifra';
    qProvjeraBCoda.Open;

    if qProvjeraBCoda.IsEmpty then
        barkod:='0'
    else
    begin
      if ProvjereFilma(qProvjeraBCoda.FieldByName('sifrakazete').AsInteger) then
      begin
        if qProvjeraBCoda.FieldByName('izdano').AsString='D' then
        begin
            barkod:='0';
            ShowMessage('Film je veæ posuðen.');
        end
        else
        if not qProvjeraRezervacija.IsEmpty then // ovo je provjera da li je nešto veæ naruèeno preko weba
        begin
            barkod:='0';
            if qProvjeraRezervacija.FieldByName('statusflag').AsString='P' then
                ShowMessage('Film je u pripremi za narudžbu sa interneta!'+#13+'Probajte ponovo za 5 minuta.')
            else ShowMessage('Film je naruèen preko interneta.');
        end
        else
        if qProvjeraBCoda.FieldByName('zbroj').AsInteger=0 then
        begin
            barkod:='0';
            ShowMessage('Barkod filma se nemože zadužiti jer ima status "'+qProvjeraBCoda.FieldByName('naziv').AsString+'"');
        end
        else
        if not qProvjeraRezervacija2.IsEmpty then // ovo je provjera da li je nešto rezervirano
            if Confirm('Film je rezerviro '+Podaci.ImeCl(qProvjeraRezervacija2.FieldByName('sifraclana').AsInteger, 3)+' za '+
                    DateToStr(qProvjeraRezervacija2.FieldByName('zeljenidatum').AsDateTime)+#13+#13+'Da li ga svejedno želite iznajmiti?') then
            begin
                barkod:=BrFilm;
                BrFilm:=qProvjeraBCoda.FieldByName('sifrakazete').AsString;
            end else barkod:='0'
        else
        begin
            barkod:=BrFilm;
            BrFilm:=qProvjeraBCoda.FieldByName('sifrakazete').AsString;
        end;
      end
      else barkod:='0';
    end;

    qProvjeraBCoda.Close;
  end
  else  // ako nije barkod
  begin
    if ProvjereFilma(StrToInt(BrFilm)) then
    begin
        // ruèno odabiranje barkoda po šifri
        Application.CreateForm(TFUnosbarCode,FUnosbarCode);
        try
            barkod:=FUnosbarCode.OdaberiBKod(StrToInt(BrFilm), 0, '');

            if barkod<>'0' then
            begin
                qProvjeraRezervacija2.Close;  // ovo je provjera da li je film rezerviran (po šifri filma)
                qProvjeraRezervacija2.MacroByName('KOD').AsString:='sifrakazete='+BrFilm;
                qProvjeraRezervacija2.MacroByName('CLAN').AsString:=Clan;
                qProvjeraRezervacija2.Open;

                if not qProvjeraRezervacija2.IsEmpty then
                        if not Confirm('Film '''+Podaci.NazivFilma(qProvjeraRezervacija2.FieldByName('sifrakazete').AsString, False)+''' je rezerviro '+
                                Podaci.ImeCl(qProvjeraRezervacija2.FieldByName('sifraclana').AsInteger, 3)+' za '+
                                DateToStr(qProvjeraRezervacija2.FieldByName('zeljenidatum').AsDateTime)+#13+#13+
                                'Da li ga svejedno želite iznajmiti?') then
                        barkod:='0'
            end;
        except
            Result:=False;
            Exit;
        end;
    End
    else barkod:='0';
  end;

  if barkod<>'0' then // '0' je za cancel iz odabira barkoda
  begin
    // prvo naði i oznaèi IZDAN u tBarkodova
    upit:=' UPDATE bcodekazete SET Izdano=''D'''+
          ' WHERE barcode='''+barkod+'''';
    // upiši u bazu POSudbi
    upit:=upit+';'+#13+
          ' INSERT INTO pos (SifraClana, SifraKazete, bcodekaz, DatumPos, Operater, SifraKluba)'+
          ' VALUES('+Clan+', '+BrFilm+', '''+barkod+''', '''+
          FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '+IntToStr(VOperater)+', '+IntToStr(SifraKluba)+')';

    // upiši u bazu POSudbi_SOLID
    upit:=upit+';'+#13+
          ' INSERT INTO pos_solid (SifraClana, SifraKazete, bcodekaz, DatumPos, Operater, SifraKluba)'+
          ' VALUES('+Clan+', '+BrFilm+', '''+barkod+''', '''+
          FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''', '+IntToStr(VOperater)+', '+IntToStr(SifraKluba)+')';

    // zatim poveæaj IZDANOKOP u bazi filmova za taj film
    upit:=upit+';'+#13+
          ' UPDATE kazetedetail SET IzdanoKop=IzdanoKop+1'+
          ' WHERE sifrakazete='+BrFilm+
          ' AND SifraFirme='+IntToStr(SifraFirme);

    try
        ShareUnit.UpitOpen(Podaci.myQuery1, upit, True, False);

        if copy(TabCon.Tabs[TabCon.TabIndex],1,1) <> '*' then
                TabCon.Tabs[TabCon.TabIndex] := '*'+TabCon.Tabs[TabCon.TabIndex];

    except
        on E: Exception do
        begin
            Logiraj(Podaci.myQuery1.Name+'::Error - FKartica.ZaduziFilm: '+E.Message, True);
        end;
    End;

    qPos.Refresh;
    Result:=True;
  end
  else
  begin
    //ZatvoriKarticu; // ako nije bilo zaduženja
    Result:=False;
  end;
End;

procedure TFKartica.ZatvoriKarticu;
var zaduz_master: Integer;
begin
    if TabCon.TabIndex<>-1 then
    begin
        if copy(TabCon.Tabs[TabCon.TabIndex],1,1) = '*' then zaduz_master:=SnimiKarticu;

        if zaduz_master<>0 then
            if Podaci.TabSetUp.FieldByName('PostojiPrinterRacuni').Value='D' then
                if Podaci.TabSetUp.FieldByName('IspisZaduz').Value='D' then
                    if Confirm('Da li želite ispisati zaduženje?') then IspZaduz(zaduz_master);

        //zatvaranje Tab-a
        TabCon.Tabs.Delete(TabCon.TabIndex);
        if TabCon.Tabs.Count = 0 then Close
        Else
        begin
            TabCon.TabIndex := TabCon.Tabs.Count-1;
            TabConChange(nil);
        end;
    end;
end;

Function TFKartica.SnimiKarticu:Integer; // vraèa šifru zaduženja
var sada, clan, temp, zaduz_master: String;
begin
    Result:=qClan.FieldByName('BrojZaduz').AsInteger;

    if copy(TabCon.Tabs[TabCon.TabIndex],1,1) = '*' then
    begin
        sada:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
        clan:=qClan.FieldByName('Sifra').AsString;
        temp:='';

        if not qPos.IsEmpty then
        begin
          Try
            //zapiši u bazu ZADUZ
            ShareUnit.UpitOpen(Podaci.myQuery1,
            ' INSERT INTO zaduz (Datum, SifraClana, Radnik)'+
            ' VALUES ('''+sada+''', '+clan+', '''+VRadnik+''')', True, False);
            zaduz_master:=Podaci.myQuery1.LastInsertID;

            Result:=StrToInt(zaduz_master);

            //zapiši u bazu ZADUZdetail
            qPos.DisableControls;
            qPos.First;

            temp:='INSERT INTO zaduzdetail (SifraZaduz, SifraKazete, DatumPos, BarCode) VALUES'+#13;
            while not qPos.Eof do
            begin
                temp:=temp+
                ' ('+zaduz_master+', '+qPossifrakazete.AsString+', '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',qPosdatumpos.Value)+''', '+
                ''''+qPosbcodekaz.AsString+'''),';
                qPos.Next;
            End;
            Delete(temp, Length(temp), 1); // obriši zadnji ','
            ShareUnit.UpitOpen(Podaci.myQuery1, temp, True, False);

            qPos.EnableControls;

            //zapiši èlanu broj zaduženja
            qClan.Edit;
            qClan.FieldByName('BrojZaduz').AsInteger:=Result;
            qClan.Post;

          except
          on E: Exception do
            begin
                Logiraj(Podaci.myQuery1.Name+'::Error - TFKartica.ZatvoriKarticu: '+E.Message, True);
            end;
          End;
        end
        else
        begin
            //obriši èlanu broj zaduženja
            qClan.Edit;
            qClan.FieldByName('BrojZaduz').AsInteger:=0;
            qClan.Post;
            Result:=0;
        end;

        TabCon.Tabs[TabCon.TabIndex]:=copy(TabCon.Tabs[TabCon.TabIndex], 2, Length(TabCon.Tabs[TabCon.TabIndex])-1);
    end;
End;

procedure TFKartica.TPosAfterEdit(DataSet: TDataSet);
begin
  IspravakKartice := True;
end;

procedure TFKartica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qClan.close;
  TStatus.close;
  qPos.Close;
  MainForm.OnActivate(Sender);
end;

procedure TFKartica.ObrisiClick(Sender: TObject);
var koji, polje, koliko: string;
begin
//    if PristupOpciji(133) then
    case (Sender as TLMDButton).Tag of
        1:  begin;
                koji:=#13+'fiksni telefon';
                polje:='telefon';
                koliko:='';
            end;
        2:  begin;
                koji:=#13+'mobilni telefon';
                polje:='mobitel';
                koliko:='';
            end;
        3:  begin;
                koji:=' EMAIL';
                polje:='email';
                koliko:='';
            end;
        4:  begin;
                koji:=#13+'FACEBOOK profil';
                polje:='SocialStatus';    // !!!!!
                koliko:='';
            end;
        5:  begin;
                koji:=#13+'"ÈLANARINA vrijedi do"';
                polje:='ClanarinaVrijediDo';
                koliko:='';
            end;
        6:  begin;
                koji:=#13+'"POPUST vrijedi do"';
                polje:='PopustVrijediDo';
                koliko:='';
            end;
    else
        koji:='';
    end;

    if koji<>'' then
        if confirm('Da li stvarno želite obrisati'+koji+'?') then
        begin
            qClan.Edit;
            qClan.FieldByName(polje).AsString := koliko;
            qClan.Post;
        End;

    LMDEdit.SetFocus;
end;

procedure TFKartica.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TFKartica.qClanAfterOpen(DataSet: TDataSet);
begin
    if qClan.IsEmpty then Exit;

    DrugiFilmovi.Close;
    DrugiFilmovi.MacroByName('CLAN').AsString:=qClan.FieldByName('Sifra').AsString;
    DrugiFilmovi.MacroByName('KLUB').AsString:=IntToStr(SifraKluba);
    DrugiFilmovi.Open;

    qDajVrstuUgovora.Close;
    qDajVrstuUgovora.MacroByName('CLAN').AsString:=qClan.FieldByName('Sifra').AsString;
    qDajVrstuUgovora.Open;
end;

procedure TFKartica.DajF11(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Case Key of
     VK_RETURN: begin
                    if (Sender as TwwDBGrid).IsSelected then (Sender as TwwDBGrid).UnselectRecord
                    else (Sender as TwwDBGrid).SelectRecord;
                End;

        VK_F11: begin
                    Application.CreateForm(TFUkupnoFilm, FUkupnoFilm);
                    FUkupnoFilm.ShowD((Sender as TwwDBGrid).Fields[1].AsInteger);
                end;
//         VK_UP: FKartica.qPos.Prior;
//       VK_DOWN: FKartica.qPos.Next;
    End;
end;

procedure TFKartica.FormDeactivate(Sender: TObject);
begin
    Close;
end;

procedure TFKartica.qRezrviranoAfterOpen(DataSet: TDataSet);
begin
  With TabRezervacija do
  begin
    if DataSet.IsEmpty then
    begin
        wwDBGrid2.Enabled:=False;
        Caption:='Rezervacije';
//        Font.Style:=[];
    end
    else
    begin
        wwDBGrid2.Enabled:=True;
        Caption:='Rezervacije ('+IntToStr(DataSet.RecordCount)+')';
//        Font.Style:=[fsBold];
    end;
  end;
end;

procedure TFKartica.DrugiFilmoviAfterOpen(DataSet: TDataSet);
begin
  With TabPosudbe do
  begin
    if DataSet.IsEmpty then
    begin
        Enabled:=False;
        Caption:='Druge posudbe';
//        Font.Style:=[];
    end
    else
    begin
        Enabled:=True;
        Caption:='Druge posudbe ('+IntToStr(DataSet.RecordCount)+')';
//        Font.Style:=[fsBold];
    end;
  end;
end;

procedure TFKartica.qWishListAfterOpen(DataSet: TDataSet);
begin
    if DataSet.IsEmpty then
    begin
        gWishList.Enabled:=False;
        TabWishLista.Caption:='Wishlista';
//        Font.Style:=[];
    end
    else
    begin
        gWishList.Enabled:=True;
        TabWishLista.Caption:='Wishlista ('+IntToStr(DataSet.RecordCount)+')';
//        Font.Style:=[fsBold];
    end;
end;

procedure TFKartica.PageControl1Change(Sender: TObject);
begin
    LMDEdit.SetFocus;
end;

procedure TFKartica.ZadRezervaciju(Sender: TObject);
begin
    Podaci.ZaduziRezervaciju(wwDBGrid2);
    LMDEdit.SetFocus;
end;

procedure TFKartica.ZadWishListu(Sender: TObject);
begin
    Podaci.ZaduziWishListu(gWishList);
end;

procedure TFKartica.gWishListCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   if  (not highlight) and (Sender as TwwDBGrid).isSelected then
   begin
      ABrush.Color:= clAqua;
      AFont.Color:= clBlack;
   end;
end;

procedure TFKartica.ZamjeniREZ_WISH(Sender: TObject);
begin
    case (Sender as TBitBtn).Tag of
        1: Podaci.WishLista2Rezervacija(gWishList);
        2: Podaci.Rezervacija2WishLista(wwDBGrid2);
    end;
end;

procedure TFKartica.VratiSe(Sender: TObject);
begin
    if (Sender as TRxDBLookupCombo).DataSource.State=dsEdit then (Sender as TRxDBLookupCombo).DataSource.DataSet.Post;

    LMDEdit.SetFocus;
end;

procedure TFKartica.FinalKey(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        13: ZatvoriEdit(Sender);

        27: begin
                (Sender as TDBEdit).DataSource.DataSet.Cancel;
                ZatvoriEdit(Sender);
            end;
    end;
end;

procedure TFKartica.ZatvoriEdit(Sender: TObject);
begin
    if (Sender as TDBEdit).DataSource.State=dsEdit then (Sender as TDBEdit).DataSource.DataSet.Post;

    LMDEdit.SetFocus;
end;

end.


