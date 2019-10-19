unit DLG_OdabirDatuma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxCntner, dxEditor, dxExEdtr, dxEdLib, StdCtrls, wwdbdatetimepicker;

type
  TDajDatum = class(TForm)
    Odaberi: TButton;
    DatumOd: TwwDBDateTimePicker;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DatumOdChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OdaberiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DajDatum: TDajDatum;

implementation

{$R *.DFM}

procedure TDajDatum.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=27 then ModalResult:=mrAbort;
end;

procedure TDajDatum.DatumOdChange(Sender: TObject);
begin
     Odaberi.SetFocus;
end;

procedure TDajDatum.FormShow(Sender: TObject);
begin
    DatumOd.Date:=Date;
end;

procedure TDajDatum.OdaberiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=27 then ModalResult:=mrAbort;
end;

end.
