unit UnosBlagdana;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnosTemplate, DB, MySQLDataset, ImgList, StdCtrls, Buttons,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls, DBCtrls, ToolWin, Mask,
  wwdbdatetimepicker;

type
  TFUnosBlagdana = class(TFUnosTemplate)
    tBlagdani: TMySQLDataset;
    tBlagdaniSifraBlagdana: TAutoIncField;
    tBlagdaniNazivBlagdana: TMySQLStringField;
    tBlagdaniDatumBlagdana: TDateField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    TQSifraBlagdana: TAutoIncField;
    TQNazivBlagdana: TMySQLStringField;
    TQDatumBlagdana: TDateField;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosBlagdana: TFUnosBlagdana;

implementation

uses BazeModul;
{$R *.dfm}

end.
