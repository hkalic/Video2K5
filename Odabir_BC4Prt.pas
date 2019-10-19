unit Odabir_BC4Prt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RxLookup, Db, DBTables, wwdbdatetimepicker,
  Grids, DBGrids, dxCntner, dxTL, dxDBCtrl, dxDBGrid, MemTable, dxmdaset,
  dxDBTLCl, dxGrClms, Menus, Buttons, MySQLDataset, FR_DSet, FR_DBSet,
  FR_Class, frx2xto30, frxClass, frxDesgn, frxDBSet;

type
  TOdabir_BC = class(TForm)
    DMediji: TDataSource;
    DStatFilma: TDataSource;
    DKlubovi: TDataSource;
    DS: TDataSource;
    dxDBGrid1: TdxDBGrid;
    TStavke: TdxMemData;
    Panel3: TPanel;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    Label30: TLabel;
    Label36: TLabel;
    Label7: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    RxDBLookupCombo9: TRxDBLookupCombo;
    RxDBLookupCombo1: TRxDBLookupCombo;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    OdBroja: TEdit;
    DatumOd: TwwDBDateTimePicker;
    DatumDo: TwwDBDateTimePicker;
    DoBroja: TEdit;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Panel2: TPanel;
    dxDBGrid2: TdxDBGrid;
    Splitter1: TSplitter;
    dsQuery: TDataSource;
    dxDBGrid2barcode: TdxDBGridMaskColumn;
    dxDBGrid2sifraKazete: TdxDBGridMaskColumn;
    dxDBGrid2film: TdxDBGridMaskColumn;
    dxDBGrid2zanr: TdxDBGridMaskColumn;
    dxDBGrid2medij: TdxDBGridMaskColumn;
    dxDBGrid2status: TdxDBGridMaskColumn;
    dxDBGrid2datum_izmjene: TdxDBGridDateColumn;
    TStavkebarcode: TStringField;
    TStavkesifrakazete: TIntegerField;
    TStavkefilm: TStringField;
    TStavkezanr: TStringField;
    TStavkemedij: TStringField;
    TStavkestatus: TStringField;
    TStavkedatum_izmjene: TDateField;
    dxDBGrid1RecId: TdxDBGridColumn;
    dxDBGrid1barcode: TdxDBGridMaskColumn;
    dxDBGrid1sifrakazete: TdxDBGridMaskColumn;
    dxDBGrid1film: TdxDBGridMaskColumn;
    dxDBGrid1zanr: TdxDBGridMaskColumn;
    dxDBGrid1medij: TdxDBGridMaskColumn;
    dxDBGrid1status: TdxDBGridMaskColumn;
    dxDBGrid1datum_izmjene: TdxDBGridDateColumn;
    PopupMenu1: TPopupMenu;
    Design1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TStavkenaljepnice: TStringField;
    tVHS: TdxMemData;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    DateField1: TDateField;
    StringField6: TStringField;
    tDVD: TdxMemData;
    StringField7: TStringField;
    IntegerField2: TIntegerField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    DateField2: TDateField;
    StringField12: TStringField;
    DizajnVHSreporta1: TMenuItem;
    CheckBox6: TCheckBox;
    DizajnZajednikenaljepnice1: TMenuItem;
    DizajnZajednikeVHSnaljepnice1: TMenuItem;
    CheckBox7: TCheckBox;
    TMediji: TMySQLTable;
    TKlubovi: TMySQLTable;
    TStatFilma: TMySQLTable;
    qBarkodovi2: TMySQLQuery;
    qBarkodovi: TMySQLQuery;
    TStavkeimdb: TFloatField;
    TStavkepg: TStringField;
    tVHSimdb: TFloatField;
    tVHSpg: TStringField;
    tDVDimdb: TFloatField;
    tDVDpg: TStringField;
    frxReport2: TfrxReport;
    frxDesigner1: TfrxDesigner;
    Button1: TButton;
    frxDBDataset3: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure reload;
    procedure RxDBLookupCombo7Change(Sender: TObject);
    procedure DodajClick(Sender: TObject);
    procedure DizajnFR(Sender: TObject);
    procedure BitBtn2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure TestFR3(Sender: TObject);
    procedure Printaj;
    function frxDesigner1SaveReport(Report: TfrxReport;
      SaveAs: Boolean): Boolean;
  private
    { Private declarations }
    Source: TStream;
  public
    { Public declarations }
  end;

