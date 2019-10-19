unit UnosMediji;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnosTemplate, ImgList, Db, DBTables, RxQuery, StdCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, ComCtrls, DBCtrls, ToolWin, RxLookup, RXCtrls,
  ExtCtrls, Mask, dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib,
  MySQLDataset;

type
  TFUnosMediji = class(TFUnosTemplate)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    ColorDialog1: TColorDialog;
    dxDBButtonEdit1: TdxDBButtonEdit;
    Panel3: TPanel;
    TMediji: TMySQLDataset;
    TMedijiSifra: TAutoIncField;
    TMedijiNaziv: TStringField;
    TMedijiBoja: TIntegerField;
    TQSifra: TAutoIncField;
    TQNaziv: TStringField;
    TQBoja: TIntegerField;
    procedure dxDBButtonEdit1ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure DSDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnosMediji: TFUnosMediji;

implementation
uses BazeModul;

{$R *.DFM}

procedure TFUnosMediji.dxDBButtonEdit1ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
    if ColorDialog1.Execute then
    begin
        TMediji.Edit;
        TMedijiBoja.Value:=ColorDialog1.Color;
        TMediji.Post;
    end;
end;

procedure TFUnosMediji.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
    Panel3.Color:=TMedijiBoja.Value;
end;

end.
