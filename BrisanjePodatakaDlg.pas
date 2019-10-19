unit BrisanjePodatakaDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, wwdbdatetimepicker,StrUtils,FileUtil, Db,
  RXShell, DBTables;

type
  TFBrisanjePodatakaDlg = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Btnizlaz: TBitBtn;
    Button1: TButton;
    Label2: TLabel;
    Panel3: TPanel;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    CheckBox2: TCheckBox;
    Panel5: TPanel;
    Label6: TLabel;
    CheckBox3: TCheckBox;
    Panel6: TPanel;
    Label7: TLabel;
    CheckBox4: TCheckBox;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    wwDBDateTimePicker2: TwwDBDateTimePicker;
    Label11: TLabel;
    Label12: TLabel;
    ListBox1: TListBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DRacuniX: TDataSource;
    TRacuniX: TTable;
    TRacuniDetX: TTable;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnizlazClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Lista:TstringList;
    procedure SrediRacune;
  public
    { Public declarations }
  end;

var
  FBrisanjePodatakaDlg: TFBrisanjePodatakaDlg;

implementation

uses BazeModul;

{$R *.DFM}

procedure TFBrisanjePodatakaDlg.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFBrisanjePodatakaDlg.Edit1KeyPress(Sender: TObject;  var Key: Char);
Var i,imasl:Integer;
    siz:LongInt;
    sd:string;
