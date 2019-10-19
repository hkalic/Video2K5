unit Lozinka;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Dialogs, Controls, StdCtrls,
  Buttons, Mask, ExtCtrls, jpeg;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    EdLozinka: TEdit;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label3: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Kpress(Sender: TObject; var Key: Char);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    BrojPokusaja:integer;
    Izlaz:Boolean;
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

uses BazeModul, SysUtils, Share;


{$R *.DFM}

procedure TPasswordDlg.FormCreate(Sender: TObject);
begin
 BrojPokusaja:=1;
 Izlaz:=True;
 PasswordDlg.Caption:=Podaci.NazivPrograma;
end;

procedure TPasswordDlg.Kpress(Sender: TObject; var Key: Char);
begin
    if key =#13 then OKBtnClick(Sender);
// if key =#13 then selectnext(sender as twincontrol,true,true);key:=#0;
end;

procedure TPasswordDlg.OKBtnClick(Sender: TObject);
begin
    ShareUnit.UpitOpen(Podaci.myQuery1,'SELECT * FROM radnici WHERE SifraFirme='+IntToStr(SifraFirme)+
    ' AND Lozinka='''+AnsiUpperCase(EdLozinka.Text)+'''', False, True);
    if Podaci.myQuery1.IsEmpty then
    begin
        inc(BrojPokusaja);
        If BrojPokusaja > 2 then
        begin
            CancelBtnClick(Sender);
            raise exception.create('Pokušaj neovlaštenog pristupa');
        end
        else
        begin
            EdLozinka.SetFocus;
            EdLozinka.SelectAll;
            raise exception.create('Pogrešna lozinka');
        end;
        {sHOWMessage('Pogrešna lozinka.');}
    end
    Else
    Begin
        VPrava:=Podaci.myQuery1.FieldByname('Prava').value;
        Voperater:=Podaci.myQuery1.Fieldbyname('Sifra').value;
        ModalResult:=MrOk;
    End;
end;

procedure TPasswordDlg.CancelBtnClick(Sender: TObject);
begin
 Izlaz:=False;
 MOdalresult:=MrCancel;
end;

procedure TPasswordDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key =#27 then CancelBtnClick(Sender);
end;

end.

