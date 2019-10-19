unit RegDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Registry, jpeg;

type
  TFRegDlg = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    Image1: TImage;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
      VideoModifier2:longint;
  public
    { Public declarations }
  end;

var
  FRegDlg: TFRegDlg;

implementation
Uses  BAzeModul;
{$R *.DFM}

procedure TFRegDlg.FormCreate(Sender: TObject);
Var nKlub :String;
    i, iKlub:Integer;
begin
  nKlub := Podaci.TabSetUP.FieldByName('NazivKluba').asString;
  iKlub := 0;
  for i := 0 to Length(nKlub)-1 do iKlub := iKlub + ord(nklub[i]);
//  VideoModifier2 := GenerateMachineModifierPrim+iklub;

  Label1.caption := Podaci.TabSetUP.FieldByName('NazivKluba').asString;
//  Edit1.Text := BufferToHex(VideoModifier2, SizeOf(longint));
end;

procedure TFRegDlg.Button2Click(Sender: TObject);
var
  Reg: TRegistry;
begin
    if not OgUsageCode1.IsCodeValid then ShowMessage('Registracijski kod je NEISPRAVAN !' + #13 +'Pokušajte ponovo.')
    Else begin
          Reg := TRegistry.Create;
          Reg.RootKey:=HKey_Local_Machine; // Section to look for within the registry
          Reg.OpenKey(regkey, false);
          try
            Reg.WriteString('EnableSpot',Edit2.text);
          finally
            Reg.Free;
          end;
          ShowMessage('Program je uspješno registriran za korisnika :' + #13 +Podaci.TabSetUP.FieldByName('NazivKluba').asString);
          Close;
         End;
end;

procedure TFRegDlg.OgUsageCode1GetKey(Sender: TObject; var Key: TKey);
begin
  Key := CKey;
end;

procedure TFRegDlg.OgUsageCode1GetCode(Sender: TObject; var Code: TCode);
begin
    HexToBuffer(Edit2.text, Code, SizeOf(Code));
end;

procedure TFRegDlg.OgUsageCode1GetModifier(Sender: TObject; var Value: Integer);
begin
  Value := VideoModifier2;
end;

end.
