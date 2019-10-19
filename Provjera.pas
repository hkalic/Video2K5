unit Provjera;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Dialogs, Controls, StdCtrls,
  Buttons, Mask, ExtCtrls;

type
  TProvjeraDlg = class(TForm)
    Label1: TLabel;
    EdLozinka: TEdit;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label3: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    procedure Kpress(Sender: TObject; var Key: Char);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  ProvjeraDlg: TProvjeraDlg;

implementation

uses BazeModul,SysUtils;


{$R *.DFM}

procedure TProvjeraDlg.Kpress(Sender: TObject; var Key: Char);
begin
 if key =#13 then
 begin
        OKBtn.Click;
//        selectnext(sender as twincontrol,true,true);
        key:=#0;
 end;
end;

procedure TProvjeraDlg.OKBtnClick(Sender: TObject);
begin
if AnsiUpperCase(EdLozinka.Text) = Zoran then ModalResult:=MrOk
else if not Podaci.TabRadnici.locate('Lozinka',AnsiUpperCase(EdLozinka.Text),[]) then CancelBtnClick(Sender)
     Else if Podaci.TabRadnici.FieldByName('Vlasnik').Value='D' then ModalResult:=MrOk
          Else CancelBtnClick(Sender);
end;

procedure TProvjeraDlg.CancelBtnClick(Sender: TObject);
begin
 MOdalresult:=MrCancel;
end;

procedure TProvjeraDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key =#27 then CancelBtnClick(Sender);
end;

procedure TProvjeraDlg.FormActivate(Sender: TObject);
begin
 EdLozinka.Text := '';
 EdLozinka.SetFocus;
end;

end.

