unit ObjasnjenjeDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdbdatetimepicker, Buttons, ExtCtrls, Placemnt;

type
  TFObjasnjenjeDlg = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    Label4: TLabel;
    FormStorage1: TFormStorage;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Label5: TLabel;
    Btnizlaz: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnizlazClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObjasnjenjeDlg: TFObjasnjenjeDlg;

implementation
Uses PrintCijenika;
{$R *.DFM}

procedure TFObjasnjenjeDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFObjasnjenjeDlg.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TFPrintCijenika,FPrintCijenika);
  Try
    FPrintCijenika.preview;
  Finally
    FPrintCijenika.Destroy;
  End;
end;

procedure TFObjasnjenjeDlg.BtnizlazClick(Sender: TObject);
begin
Close;
end;

end.
