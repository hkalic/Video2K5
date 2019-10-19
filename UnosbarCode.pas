unit UnosbarCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, lmdctrl, lmdeditb, lmdeditc, LMDEdit, Grids, DBGrids,
  Buttons, Db, DBTables, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxExEdtr,
  dxCntner, RxLookup, Variants, MySQLDataset;

type
  TFUnosbarCode = class(TForm)
    Panel2: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Izmjena: TSpeedButton;
    Edit1: TEdit;
    DBarcode2: TDataSource;
    dxDBGrid1: TdxDBGrid;
    Label3: TLabel;
    LookUpCombo: TRxDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    qBarkod3: TMySQLQuery;
    qBarkod: TMySQLQuery;
    tMediji: TMySQLDataset;
    tStatus: TMySQLDataset;
    tSetup: TMySQLDataset;
    Label2: TLabel;
    dsMedij: TDataSource;
    eKategorija: TEdit;
    Label6: TLabel;
    eStatus: TRxDBLookupCombo;
    dsStatus: TDataSource;
    Label7: TLabel;
    eKlub: TRxDBLookupCombo;
    dsSetup: TDataSource;
    TBarcode2: TMySQLQuery;
    dxDBGrid1sifraKazete: TdxDBGridMaskColumn;
    dxDBGrid1barcode: TdxDBGridMaskColumn;
    dxDBGrid1kategorija: TdxDBGridMaskColumn;
    TBarcode2sifraKazete: TIntegerField;
    TBarcode2barcode: TMySQLStringField;
    TBarcode2mNaziv: TMySQLStringField;
    TBarcode2kategorija: TSmallintField;
    TBarcode2sNaziv: TMySQLStringField;
    TBarcode2kNaziv: TMySQLStringField;
    TBarcode2izdano: TMySQLStringField;
    dxDBGrid1izdano: TdxDBGridCheckColumn;
    TBarcode2status: TIntegerField;
    TBarcode2sifra_medija: TIntegerField;
    TBarcode2sifra_videokluba: TIntegerField;
    dxDBGrid1mNaziv: TdxDBGridLookupColumn;
    dxDBGrid1sNaziv: TdxDBGridLookupColumn;
    dxDBGrid1kNaziv: TdxDBGridLookupColumn;
    qIzbroj: TMySQLQuery;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBarcode2BeforePost(DataSet: TDataSet);
    procedure TBarcode2KategorijaValidate(Sender: TField);
    procedure TBarcode2IzdanoChange(Sender: TField);
    procedure qBarkodBeforeOpen(DataSet: TDataSet);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure LookUpComboKeyPress(Sender: TObject; var Key: Char);
    procedure TBarcode2BeforeOpen(DataSet: TDataSet);
    procedure IzmjenaClick(Sender: TObject);
    procedure drugiOnKey(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    fbroj:Integer;
    procedure DajSlovo;

    Function ShowMBcode(filmbroj, kategorija, sifra_statusa:Integer):Integer;
    Function OdaberiBKod(filmbroj, nacin:Integer; naslov:String):String;
    Function OdaberiBKodZaRezervaciju(filmbroj, nacin:Integer; naslov:String):String;
  end;

var
  FUnosbarCode: TFUnosbarCode;
  status, kat: integer;

implementation

Uses BazeModul, Unoskazete, Share, Main;

{$R *.DFM}

procedure TFUnosbarCode.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #27 then Close;
end;

procedure TFUnosbarCode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TFUnosbarCode.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    If (key = #13) and (Edit1.text <> '')
        and (length(Edit1.text) >= Podaci.TabSetUp.FieldByName('MinDuzBcode').AsInteger) then
    begin
        If SpeedButton1.Down then  // dodavanje koda
        begin
            // ako je neko polje prazno onda upiši prvi podatak                             // Cross default opcije:
            if eKategorija.Text='' then eKategorija.Text:=default_KategorijaBarkoda;                 // '19'
            if eStatus.KeyValue=null then eStatus.KeyValue:=StrToInt(default_StatusBarkoda);         // 3
            if eKlub.KeyValue=null then eKlub.KeyValue:=SifraKluba;
            if LookUpCombo.KeyValue=null then LookUpCombo.KeyValue:=StrToInt(default_MedijBarkoda);  // 2

            qBarkod3.ParamByName('sifrakoda').AsString:=Edit1.text;
            qBarkod3.Open;
            if qBarkod3.FieldByName('barcode').AsString=Edit1.text then
            begin
                Edit1.text := '';
                LookUpCombo.Value:='';
                LookUpCombo.SetFocus;
                raise exception.create('BARCODE veæ postoji!!!');
            End
            else
            begin
                ShareUnit.UpitOpen(Podaci.myQuery1,
                ' INSERT INTO bcodekazete (barCode, SifraKazete, Sifra_medija, status, kategorija, izdano, datum_izmjene, sifra_videokluba)'+
                ' VALUES ('''+Edit1.text+''', '+IntToStr(fbroj)+', '+IntToStr(LookUpCombo.KeyValue)+', '+
                IntToStr(eStatus.KeyValue)+', '+eKategorija.Text+', ''N'','''+FormatDateTime('yyyy-mm-dd hh:mm:ss', Now)+''', '+IntToStr(eKlub.KeyValue)+')', True, False);
                dajslovo;
            End;
        end
        Else
        if Izmjena.Down then  // ispravljane koda
        begin
            ShareUnit.UpitOpen(Podaci.myQuery1,
            ' UPDATE bcodekazete SET'+
            ' Sifra_medija='+IntToStr(LookUpCombo.KeyValue)+','+
            ' status='+IntToStr(eStatus.KeyValue)+', '+
            ' kategorija='+eKategorija.Text+', '+
            ' datum_izmjene='''+FormatDateTime('yyyy-mm-dd hh:mm:ss', Now)+''', '+
            ' sifra_videokluba='+IntToStr(eKlub.KeyValue)+', '+
            ' barCode='''+Edit1.text+''''+
            ' WHERE barCode='''+dxDBGrid1barcode.Field.AsString+'''', True, False);
            dajslovo;
            SpeedButton1.Down:=True;
            SpeedButton1.Click;
        End;
        LookUpCombo.SetFocus;
        qBarkod3.Close;
        qBarkod3.Filtered:=False;

        TBarcode2.Close;
        TBarcode2.Open;
    End;
end;

Function TFUnosbarCode.ShowMBcode(filmbroj, kategorija, sifra_statusa:Integer):Integer;
begin
(*    if PristupOpciji(21) then // pravo za promjenu barkodova
    begin
        Panel1.Enabled:=True;
        dxDBGrid1.OnKeyDown:=dxDBGrid1KeyDown;
    end
    else
    begin
        Panel1.Enabled:=False;
        dxDBGrid1.OnKeyDown:=drugiOnKey;
    end;
*)
    if low_rights then // iskljuèi "rich" opcije, web i sl.
        eKlub.Visible:=False;
    try
        Result := 0;
        status := sifra_statusa;
        fbroj := filmBroj;
        kat := kategorija;

        TBarcode2.Open;
        TBarcode2.Last;

        tMediji.Open;
        tStatus.Open;
        tSetup.Open;

        tStatus.Locate('sifra',1,[]); // Naði status 'O.K.'
        tSetup.Locate('SifraKluba',SifraKluba,[]); // Naði video klub

        DajSlovo;
        ShowModal;

        qIzbroj.Close; // Prebroj koliko ima filmova za posuditi
        qIzbroj.MacroByName('FILM').AsString:=IntToStr(filmbroj);
        qIzbroj.Open;
        Result:=qIzbroj.FieldByName('UKUPNO').AsInteger;
    Finally
        tSetup.Close;
        tMediji.Close;
        tStatus.Close;
        TBarcode2.Close;
        TBarcode2.Filter := '';
        TBarcode2.Filtered := False;
    End;
end;

procedure TFUnosbarCode.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (key=VK_F1) and (SpeedButton1.Down) then DajSlovo;
end;

procedure TFUnosbarCode.SpeedButton1Click(Sender: TObject);
begin
    if TBarcode2.State=dsEdit then TBarcode2.Cancel;

    LookUpCombo.DataField:='';
    eStatus.DataField:='';
    eKlub.DataField:='';

    LookUpCombo.DataSource:=nil;
    eStatus.DataSource:=nil;
    eKlub.DataSource:=nil;

    DajSlovo;
end;

procedure TFUnosbarCode.DajSlovo;
Var kod:String;
begin
    qBarkod.Open;  // dodaj u edit1 sljedeæi barkod SSSS###C
    if qBarkod.Fields[0].AsString='' then
    begin
        if Podaci.TabSetUp.FieldByName('bezbrojanjabarkodova').Value='N' then
            kod:=ShareUnit.PopuniXljevo(IntToStr(fbroj),'0',4)+'001'
        else
            kod:=ShareUnit.PopuniXljevo(IntToStr(fbroj),'0',4);
    end
    else
    begin
        if Podaci.TabSetUp.FieldByName('bezbrojanjabarkodova').Value='N' then
            kod:=ShareUnit.PopuniXljevo(IntToStr(fbroj),'0',4)+ShareUnit.PopuniXljevo(qBarkod.Fields[0].AsString,'0',3)
        else
            kod:=ShareUnit.PopuniXljevo(IntToStr(fbroj),'0',4);
    end;
    qBarkod.Close;
    Edit1.ReadOnly:=False;

    if Podaci.TabSetUp.FieldByName('bezbrojanjabarkodova').Value='N' then
        Edit1.Text:=kod+ShareUnit.EAN8Check(kod)
    else
        Edit1.Text:=kod;

    dxDBGrid1.Enabled:=True;

    LookUpCombo.KeyValue:=StrToInt(default_MedijBarkoda);
    eKategorija.Text:=default_KategorijaBarkoda;
    eStatus.KeyValue:=StrToInt(default_StatusBarkoda);
    eKlub.KeyValue:=SifraKluba;
end;

Function TFUnosbarCode.OdaberiBKod(filmbroj, nacin:Integer; naslov:String):String;
begin
  try
     Result:='0';  // CANCEL
     Panel1.Visible:=False;   // zatvori postavke za UNOS barkodova
     FUnosbarCode.Caption:='Odaberite barkod'+naslov;
     FUnosbarCode.BorderIcons:=[];
     TBarcode2.ReadOnly:=True;
     OnKeyDown:=nil;
     fbroj:=filmbroj;

     TBarcode2.SQL.Clear;
     TBarcode2.SQL.Add('SELECT b.sifraKazete, b.barcode, m.naziv mNaziv, '+
                    'b.kategorija, s.naziv sNaziv, x.NazivKluba kNaziv, b.izdano, '+
                    'b.status, b.sifra_medija, b.sifra_videokluba '+
                    'FROM bcodekazete b, medij m, statusfilma s, setup x '+
                    'WHERE b.sifra_medija=m.sifra '+
                    'AND b.status=s.sifra '+
                    'AND b.sifra_videokluba=x.sifrakluba '+
                    'AND b.sifraKazete=[FILM] '+
                    'AND b.Sifra_videokluba='+IntToStr(SifraKluba)+' AND b.Izdano=''N'''+' AND s.zbroj>0 '+
                    'ORDER BY b.barcode DESC');

     TBarcode2.Open;
     tMediji.Open;
     tStatus.Open;

//     TBarcode2.Filter:='Sifra_videokluba='+IntToStr(SifraKluba)+' AND Izdano=''N'''+' AND status NOT IN (2, 3)';
//     TBarcode2.Filtered:=True;
     TBarcode2.Last;

     dxDBGrid1.Tag:=1; // oznaka za onKeyPress za odabir barkoda
     if TBarcode2.RecordCount>1 then
     begin
          if ShowModal=mrOk then
            Result:=TBarcode2BarCode.AsString // odaberi barkod
          else Result:='0';  // CANCEL
     end
     else if TBarcode2.RecordCount=1 then
            Result:=TBarcode2BarCode.AsString // samo jedan barkod
     else Result:='0';       // CANCEL - nema barkodova
  Finally
     tMediji.Close;
     tStatus.Close;
     TBarcode2.Close;
     TBarcode2.Filter := '';
     TBarcode2.Filtered := False;

     Panel1.Visible:=True;  // vrati default postavke
     FUnosbarCode.Caption:='Unos barkodova';
     FUnosbarCode.BorderIcons:=[biSystemMenu];
     TBarcode2.ReadOnly:=True;
     OnKeyDown:=FormKeyDown;
     dxDBGrid1.Tag:=0; // oznaka za onKeyPress za odabir barkoda
  End;
end;

Function TFUnosbarCode.OdaberiBKodZaRezervaciju(filmbroj, nacin:Integer; naslov:String):String;
begin
  try
     Result:='0';  // CANCEL
     Panel1.Visible:=False;   // zatvori postavke za UNOS barkodova
     FUnosbarCode.Caption:='Odaberite barkod'+naslov;
     FUnosbarCode.BorderIcons:=[];
     TBarcode2.ReadOnly:=True;
     OnKeyDown:=nil;
     fbroj:=filmbroj;

     TBarcode2.SQL.Clear;
     TBarcode2.SQL.Add('SELECT b.sifraKazete, b.barcode, m.naziv mNaziv, '+
                    'b.kategorija, s.naziv sNaziv, x.NazivKluba kNaziv, b.izdano, '+
                    'b.status, b.sifra_medija, b.sifra_videokluba '+
                    'FROM bcodekazete b, medij m, statusfilma s, setup x '+
                    'WHERE b.sifra_medija=m.sifra '+
                    'AND b.status=s.sifra '+
                    'AND b.sifra_videokluba=x.sifrakluba '+
                    'AND b.sifraKazete=[FILM] '+
                    'AND b.Sifra_videokluba='+IntToStr(SifraKluba)+' AND s.zbroj>0 '+
                    'ORDER BY b.barcode DESC');

     TBarcode2.Open;
     tMediji.Open;
     tStatus.Open;

//     TBarcode2.Filter:='Sifra_videokluba='+IntToStr(SifraKluba)+' AND Izdano=''N'''+' AND status NOT IN (2, 3)';
//     TBarcode2.Filtered:=True;
     TBarcode2.Last;

     dxDBGrid1.Tag:=1; // oznaka za onKeyPress za odabir barkoda
     if TBarcode2.RecordCount>1 then
     begin
          if ShowModal=mrOk then
            Result:=TBarcode2BarCode.AsString // odaberi barkod
          else Result:='0';  // CANCEL
     end
     else if TBarcode2.RecordCount=1 then
            Result:=TBarcode2BarCode.AsString // samo jedan barkod
     else Result:='0';       // CANCEL - nema barkodova
  Finally
     tMediji.Close;
     tStatus.Close;
     TBarcode2.Close;
     TBarcode2.Filter := '';
     TBarcode2.Filtered := False;

     Panel1.Visible:=True;  // vrati default postavke
     FUnosbarCode.Caption:='Unos barkodova';
     FUnosbarCode.BorderIcons:=[biSystemMenu];
     TBarcode2.ReadOnly:=True;
     OnKeyDown:=FormKeyDown;
     dxDBGrid1.Tag:=0; // oznaka za onKeyPress za odabir barkoda
  End;
end;

procedure TFUnosbarCode.dxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var posudjeno: integer;
    upit: string;
begin
    if dxDBGrid1.Tag=1 then // ako je odabir barkoda
    begin
        if key=13 then
            ModalResult:=mrOk
        else if key=27 then ModalResult:=mrCancel;
    end
    else
    begin
        if (Key=VK_DELETE) and Izmjena.Down and (TBarcode2.FieldByName('izdano').AsString='N') then
        begin
            if confirm('Da li stvarno želite obrisati barkod?') then
            begin
                ShareUnit.UpitOpen(Podaci.myQuery1,
                    'DELETE FROM bcodekazete WHERE barcode='''+TBarcode2.FieldByName('barcode').AsString+'''', True, False);
                TBarcode2.Close;
                TBarcode2.Open;
                Edit1.text := '';
                LookUpCombo.Value:='';
                LookUpCombo.SetFocus;
                SpeedButton1.Down:=True;
                DajSlovo;
            End;
        end
        else
        if key=VK_F9 then
        begin
            if PristupOpciji(998) then
            begin
                ShareUnit.UpitOpen(Podaci.myQuery1,
                'SELECT sifranebitna FROM pos WHERE bcodekaz='''+TBarcode2.FieldByName('barcode').AsString+''''
                , False, True);

                if Podaci.myQuery1.IsEmpty then
                    posudjeno:=0
                else posudjeno:=Podaci.myQuery1.FieldByName('sifranebitna').AsInteger;

                if Confirm('Da li ste sigurni da film želite vratiti u videoteku?') then
                begin
                    upit:='';
                    if posudjeno<>0 then
                        upit:='DELETE FROM pos WHERE sifranebitna='+IntToStr(posudjeno)+';'+#13;

                    ShareUnit.UpitOpen(Podaci.myQuery1, upit+
                    'UPDATE bcodekazete SET izdano=''N'''+
                    'WHERE barcode='+TBarcode2.FieldByName('barcode').AsString, True, False);

                    TBarcode2.Close;
                    TBarcode2.Open; // ima TBarcode2BeforeOpen koji stavlja MACRO za kazetu
                end;
            end;
        end;
    end;
end;

procedure TFUnosbarCode.drugiOnKey(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var posudjeno: integer;
    upit: string;
begin
    if dxDBGrid1.Tag=1 then // ako je odabir barkoda
    begin
        if key=13 then
            ModalResult:=mrOk
        else if key=27 then ModalResult:=mrCancel;
    end
    else
    begin
        if (key=13) or (key=27) then Close;
    end;
end;

procedure TFUnosbarCode.TBarcode2BeforePost(DataSet: TDataSet);
begin
    SpeedButton1.Down:=True;
end;

procedure TFUnosbarCode.TBarcode2KategorijaValidate(Sender: TField);
begin
  Podaci.Otvoriindex('cijene');
  if not Podaci.TabIndex.LOCATE('Cijenik;Kategorija', VarArrayOf([1,Sender.Value]), []) then
         raise exception.create('Kategorija naplate ne postoji, nije definirana cjenikom.');
end;

procedure TFUnosbarCode.TBarcode2IzdanoChange(Sender: TField);
begin
     if (Sender as TField).DataSet.State=dsEdit then
     if TBarcode2Izdano.Value='N' then
     begin
          if Podaci.TPosudbe.Locate('bcodekaz',TBarcode2BarCode.AsString,[]) then
          begin
               ShowMessage('Još uvijek postoji zaduženje na èlanu: '+Podaci.TPosudbe.FieldByName('SifraClana').AsString);
               TBarcode2.Cancel;
          end;
     end;
end;

procedure TFUnosbarCode.qBarkodBeforeOpen(DataSet: TDataSet);
begin
    (DataSet as TMySQLQuery).ParamByName('SifraKazete').AsInteger:=fbroj;
end;

procedure TFUnosbarCode.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TFUnosbarCode.LookUpComboKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key=#13 then begin SelectNext(Sender as twincontrol, True, True); key:=#0; end;
end;

procedure TFUnosbarCode.TBarcode2BeforeOpen(DataSet: TDataSet);
begin
    TBarcode2.MacroByName('FILM').AsString:=IntToStr(fbroj);
end;

procedure TFUnosbarCode.IzmjenaClick(Sender: TObject);
begin
    // kontrola da li je kod u tPOS
    ShareUnit.UpitOpen(Podaci.myQuery1,
        'SELECT * FROM pos WHERE bcodekaz='''+TBarcode2.FieldByName('barcode').AsString+'''', False, True);
    if not Podaci.myQuery1.IsEmpty then
    begin
        ShowMessage('Medij sa ovim barkodom je još uvijek posuðen pa ga nemožete izmjeniti!!!');
        Close;
    end;

//    dxDBGrid1.Enabled:=False;
    Edit1.Text:=dxDBGrid1barcode.Field.AsString;
    eKategorija.Text:=dxDBGrid1kategorija.Field.AsString;

    LookUpCombo.DataSource:=DBarcode2;
    eStatus.DataSource:=DBarcode2;
    eKlub.DataSource:=DBarcode2;

    LookUpCombo.DataField:='sifra_medija';
    eStatus.DataField:='status';
    eKlub.DataField:='sifra_videokluba';
end;

end.
