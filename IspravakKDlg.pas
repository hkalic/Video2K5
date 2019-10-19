unit IspravakKDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, DB, dxmdaset, wwDBDateTimePicker;

type
  TFIspravakKDlg = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TPos: TdxMemData;
    ds1: TDataSource;
    TPosVrati: TBooleanField;
    TPosSifraKazete: TIntegerField;
    TPosfilm: TStringField;
    TPosbcodekazete: TStringField;
    TPosvMedij: TStringField;
    TPosdjel: TStringField;
    TPosDatumPos: TDateTimeField;
    wwDBGrid: TwwDBGrid;
    TPossifraNebitna: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure wwDBGridKeyPress(Sender: TObject; var Key: Char);
    procedure wwDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBGridCreateDateTimePicker(Sender: TObject;
      ADateTimePicker: TwwDBCustomDateTimePicker);
    procedure ZatvorenDTPicker(Sender: TObject);
    procedure EnterDTPicker(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIspravakKDlg: TFIspravakKDlg;

  DTCheck: TDateTime;

implementation
Uses BazeModul, Kartica, VratitiDoDlg, Share;
{$R *.DFM}

procedure TFIspravakKDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FKartica.qPos.Close;
    FKartica.qPos.Open;
    Action := CaFree;
end;

procedure TFIspravakKDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFIspravakKDlg.FormCreate(Sender: TObject);
var i: integer;
begin
    IspravakKartice := False;
    wwDBGrid.ReadOnly := False;

    FKartica.qPos.First;
    TPos.Open;
    while not FKartica.qPos.Eof do
    begin
        with TPos do    // tdxMemData
        begin
            Insert;
            FieldByName('Vrati').Value:=FKartica.qPos.FieldByName('Vrati').Value;
            FieldByName('SifraKazete').Value:=FKartica.qPos.FieldByName('SifraKazete').Value;
            FieldByName('DatumPos').Value:=FKartica.qPos.FieldByName('DatumPos').Value;
            FieldByName('film').Value:=FKartica.qPos.FieldByName('film').Value;
            FieldByName('bcodekaz').Value:=FKartica.qPos.FieldByName('bcodekaz').Value;
            FieldByName('vMedij').Value:=FKartica.qPos.FieldByName('vMedij').Value;
            FieldByName('djel').Value:=FKartica.qPos.FieldByName('djel').Value;
            FieldByName('sifraNebitna').Value:=FKartica.qPos.FieldByName('sifraNebitna').Value;
            Post;
            FKartica.qPos.Next;
        end;
    end;
end;

procedure TFIspravakKDlg.wwDBGridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close
  else if (key=#13) or (key=' ') then
            if TPos.FieldByName('vrati').AsBoolean then
            begin
                TPos.Edit;
                TPos.FieldByName('vrati').AsBoolean:=False;
                TPos.Post;
            end
            else
            begin
                TPos.Edit;
                TPos.FieldByName('vrati').AsBoolean:=True;
                TPos.Post;
            end;
end;

procedure TFIspravakKDlg.wwDBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vPlatitiDo:TDateTime;
    razlog, iznos, upit0, popisKazeta, popisBcodova, popisSifraNebitnih, popisDatumPos: String;
    i: Integer;
begin
  if key = VK_ESCAPE then Close
  Else If (Shift = [ssCtrl]) and (key = Vk_DELETE) then
       begin
         TPos.First;  // provjeri koliko ima selektiranih
         i:=0;
         while not TPos.Eof do
         begin
            if TPos.FieldByName('vrati').AsBoolean then i:=i+1;
            TPos.Next;
         end;

         if i=0 then
         begin
            ShowMessage('Niste oznaèili filmove za brisanje!');
            Exit;
         end;

         if confirm('Da li stvarno želite obrisati film/ove sa kartice zaduženja?') then
         begin
            upit0:=''; // ovo je za query string
            if not IspravakKartice then // samo kod 1. brisanja
            begin
                Application.CreateForm(TFVratitiDoDlg, FVratitiDoDlg); // Povrat duga æe izvršiti do
                FVratitiDoDlg.Label6.Caption:='Razlog ispravka kartice';

                FVratitiDoDlg.rb3.Enabled:=False;   // C razlog disabliran
                FVratitiDoDlg.RNDatum.Visible:=False;
                FVratitiDoDlg.RNBroj.Visible:=False;
                FVratitiDoDlg.RNCifra.Visible:=False;
                FVratitiDoDlg.Label1.Visible:=False;
                FVratitiDoDlg.Label2.Visible:=False;
                FVratitiDoDlg.Label3.Visible:=False;
                FVratitiDoDlg.Label4.Visible:=False;
                FVratitiDoDlg.Label5.Visible:=False;
                FVratitiDoDlg.Ostalo.Visible:=False;
                FVratitiDoDlg.Platitcedo.Visible:=False;

                if FVratitiDoDlg.Showmodal=mrOK then begin end else Exit;

                With Podaci.TPotvrda do
                begin
                    if FVratitiDoDlg.rb1.Checked then
                    begin
                        razlog:='ARazlog';
                        iznos:='''D''';
                    end
                    else if FVratitiDoDlg.rb2.Checked then
                    begin
                        razlog:='BRazlog';
                        iznos:='''D''';
                    end
                    else if FVratitiDoDlg.rb4.Checked then
                    begin
                        razlog:='DRazlog';
                        iznos:='''D''';
                    end
                    else if FVratitiDoDlg.rb5.Checked then
                    begin
                        razlog:='ERazlog, EKoji';
                        iznos:='''D'', '''+FVratitiDoDlg.razlog.Text+'''';
                    end;
                    upit0:='INSERT INTO potvrda (SifraRacuna, SifraClana, DatumPotvrde, DRadnik, Vrsta, '+razlog+') '+
                    ' VALUES ('+Fkartica.qClan.FieldByName('BrojZaduz').AsString+', '+
                    IntToStr(FKartica.qPos.FieldByName('SifraClana').AsInteger)+','+
                    ' '''+FormatDateTime('yyyy-mm-dd hh:mm:ss', Now)+''', '''+VRadnik+''', 2, '+iznos+');';
                end;
            end;

            popisKazeta:=''; popisBcodova:=''; popisSifraNebitnih:=''; popisDatumPos:='';
            TPos.First;
            while not TPos.Eof do
            begin
                if TPos.FieldByName('Vrati').AsBoolean then
                begin
                    popisKazeta:=popisKazeta+TPos.FieldByName('SifraKazete').AsString+',';
                    popisBcodova:=popisBcodova+''''+TPos.FieldByName('BCodeKaz').AsString+''',';
                    popisSifraNebitnih:=popisSifraNebitnih+TPos.FieldByName('sifraNebitna').AsString+',';
                    popisDatumPos:=popisDatumPos+''''+FormatDateTime('yyyy-mm-dd hh:mm:ss',TPos.FieldByName('DatumPos').AsDateTime)+''',';
                end;
                TPos.Next;
            end;

            Delete(popisKazeta, Length(popisKazeta), 1);                // obriši zadnji karakter -> ','
            Delete(popisBcodova, Length(popisBcodova), 1);              // obriši zadnji karakter -> ','
            Delete(popisSifraNebitnih, Length(popisSifraNebitnih), 1);  // obriši zadnji karakter -> ','
            Delete(popisDatumPos, Length(popisDatumPos), 1);            // obriši zadnji karakter -> ','

            ShareUnit.UpitOpen(Podaci.myQuery1,
                // Smanji broj izdanih
                'UPDATE kazetedetail SET IzdanoKop=IzdanoKop-1 WHERE SifraFirme='+IntToStr(SifraFirme)
                +' AND SifraKazete IN ('+popisKazeta+'); '+
                // Vrati film iz posuðenih - barkodovi
                'UPDATE bcodekazete SET Izdano=''N'' WHERE barcode IN('+popisBcodova+'); '+
                // obriši ga iz posudbe
                'DELETE FROM pos WHERE sifranebitna IN ('+popisSifraNebitnih+'); '+
                // obriši ga iz pos_solid
                'DELETE FROM pos_solid WHERE sifraclana='+IntToStr(FKartica.qPos.FieldByName('SifraClana').AsInteger)
                +' AND bcodekaz IN ('+popisBcodova+') AND datumpos IN ('+popisDatumPos+'); '
            , True, False);

            IspravakKartice:=True;
            Close;
         End;
       end;
end;

procedure TFIspravakKDlg.wwDBGridCreateDateTimePicker(Sender: TObject;
  ADateTimePicker: TwwDBCustomDateTimePicker);
begin
    ADateTimePicker.OnDropDown:=EnterDTPicker;
    ADateTimePicker.OnCloseUp:=ZatvorenDTPicker;
end;

procedure TFIspravakKDlg.ZatvorenDTPicker(Sender: TObject);
begin
    if TPos.State=dsEdit then TPos.Post;
    if DTCheck<>TPos.FieldByName('datumpos').AsDateTime then
    begin
        IspravakKartice:=True;
        ShareUnit.UpitOpen(Podaci.myQuery1,
        'UPDATE pos SET datumpos='''+FormatDateTime('yyyy-mm-dd hh:mm:ss', TPos.FieldByName('datumpos').AsDateTime)+''' WHERE sifranebitna='+TPos.FieldByName('sifraNebitna').AsString, True, False);
    end;
end;

procedure TFIspravakKDlg.EnterDTPicker(Sender: TObject);
begin
    DTCheck:=TPos.FieldByName('datumpos').AsDateTime;
end;

end.
