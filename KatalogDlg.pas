unit KatalogDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, wwdbdatetimepicker, RxLookup, Db, DBTables,
  MySQLDataset;

type
  TFKatalogDlg = class(TForm)
    Panel1: TPanel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    Label1: TLabel;
    Btnizlaz: TBitBtn;
    Label6: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label7: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label8: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label11: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label12: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    wwDBDateTimePicker2: TwwDBDateTimePicker;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    Button1: TButton;
    DVrsta: TDataSource;
    Drezija: TDataSource;
    dglumci: TDataSource;
    Ddrzava: TDataSource;
    Ddist: TDataSource;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    Label4: TLabel;
    Label5: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    DMediji: TDataSource;
    CheckBox2: TCheckBox;
    Bevel1: TBevel;
    TMediji: TMySQLDataset;
    Tvrsta: TMySQLDataset;
    Trezija: TMySQLDataset;
    TGlumci: TMySQLDataset;
    TDrzava: TMySQLDataset;
    Tdist: TMySQLDataset;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnizlazClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    odabran:Integer;
  public
    { Public declarations }
  end;

var
  FKatalogDlg: TFKatalogDlg;

implementation
Uses PrintKatalog, BazeModul;
{$R *.DFM}

procedure TFKatalogDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then Close;
end;

procedure TFKatalogDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TFKatalogDlg.BtnizlazClick(Sender: TObject);
begin
    Close;
end;

procedure TFKatalogDlg.Button1Click(Sender: TObject);
Var vr11,vr22,vr33,vr44,vr55:String;
begin
    vr11:=''; vr22:=''; vr33:=''; vr44:=''; vr55:='';
    if RadioButton5.checked then Odabran := 1
    Else if RadioButton6.checked then Odabran := 2
    Else if RadioButton7.checked then Odabran := 3
    Else if RadioButton8.checked then Odabran := 4
    Else if RadioButton9.checked then Odabran := 5
    Else if RadioButton10.checked then Odabran := 6
    Else if RadioButton11.checked then Odabran := 7
    Else if RadioButton1.checked then Odabran := 8;

    case Odabran of
        2: vr11:= RxDBLookupCombo1.Value;
        3: vr11:= RxDBLookupCombo2.Value;
        4: vr11:= RxDBLookupCombo3.Value;
        5: vr11:= RxDBLookupCombo4.Value;
        6: vr11:= RxDBLookupCombo5.Value;
        7: begin
             vr11:= datetostr(wwDBDateTimePicker1.date);
             vr22:= datetostr(wwDBDateTimePicker2.date);
           End;
        8: begin
             vr44:= RxDBLookupCombo5.Value;
             vr11:= datetostr(wwDBDateTimePicker1.date);
             vr22:= datetostr(wwDBDateTimePicker2.date);
           End;
    End;

    if not CheckBox2.Checked then vr55:= RxDBLookupCombo6.Value
    Else vr55:='';

    if CheckBox1.checked then vr33 := 'ok';

    Application.CreateForm(TFPrintKatalog, FPrintKatalog);
    FPrintKatalog.NapraviPrint(Odabran, vr11, vr22, vr33, vr44, vr55);
end;

procedure TFKatalogDlg.FormCreate(Sender: TObject);
begin
    Tvrsta.Open;
    Trezija.Open;
    TGlumci.Open;
    TDrzava.Open;
    Tdist.Open;
    TMediji.Open;
end;

end.
