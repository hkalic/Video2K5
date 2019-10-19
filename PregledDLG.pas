unit PregledDLG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdbdatetimepicker, ExtCtrls, jpeg;

type
  TFPregledDLG = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label18: TLabel;
    Label15: TLabel;
    DatumOd: TwwDBDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    DatumDo: TwwDBDateTimePicker;
    Label4: TLabel;
    Kuda: TRadioGroup;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Panel3: TPanel;
    Image1: TImage;
    Label5: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DatumOdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function ShowMpre(La2:String):Integer;
  end;

var
  FPregledDLG: TFPregledDLG;

implementation

{$R *.DFM}

procedure TFPregledDLG.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFPregledDLG.DatumOdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
     VK_return: begin
                  selectnext(sender as twincontrol,True,true);
                  key:=0;
                End;
  End;
end;

Function TFPregledDLG.ShowMpre(La2:String):Integer;
Begin
  Label1.Caption := la2;
  Result := ShowModal;
End;


procedure TFPregledDLG.FormActivate(Sender: TObject);
begin
  Kuda.ItemIndex := 0;
  DatumOd.SetFocus;
end;

end.
