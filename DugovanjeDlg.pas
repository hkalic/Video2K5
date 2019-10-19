unit DugovanjeDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, wwdbdatetimepicker, RXSpin,
  DB, MySQLDataset, DBCtrls, wwdblook;

type
  TFDugovanjeDlg = class(TForm)
    Panel1: TPanel;
    BtnNaplati: TButton;
    BtnPromjena: TButton;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ClanEdit: TRxSpinEdit;
    Label5: TLabel;
    Platitcedo: TwwDBDateTimePicker;
    Label6: TLabel;
    PoRacunuEdit: TMaskEdit;
    qImaRacun: TMySQLQuery;
    Label7: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure PoRacunuEditExit(Sender: TObject);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDugovanjeDlg: TFDugovanjeDlg;

implementation

uses BazeModul;

{$R *.DFM}

procedure TFDugovanjeDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then BtnPromjena.Click;
end;

procedure TFDugovanjeDlg.FormActivate(Sender: TObject);
begin
    CurrencyEdit1.SetFocus;
//  DanaEditChange(Sender);
end;

procedure TFDugovanjeDlg.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if key = VK_return then
    begin
        selectnext(sender as twincontrol,True,true);
        key:=0;
    End;
end;

procedure TFDugovanjeDlg.FormCreate(Sender: TObject);
begin
    Top:=300;
    Left:=15;
end;

procedure TFDugovanjeDlg.PoRacunuEditExit(Sender: TObject);
begin
    if (Sender as TMaskEdit).Text<>'' then
    begin
        qImaRacun.Close;
        qImaRacun.MacroByName('WHERE').AsString:='WHERE brojracuna='''+(Sender as TMaskEdit).Text+'''';
        qImaRacun.Open;

        if qImaRacun.IsEmpty then
        begin
            ShowMessage('Nepostoji raèun sa tim brojem!');
            (Sender as TMaskEdit).Text:='';
            (Sender as TMaskEdit).SetFocus;
        end;
    end;
end;

procedure TFDugovanjeDlg.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

end.
