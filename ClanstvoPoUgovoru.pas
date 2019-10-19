unit ClanstvoPoUgovoru;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Wwdatsrc, DBTables, Wwtable, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, DBCtrls, wwdblook, Mask, Menus, MySQLDataset, DBGrids,
  dxDBGrid, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxCntner;

type
  TFClanstvoPoUgovoru = class(TForm)
    Panel1: TPanel;
    Button2: TButton;
    DBText2: TDBText;
    DBText3: TDBText;
    Panel2: TPanel;
    Button3: TButton;
    Button4: TButton;
    Button122: TButton;
    Button5: TButton;
    PopupMenu1: TPopupMenu;
    Prenesistatuslanstvanalana1: TMenuItem;
    Label11: TLabel;
    DBEdit15: TDBEdit;
    TVrstaClanstva: TMySQLDataset;
    TPoUgovoru: TMySQLDataset;
    TPoUgovoruSifra: TAutoIncField;
    TPoUgovoruDatum: TDateField;
    TPoUgovoruCalcSaldo: TCurrencyField;
    TPoUgovoruKomercijalista: TIntegerField;
    TPoUgovoruSifraClana: TIntegerField;
    TPoUgovoruVrstaUgovora: TIntegerField;
    TPoUgovoruRadnikID: TStringField;
    TPoUgovoruLookVrstaClanstva: TStringField;
    dsPoUgovoru: TDataSource;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1Sifra: TdxDBGridMaskColumn;
    dxDBGrid1Datum: TdxDBGridDateColumn;
    dxDBGrid1LookVrstaClanstva: TdxDBGridLookupColumn;
    dxDBGrid1IznosUgovora: TdxDBGridCurrencyColumn;
    dxDBGrid1DodajNaSaldo: TdxDBGridCurrencyColumn;
    dxDBGrid1Placeno: TdxDBGridCurrencyColumn;
    dxDBGrid1CalcSaldo: TdxDBGridColumn;
    dxDBGrid1Komercijalista: TdxDBGridMaskColumn;
    dxDBGrid1SifraClana: TdxDBGridMaskColumn;
    dxDBGrid1VrstaUgovora: TdxDBGridMaskColumn;
    dxDBGrid1RadnikID: TdxDBGridMaskColumn;
    TPoUgovoruIznosUgovora: TFloatField;
    TPoUgovoruDodajNaSaldo: TFloatField;
    TPoUgovoruPlaceno: TFloatField;
    procedure Button111Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TPoUgovoruAfterInsert(DataSet: TDataSet);
    procedure TPoUgovoruCalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure TPoUgovoruBeforeEdit(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure Button122Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure TPoUgovoruAfterPost(DataSet: TDataSet);
    procedure TPoUgovoruBeforePost(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Prenesistatuslanstvanalana1Click(Sender: TObject);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    biounos:Boolean;
  public
    { Public declarations }
  end;

var
  FClanstvoPoUgovoru: TFClanstvoPoUgovoru;

implementation

Uses BAzeModul, Kartica, UplataPoUgovoru, PregClanarineClanDlg, UplataProduznjeDlg,
  VracanjeDlg, Share, DLG_Combo, Main;
{$R *.DFM}


procedure TFClanstvoPoUgovoru.FormCreate(Sender: TObject);
begin
    biounos:=False;
    TVrstaClanstva.Open;
    TPoUgovoru.Filter:='SifraClana = '+IntToStr(Fkartica.qClan.FieldByName('Sifra').AsInteger);
    TPoUgovoru.Filtered:=True;
    TPoUgovoru.Open;
    TPoUgovoru.Last;
end;

procedure TFClanstvoPoUgovoru.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if (dsPoUgovoru.State in DsEditModes) then
        if Confirm('Da li želite snimiti izmjene?') then
        begin
            TPoUgovoru.Post;
        end;
    FKartica.qClan.Close;
    FKartica.qClan.Open;
end;

procedure TFClanstvoPoUgovoru.TPoUgovoruAfterInsert(DataSet: TDataSet);
begin
    TPoUgovoru.FieldByName('Datum').AsDateTime:=date;
    TPoUgovoru.FieldByName('Komercijalista').AsInteger:=VOperater;
    TPoUgovoru.FieldByName('RadnikID').AsString:=VRadnik;
    TPoUgovoru.FieldByName('IznosUgovora').AsInteger:=0;
    TPoUgovoru.FieldByName('Placeno').AsInteger:=0;
    TPoUgovoru.FieldByName('SifraClana').AsInteger:=Fkartica.qClan.FieldByName('Sifra').AsInteger;
end;

procedure TFClanstvoPoUgovoru.TPoUgovoruCalcFields(DataSet: TDataSet);
begin
    TPoUgovoru.FieldByName('CalcSaldo').AsFloat:=TPoUgovoru.FieldByName('IznosUgovora').AsFloat-TPoUgovoru.FieldByName('Placeno').AsFloat;
end;

procedure TFClanstvoPoUgovoru.Button2Click(Sender: TObject);
begin
    Close;
end;

procedure TFClanstvoPoUgovoru.Button111Click(Sender: TObject);
begin
    if Podaci.TabRadnici.FieldByName('Vlasnik').Value='N' then MessageDlg('Nemate prava za brisanje!', mtError, [mbOK], 0)
    Else if confirm('Da li stvarno želite obrisati podatak?') then TPoUgovoru.Delete;
end;

procedure TFClanstvoPoUgovoru.TPoUgovoruBeforeEdit(DataSet: TDataSet);
begin
    if Podaci.TabRadnici.FieldByName('Vlasnik').Value='N' then
        raise exception.create('Nema prava za izmjenu podataka!');
end;

procedure TFClanstvoPoUgovoru.Button1Click(Sender: TObject);
begin
    TPoUgovoru.Append;
end;

procedure TFClanstvoPoUgovoru.Button122Click(Sender: TObject);
Var pa, sifraclana:Integer;
    IznosUplate:Currency;
    vVrijediDo:TDatetime;
    sljedeci, rac_master: String;
begin
    if TPoUgovoru.State in [dsEdit, dsInsert] then TPoUgovoru.Post;

    Podaci.tVrstePlacanja.Close; // naði default vrstu plaèanja
    Podaci.tVrstePlacanja.Open;
    Podaci.tVrstePlacanja.LocateRecord('NazivPlacanja', IntToStr(VrstaPlacanja), [], True);

    Application.CreateForm(TFUplataPoUgovoru,FUplataPoUgovoru);
    FUplataPoUgovoru.Label1.Caption := 'Uplata po ugovoru br. '+inttostr(TPoUgovoruSifra.AsInteger)+' u iznosu od';
    pa := FUplataPoUgovoru.Showmodal;
    IznosUplate := FUplataPoUgovoru.CurrencyEdit1.Value;

    If pa in [mrCancel, mrNone, mrAbort] then
    begin
        FUplataPoUgovoru.Release;
        Exit;
    End;

    if IznosUplate = 0 then
    begin
        MessageDlg('Ne možete naplatiti 0,00 Kn!', mtError, [mbOK], 0);
        FUplataPoUgovoru.Release;
        Exit;
    End;

    Try
        try
            Application.CreateForm(TFUplataProduznjeDlg, FUplataProduznjeDlg);
            if FUplataProduznjeDlg.Showmodal = mrOK then vVrijediDo := FUplataProduznjeDlg.DOdatuma.Date;
        Finally
            FUplataProduznjeDlg.Release;
        End;

        sifraclana:=FKartica.qClan.FieldByName('sifra').AsInteger;

        // napravi novi RAÈUN za plaèanje po ugovoru
        // naði sljedeæi broj raèuna
        FVracanjeDlg.qMaxRacun.TableName:='racuni';
        FVracanjeDlg.qMaxRacun.ParamByName('SifraKluba').AsInteger:=SifraKluba;
        FVracanjeDlg.qMaxRacun.Open;
        if FVracanjeDlg.qMaxRacun.FieldByName('racun').IsNull then sljedeci:='1' else
            sljedeci:=FVracanjeDlg.qMaxRacun.FieldByName('racun').AsString;
        FVracanjeDlg.qMaxRacun.Close;
        rac_master:=ShareUnit.PopuniXljevo(IntToStr(SifraKluba),'0',2)+'-'+ShareUnit.PopuniXljevo(sljedeci,'0',6);

        ShareUnit.UpitOpen(Podaci.myQuery1,
        ' INSERT INTO racuni '+
        ' (SifraKluba, BrojRacuna, VrstaRacuna, Datum, Radnik, SifraClana, Popust, Cifra, StopaPoreza, SifraUgovora, Duzan, VrstaPlacanja)'+
        ' VALUES ('+IntToStr(SifraKluba)+', '''+rac_master+''','+
        ' 5, '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+''','+
        ' '''+TPoUgovoru.FieldByName('RadnikID').AsString+''', '+IntToStr(sifraclana)+','+
        ' 0, '+CurrToStr(IznosUplate)+','+
        ' '+Podaci.tabSetUp.FieldByName('IznosPoreza').AsString+', '+
        TPoUgovoru.FieldByName('Sifra').AsString+','+
        ' '+FloatToStr(Fkartica.qClan.FieldByName('Duzan').AsCurrency)+','+
        ' '+IntToStr(Podaci.tVrstePlacanja.FieldByName('Sifra').AsInteger)+')', True, False);

        TPoUgovoru.BeforeEdit := nil;
        TPoUgovoru.Edit;
        TPoUgovoruPlaceno.Value := TPoUgovoruPlaceno.AsCurrency + IznosUplate;
        TPoUgovoru.Post;
        TPoUgovoru.BeforeEdit := TPoUgovoruBeforeEdit;
        TPoUgovoru.Close;
        TPoUgovoru.Open;

        if vVrijediDo <> 0 then
        begin
            ShareUnit.UpitOpen(Podaci.myQuery1,
            ' UPDATE clanovi SET ClanarinaVrijediDo='''+FormatDateTime('yyyy-mm-dd', vVrijediDo)+''''+
            ' WHERE sifra='+IntToStr(sifraclana), True, False);
        End;

        FKartica.qClan.Close;
        FKartica.qClan.ParamByName('clan').Value:=sifraclana;
        FKartica.qClan.Open;

        if Podaci.TabSetUp.FieldByName('postojiprinterracuni').AsString='D' then IspRacun(rac_master);
    except
        on E: Exception do
        begin
            Logiraj(Podaci.myQuery1.Name+'::Error - TFClanstvoPoUgovoru.Button122Click: '+E.Message, True);
        end;
    End;
end;

procedure TFClanstvoPoUgovoru.Button5Click(Sender: TObject);
begin
    Application.CreateForm(TFPregClanarineClanDlg, FPregClanarineClanDlg);
    FPregClanarineClanDlg.SpinEd.Value:=Fkartica.qClan.FieldByName('Sifra').AsInteger;
    FPregClanarineClanDlg.NapraviPregled(5, TPoUgovoruSifra.AsInteger);
end;

procedure TFClanstvoPoUgovoru.TPoUgovoruAfterPost(DataSet: TDataSet);
begin
    if bioUnos then
    begin
        ShareUnit.UpitOpen(Podaci.myQuery1,
        'UPDATE clanovi SET StatusPoUgovoru='+TPoUgovoru.FieldByName('VrstaUgovora').AsString+', '+
        'Duzan='+FloatToStr(Fkartica.qClan.FieldByName('Duzan').AsCurrency+TPoUgovoru.FieldByName('DodajNaSaldo').AsCurrency)+', '+
        'SifStatusPoUgovoru='+TPoUgovoru.FieldByName('VrstaUgovora').AsString+' '+
        'WHERE sifra='+FKartica.qClan.FieldByName('sifra').AsString, True, False);
        biounos:=False;
    end;
end;

procedure TFClanstvoPoUgovoru.TPoUgovoruBeforePost(DataSet: TDataSet);
begin
    biounos:=DataSet.State=DsInsert;
end;

procedure TFClanstvoPoUgovoru.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then Close;
end;

procedure TFClanstvoPoUgovoru.Prenesistatuslanstvanalana1Click(Sender: TObject);
begin
    ShareUnit.UpitOpen(Podaci.myQuery1,
    ' UPDATE clanovi SET StatusPoUgovoru='+TPoUgovoru.FieldByName('VrstaUgovora').AsString+
    ' WHERE sifra='+FKartica.qClan.FieldByName('sifra').AsString, True, False);
end;

procedure TFClanstvoPoUgovoru.Loguj(Dataset: TMySQLDatasetBase;
  var SQL: String; var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TFClanstvoPoUgovoru.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_F9 then
        if PristupOpciji(998) then
        begin
            DlgCombo.DajCombo('radnici');
            if DlgCombo.ShowModal=mrOK then
            begin
                ShareUnit.UpitOpen(Podaci.myQuery1,
                'UPDATE clanstvopougovoru SET radnikid='''+DlgCombo.ComboTablica.FieldByname('ID').AsString+''''+#13+
                'WHERE sifra='+TPoUgovoru.FieldByName('sifra').AsString, True, False);

                TPoUgovoru.Close;
                TPoUgovoru.Filter:='SifraClana = '+IntToStr(Fkartica.qClan.FieldByName('Sifra').AsInteger);
                TPoUgovoru.Filtered:=True;
                TPoUgovoru.Open;
                TPoUgovoru.Last;
            end;
        end;
end;

end.
