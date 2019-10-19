unit UnosClanovi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnosTemplate, ImgList, Db, DBTables, RxQuery, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ComCtrls, DBCtrls, ToolWin, RxLookup, RXCtrls,
  ExtCtrls, Mask, wwdbdatetimepicker, dateutil, MySQLDataset,
  LMDCustomComponent, LMDCustomHint, LMDCustomShapeHint, LMDMessageHint;


  type
  TFUnosClanova = class(TFUnosTemplate)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label17: TLabel;
    Label15: TLabel;
    DBText2: TDBText;
    Label29: TLabel;
    DBText1: TDBText;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit16: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label22: TLabel;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    DVrsta: TDataSource;
    Label23: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DStatus: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    TQSifra: TAutoIncField;
    TQImePrezime: TStringField;
    TQAdresa: TStringField;
    TQMjStanovanja: TStringField;
    TClanovi: TMySQLDataset;
    TClanoviSifra: TAutoIncField;
    TClanoviImePrezime: TStringField;
    TClanoviAdresa: TStringField;
    TClanoviMjStanovanja: TStringField;
    TClanoviTelefon: TStringField;
    TClanoviJmbg: TStringField;
    TClanoviOsobna: TStringField;
    TClanoviDuzan: TCurrencyField;
    TClanoviOvlast1: TStringField;
    TClanoviOvlast2: TStringField;
    TClanoviOvlast3: TStringField;
    TClanoviPopust: TSmallintField;
    TClanoviBrojZaduz: TIntegerField;
    TClanoviBarCode: TStringField;
    TClanoviSMS: TStringField;
    TClanoviNapomena: TStringField;
    TClanoviAzurirano: TDateTimeField;
    TClanoviDjelatnik: TIntegerField;
    TClanoviLookOperater: TStringField;
    TClanoviNapomena2: TStringField;
    TClanoviDatumUpisa: TDateField;
    TClanoviInfoBoxID: TStringField;
    TClanoviEMail: TStringField;
    TClanoviMobitel: TStringField;
    TClanoviPrvaPosudba: TStringField;
    TClanoviNapomena3: TStringField;
    TClanoviVrstaPologa: TIntegerField;
    TClanoviPologVrijediDo: TDateField;
    TClanoviStatusClana: TIntegerField;
    TClanoviDatumIzmEmail: TDateField;
    TClanoviDatumIzmMob: TDateField;
    TStatus: TMySQLDataset;
    Tvrsta: TMySQLDataset;
    TClanoviKlubUpisa: TSmallintField;
    Label1: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    TFacebook: TMySQLDataset;
    DFacebook: TDataSource;
    TClanoviSocialStatus: TSmallintField;
    Balon1: TLMDMessageHint;
    procedure TClanoviBeforePost(DataSet: TDataSet);
    procedure TClanoviJmbgValidate(Sender: TField);
    procedure TClanoviAfterPost(DataSet: TDataSet);
    procedure TClanoviAfterInsert(DataSet: TDataSet);
    procedure TClanoviAfterCancel(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure TClanoviImePrezimeChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure wwDBDateTimePicker1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure aBeforeOpen(DataSet: TDataSet);
    procedure DBGrid11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit14Exit(Sender: TObject);
    procedure BtnSpremiClick(Sender: TObject);
    procedure FieldValidate(Sender: TField);
    procedure ZatvoriBalon(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosClanova: TFUnosClanova;

implementation
uses BazeModul, Servisi, PrintUgovor, PrintOvlast, Share,
  PregSvePosudbeDlg2, kartica;
{$R *.DFM}

procedure TFUnosClanova.TClanoviBeforePost(DataSet: TDataSet);
Var a, a2: string;
begin
  DataSet.FieldByName('Azurirano').Value := Now;
  DataSet.FieldByName('Djelatnik').Value := VOperater;
  if bioUnosClana>0 then
  begin
       TClanoviDatumUpisa.Value:=Date;
       TClanoviKlubUpisa.AsInteger:=SifraKluba;

       if TClanoviEMail.AsString <> '' then TClanoviDatumIzmEmail.Value := Date;
       if TClanoviMobitel.AsString <> '' then TClanoviDatumIzmMob.Value := Date;
       if Podaci.TabSetUp.FieldByName('PostojiINFOBOX').Value='D' then
       begin
         a := DateToStr(date);
         ShareUnit.UpitOpen(Podaci.myQuery1,'SELECT COUNT(*) br FROM clanovi', True, False);
         TClanoviInfoBoxID.Value:=copy(a,1,2)+copy(a,4,2)+Podaci.PopuniNule3(IntToStr(Podaci.myQuery1.Fields[0].AsInteger+1),4);
       End;

       if (Podaci.TabSetUp.FieldByName('ZabranaMalodobnici').Value='D') and (TClanoviJmbg.AsString <> '') then
       begin
         a := TClanoviJmbg.AsString;
         if StrToInt(copy(a,6,2)) > 25 then a2:= '1'
         Else a2:='2';
         if ValidDate(StrToDate(copy(a,1,2)+'.'+copy(a,3,2)+'.'+a2+copy(a,5,3))) then
          if StarostGodina(StrToDate(copy(a,1,2)+'.'+copy(a,3,2)+'.'+a2+copy(a,5,3))) < 18 then
          begin
            MessageDlg('Osoba je maloljetna te nije dozvoljen upis!', mtConfirmation, [mbOK], 0);
            TClanovi.cancel;
          End;
       End;
  End;
end;

procedure TFUnosClanova.TClanoviJmbgValidate(Sender: TField);
Var a,a2:string;
begin
  if Podaci.TabSetUp.FieldByName('UpisClanaJmbgNeisp').Value='N' then
  begin
    KobrJMBG(Kbool,Sender.AsString);
// ovdje ide provjera da li je JMBG veæ upisan

       if (Podaci.TabSetUp.FieldByName('ZabranaMalodobnici').Value='D') and (TClanoviJmbg.AsString <> '') then
       begin
         a := TClanoviJmbg.AsString;

         if strtoint(copy(a,6,2)) > 25 then a2:= '1'
         Else a2:='2';

         if ValidDate(strtodate(copy(a,1,2)+'.'+copy(a,3,2)+'.'+a2+copy(a,5,3))) then
          if StarostGodina(strtodate(copy(a,1,2)+'.'+copy(a,3,2)+'.'+a2+copy(a,5,3))) < 18 then
//            MessageDlg('Osoba je maloljetna te nije dozvoljen upis.', mtConfirmation, [mbOK], 0);
            Raise Exception.Create('Osoba je maloljetna te nije dozvoljen upis.');
//            TClanovi.cancel;
       End;
  End;
end;

procedure TFUnosClanova.TClanoviAfterPost(DataSet: TDataSet);
var novasifra: string;
begin
  inherited;
//  Podaci.TClanovi.Locate('Sifra',TClanoviSifra.value,[]);
  if Podaci.TabSetUp.FieldByName('IspisUgovora').Value='D' then
    if MessageDlg('Da li želite ispisati ugovor u '+Podaci.TabSetUp.FieldByName('BrojKopUgovora').AsString+' primjerka?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
        Application.CreateForm(TFPrintUgovor, FPrintUgovor);
        try
            if BioUnosClana>0 then novasifra:=TClanovi.LastInsertID
            else novasifra:=TClanovi.FieldByName('sifra').AsString;

            FPrintUgovor.DajUgovorClana(novasifra);
        Finally
            FPrintUgovor.Destroy;
        End;
    End;

  if Podaci.TabSetUp.FieldByName('IspisOvlastenja').Value='D' then
    if MessageDlg('Da li želite ispisati SUGLASNOST?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
         Application.CreateForm(TFPrintOvlast,FPrintOvlast);
         Try
           FPrintOvlast.Print;
//           FPrintOvlast.Preview;
         Finally
           FPrintOvlast.Destroy;
         End;
    End;

  if BioUnosClana>0 then
  begin
    BioUnosClana:=StrToInt(TClanovi.LastInsertID);
    if Podaci.tabSetUp.FieldByName('NaplatiClanarinu').Value='D' then
      if confirm('Da li stvarno želite naplatiti èlanarinu?') then
        Podaci.NaplatiClanarinu(BioUnosClana, TClanovi.FieldByName('Popust').value);
    if Podaci.tabSetUp.FieldByName('NaplatiOsiguranje').Value='D' then
      if confirm('Da li stvarno želite naplatiti osiguranje?') then
        Podaci.NaplatiOsiguranje(BioUnosClana, TClanovi.FieldByName('Popust').value);
  End;
end;

procedure TFUnosClanova.TClanoviAfterInsert(DataSet: TDataSet);
begin
  inherited;
  BioUnosClana:=1;
  TsAfterEdit(Dataset);
end;

procedure TFUnosClanova.TClanoviAfterCancel(DataSet: TDataSet);
begin
  inherited;
  BioUnosClana:=0;
end;

procedure TFUnosClanova.FormActivate(Sender: TObject);
begin
  inherited;
  if IzKartice then
  begin
    if Pregled.ActivePage = Tpregled then DQ.DataSet.Locate('Sifra',Kclan, [])
    else If Pregled.ActivePage = TUnos then DS.DataSet.Locate('Sifra',Kclan,[]);
    BtnIzmijeniClick(Sender);
  End;
end;

procedure TFUnosClanova.TClanoviImePrezimeChange(Sender: TField);
begin
  inherited;
  If crnaLista then
  begin
    ShareUnit.UpitOpen(Podaci.myQuery1,
        ' SELECT ImePrezime FROM crnalista WHERE ImePrezime LIKE ''%'+TClanoviImePrezime.asString+'%''', True, False);
    if not Podaci.myQuery1.IsEmpty then
      MessageDlg('Èlan : '+TClanoviImePrezime.asString+#13+#13+'JE UPISAN NA CRNU LISTU !!!'+#13+#13+Podaci.TCrnaLista.fieldByName('Napomena').asstring, mtWarning, [mbOk], 0);
  end;
end;

procedure TFUnosClanova.FormCreate(Sender: TObject);
begin
  inherited;
  TVrsta.Open;
  TStatus.Open;
  TFacebook.Open;
  BitBtn1.Visible := cross;
  BitBtn2.Visible := cross;
end;

procedure TFUnosClanova.wwDBDateTimePicker1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    selectnext(sender as twincontrol,True,true);
    key := #0;
  End;
end;

procedure TFUnosClanova.BitBtn1Click(Sender: TObject);
begin
  if (Ds.State in DsEditModes) then TClanoviDatumIzmEmail.Value := Date
  Else begin
         TClanovi.afterpost:=nil;
         Ds.DataSet.Edit;
         TClanoviDatumIzmEmail.Value := Date;
         Ds.DataSet.Post;
         TClanovi.AfterPost:=TClanoviAfterPost;
       End;
end;

procedure TFUnosClanova.BitBtn2Click(Sender: TObject);
begin
  if (Ds.State in DsEditModes) then TClanoviDatumIzmMob.Value := Date
  Else begin
         TClanovi.afterpost:=nil;
         Ds.DataSet.Edit;
         TClanoviDatumIzmMob.Value := Date;
         Ds.DataSet.Post;
         TClanovi.AfterPost:=TClanoviAfterPost;
       End;
end;

procedure TFUnosClanova.aBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//    (DataSet as TMySQLDataset).MacroByName('WHERE').AsString:='WHERE '+(DataSet as TMySQLDataset).Fields[0].FieldName+'='+TQ.Fields[0].AsString;
end;

procedure TFUnosClanova.DBGrid11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if key=VK_F10 then
    begin
        Application.CreateForm(TFPregSvePosudbeDlg2, FPregSvePosudbeDlg2);
        FPregSvePosudbeDlg2.DoMagic(TQ.FieldByName('sifra').AsInteger);
    end;
end;

procedure TFUnosClanova.DBEdit14Exit(Sender: TObject);
begin
  inherited;
    if TClanoviMobitel.Value='' then
    begin
        DBCheckBox1.Enabled:=False;
        TClanoviSMS.Value:='N';
    end
    else DBCheckBox1.Enabled:=True;
end;

procedure TFUnosClanova.BtnSpremiClick(Sender: TObject);
begin
  inherited;
    // refreshaj poadtke èlana
    FKartica.qClan.Close;
    FKartica.qClan.ParamByName('clan').Value:=Kclan;
    FKartica.qClan.Open;
//    if FKartica.qClan.IsEmpty then Exit;
end;

procedure TFUnosClanova.FieldValidate(Sender: TField);
var i: integer;
begin
  inherited;
    if (Trim(Sender.Value)='') or (Sender.IsNull) then
    begin
        For i:=0 to Panel1.ControlCount-1 do
            if Panel1.Controls[i].ClassName = 'TDBEdit' then
                if (Panel1.Controls[i] as TDBedit).Field.FieldName = Sender.FieldName then
                    Balon1.ShowControlMessage(Sender.ConstraintErrorMessage, Panel1.Controls[i]);

        raise Exception.Create(Sender.ConstraintErrorMessage);
    end;
end;

procedure TFUnosClanova.ZatvoriBalon(Sender: TObject);
begin
  inherited;
    if Balon1.IsDisplaying then Balon1.HideMessage;
end;

end.


