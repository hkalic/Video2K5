program Video2k5;

{%ToDo 'Video2k5.todo'}

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  Share in '..\Share\Share.pas' {ShareUnit: TDataModule},
  BazeModul in 'BazeModul.pas' {Podaci: TDataModule},
  WebClass in 'WebClass.pas',
  UnosTemplate in 'UnosTemplate.pas' {FUnosTemplate},
  Lozinka in 'Lozinka.pas' {PasswordDlg},
  Splash in 'Splash.pas' {SplashForm},
  PrintFormeUnosa in 'PrintFormeUnosa.pas' {FprintFormeUnosa: TQuickRep},
  VracanjeDlg in 'VracanjeDlg.pas' {FVracanjeDlg},
  Kartica in 'Kartica.pas' {FKartica},
  PostavkeDlg in 'PostavkeDlg.pas' {FPostavkeDlg},
  Provjera in 'Provjera.pas' {ProvjeraDlg},
  CijeneDlg in 'CijeneDlg.pas' {FCijeneDlg},
  Pristup in 'Pristup.pas' {FPristupDlg},
  ClanoviDlg in 'ClanoviDlg.pas' {FClanoviDlg},
  FilmoviDlg in 'FilmoviDlg.pas' {FFilmoviDlg},
  UnosbarCode in 'UnosbarCode.pas' {FUnosbarCode},
  NaplatiDlg in 'NaplatiDlg.pas' {FNaplatiDlg},
  PlatioJeDlg in 'PlatioJeDlg.pas' {FPlatioJeDlg},
  KodKojihJeDlg in 'KodKojihJeDlg.pas' {FKodKojihJEDlg},
  DaliGledoDlg in 'DaliGledoDlg.pas' {FDaliGledoDlg},
  PrikazEkranDLG in 'PrikazEkranDLG.pas' {FPrikazEkranDLG},
  PregledDLG in 'PregledDLG.pas' {FPregledDLG},
  ClanarinaDlg in 'ClanarinaDlg.pas' {FClanarinaDlg},
  SaldoDLG in 'SaldoDLG.pas' {FSaldoDLG},
  IspravakKDlg in 'IspravakKDlg.pas' {FIspravakKDlg},
  IzborCjenikaDLG in 'IzborCjenikaDLG.pas' {FIzborCjenikaDLG},
  IzmjenaPopustDlg in 'IzmjenaPopustDlg.pas' {FIzmjenaPopustDlg},
  PrintTempl in 'PrintTempl.pas' {FPrintTempl: TQuickRep},
  RadOperateraDlg in 'RadOperateraDlg.pas' {FRadOperateraDlg},
  PrintOpomene in 'PrintOpomene.pas' {FPrintOpomene: TQuickRep},
  PrintUgovor in 'PrintUgovor.pas' {FPrintUgovor: TQuickRep},
  PregTempl in 'PregTempl.pas' {FPregTempl},
  PregledSaldoDlg in 'PregledSaldoDlg.pas' {FPregledSaldoDlg},
  PregClanarineClanDlg in 'PregClanarineClanDlg.pas' {FPregClanarineClanDlg},
  BrdanaDlg in 'BrdanaDlg.pas' {FBrdanaDlg},
  PrintTOPfilmovi in 'PrintTOPfilmovi.pas' {FPrintTOPfilmovi: TQuickRep},
  PregledObrisaniDlg in 'PregledObrisaniDlg.pas' {FPregledObrisaniDlg},
  PrintJednostavnoSVI in 'PrintJednostavnoSVI.pas' {FPrintJednostavnoSVI: TQuickRep},
  PrintJednostavnoIzda in 'PrintJednostavnoIzda.pas' {FPrintJednostavnoIzda: TQuickRep},
  PrintInventura in 'PrintInventura.pas' {FPrintInventura: TQuickRep},
  ObjasnjenjeDlg in 'ObjasnjenjeDlg.pas' {FObjasnjenjeDlg},
  PrintCijenika in 'PrintCijenika.pas' {FPrintCijenika: TQuickRep},
  KatalogDlg in 'KatalogDlg.pas' {FKatalogDlg},
  PrintKatalog in 'PrintKatalog.pas' {FPrintKatalog: TQuickRep},
  PrintBarCode in 'PrintBarCode.pas' {FPrintBarCode: TQuickRep},
  IskaznicaDlg in 'IskaznicaDlg.pas' {FIskaznicaDlg},
  PregledIstekle in 'PregledIstekle.pas' {FPregledIstekle},
  MsgUnit in 'MsgUnit.pas' {Msgform},
  PrintOvlast in 'PrintOvlast.pas' {FPrintOvlast: TQuickRep},
  PregRacunaCla in 'PregRacunaCla.pas' {FPregRacunaCla},
  IzvozDlg in 'IzvozDlg.pas' {FIzvozDlg},
  ImportDlg in 'ImportDlg.pas' {FImportDlg},
  PregSvePosudbeDlg2 in 'PregSvePosudbeDlg2.pas' {FPregSvePosudbeDlg2},
  PregNapomene1 in 'PregNapomene1.pas' {FPregNapomene1},
  DugovanjeDlg in 'DugovanjeDlg.pas' {FDugovanjeDlg},
  OdabirPrikazaDlg in 'OdabirPrikazaDlg.pas' {FOdabirPrikazaDlg},
  VratitiDoDlg in 'VratitiDoDlg.pas' {FVratitiDoDlg},
  ClanstvoPoUgovoru in 'ClanstvoPoUgovoru.pas' {FClanstvoPoUgovoru},
  UplataPoUgovoru in 'UplataPoUgovoru.pas' {FUplataPoUgovoru},
  UplataProduznjeDlg in 'UplataProduznjeDlg.pas' {FUplataProduznjeDlg},
  AbaoutDlg in 'AbaoutDlg.pas' {FAbaoutDlg},
  OsiguranjeDlg in 'OsiguranjeDlg.pas' {FOsiguranjeDlg},
  PrijaveGRID in 'PrijaveGRID.pas' {FPrijaveGRID},
  RekDlg in 'RekDlg.pas' {FRekDlg},
  Odabir_BC4Prt in 'Odabir_BC4Prt.pas' {Odabir_BC},
  PojamUnit in 'PojamUnit.pas' {PojamForm},
  UnosClanovi in 'UnosClanovi.pas' {FUnosClanova},
  UnosZanrovi in 'UnosZanrovi.pas' {FUnosVrste},
  UnosReziseri in 'UnosReziseri.pas' {FUnosreziseri},
  UnosDobavljaci in 'UnosDobavljaci.pas' {FUnosDobavljaci},
  UnosGlumci in 'UnosGlumci.pas' {FUnosGlumci},
  UnosDrzave in 'UnosDrzave.pas' {FUnosDrzave},
  UnosKazete in 'UnosKazete.pas' {FUnosKazete},
  UnosMediji in 'UnosMediji.pas' {FUnosMediji},
  UnosCrneListe in 'UnosCrneListe.pas' {FUnosCrneListe},
  UnosVrstePologa in 'UnosVrstePologa.pas' {FUnosVrstePologa},
  UnosVrstveClanstva in 'UnosVrstveClanstva.pas' {FUnosVrstveClanstva},
  UnosStatusCla in 'UnosStatusCla.pas' {FUnosStatusCla},
  UnosStatusFil in 'UnosStatusFil.pas' {FUnosStatusFil},
  UnosRadnici in 'UnosRadnici.pas' {FUnosRadnici},
  FilmUkupno in 'FilmUkupno.pas' {FUkupnoFilm},
  IzvjestajTM in 'IzvjestajTM.pas' {Izvjestaji: TDataModule},
  DLG_OdabirDatuma in 'DLG_OdabirDatuma.pas' {DajDatum},
  PregNarucenih in 'PregNarucenih.pas' {FNaruceni},
  DLG_Combo in 'DLG_Combo.pas' {DlgCombo},
  PregSvePosudbeDlg in 'PregSvePosudbeDlg.pas' {FPregSvePosudbeDlg},
  DLG_Klub in 'DLG_Klub.pas' {DLG_OdabirKluba},
  CrnaListaDlg in 'CrnaListaDlg.pas' {FCrnaListaDlg},
  PregRezerviranih in 'PregRezerviranih.pas' {FRezervirani},
  PregWishLista in 'PregWishLista.pas' {fPregledWishLista},
  DLG_OdabirMedija in 'DLG_OdabirMedija.pas' {fOdabirMedija},
  UnosBlagdana in 'UnosBlagdana.pas' {FUnosBlagdana},
  UnosNacinaKontakta in 'UnosNacinaKontakta.pas' {FUnosKontaktiranja},
  UpitThreaded in 'UpitThreaded.pas',
  UnosVrstaPlacanja in 'UnosVrstaPlacanja.pas' {FUnosVrstaPlacanja};

