unit BrdanaDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXSpin, ExtCtrls;

type
  TFBrdanaDlg = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    DanaEdit: TRxSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    procedure DanaEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBrdanaDlg: TFBrdanaDlg;

implementation

{$R *.DFM}

procedure TFBrdanaDlg.DanaEditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    selectnext(sender as twincontrol,True,true);
    key:=#0;
  end;
end;

end.
