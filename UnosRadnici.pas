unit UnosRadnici;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnosTemplate, Db, DBTables, RxQuery, Placemnt, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ComCtrls, DBCtrls, ToolWin, RXLookup, ExtCtrls, Mask,
  RXCtrls, ImgList, MySQLDataset;

type
  TFUnosRadnici = class(TFUnosTemplate)
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label2: TLabel;
    DBEdit7: TDBEdit;
    Tradnici: TMySQLDataset;
    TQSifra: TAutoIncField;
    TQNaziv: TStringField;
    TQUlica: TStringField;
    TQPtt: TIntegerField;
    TQMjesto: TStringField;
    TQLozinka: TStringField;
    TQVlasnik: TStringField;
    TQNeVrijedi: TStringField;
    TQID: TStringField;
    Label30: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    tSetup: TMySQLDataset;
    dSetup: TDataSource;
    procedure TradniciBeforeEdit(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosRadnici: TFUnosRadnici;

implementation
uses BazeModul, Share;

{$R *.DFM}

procedure TFUnosRadnici.TradniciBeforeEdit(DataSet: TDataSet);
begin
    aBeforeEdit(DataSet);
    if Tradnici.FieldByName('Sifra').value <> Voperater then
        if Podaci.myQuery1.FieldByName('Vlasnik').AsString<>'D' then
            raise Exception.Create('Nemožete mijenjati tuðe podatke.');
end;

procedure TFUnosRadnici.FormCreate(Sender: TObject);
begin
  inherited;
    DBCheckBox2.Visible := False;
    ShareUnit.UpitOpen(Podaci.myQuery1,
        'SELECT vlasnik FROM radnici WHERE sifra='+IntToStr(Voperater), True, True);

    if not Podaci.myQuery1.IsEmpty then
        if Podaci.myQuery1.FieldByName('Vlasnik').AsString='D' then
            DBCheckBox2.Visible:=True
        else DBCheckBox2.Visible:=False;

    tSetup.Open;
end;

end.