//{$R *.RES}
//ZipMsgYU.res

//{$R ZipMsgYU.RES}

{$R *.RES}
begin

  if ParamStr(2) <> chr(90)+chr(77)+chr(48) then
  begin
        SplashForm := TSplashForm.Create(Application);
        SplashForm.Show;
        SplashForm.Update;
  End;

  Application.Initialize;
  Application.Title := 'Video 2kX';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPodaci, Podaci);
  Application.CreateForm(TShareUnit, ShareUnit);
  Application.CreateForm(TFKartica, FKartica);
  Application.CreateForm(TProvjeraDlg, ProvjeraDlg);
  Application.CreateForm(TFVracanjeDlg, FVracanjeDlg);
  Application.CreateForm(TFNaplatiDlg, FNaplatiDlg);
  Application.CreateForm(TFPregledDLG, FPregledDLG);
  Application.CreateForm(TFRekDlg, FRekDlg);
  Application.CreateForm(TPojamForm, PojamForm);
  Application.CreateForm(TDajDatum, DajDatum);
  Application.CreateForm(TIzvjestaji, Izvjestaji);
  Application.CreateForm(TDlgCombo, DlgCombo);
  Application.CreateForm(TfOdabirMedija, fOdabirMedija);
  if ParamStr(2) <> chr(90)+chr(77)+chr(48) then
  begin
    SplashForm.Hide;
    SplashForm.Free;
  End;

  MainForm.InitLow;

  Application.Run;
End.
