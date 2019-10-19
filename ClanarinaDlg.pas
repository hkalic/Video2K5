unit ClanarinaDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, wwdbdatetimepicker, RXSpin,
  DBCtrls, wwdblook;

type
  TFClanarinaDlg = class(TForm)
    Panel1: TPanel;
    BtnNaplati: TButton;
    BtnPromjena: TButton;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    DanaEdit: TRxSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    DOdatuma: TwwDBDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
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
  FClanarinaDlg: TFClanarinaDlg;

implementation

uses BazeModul;

{$R *.DFM}

procedure TFClanarinaDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then Close;
end;

procedure TFClanarinaDlg.FormActivate(Sender: TObject);
begin
    CurrencyEdit1.SetFocus;
    DanaEditChange(Sender);
end;

procedure TFClanarinaDlg.DanaEditChange(Sender: TObject);
begin
    if DanaEdit.VAlue = 0 then DOdatuma.Date := date//strtodate('01.01.2050')
    else DOdatuma.Date := date + DanaEdit.Value;
end;

procedure TFClanarinaDlg.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if key = VK_return then
    begin
        selectnext(sender as twincontrol,True,true);
        key:=0;
    End;
end;

end.