var
  Odabir_BC: TOdabir_BC;

implementation

uses BazeModul, PojamUnit, Main, IzvjestajTM;

{$R *.DFM}

procedure TOdabir_BC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TOdabir_BC.CheckBox1Click(Sender: TObject);
begin
     if (Sender as TCheckBox).Checked then TMediji.Open else TMediji.Close;
     RxDBLookupCombo7.Enabled:=(Sender as TCheckBox).Checked;
     Label30.Enabled:=(Sender as TCheckBox).Checked;
     reload;
end;

procedure TOdabir_BC.CheckBox2Click(Sender: TObject);
begin
     if (Sender as TCheckBox).Checked then TStatFilma.Open else TStatFilma.Close;
     RxDBLookupCombo9.Enabled:=(Sender as TCheckBox).Checked;
     Label36.Enabled:=(Sender as TCheckBox).Checked;
     reload;
end;

procedure TOdabir_BC.CheckBox3Click(Sender: TObject);
begin
     if (Sender as TCheckBox).Checked then TKlubovi.Open else TKlubovi.Close;
     RxDBLookupCombo1.Enabled:=(Sender as TCheckBox).Checked;
     Label7.Enabled:=(Sender as TCheckBox).Checked;
     reload;
end;

procedure TOdabir_BC.CheckBox5Click(Sender: TObject);
begin
     DatumDo.Enabled:=(Sender as TCheckBox).Checked;
     DatumOd.Enabled:=(Sender as TCheckBox).Checked;
     Label3.Enabled:=(Sender as TCheckBox).Checked;
     Label4.Enabled:=(Sender as TCheckBox).Checked;
end;

procedure TOdabir_BC.CheckBox4Click(Sender: TObject);
begin
     OdBroja.Enabled:=(Sender as TCheckBox).Checked;
     DoBroja.Enabled:=(Sender as TCheckBox).Checked;
     Label5.Enabled:=(Sender as TCheckBox).Checked;
     Label6.Enabled:=(Sender as TCheckBox).Checked;
end;

procedure TOdabir_BC.FormCreate(Sender: TObject);
begin
    if not Podaci.TBarcode.Active then Podaci.TBarcode.Open;
    TKlubovi.Open;
    TStatFilma.Open;
    TMediji.Open;
    Tstavke.Open;
    tDVD.Open;
    tVHS.Open;
    TKlubovi.Locate('Sifrakluba', SifraKluba, []);
    reload;
end;

