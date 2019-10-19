unit PregClanarineClanDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PregTempl, Db, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBTables,
  RXSpin, MySQLDataset, dxCntner, dxTL, dxDBCtrl, dxDBGrid;

type
  TFPregClanarineClanDlg = class(TFPregTempl)
    SpinEd: TRxSpinEdit;
    Label1: TLabel;
    Button1: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Table1: TMySQLQuery;
    Table1Sifra: TAutoIncField;
    Table1SifraKluba: TSmallintField;
    Table1Brojracuna: TMySQLStringField;
    Table1Datum: TDateTimeField;
    Table1Radnik: TMySQLStringField;
    Table1SifraClana: TIntegerField;
    Table1Popust: TFloatField;
    Table1StopaPoreza: TIntegerField;
    Table1VrstaRacuna: TSmallintField;
    Table1Cifra: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure SpinEdKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    varkoji:Integer;
  public
    { Public declarations }
    procedure NapraviPregled(Koji, Ugovor:Integer);
  end;

var
    vBrUg, brojugovora:Integer;
    FPregClanarineClanDlg: TFPregClanarineClanDlg;

implementation
Uses Share, BazeModul, ClanstvoPoUgovoru;
{$R *.DFM}

procedure TFPregClanarineClanDlg.Button1Click(Sender: TObject);
var     uk:Currency;
        ugovor: String;
begin
  ShareUnit.UpitOpen(Podaci.myQuery1,'SELECT sifra, datum FROM clanstvopougovoru '+
                                     'WHERE sifraclana='+IntToStr(SpinEd.AsInteger)+' '+
                                     'ORDER BY datum DESC LIMIT 1', False, True);

  if not Podaci.myQuery1.IsEmpty then
  begin
    Screen.Cursor := crHourglass;
    Try
        Table1.DisableControls;
        Table1.Close;
        if vBrUg>0 then ugovor:='SifraUgovora='+IntToStr(brojugovora)+' and '
        else ugovor:='';

        Table1.MacroByName('WHERE').AsString:='WHERE '+ugovor+'VrstaRacuna='+IntToStr(varkoji)
                                            +' AND sifraclana='+FloatToStr(SpinEd.Value);
                                           // +' AND sifra';
        Table1.Open;
        Table1.First;
        while not Table1.Eof do
        begin
            uk := uk + Table1.FieldByName('Cifra').Value;
            Table1.Next;
        end;
        Table1.EnableControls;
        Table1.First;
        Label4.Caption := FloatToStr(uk);
    Finally
        Screen.Cursor := crDefault;
    end;
  End;
  if FPregClanarineClanDlg.Showing then SpinEd.SetFocus;
end;

procedure TFPregClanarineClanDlg.SpinEdKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
    begin
        selectnext(sender as twincontrol,True,true);
        key:=#0;
    end;
end;

procedure TFPregClanarineClanDlg.NapraviPregled(Koji, Ugovor:Integer);
Begin
//       2 ovo su èlanarine prave
//       5 naplata po ugovoru
    if koji=5 then vBrUg:=5 else vBrUg:=0;

    brojugovora:=ugovor;

    try
        varkoji := koji;
//    DBGrid1.columns[4].visible := (koji = 5);
        If koji = 4 then caption := 'Plaæene èlanarine za èlana'
        Else caption := 'Plaæanje po ugovoru za èlana';
        Button1Click(nil);
        ShowModal;
    except
    end;
End;

procedure TFPregClanarineClanDlg.FormCreate(Sender: TObject);
begin
//  inherited;
end;

end.
