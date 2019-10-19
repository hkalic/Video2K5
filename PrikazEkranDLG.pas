unit PrikazEkranDLG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Jmpmemo;

type
  TFPrikazEkranDLG = class(TForm)
    Panel1: TPanel;
    Label18: TLabel;
    Label15: TLabel;
    Button1: TButton;
    JumpMemo1: TJumpMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrikazEkranDLG: TFPrikazEkranDLG;

implementation
Uses BazeModul,RXShell;
{$R *.DFM}

procedure TFPrikazEkranDLG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFPrikazEkranDLG.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFPrikazEkranDLG.FormCreate(Sender: TObject);
begin
  try
    JumpMemo1.LoadFromFile('Ispis.Txt');
//    Memo1.Lines.LoadFromFile('Ispis.Txt');
  except
//    if FileExists(ExtractFilePath(Application.ExeName)+'Ispis.Txt') then
//      FileExecute('C:\Program Files\Accessories\Wordpad.exe', 'Ispis.Txt', ExtractFilePath(Application.ExeName), esNormal)
//    Else

     MessageDlg('Datoteka ISPIS.TXT nije pronaðena na disku ili je prevelika !'+#13+#13+
                'smanjite opseg dana za pregled i pokušajte ponovo', mtWarning, [mbOk], 0);
  end;
  //Button1.Visible := (Podaci.TabSetUp.FieldByName('Port').asString <> 'LPT1')
end;

procedure TFPrikazEkranDLG.Button1Click(Sender: TObject);
Var i:Integer;
begin
  if MessageDlg('Kod ispisa na printer STROGO je ZABRANJENO gasiti printer u toku ispisa'+#13+
                'jer æe se Windowsi blokirati i može doæi do gubitka podataka !!!!'+#13+#13+
                'Da li želite ispis na PRINTER ?', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
  begin
    Screen.Cursor := crHourglass;
    try
      Podaci.ComPort1.Open;
//      for I := 0 to Memo1.Lines.Count - 1 do
//            if Memo1.Lines[i] = '' then Podaci.ComPort1.WriteString(#13+#10, True)
//            Else Podaci.ComPort1.WriteString(Memo1.Lines[i]+#13+#10, True);
      Podaci.PripremiPrinter(True);
      for I := 0 to JumpMemo1.Lines.Count - 1 do
            if JumpMemo1.Lines[i] = '' then Podaci.ComPort1.WriteStr(#13+#10)
            Else Podaci.ComPort1.WriteStr(JumpMemo1.Lines[i]+#13+#10);
    finally
      Podaci.ComPort1.Close;
      Screen.Cursor := crDefault;
      Close;
    end;
  End;
end;

end.