procedure TOdabir_BC.dxDBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key=27 then Close
     else if key=13 then
     begin
          TStavke.Append;
          TStavke.FieldByName('barcode').Value:=qBarkodovi.FieldByName('barcode').Value;
          TStavke.FieldByName('sifrakazete').Value:=qBarkodovi.FieldByName('sifrakazete').Value;
          TStavke.FieldByName('film').Value:=qBarkodovi.FieldByName('film').Value;
          TStavke.FieldByName('zanr').Value:=qBarkodovi.FieldByName('zanr').Value;
          TStavke.FieldByName('medij').Value:=qBarkodovi.FieldByName('medij').Value;
          TStavke.FieldByName('status').Value:=qBarkodovi.FieldByName('status').Value;
          TStavke.FieldByName('datum_izmjene').Value:=qBarkodovi.FieldByName('datum_izmjene').Value;
          TStavke.FieldByName('imdb').Value:=qBarkodovi.FieldByName('imdb').Value;
          TStavke.FieldByName('pg').Value:=qBarkodovi.FieldByName('pg').Value;
          TStavke.FieldByName('naljepnica').Value:=qBarkodovi.FieldByName('naljepnica').Value;
          TStavke.Post;

          if qBarkodovi.FieldByName('naljepnica').Value='VHS' then
          begin
               tVHS.Append;
               tVHS.FieldByName('barcode').Value:=qBarkodovi.FieldByName('barcode').Value;
               tVHS.FieldByName('sifrakazete').Value:=qBarkodovi.FieldByName('sifrakazete').Value;
               tVHS.FieldByName('film').Value:=qBarkodovi.FieldByName('film').Value;
               tVHS.FieldByName('zanr').Value:=qBarkodovi.FieldByName('zanr').Value;
               tVHS.FieldByName('medij').Value:=qBarkodovi.FieldByName('medij').Value;
               tVHS.FieldByName('status').Value:=qBarkodovi.FieldByName('status').Value;
               tVHS.FieldByName('datum_izmjene').Value:=qBarkodovi.FieldByName('datum_izmjene').Value;
               tVHS.FieldByName('imdb').Value:=qBarkodovi.FieldByName('imdb').Value;
               tVHS.FieldByName('pg').Value:=qBarkodovi.FieldByName('pg').Value;
               tVHS.FieldByName('naljepnica').Value:='VHS';
               tVHS.Post;
          end else
          if qBarkodovi.FieldByName('naljepnica').Value='DVD' then
          begin
               tDVD.Append;
               tDVD.FieldByName('barcode').Value:=qBarkodovi.FieldByName('barcode').Value;
               tDVD.FieldByName('sifrakazete').Value:=qBarkodovi.FieldByName('sifrakazete').Value;
               tDVD.FieldByName('film').Value:=qBarkodovi.FieldByName('film').Value;
               tDVD.FieldByName('zanr').Value:=qBarkodovi.FieldByName('zanr').Value;
               tDVD.FieldByName('medij').Value:=qBarkodovi.FieldByName('medij').Value;
               tDVD.FieldByName('status').Value:=qBarkodovi.FieldByName('status').Value;
               tDVD.FieldByName('datum_izmjene').Value:=qBarkodovi.FieldByName('datum_izmjene').Value;
               tDVD.FieldByName('imdb').Value:=qBarkodovi.FieldByName('imdb').Value;
               tDVD.FieldByName('pg').Value:=qBarkodovi.FieldByName('pg').Value;
               tDVD.FieldByName('naljepnica').Value:='DVD';
               tDVD.Post;
          end;
     end;
end;

procedure TOdabir_BC.dxDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['A'..'Z','a'..'z','0'..'9','š','ð','è','æ','ž','Š','Ð','Ž','Æ','È','%'] then
  begin
    PojamForm.Edit1.Text := Key;
    PojamForm.Edit1.SelStart := 1;
    PojamForm.ShowModal;
    if PojamForm.ModRes then
        qBarkodovi.Locate(dxDBGrid2.FocusedField.FieldName,PojamForm.Edit1.Text,[loCaseInsensitive, loPartialKey]);
  end;
end;

procedure TOdabir_BC.reload;
var s: string;
begin
     s:='';
     qBarkodovi.Close;
     if CheckBox1.Checked then s:=' AND b.sifra_medija='+TMediji.FieldByName('Sifra').AsString;
     if CheckBox2.Checked then s:=s+' AND b.status='+TStatFilma.FieldByName('Sifra').AsString;
     if CheckBox3.Checked then s:=s+' AND b.Sifra_videokluba='+TKlubovi.FieldByName('SifraKluba').AsString;
     s:=s+' ORDER BY b.sifraKazete DESC';
     if FileExists(PathSQL+'\OdabirBarkodova.sql') then
     begin
          qBarkodovi.SQL.LoadFromFile(PathSQL+'\OdabirBarkodova.sql');
          qBarkodovi.SQL.Append(s);
     end
     else
     begin
          ShowMessage('Greška u OdabirBarkodova.sql');
          Close;
     end;
     qBarkodovi.Open;
end;

procedure TOdabir_BC.RxDBLookupCombo7Change(Sender: TObject);
begin
     reload;
end;

