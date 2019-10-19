unit PlatioJeDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, ToolEdit, CurrEdit;

type
  TFPlatioJeDlg = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Platio: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PlatioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlatioJeDlg: TFPlatioJeDlg;

implementation

{$R *.DFM}

procedure TFPlatioJeDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFPlatioJeDlg.PlatioKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then selectnext(sender as twincontrol,True,true);
end;

end.
