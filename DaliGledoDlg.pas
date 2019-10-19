unit DaliGledoDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, Variants, DB, MySQLDataset;

type
  TFDaliGledoDlg = class(TForm)
    Label1: TLabel;
    ed1: TMaskEdit;
    Label2: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Gledao: TMySQLQuery;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDaliGledoDlg: TFDaliGledoDlg;

implementation
Uses BazeModul, Kartica;
{$R *.DFM}

procedure TFDaliGledoDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFDaliGledoDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := CaFree;
end;

procedure TFDaliGledoDlg.ed1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (Ed1.text<>'') then
  begin
//    if StrToInt(Ed1.Text) Then
    if SveBrojevi(Ed1.Text) Then
    begin
      Gledao.Close;
      Gledao.MacroByName('WHERE').AsString:=
        ' WHERE sifraclana='+FKartica.qClan.FieldByName('Sifra').AsString+
        ' AND sifrakazete='+ed1.text;
      Gledao.Open;

      if Gledao.IsEmpty then
      begin
        Label6.Caption := Ed1.Text;
        Label7.Caption := 'ne';
        Label8.Caption := '';
      end
      else
      Begin
        Label6.Caption := Ed1.Text;
        Label7.Caption := 'DA';
        Label8.Caption := Gledao.FieldByName('posudjen').AsString;
      end;
    end
    else Ed1.text := '';

    ed1.SelectAll;
    ed1.SetFocus;
  End;

end;

end.
