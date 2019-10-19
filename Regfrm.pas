unit RegFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, SLock;

type
  TfrmRegister = class(TForm)
    grpRegInfo: TGroupBox;
    pnlButtons: TPanel;
    lblChallenge: TLabel;
    edtChallengeString: TEdit;
    lblUnlock: TLabel;
    edtUnlock: TEdit;
    btnDone: TButton;
    edtRegName: TEdit;
    btnRegister: TButton;
    lblStep3: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnDoneClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnSetNameClick(Sender: TObject);
    procedure edtUnlockChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegister: TfrmRegister;

implementation

uses BazeModul, Main;


{$R *.DFM}

procedure TfrmRegister.btnDoneClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRegister.btnRegisterClick(Sender: TObject);
begin
     MainForm.Slock1.RegName := edtRegName.Text;
     MainForm.Slock1.RegisterNow(edtUnlock.Text);
end;

procedure TfrmRegister.btnSetNameClick(Sender: TObject);
begin
     if (Length(edtRegName.Text) > 0) then
     begin
          MainForm.Slock1.RegName := edtRegName.Text;
          edtChallengeString.Text := MainForm.Slock1.ChallengeString;
          edtChallengeString.Enabled := True;
          edtUnlock.Enabled := True;
          edtUnlock.SetFocus;
     end
     else
     begin
          edtChallengeString.Enabled := False;
          edtUnlock.Enabled := False;
     end;
end;

procedure TfrmRegister.edtUnlockChange(Sender: TObject);
begin
     btnRegister.Enabled := (Length(edtUnlock.Text) > 0);
end;

procedure TfrmRegister.FormCreate(Sender: TObject);
begin
//  edtRegName.Text := MainForm.Slock1.RegName;

  edtRegName.Text := Podaci.TabSetUp.FieldByname('NazivKluba').AsString;
  Button1.Visible := (MainForm.Slock1.Status = stRegistered);
  grpRegInfo.Visible := not Button1.Visible;

end;

procedure TfrmRegister.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmRegister.Button1Click(Sender: TObject);
begin
  if confirm('Da li stvarno želite vratiti program u DEMO naèin rada ?') then begin
    MainForm.Slock1.DeleteRegInfo('VIDEOTATJANA'+chr(90)+chr(77)+chr(77)+chr(79)+chr(75)+chr(73));
    Application.Terminate;
  End;
end;

procedure TfrmRegister.FormActivate(Sender: TObject);
begin
  if grpRegInfo.Visible then btnSetNameClick(Sender);
end;

end.