begin
  if key = #13 then begin
    if Edit1.Text = 'SREDIBAZE' then begin
      Panel2.Visible := True;
      Edit1.enabled := False;

      For i := 0 to Lista.count-1 do begin
         siz := GetFileSize(ExtractFilePath(Application.ExeName)+'BAZE\'+Lista[i]+'.db');
         Podaci.Otvoriindex(lista[i]);
         imasl := Podaci.tabIndex.RecordCount;
         sd := leftStr(lista[i],14)+leftStr(inttostr(imasl),6)+' '+Format('%5.0f', [siz/1024])+' Kb';
         Lista[i] := sd;
      End;

      ListBox1.Items := Lista;

    End
    Else Edit1.Text := '';
  End
end;

procedure TFBrisanjePodatakaDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Lista.Free;
Action := caFree;
end;

procedure TFBrisanjePodatakaDlg.BtnizlazClick(Sender: TObject);
begin
Close;
end;

procedure TFBrisanjePodatakaDlg.Button1Click(Sender: TObject);
Var bilo:Boolean;
begin
  if confirm('Da li stvarno želite BRISATI OZNAÈENE baze podataka ?') then
  begin
   Screen.Cursor := crHourglass;
   try
    if CheckBox1.Checked or CheckBox2.Checked then Podaci.DatabaseMaster.Close;
    if CheckBox1.Checked then DeleteFile(ExtractFilePath(Application.ExeName)+'BAZE\Dnev.db');
    if CheckBox2.Checked then begin
      DeleteFile(ExtractFilePath(Application.ExeName)+'BAZE\Zaduz.db');
      DeleteFile(ExtractFilePath(Application.ExeName)+'BAZE\ZaduzDetail.db');
    End;
    bilo := False;

    if CheckBox3.Checked and (wwDBDateTimePicker1.date <> 0) then begin // KOI
      Podaci.TKoi.IndexFieldNames := 'SifraNebitna';
      Podaci.TKoi.First;
      while not Podaci.TKoi.Eof do begin
         if Podaci.TKoi.FieldByName('Posudjen').value < wwDBDateTimePicker1.date then Podaci.TKoi.Delete
         else Podaci.TKoi.Next;
      End;
      bilo := true;
    End;


    if CheckBox4.Checked and (wwDBDateTimePicker2.date <> 0) then begin
      SrediRacune;
      bilo := true;
    End;


    if bilo then
        FileExecute(ExtractFilePath(Application.ExeName)+'Pdxrbld.exe',
                    Format(' -R2 -P+ "/A%s" "/P%s" -P+',[Podaci.DatabaseMaster.Aliasname,chr(90)+chr(77)+chr(77)+chr(79)+chr(75)+chr(73)]), '', esNormal);
   Finally
    Screen.Cursor := crDefault;
    Application.Terminate;
   End;
  End;
end;

procedure TFBrisanjePodatakaDlg.FormCreate(Sender: TObject);
begin
  Lista := TStringList.Create;
  Lista.LoadFromFile('bazeDEf.txt');
end;


procedure TFBrisanjePodatakaDlg.SrediRacune;
Begin
  TRacuniX.DatabaseName := ExtractFilePath(Application.ExeName)+'BAZEX';
  TRacuniDetX.DatabaseName :=ExtractFilePath(Application.ExeName)+'BAZEX';
  TRacuniX.Open;
  TRacuniDetX.Open;
  Podaci.TRacuni.IndexFieldNames := 'Datum';
  Podaci.TRacuni.First;
  while not Podaci.TRacuni.Eof do begin
         if Podaci.TRAcuni.FieldByName('DAtum').value < wwDBDateTimePicker2.date then begin
           TRacuniX.Append;
           TRacuniX.FieldByName('Sifra').Value := Podaci.TRAcuni.FieldByName('Sifra').value;
           TRacuniX.FieldByName('Datum').Value := Podaci.TRAcuni.FieldByName('Datum').value;
           TRacuniX.FieldByName('Radnik').Value := Podaci.TRAcuni.FieldByName('Radnik').value;
           TRacuniX.FieldByName('SifraClana').Value := Podaci.TRAcuni.FieldByName('SifraClana').value;
           TRacuniX.FieldByName('Popust').Value := Podaci.TRAcuni.FieldByName('Popust').value;
           TRacuniX.FieldByName('StopaPoreza').Value := Podaci.TRAcuni.FieldByName('StopaPoreza').value;
           TRacuniX.FieldByName('VrstaRacuna').Value := Podaci.TRAcuni.FieldByName('VrstaRacuna').value;
           TRacuniX.FieldByName('Cifra').Value := Podaci.TRAcuni.FieldByName('Cifra').value;
           TRacuniX.Post;


           Podaci.TRacuniDet.First;
           while not Podaci.TRacuniDet.Eof do begin
               TRacuniDetX.append;
               TRacuniDetX.FieldByName('SifraRacuna').Value := Podaci.TRAcuniDet.FieldByName('SifraRacuna').value;
               TRacuniDetX.FieldByName('SifraKazete').Value := Podaci.TRAcuniDet.FieldByName('SifraKazete').value;
               TRacuniDetX.FieldByName('DatumPos').Value := Podaci.TRAcuniDet.FieldByName('DatumPos').value;
               TRacuniDetX.FieldByName('Dan').Value := Podaci.TRAcuniDet.FieldByName('Dan').value;
               TRacuniDetX.FieldByName('Svaki').Value := Podaci.TRAcuniDet.FieldByName('Svaki').value;
               TRacuniDetX.FieldByName('Vikend').Value := Podaci.TRAcuniDet.FieldByName('Vikend').value;
               TRacuniDetX.FieldByName('Blagdan').Value := Podaci.TRAcuniDet.FieldByName('Blagdan').value;
               TRacuniDetX.FieldByName('BrDan').Value := Podaci.TRAcuniDet.FieldByName('BrDan').value;
               TRacuniDetX.FieldByName('BrSvaki').Value := Podaci.TRAcuniDet.FieldByName('BrSvaki').value;
               TRacuniDetX.FieldByName('BrVikend').Value := Podaci.TRAcuniDet.FieldByName('BrVikend').value;
               TRacuniDetX.FieldByName('BrBlagdan').Value := Podaci.TRAcuniDet.FieldByName('BrBlagdan').value;
               TRacuniDetX.Post;
               Podaci.TRacuniDet.Delete;
           End;

           Podaci.TRacuni.Delete;
         End
         else Podaci.TRacuni.Next;
  End; // eof racuni
End;

end.
