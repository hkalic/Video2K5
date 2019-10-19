unit IzvozDlg;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdbdatetimepicker, RXSpin;

type
  TFIzvozDlg = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    OdBroja: TRxSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    DoBroja: TRxSpinEdit;
    Label6: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIzvozDlg: TFIzvozDlg;

implementation

{$R *.DFM}

end.
