unit AbaoutDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Jpeg,
  StdCtrls, ExtCtrls;

type
  TFAbaoutDlg = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label39: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAbaoutDlg: TFAbaoutDlg;

implementation
Uses BAzeModul;
{$R *.DFM}

procedure TFAbaoutDlg.FormCreate(Sender: TObject);
begin
  //if not registriran then Label5.caption := 'DEMO VERZIJA' Else
    Label5.caption := Podaci.TabSetUP.FieldByName('NazivKluba').asString;
end;

procedure TFAbaoutDlg.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
