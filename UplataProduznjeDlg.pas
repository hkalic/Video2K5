unit UplataProduznjeDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, wwdbdatetimepicker, RXSpin;

type
  TFUplataProduznjeDlg = class(TForm)
    Panel1: TPanel;
    BtnNaplati: TButton;
    BtnPromjena: TButton;
    DanaEdit: TRxSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    DOdatuma: TwwDBDateTimePicker;
    Label5: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure DanaEditChange(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUplataProduznjeDlg: TFUplataProduznjeDlg;

implementation

{$R *.DFM}

procedure TFUplataProduznjeDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFUplataProduznjeDlg.FormActivate(Sender: TObject);
begin
  DanaEditChange(Sender);
end;

procedure TFUplataProduznjeDlg.DanaEditChange(Sender: TObject);
begin
 if DanaEdit.VAlue = 0 then DOdatuma.Date := strtodate('01.01.2050')
 else DOdatuma.Date := date + DanaEdit.Value;
end;

procedure TFUplataProduznjeDlg.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key = VK_return then
 begin
   selectnext(sender as twincontrol,True,true);
   key:=0;
 End;

end;

end.
