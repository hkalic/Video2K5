unit UnosCrneListe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnosTemplate, DB, MySQLDataset, ImgList, StdCtrls, Buttons,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, DBCtrls, ToolWin, Mask;

type
  TFUnosCrneListe = class(TFUnosTemplate)
    TCrnaLista: TMySQLDataset;
    TQSifra: TAutoIncField;
    TQImePrezime: TMySQLStringField;
    TQNapomena: TMySQLStringField;
    TCrnaListaSifra: TAutoIncField;
    TCrnaListaImePrezime: TMySQLStringField;
    TCrnaListaNapomena: TMySQLStringField;
    TCrnaListaDatumUpisa: TDateField;
    TCrnaListaTelefon1: TMySQLStringField;
    TCrnaListaTelefon2: TMySQLStringField;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    procedure TCrnaListaAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosCrneListe: TFUnosCrneListe;

implementation
uses BazeModul;

{$R *.dfm}

procedure TFUnosCrneListe.TCrnaListaAfterInsert(DataSet: TDataSet);
begin
    TsAfterEdit(DataSet);
    TCrnaLista.FieldByName('DatumUpisa').AsDateTime:=Date;
end;

end.
