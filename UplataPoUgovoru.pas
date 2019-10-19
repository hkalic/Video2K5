unit UplataPoUgovoru;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls, DBCtrls, wwdblook;

type
  TFUplataPoUgovoru = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    BtnNaplati: TButton;
    BtnPromjena: TButton;
    Label4: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUplataPoUgovoru: TFUplataPoUgovoru;

implementation

uses BazeModul;

{$R *.DFM}
procedure TFUplataPoUgovoru.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key=VK_ESCAPE then
    begin
        ModalResult:=mrAbort;
        Close;
    end;
end;

end.
