unit VratitiDoDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdbdatetimepicker, ExtCtrls, DBCtrls, dxDBELib, dxCntner,
  dxEditor, dxExEdtr, dxEdLib, DateUtils;

type
  TFVratitiDoDlg = class(TForm)
    Panel1: TPanel;
    Platitcedo: TwwDBDateTimePicker;
    BtnNaplati: TButton;
    RNDatum: TDBText;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    rb5: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    RNBroj: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    razlog: TEdit;
    Ostalo: TdxCurrencyEdit;
    RNCifra: TdxDBCurrencyEdit;
    procedure BtnNaplatiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVratitiDoDlg: TFVratitiDoDlg;

implementation

uses BazeModul;

{$R *.DFM}

procedure TFVratitiDoDlg.BtnNaplatiClick(Sender: TObject);
begin
    if rb3.Checked then
    begin
        if Ostalo.Value>RNCifra.Value then
            ShowMessage('Nemože ostati više za platiti nego što je bilo!')
        else if (Ostalo.Text='0,00') or (Platitcedo.Text='') then
            ShowMessage('Niste upisali sve podatke!')
        else FVratitiDoDlg.ModalResult:=mrOK;
    end else
    if rb5.Checked then
    begin
        if razlog.Text='' then ShowMessage('Niste upisali razlog!')
        else FVratitiDoDlg.ModalResult:=mrOK;
    end else FVratitiDoDlg.ModalResult:=mrOK;
end;

procedure TFVratitiDoDlg.FormShow(Sender: TObject);
begin
    Ostalo.Value:=RNCifra.Value;
    Platitcedo.Date:=IncDay(Date,1); // Sutra
end;

end.
