unit NaplatiDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, DB, MySQLDataset, DBCtrls,
  wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, Wwdbdlg;

type
  TFNaplatiDlg = class(TForm)
    Panel1: TPanel;
    BtnNaplati: TButton;
    BtnPromjena: TButton;
    BtnOdustani: TButton;
    Label1: TLabel;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Button1: TButton;
    Label4: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNaplatiDlg: TFNaplatiDlg;

implementation

uses Main, BazeModul;

{$R *.DFM}

procedure TFNaplatiDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFNaplatiDlg.FormActivate(Sender: TObject);
begin
  BtnNaplati.SetFocus;

  Podaci.tVrstePlacanja.Close; // naði default vrstu plaèanja
  Podaci.tVrstePlacanja.Open;
  Podaci.tVrstePlacanja.LocateRecord('NazivPlacanja', IntToStr(VrstaPlacanja), [], True);
end;

end.
