unit IzmjenaPopustDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDCustomMaskEdit,
  LMDCustomExtCombo, LMDCalendarComboBox, LMDDBCalendarComboBox, ToolEdit,
  RXDBCtrl;

type
  TFIzmjenaPopustDlg = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBDateEdit1: TDBDateEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIzmjenaPopustDlg: TFIzmjenaPopustDlg;

implementation
Uses Kartica;
{$R *.DFM}

procedure TFIzmjenaPopustDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFIzmjenaPopustDlg.DBEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
Case Key of
      VK_Up:
           begin
             selectnext(sender as twincontrol,False,true);
             key:=0;
           End;
      VK_Down, VK_return:
           begin
             selectnext(sender as twincontrol,True,true);
             key:=0;
           End;
End;

end;

end.
