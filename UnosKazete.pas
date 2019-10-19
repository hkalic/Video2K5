unit UnosKazete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnosTemplate, ImgList, Db, DBTables, RxQuery, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ComCtrls, DBCtrls, ToolWin, RxLookup, RXCtrls,
  ExtCtrls, Mask, wwdbdatetimepicker, dateutil, ExtDlgs, Variants,
  MySQLDataset, dxCntner, dxEditor, dxEdLib, dxDBELib, wwdbedit, dxExEdtr;

type
  TFUnosKazete = class(TFUnosTemplate)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label6: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Label20: TLabel;
    Label29: TLabel;
    DBText1: TDBText;
    Label18: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    DBEdit5: TDBEdit;
    Label30: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    Label35: TLabel;
    RxDBLookupCombo8: TRxDBLookupCombo;
    Image1: TImage;
    OpenPic: TOpenPictureDialog;
    DBText2: TDBText;
    qBarKod: TMySQLQuery;
    TKazete: TMySQLDataset;
    TQSifra: TAutoIncField;
    TQZanr: TIntegerField;
    TQObrisan: TMySQLStringField;
    TQNaziv: TMySQLStringField;
    TQOrginalNaziv: TMySQLStringField;
    tKazDetail: TMySQLTable;
    dsKazDetail: TDataSource;
    tKazDetailSifra: TAutoIncField;
    tKazDetailSifraKazete: TIntegerField;
    tKazDetailSifraFirme: TSmallintField;
    tKazDetailBrKazeta: TSmallintField;
    tKazDetailIzdatPuta: TSmallintField;
    tKazDetailIzdanoKop: TSmallintField;
    tKazDetailBrRacuna: TMySQLStringField;
    tKazDetailDobavljac: TIntegerField;
    tKazDetailKupljen: TDateField;
    tKazDetailCijenaKn: TFloatField;
    tKazDetailCijenaDEM: TFloatField;
    tKazDetailObrisan: TMySQLStringField;
    tKazDetailDatumBrisanja: TDateTimeField;
    tKazDetailZaradioDEM: TFloatField;
    tKazDetailDatumPlacanja: TDateField;
    tKazDetailAzurirano: TDateTimeField;
    tKazDetailZaradioKN: TFloatField;
    tKazDetailPravaVrijedeDo: TDateField;
    tKazDetailSifraStatusFilma: TIntegerField;
    tKazDetailKupljenoKazeta: TIntegerField;
    Label1: TLabel;
    TKazeteSifra: TAutoIncField;
    TKazeteNaziv: TMySQLStringField;
    TKazeteZanr: TIntegerField;
    TKazeteRezija: TIntegerField;
    TKazeteGlumac1: TIntegerField;
    TKazeteGlumac2: TIntegerField;
    TKazeteDrzava: TIntegerField;
    TKazeteProizveden: TSmallintField;
    TKazeteKategorija: TSmallintField;
    TKazeteAzurirano: TDateTimeField;
    TKazeteDjelatnik: TIntegerField;
    TKazeteOrginalNaziv: TMySQLStringField;
    TKazetePodZanr: TIntegerField;
    TKazeteLinkSlike: TMySQLStringField;
    TKazeteSifraStara: TSmallintField;
    TKazetelookOperater: TStringField;
    Panel3: TPanel;
    Panel4: TPanel;
    b1: TBitBtn;
    b2: TBitBtn;
    GroupBox1: TGroupBox;
    DBText3: TDBText;
    Label23: TLabel;
    DBText4: TDBText;
    Label21: TLabel;
    Panel5: TPanel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label14: TLabel;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    Label32: TLabel;
    wwDBDateTimePicker3: TwwDBDateTimePicker;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label19: TLabel;
    wwDBDateTimePicker2: TwwDBDateTimePicker;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    Label34: TLabel;
    DBEdit6: TDBEdit;
    Label36: TLabel;
    RxDBLookupCombo9: TRxDBLookupCombo;
    b4: TBitBtn;
    b5: TBitBtn;
    Label12: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label27: TLabel;
    TKazeteBrKazeta: TSmallintField;
    TKazeteObrisan: TMySQLStringField;
    TKazeteDatumBrisanja: TDateTimeField;
    TKazeteVrstaMedija: TIntegerField;
    b3: TBitBtn;
    TKazeteimdb: TFloatField;
    Label17: TLabel;
    dxDBMaskEdit1: TdxDBMaskEdit;
    TKazeteVrijeme: TIntegerField;
    TKazetepg: TStringField;
    Label31: TLabel;
    DBComboBox1: TDBComboBox;
    DBMemo1: TDBMemo;
    tSadrzaj: TMySQLTable;
    dsSadrzaj: TDataSource;
    Label33: TLabel;
    Label37: TLabel;
    DBMemo2: TDBMemo;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Label6DblClick(Sender: TObject);
    procedure KdownSifarnik(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label7DblClick(Sender: TObject);
    procedure Label8DblClick(Sender: TObject);
    procedure Label9DblClick(Sender: TObject);
    procedure Label11DblClick(Sender: TObject);
    procedure Label12DblClick(Sender: TObject);
    procedure TKazeteBeforePost(DataSet: TDataSet);
    procedure BtnSpremiClick(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
    procedure ToggleObrisi(Sender: TObject);
    procedure TKazeteAfterInsert(DataSet: TDataSet);
    procedure wwDBDateTimePicker1KeyPress(Sender: TObject; var Key: Char);
    procedure TKazeteBeforeEdit(DataSet: TDataSet);
    procedure TKazeteKategorijaValidate(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure wwDBDateTimePicker1Change(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure PregledChange(Sender: TObject);
    procedure SlikaFilma;
    procedure TKazeteAfterScroll(DataSet: TDataSet);
    procedure b5Click(Sender: TObject);
    procedure OpenPicShow(Sender: TObject);
    procedure TKazeteKategorijaChange(Sender: TField);
    procedure TKazeteAfterPost(DataSet: TDataSet);
    procedure DBGrid11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid11GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure TKazeteBeforeClose(DataSet: TDataSet);
    procedure b2Click(Sender: TObject);
    procedure DetaljiVidljivi(vidljivi:boolean);
    procedure TKazeteAfterOpen(DataSet: TDataSet);
    procedure kdetPromjena(Sender: TObject);
    procedure tKazDetailAfterRefresh(DataSet: TDataSet);
    procedure TQAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    ImaKazeta:Integer;
    MovSlika, BilaPromjenaKategorije:Boolean;
    staza :String;
  public
    { Public declarations }
  end;

var
  FUnosKazete: TFUnosKazete;

implementation
Uses BazeModul, UnosZanrovi, UnosReziseri,UnosDobavljaci, UnosGlumci, UnosDrzave,
     AppUtils, UnosbarCode, FilmUkupno, Main, Share, PregSvePosudbeDlg;
{$R *.DFM}

procedure TFUnosKazete.FormCreate(Sender: TObject);
begin
  inherited;
  BilaPromjenaKategorije:=False;
  if Podaci.TabSetUp.FieldByName('ImaCitac').Value='D' then b1.Enabled:=True else b1.Enabled:=False;
  if Podaci.TabSetUp.FieldByName('SlikaFilma').Value='D' then MovSlika:=True else MovSlika:=False;

  b4.Visible := MovSlika;
  b5.Visible := MovSlika;
  Image1.Visible := MovSlika;
  Label5.visible := not orao;
  DBEdit4.visible := not orao;

  tKazDetail.Filter:='SifraFirme='+IntToStr(SifraFirme);
end;

procedure TFUnosKazete.KdownSifarnik(Sender: TObject; var Key: Word; Shift: TShiftState);
Var L:Tlabel;
begin
  If (Shift = [ssCtrl]) and (key = Vk_Return) then
   With (Sender as TRxDbLookupCombo) do
    begin
     Case Tag Of 1: L:=Label6;
                 2: L:=Label7;
                 3: L:=Label8;
                 4: L:=Label9;
                 5: L:=Label11;
                 6: L:=Label12;
     end;
     L.OnDblClick(L);
   end;
end;

procedure TFUnosKazete.Label6DblClick(Sender: TObject);
begin
    Podaci.TMediji.Close;
    Odabir(TFUnosVrste, RxDBLookupCombo1.Field);
    If WindowState = wsNormal Then
        if Visible then WindowState := wsMaximized;
    Podaci.TMediji.Open;
end;

procedure TFUnosKazete.Label7DblClick(Sender: TObject);
begin
  Podaci.TRez.Close;
  Odabir(TFUnosreziseri, RxDBLookupCombo3.Field);
  If WindowState = wsNormal Then if Visible then WindowState := wsMaximized;
  Podaci.TRez.Open;
end;

procedure TFUnosKazete.Label8DblClick(Sender: TObject);
begin
  Podaci.TGlumac.Close;
  Odabir(TFUnosGlumci, RxDBLookupCombo2.Field);
  If WindowState = wsNormal Then if Visible then WindowState := wsMaximized;
  Podaci.TGlumac.Open;
end;

procedure TFUnosKazete.Label9DblClick(Sender: TObject);
begin
  Podaci.TGlumac.Close;
  Odabir(TFUnosGlumci, RxDBLookupCombo4.Field);
  If WindowState = wsNormal Then if Visible then WindowState := wsMaximized;
  Podaci.TGlumac.Open;
end;

procedure TFUnosKazete.Label11DblClick(Sender: TObject);
begin
  Podaci.TDrzav.Close;
  Odabir(TFUnosDrzave, RxDBLookupCombo5.Field);
  If WindowState = wsNormal Then if Visible then WindowState := wsMaximized;
  Podaci.TDrzav.Open;
end;

procedure TFUnosKazete.Label12DblClick(Sender: TObject);
begin
  Podaci.TDobav.Close;
  Odabir(TFUnosDobavljaci, RxDBLookupCombo6.Field);
  If WindowState = wsNormal Then if Visible then WindowState := wsMaximized;
  Podaci.TDobav.Open;
end;

procedure TFUnosKazete.TKazeteBeforePost(DataSet: TDataSet);
begin
  TKazeteAzurirano.Value := Now;
  TKazeteDjelatnik.Value := VOperater;
end;

procedure TFUnosKazete.BtnSpremiClick(Sender: TObject);
begin
  inherited;
//  if Podaci.TabSetUp.FieldByName('ImaCitac').Value='D' then
//       if confirm('Da li želite unositi / mijenjati BARCODE?') then b1Click(Sender);
end;

procedure TFUnosKazete.DSStateChange(Sender: TObject);
begin
  inherited;
  if Ds.State=DsInsert then
    panel3.Visible:=False
  else
    panel3.Visible:=True;

  if Podaci.TabSetUp.FieldByName('ImaCitac').Value='D' then
        b1.Enabled := not (Ds.State in DsEditModes);
//  panel3.Enabled:=not (Ds.State in DsEditModes);
  b2.Enabled:=not (Ds.State in DsEditModes);
  b3.Enabled:=b2.Enabled;
end;

procedure TFUnosKazete.ToggleObrisi(Sender: TObject);
begin
    if tKazeteObrisan.Value='D' then
    begin
        if Confirm('Da li stvarno želite vratiti FILM?') then
        begin
            TKazete.Edit;
            TKazeteObrisan.Value:='N';
            TKazeteDatumBrisanja.AsString:='';
            TKazete.Post;
            (Sender as TBitBtn).Caption:='OBRIŠI FILM';
        End;
    end
    else
    begin
        if Confirm('Da li stvarno želite obrisati FILM?') then
        begin
            TKazete.Edit;
            TKazeteObrisan.Value:='D';
            TKazeteDatumBrisanja.Value:=Date;
            TKazete.Post;
            (Sender as TBitBtn).Caption:='VRATI FILM';
        End;
    end;
end;

procedure TFUnosKazete.TKazeteAfterInsert(DataSet: TDataSet);
begin
    TsAfterEdit(DataSet);
    TKazDetailKupljen.value := date;
    TKazDetailDatumPlacanja.value := date;
//    TKazeteVrstaMedija.value := 1;
end;

procedure TFUnosKazete.wwDBDateTimePicker1KeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
    begin
        selectnext(sender as twincontrol,True,true);
        key := #0;
    End;
end;

procedure TFUnosKazete.TKazeteBeforeEdit(DataSet: TDataSet);
begin
    If not PristupOpciji(900) then raise exception.create(cNeovlasteno);
end;

procedure TFUnosKazete.b1Click(Sender: TObject);
var i, j, k: Integer;
    klubovi: array of Integer;
begin
    if tKazDetail.State in [dsEdit, dsInsert] then tKazDetail.Post;
    
    TKazete.BeforeEdit := nil;
    Application.CreateForm(TFUnosbarCode,FUnosbarCode);

   if Podaci.TabSetUp.FieldByName('bezbrojanjabarkodova').Value='N' then
   begin
    if tKazDetail.FieldByName('KupljenoKazeta').AsInteger<>0 then
    begin
        ShareUnit.UpitOpen(Podaci.myQuery1,'SELECT barcode FROM bcodekazete WHERE sifrakazete='+TKazeteSifra.AsString, False, True);
        if Podaci.myQuery1.RecordCount=0 then
        begin
            // napravi popis klubova
            ShareUnit.UpitOpen(Podaci.myQuery1,'SELECT sifrakluba FROM setup WHERE aktivan=''D''', True, True);
            if not Podaci.myQuery1.IsEmpty then
            begin
                SetLength(klubovi, Podaci.myQuery1.RecordCount);
                Podaci.myQuery1.First;
                for i:=0 to Podaci.myQuery1.RecordCount-1 do
                begin
                    klubovi[i]:=Podaci.myQuery1.FieldByName('sifrakluba').AsInteger;
                    Podaci.myQuery1.Next;
                end;
            end
            else
            begin
                ShowMessage('Nema niti jednog aktivnog kluba');
                Exit;
            end;

            FUnosbarCode.fbroj:=TKazeteSifra.Value;
            // Generiraj X barkodova
            j:=0;
            For i:=1 to tKazDetail.FieldByName('KupljenoKazeta').AsInteger do
            begin
                FUnosbarCode.dajslovo;
                k:=klubovi[j];
                ShareUnit.UpitOpen(Podaci.myQuery1,
                    ' INSERT INTO bcodekazete (barCode, SifraKazete, Sifra_medija, status, kategorija, izdano, datum_izmjene, sifra_videokluba)'+
                    ' VALUES ('''+FUnosbarCode.Edit1.text+''', '+IntToStr(FUnosbarCode.fbroj)+', '+IntToStr(FUnosbarCode.LookUpCombo.KeyValue)+', '+
                    IntToStr(FUnosbarCode.eStatus.KeyValue)+', '+FUnosbarCode.eKategorija.Text+', ''N'','''+FormatDateTime('yyyy-mm-dd hh:mm:ss', Now)+''', '+IntToStr(k)+')', True, False);
                j:=j+1; // ovo je zbog toga da svaki klub (aktivni) dobije jednako bcodova
                if j>Length(klubovi)-1 then j:=0;
            end;
        end;
    end;
   end;

    ImaKazeta := FUnosbarCode.ShowMBcode(TKazeteSifra.Value, TKazeteKategorija.Value, tKazDetailSifraStatusFilma.Value);

//    ShowMessage(IntToStr(ImaKazeta));
    if tKazeteBrKazeta.AsInteger<>imaKazeta then
    begin
        tKazete.Edit;
        tKazeteBrKazeta.AsInteger:=imaKazeta;
        tKazete.Post;
    end;

//    FUnosbarCode.Release;
    TKazete.BeforeEdit := TKazeteBeforeEdit;
end;

procedure TFUnosKazete.TKazeteKategorijaValidate(Sender: TField);
begin
  Podaci.Otvoriindex('cijene');
  if not Podaci.TabIndex.LOCATE('Cijenik;Kategorija', VarArrayOf([1,Sender.Value]), []) then
         raise exception.create('Kategorija naplate ne postoji, nije definirana cijenikom.');
end;

procedure TFUnosKazete.FormActivate(Sender: TObject);
begin
    inherited;
    if IzOdabiraF then
    begin
        Pregled.ActivePage:=Tunos;
    end;
//    if tKazDetail.Active then ShowMessage('Otvoren tkazdet');

    Image1.Width:=Podaci.TabSetUp.FieldByName('SirinaSlikeF').Value;
    Image1.Height:=Podaci.TabSetUp.FieldByName('VisinaSlikeF').Value;
    staza:=Podaci.TabSetUp.FieldByName('PathSlikeF').AsString;
end;

procedure TFUnosKazete.wwDBDateTimePicker1Change(Sender: TObject);
begin
  inherited;
  if (Ds.State in DsEditModes) then TKazDetailPravaVrijedeDo.value := IncYear(wwDBDateTimePicker1.Date,5);
end;

procedure TFUnosKazete.b4Click(Sender: TObject);
begin
    if (TKazete.State=dsEdit) or (TKazete.State=dsInsert) then
    begin
        if OpenPic.Execute then
            TKazete.FieldByName('LinkSlike').Value:=Copy(OpenPic.FileName,Length(staza)+1,Length(OpenPic.FileName)-Length(staza));
    end else
    begin
        if OpenPic.Execute then
        begin
            TKazete.Edit;
            TKazete.FieldByName('LinkSlike').Value:=Copy(OpenPic.FileName,Length(staza)+1,Length(OpenPic.FileName)-Length(staza));
            TKazete.Post;
        end;
    end;
    if MovSlika then SlikaFilma;
end;

procedure TFUnosKazete.PregledChange(Sender: TObject);
begin
  inherited;
    if Pregled.ActivePage=Tunos then
    begin
        if MovSlika then SlikaFilma;

        if TKazeteObrisan.AsString='D' then
            b3.Caption:='VRATI FILM'
        else
            b3.Caption:='OBRIŠI FILM';
    end;
end;

procedure TFUnosKazete.SlikaFilma;
begin
    try
      if FileExists(staza+TKazete.FieldByName('LinkSlike').AsString) then
            Image1.Picture.LoadFromFile(staza+TKazete.FieldByName('LinkSlike').AsString)
      else Image1.Picture := nil;
    except
      Image1.Picture := nil;
    End;
end;

procedure TFUnosKazete.TKazeteAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if MovSlika and (Pregled.ActivePage=Tunos) then SlikaFilma;

  if not tKazDetail.Active then tKazDetail.Open;
end;

procedure TFUnosKazete.b5Click(Sender: TObject);
begin
  if Confirm('Da li ste sigurni da želite skloniti sliku?') then
  begin
    if (TKazete.State=dsEdit) or (TKazete.State=dsInsert) then
        TKazete.FieldByName('LinkSlike').Value:=''
    else
    begin
        TKazete.Edit;
        TKazete.FieldByName('LinkSlike').Value:='';
        TKazete.Post;
    end;
    SlikaFilma;
  end;
end;

procedure TFUnosKazete.OpenPicShow(Sender: TObject);
begin
    OpenPic.InitialDir:=staza;
end;

procedure TFUnosKazete.TKazeteKategorijaChange(Sender: TField);
begin
  inherited;
     BilaPromjenaKategorije:=True;
end;

procedure TFUnosKazete.TKazeteAfterPost(DataSet: TDataSet);
begin
  inherited;
  if BilaPromjenaKategorije then
  begin
     qBarKod.MacroByName('KAZETA').AsString:=TKazete.FieldByName('sifra').AsString;
     qBarKod.Open;
     if qBarKod.RecordCount>0 then
     begin
          if Confirm('Da li želite uskladiti kategoriju naplate na barkodovima'+
                      #13+'(na svim barkodivam iz svih video klubova)?') then
          begin
               ShareUnit.UpitOpen(Podaci.myQuery1,
               ' UPDATE bcodekazete'+
               ' SET kategorija='+TKazete.FieldByName('Kategorija').AsString+
               ' WHERE sifrakazete='+TKazete.FieldByName('sifra').AsString, True, False);
          end;
     end;
     qBarKod.Close;
     BilaPromjenaKategorije:=False;
  end;
end;

procedure TFUnosKazete.DBGrid11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if key=VK_F11 then
    begin
        Application.CreateForm(TFUkupnoFilm, FUkupnoFilm);
        FUkupnoFilm.ShowD(DBGrid11.Fields[0].AsInteger);
    end
    else if key=VK_F10 then
    begin
        Application.CreateForm(TFPregSvePosudbeDlg, FPregSvePosudbeDlg);
        FPregSvePosudbeDlg.DoMagic(TQ.FieldByName('sifra').AsInteger);
    end;
end;

procedure TFUnosKazete.DBGrid11GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
    if TQ.FieldByName('Obrisan').AsString='D' then
    begin
        Background := $00B0B0FF;
        AFont.Style:=[fsItalic, fsBold];
        AFont.Color:=clRed;
    end
    else
    begin
        Background := $00B8EDFA;
        AFont.Style:=[fsBold];
        AFont.Color:=clBlack;
    end;

    if Highlight then
    begin
        AFont.Color := clHighlightText;
        if DBGrid11.Focused then
            Background := clHighlight
        else Background := clGray;
    end;
end;

procedure TFUnosKazete.TKazeteBeforeClose(DataSet: TDataSet);
begin
  inherited;
    tKazDetail.Close;
    tSadrzaj.Close;
end;

procedure TFUnosKazete.b2Click(Sender: TObject);
begin
    DetaljiVidljivi(True);
    // dodaj detalje filma za firmu
    ShareUnit.UpitOpen(Podaci.myQuery1,
        'INSERT INTO kazetedetail (SifraKazete, SifraFirme, Azurirano) '+
        'VALUES ('
        +TKazete.FieldByName('Sifra').AsString+', '
        +IntToStr(SifraFirme)+', '
        +''''+FormatDateTime('yyyy-mm-dd hh:mm:ss', Now)+''')', True, False);
    tKazDetail.Close;
    tKazDetail.Open;
end;

procedure TFUnosKazete.DetaljiVidljivi(vidljivi:boolean);
begin   // upali detalje filma po firmi
    if vidljivi then
    begin
        b2.Visible:=False;
        b3.Visible:=True;
        b1.Visible:=True;
        Panel5.Visible:=True;
    end
    else
    begin
        b2.Visible:=True;
        b3.Visible:=False;
        b1.Visible:=False;
        Panel5.Visible:=False;
    end;
end;

procedure TFUnosKazete.TKazeteAfterOpen(DataSet: TDataSet);
begin
    if tKazDetail.Active=False then tKazDetail.Open;
    tSadrzaj.Open;
end;

procedure TFUnosKazete.kdetPromjena(Sender: TObject);
begin
    DetaljiVidljivi(not tKazDetail.IsEmpty);
end;

procedure TFUnosKazete.tKazDetailAfterRefresh(DataSet: TDataSet);
begin
    DetaljiVidljivi(not tKazDetail.IsEmpty);
end;

procedure TFUnosKazete.TQAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if TKazeteObrisan.AsString='D' then
    b3.Caption:='VRATI FILM'
  else
    b3.Caption:='OBRIŠI FILM';
end;

end.
