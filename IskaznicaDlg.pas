unit IskaznicaDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Jpeg,
  ExtCtrls, StdCtrls, clipbrd,fileutil, Placemnt;

type
  TFIskaznicaDlg = class(TForm)
    Panel7: TPanel;
    Image1: TImage;
    Button1: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button4: TButton;
    FormStorage1: TFormStorage;
    Label2: TLabel;
    Button22: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button223Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    NoviNaziv,idd:String;
    biloucit:Boolean;
    klub1,adr1,tel1:String;
  public
    { Public declarations }
    procedure ShowMIskaznica(Slika:TPicture;Naziv,id,Klub,Adresa,tel:String);

  end;

var
  FIskaznicaDlg: TFIskaznicaDlg;

implementation

uses Kartica,PrintIskaznice;

{$R *.DFM}

procedure TFIskaznicaDlg.Button1Click(Sender: TObject);
begin
    try
      Image1.Picture.LoadFromFile(Edit1.text);
      Button3.SetFocus;
      biloucit := True;
    except
      Image1.Picture := nil;
    End;
    DeleteFile(Edit1.text);
    Button1.Enabled := False;
end;

procedure TFIskaznicaDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if biloucit then
    if MessageDlg('Da li želite snimiti sliku za èlana?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Image1.Picture.SaveToFile(NoviNaziv);
  Action := cafree;
end;

procedure TFIskaznicaDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;


procedure TFIskaznicaDlg.ShowMIskaznica(Slika:TPicture;Naziv,id,Klub,Adresa,tel:String);
begin
  noviNaziv := Naziv;
  biloucit := False;
  idd := id;
  klub1 := klub;
  adr1 := adresa;
  tel1 := tel;
  Image1.Picture := Slika;
  ShowModal;
End;

procedure TFIskaznicaDlg.Button223Click(Sender: TObject);
begin
//  Image1.Picture.LoadFromClipBoardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
//  if Image1.Picture <> nil then biloucit := true;
Close;
end;

procedure TFIskaznicaDlg.FormActivate(Sender: TObject);
begin
  Button1.Enabled := FileExists(Edit1.text);
  if not Button1.Enabled then Button3.SetFocus;
end;

procedure TFIskaznicaDlg.Button3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourglass;
    Application.CreateForm(TFPrintIskaznice,FPrintIskaznice);
    FPrintIskaznice.PrintKartica(Image1.Picture,idd,klub1,adr1,tel1);
  Finally
    Screen.Cursor := crDefault;
    if MessageDlg('Da li želite prijenos Barcode sa iskaznice kao èlanov barcode?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      FKartica.NoviBCode := idd;
    End;
    Close;
  End;
end;

procedure TFIskaznicaDlg.Button4Click(Sender: TObject);
begin
  if MessageDlg('Da li stvarno želite obrisati sve slike iz PRIVREMENOG direktorija?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    DeleteFiles(ExtractFilePath(Edit1.text)+'*.jpg');
  End;
end;

end.
