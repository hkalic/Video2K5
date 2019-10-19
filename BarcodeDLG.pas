unit BarcodeDLG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXSpin, Buttons, ExtCtrls, Db, MemTable, Placemnt, 
  Grids, DBGrids;

type
  TFBarcodedLG = class(TForm)
    Panel2: TPanel;
    Btnizlaz: TBitBtn;
    EditKlub: TEdit;
    Label3: TLabel;
    Shape1: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    Button1: TButton;
    FormStorage1: TFormStorage;
    Label13: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnizlazClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    TTemp, Tstavke : TMemoryTable;
    procedure NapuniPrvaKombinacija;
    function  PopuniNule(X:String;Koliko:Integer): String;
  public
    { Public declarations }
  end;

var
  FBarcodedLG: TFBarcodedLG;

implementation
Uses PrintBarCode;
{$R *.DFM}

procedure TFBarcodedLG.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Tstavke.Close;
     Tstavke.free;
     action := caFree;
end;

procedure TFBarcodedLG.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFBarcodedLG.BtnizlazClick(Sender: TObject);
begin
     Close;
end;

procedure TFBarcodedLG.Button1Click(Sender: TObject);
var  a:TFieldDefs;
begin
  TTemp := TMemoryTable.Create(self);
  TTemp.DataBaseName := 'DB';
  TTemp.TableName := 'Temp1';
  TTemp.SessionName := 'Default';
  TTemp.Name := 'TTemp';

  try
    TTemp.Close;
    a := TTemp.FieldDefs;
    a.Add('Broj',ftString, 5, False);
    a.Add('BarC',ftString, 7, False);
    a.Add('Samobroj',ftString, 1, False);
    TTemp.Open;
    NapuniPrvaKombinacija;
    Application.CreateForm(TFPrintBarCode,FPrintBarCode);
    FPrintBarCode.Kreni(TTemp,EditKlub.Text);
  finally
    TTemp.Free;
  End;
end;

procedure TFBarcodedLG.NapuniPrvaKombinacija;
Var ImaKaz,Kom:Integer;
begin
 Tstavke.First;
 while not TStavke.Eof do
 begin
  if Tstavke.FieldByName('Slovo').asString = '' then
  begin
    for imaKaz := 1 to Tstavke.FieldByName('ImaKazeta').asInteger do
    begin
       for Kom := 1 to Tstavke.FieldByName('Komada').asInteger do
       begin
          TTemp.Append;
          TTemp.FieldByName('Broj').Value := inttostr(Tstavke.FieldByName('Broj').asInteger);
          TTemp.FieldByName('Slovo').Value := chr(64+ImaKaz);
          TTemp.FieldByName('BarC').Value := PopuniNule(inttostr(Tstavke.FieldByName('Broj').asInteger),6)+chr(64+ImaKaz);
          TTemp.FieldByName('SamoBroj').Value := Tstavke.FieldByName('SamoBroj').asString;
          TTemp.Post;
       End;
    End;
  End
  Else Begin
       for Kom := 1 to Tstavke.FieldByName('Komada').asInteger do
       begin
          TTemp.Append;
          TTemp.FieldByName('Broj').Value := inttostr(Tstavke.FieldByName('Broj').asInteger);
          TTemp.FieldByName('Slovo').Value := AnsiUpperCase(Tstavke.FieldByName('Slovo').asString);
          TTemp.FieldByName('BarC').Value := PopuniNule(inttostr(Tstavke.FieldByName('Broj').asInteger),6)+
                                             AnsiUpperCase(Tstavke.FieldByName('Slovo').asString);
          TTemp.FieldByName('SamoBroj').Value := Tstavke.FieldByName('SamoBroj').asString;
          TTemp.Post;
       End;
  End;
  TStavke.Next;
 End;
End;

function TFBarcodedLG.PopuniNule(X:String;Koliko:Integer): String;
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

procedure TFBarcodedLG.FormCreate(Sender: TObject);
var  a: TFieldDefs;
begin
  Tstavke := TMemoryTable.Create(self);
  Tstavke.DataBaseName := 'DB';
  Tstavke.TableName := 'Temp2';
  Tstavke.SessionName := 'Default';
  Tstavke.Name := 'Tstavke';
  Tstavke.Close;
  a := Tstavke.FieldDefs;
  a.Add('SamoBroj',ftString, 1, False);
  a.Add('Broj',ftInteger, 0, False);
  a.Add('ImaKazeta',ftInteger, 0, False);
  a.Add('Komada',ftInteger, 0, False);
  a.Add('Slovo',ftString, 1, False);
  Tstavke.Open;
  DataSource1.dataset := Tstavke;
end;

end.
