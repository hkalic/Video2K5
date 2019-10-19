unit DLG_Klub;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MySQLDataset;

type
  TDLG_OdabirKluba = class(TForm)
    KlubCombo: TComboBox;
    SviKlubovi: TMySQLDataset;
    procedure FormCreate(Sender: TObject);
    procedure KlubComboKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DLG_OdabirKluba: TDLG_OdabirKluba;

implementation

uses BazeModul;

{$R *.dfm}

procedure TDLG_OdabirKluba.FormCreate(Sender: TObject);
begin
    KlubCombo.Items.Clear;
    KlubCombo.Items.Add('Svi klubovi');
    with SviKlubovi do
    begin
        Open;
        while not Eof do
        begin
            KlubCombo.Items.Add(FieldByName('sifrakluba').AsString+' - '+FieldByName('nazivkluba').AsString);
            Next;
        end;
    end;
end;

procedure TDLG_OdabirKluba.KlubComboKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=VK_Return then
    begin
        //ShowMessage(KlubCombo.Text);
        ModalResult:=mrOk;
    end
    else if key=27 then ModalResult:=mrAbort;
end;

end.
