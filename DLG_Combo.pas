unit DLG_Combo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MySQLDataset, RxLookup;

type
  TDlgCombo = class(TForm)
    LookCombo: TRxDBLookupCombo;
    DataSource2: TDataSource;
    ComboTablica: TMySQLQuery;
    procedure LookComboKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DajCombo(Tablica: String);
  end;

var
  DlgCombo: TDlgCombo;

implementation

uses BazeModul;

{$R *.dfm}

procedure TDlgCombo.DajCombo(Tablica: String);
begin
    ComboTablica.TableName:=Tablica;
    ComboTablica.Open;
end;

procedure TDlgCombo.LookComboKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key=13) and (LookCombo.Value<>'') then ModalResult:=mrOK
    else
    if key=27 then ModalResult:=mrAbort;
end;

end.