procedure TOdabir_BC.DodajClick(Sender: TObject);
var s, j: String;
begin
     s:='';
     qBarkodovi2.Close;

     if CheckBox4.Checked then     // od broja do broja
     begin
          if (OdBroja.Text<>'') and (DoBroja.Text<>'') then
          begin
               if StrToInt(DoBroja.Text)<StrToInt(OdBroja.Text) then
               begin
                    j:=DoBroja.Text;
                    DoBroja.Text:=OdBroja.Text;
                    OdBroja.Text:=j;
               end;
               s:=s+' AND b.sifraKazete BETWEEN '''+OdBroja.Text+''' AND '''+DoBroja.Text+'''';
          end
          else
          begin
               ShowMessage('Niste dobro upisali brojeve filmova!');
               Close;
          end;
     end;

     if CheckBox5.Checked then     // od datuma do datuma
     begin
          if (DatumOd.Text<>'') and (DatumDo.Text<>'') then
          begin
               if StrToDate(DatumDo.Text)<StrToDate(DatumOd.Text) then
               begin
                    j:=DatumDo.Text;
                    DatumDo.Text:=DatumOd.Text;
                    DatumOd.Text:=j;
               end;
               s:=s+' AND b.datum_izmjene BETWEEN '''+DatumOd.Text+''' AND '''+DatumDo.Text+'''';
          end
          else
          begin
               ShowMessage('Niste dobro upisali datume filmova!');
               Close;
          end;
     end;

     if CheckBox7.Checked then
     begin
          if CheckBox1.Checked then s:=s+' AND b.Sifra_medija='+TMediji.FieldByName('sifra').AsString; // samo za vrste medija
          if CheckBox2.Checked then s:=s+' AND b.Status='+TStatFilma.FieldByName('sifra').AsString; // samo za status filma
          if CheckBox3.Checked then s:=s+' AND b.Sifra_videokluba='+TKlubovi.FieldByName('sifrakluba').AsString; // samo za video klub
     end;

     if FileExists(PathSQL+'\OdabirBarkodova.sql') then
     begin
          qBarkodovi2.SQL.LoadFromFile(PathSQL+'\OdabirBarkodova.sql');
          qBarkodovi2.SQL.Append(s);

          qBarkodovi2.Open;
          qBarkodovi2.First;
          while not qBarkodovi2.Eof do
          begin
               TStavke.Append;
               TStavke.FieldByName('barcode').Value:=qBarkodovi2.FieldByName('barcode').Value;
               TStavke.FieldByName('sifrakazete').Value:=qBarkodovi2.FieldByName('sifrakazete').Value;
               TStavke.FieldByName('film').Value:=qBarkodovi2.FieldByName('film').Value;
               TStavke.FieldByName('zanr').Value:=qBarkodovi2.FieldByName('zanr').Value;
               TStavke.FieldByName('medij').Value:=qBarkodovi2.FieldByName('medij').Value;
               TStavke.FieldByName('status').Value:=qBarkodovi2.FieldByName('status').Value;
               TStavke.FieldByName('datum_izmjene').Value:=qBarkodovi2.FieldByName('datum_izmjene').Value;
               TStavke.FieldByName('naljepnica').Value:=qBarkodovi2.FieldByName('naljepnica').Value;
               TStavke.FieldByName('imdb').Value:=qBarkodovi2.FieldByName('imdb').Value;
               TStavke.FieldByName('pg').Value:=qBarkodovi2.FieldByName('pg').Value;
               TStavke.Post;

               if qBarkodovi2.FieldByName('naljepnica').Value='VHS' then
               begin
                    tVHS.Append;
                    tVHS.FieldByName('barcode').Value:=qBarkodovi2.FieldByName('barcode').Value;
                    tVHS.FieldByName('sifrakazete').Value:=qBarkodovi2.FieldByName('sifrakazete').Value;
                    tVHS.FieldByName('film').Value:=qBarkodovi2.FieldByName('film').Value;
                    tVHS.FieldByName('zanr').Value:=qBarkodovi2.FieldByName('zanr').Value;
                    tVHS.FieldByName('medij').Value:=qBarkodovi2.FieldByName('medij').Value;
                    tVHS.FieldByName('status').Value:=qBarkodovi2.FieldByName('status').Value;
                    tVHS.FieldByName('datum_izmjene').Value:=qBarkodovi2.FieldByName('datum_izmjene').Value;
                    tVHS.FieldByName('imdb').Value:=qBarkodovi2.FieldByName('imdb').Value;
                    tVHS.FieldByName('pg').Value:=qBarkodovi2.FieldByName('pg').Value;
                    tVHS.FieldByName('naljepnica').Value:='VHS';
                    tVHS.Post;
               end else
               if qBarkodovi2.FieldByName('naljepnica').Value='DVD' then
               begin
                    tDVD.Append;
                    tDVD.FieldByName('barcode').Value:=qBarkodovi2.FieldByName('barcode').Value;
                    tDVD.FieldByName('sifrakazete').Value:=qBarkodovi2.FieldByName('sifrakazete').Value;
                    tDVD.FieldByName('film').Value:=qBarkodovi2.FieldByName('film').Value;
                    tDVD.FieldByName('zanr').Value:=qBarkodovi2.FieldByName('zanr').Value;
                    tDVD.FieldByName('medij').Value:=qBarkodovi2.FieldByName('medij').Value;
                    tDVD.FieldByName('status').Value:=qBarkodovi2.FieldByName('status').Value;
                    tDVD.FieldByName('datum_izmjene').Value:=qBarkodovi2.FieldByName('datum_izmjene').Value;
                    tDVD.FieldByName('imdb').Value:=qBarkodovi2.FieldByName('imdb').Value;
                    tDVD.FieldByName('pg').Value:=qBarkodovi2.FieldByName('pg').Value;
                    tDVD.FieldByName('naljepnica').Value:='DVD';
                    tDVD.Post;
               end;
               qBarkodovi2.Next;
          end;
     end
     else
     begin
          ShowMessage('Greška u OdabirBarkodova.sql');
          Close;
     end;
end;

procedure TOdabir_BC.DizajnFR(Sender: TObject);
begin   // možda ovo napraviti sa TIzvjestaji.DajFRReport(Dizajn:Integer; Report:TfrReport; uvjet:String)
  with Izvjestaji do  // *.frf iz DB
  begin
    if PristupOpciji(73) then // pravo za dizaj izvještaja
    begin
        SviReporti.MacroByName('WHERE').AsString:='WHERE SifraIzvjestaja='+IntToStr((Sender as TMenuItem).Tag);
        SviReporti.Open;

        if not SviReporti.IsEmpty then
        begin
            try
                SviReporti.Edit;
                Source:=Izvjestaji.SviReporti.CreateBlobStream(Izvjestaji.SviReportiIzgled, bmReadWrite);
                frxReport2.LoadFromStream(Source);

                frxReport2.DesignReport;
                SviReporti.Post;
            finally
                Source.Free;
            end;
        end
        else
        begin
            ShowMessage('Nemogu pronaæi definiciju "'+(Sender as TMenuItem).Caption+'"!');
            Exit;
        end;

        SviReporti.Close;
    end;
  end;
end;

function TOdabir_BC.frxDesigner1SaveReport(Report: TfrxReport;
  SaveAs: Boolean): Boolean;
begin
    Source.Seek(0, 0);
    Report.SaveToStream(Source);
end;

procedure TOdabir_BC.Printaj;
begin
    with Izvjestaji do  // *.fr3 iz DB
    begin
        SviReporti.Close;
        SviReporti.MacroByName('WHERE').AsString:='WHERE SifraIzvjestaja IN (2, 3, 4, 5)';
        SviReporti.MacroByName('ORDER').AsString:='ORDER BY SifraIzvjestaja';
        SviReporti.Open;

        if SviReporti.RecordCount<>4 then
        begin
            ShowMessage('Nemogu pronaæi sve definicije za naljepnice!');
            Exit;
        end;

        SviReporti.First;
        try
            Source:=SviReporti.CreateBlobStream(SviReportiIzgled, bmRead);
            frxReport2.LoadFromStream(Source);
            frxReport2.PrepareReport(True);
        finally
            Source.Free;
        end;

        SviReporti.Next;
        try
            Source:=SviReporti.CreateBlobStream(SviReportiIzgled, bmRead);
            frxReport2.LoadFromStream(Source);
            frxReport2.PrepareReport(False);
        finally
            Source.Free;
        end;

        if CheckBox6.Checked then
        begin
            SviReporti.Next;
            try
                Source:=SviReporti.CreateBlobStream(SviReportiIzgled, bmRead);
                frxReport2.LoadFromStream(Source);
                frxReport2.PrepareReport(False);
            finally
                Source.Free;
            end;

            SviReporti.Next;
            try
                Source:=SviReporti.CreateBlobStream(SviReportiIzgled, bmRead);
                frxReport2.LoadFromStream(Source);
                frxReport2.PrepareReport(False);
            finally
                Source.Free;
            end;
        end;

        frxReport2.ShowPreparedReport;

        SviReporti.Close;
    End;
end;

procedure TOdabir_BC.BitBtn2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if Button=mbLeft then Printaj;   // umjesto onClick zbog PopupMenu1
end;

procedure TOdabir_BC.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TOdabir_BC.TestFR3(Sender: TObject);
begin
    with Izvjestaji do  // *.fr3 fajlovi
    begin
        SviReporti.Close;
        SviReporti.MacroByName('WHERE').AsString:='WHERE SifraIzvjestaja IN (2, 3, 4, 5)';
        SviReporti.MacroByName('ORDER').AsString:='ORDER BY SifraIzvjestaja';
        SviReporti.Open;

        if SviReporti.RecordCount<>4 then
        begin
            ShowMessage('Nemogu pronaæi sve definicije za naljepnice!');
            Exit;
        end;

        SviReporti.First;
        try
            frxReport2.LoadFromFile(PathINI+'\INI\NaljepniceDVD.fr3', True);
            SviReporti.Edit;
            SviReportiIzgled.LoadFromFile(PathINI+'\INI\NaljepniceDVD.fr3');
            SviReporti.Post;
            frxReport2.PrepareReport(True);
        finally
        end;

        SviReporti.Next;
        try
            frxReport2.LoadFromFile(PathINI+'\INI\NaljepniceVHS.fr3', True);
            SviReporti.Edit;
            SviReportiIzgled.LoadFromFile(PathINI+'\INI\NaljepniceVHS.fr3');
            SviReporti.Post;
        finally
        end;

        if CheckBox6.Checked then
        begin
            frxReport2.PrepareReport(True); // nastavak od zadnjeg reporta bez završetka
            SviReporti.Next;
            try
                frxReport2.LoadFromFile(PathINI+'\INI\Zajednicka1.fr3', True);
                SviReporti.Edit;
                SviReportiIzgled.LoadFromFile(PathINI+'\INI\Zajednicka1.fr3');
                SviReporti.Post;
                frxReport2.PrepareReport(True);
            finally
            end;

            SviReporti.Next;
            try
                frxReport2.LoadFromFile(PathINI+'\INI\Zajednicka2.fr3', True);
                SviReporti.Edit;
                SviReportiIzgled.LoadFromFile(PathINI+'\INI\Zajednicka2.fr3');
                SviReporti.Post;
                frxReport2.PrepareReport(False);  // ovaj false je znak da nema više dodataka reportova
            finally
            end;
        end
        else
            frxReport2.PrepareReport(False); // nastavak od zadnjeg reporta sa završetkom (onaj iznad "if CheckBox6.Checked then")

        SviReporti.Close;
    End;

    frxReport2.ShowPreparedReport;

//    frxReport2.LoadFromFile(PathINI+'\INI\NaljepniceDVD.fr3');
(*
    Izvjestaji.SviReporti.Close;
    Izvjestaji.SviReporti.MacroByName('WHERE').AsString:='WHERE SifraIzvjestaja=2';
    Izvjestaji.SviReporti.Open;

    Source:=Izvjestaji.SviReporti.CreateBlobStream(Izvjestaji.SviReportiIzgled, bmRead);
    frxReport2.LoadFromStream(Source);
    frxReport2.DesignReport(True);
*)
end;

end.
