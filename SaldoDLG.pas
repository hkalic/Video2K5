unit SaldoDLG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls;

type
  TFSaldoDLG = class(TForm)
    Panel2: TPanel;
    Label18: TLabel;
    Label15: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Povrat: TCurrencyEdit;
    Novi: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure NoviKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSaldoDLG: TFSaldoDLG;

implementation

{$R *.DFM}

procedure TFSaldoDLG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
end;

procedure TFSaldoDLG.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;


procedure TFSaldoDLG.NoviKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then selectnext(sender as twincontrol,True,true);
end;

end.
