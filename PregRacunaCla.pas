unit PregRacunaCla;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PregTempl, Db, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBTables,
  RxLookup, MySQLDataset, dxCntner, dxTL, dxDBCtrl, dxDBGrid;

type
  TFPregRacunaCla = class(TFPregTempl)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LookCombo: TRxDBLookupCombo;
    DataSource2: TDataSource;
    GroupBox1: TGroupBox;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DataSource3: TDataSource;
    Table1: TMySQLDataset;
    Query1: TMySQLQuery;
    Table2: TMySQLDataset;
    tabradnici2: TMySQLDataset;
    Query1Datum: TDateTimeField;
    Query1Radnik: TMySQLStringField;
    Query1SifraClana: TIntegerField;
    Query1Popust: TFloatField;
    Query1StopaPoreza: TIntegerField;
    Query1VrstaRacuna: TSmallintField;
    Query1Cifra: TFloatField;
    Query1NazivUgovora: TMySQLStringField;
    Query1BrojRacuna: TMySQLStringField;
    Query2: TMySQLQuery;
    Query2sifra: TAutoIncField;
    Query2imeprezime: TMySQLStringField;
    Query2adresa: TMySQLStringField;
    Query2mobitel: TMySQLStringField;
    Query2cifra: TFloatField;
    Query2brojugovora: TIntegerField;
    Query2naziv: TMySQLStringField;
    Query2iznosugovora: TFloatField;
    Query2placeno: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LookComboChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    cFilterRadnik,  cFilterUgovor :String;

    vDatumOd,
    vDatumDo:string;

    vKoji:Integer;

    procedure PostaviFilter;

  public
    { Public declarations }
    Procedure ShowMPregled(DatumOd,DatumDo:string;Koji:Integer;Nasl:String);
  end;

var
  FPregRacunaCla: TFPregRacunaCla;

implementation

uses BazeModul, Main, DLG_Combo, Share;

{$R *.DFM}

procedure TFPregRacunaCla.ShowMPregled(DatumOd,DatumDo:string;Koji:Integer;Nasl:String);
begin
  cFilterRadnik := '';
  cFilterUgovor := '';
  tabradnici2.Open;
  Table2.Open;

  case koji of
    5: DataSource1.DataSet := Query1;
    6: DataSource1.DataSet := Query2;
    Else DataSource1.DataSet := Table1;
  end;

  caption := nasl;
//  DBGrid1.Columns[4].Visible := (koji = 5);
//  DBGrid1.Columns[7].Visible := (koji = 5);
  GroupBox1.Visible := False;//(koji = 5);
  vDatumOd:= DatumOd;
  vDatumDo:= DatumDo;
  vKoji:=Koji;
  PostaviFilter;
  FPregRacunaCla.ShowModal;
end;

procedure TFPregRacunaCla.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Table1.Close;
  Query1.close;
  tabradnici2.close;
  Table2.close;
  inherited;
end;

procedure TFPregRacunaCla.LookComboChange(Sender: TObject);
begin
  cFilterRadnik := '';
  cFilterUgovor := '';

  if LookCombo.Value <> '' then cFilterRadnik := ' Radnik = '+chr(39)+ tabradnici2.FieldByname('ID').asstring+chr(39)+' and ';
  if RxDBLookupCombo1.Value <> '' then cFilterUgovor := ' VrstaUgovora = '+chr(39)+ Table2.FieldByname('Sifra').asstring+chr(39)+' and ';
  PostaviFilter;
end;

procedure TFPregRacunaCla.PostaviFilter;
Var uk:Currency;
begin
  with DataSource1.DataSet do
  begin
    Close;
    if ClassType=TMySQLQuery then
    begin
        Query1.MacroByName('WHERE').AsString:='WHERE '+cFilterRadnik + cFilterUgovor+
            ' r.VrstaRacuna = 5 and r.datum BETWEEN '''+FormatDateTime('yyyy-mm-dd hh:mm:ss', StrToDate(vDatumOd))+''' AND '''+FormatDateTime('yyyy-mm-dd hh:mm:ss', StrToDate(vDatumDo))+'''';
        Query2.MacroByName('DATUM').AsString:='and datum BETWEEN '''+FormatDateTime('yyyy-mm-dd hh:mm:ss', StrToDate(vDatumOd))+''' AND '''+FormatDateTime('yyyy-mm-dd hh:mm:ss', StrToDate(vDatumDo))+'''';

        if cFilterRadnik<>'' then
            Query2.MacroByName('FILTER').AsString:='AND d.sifra='+tabradnici2.FieldByname('sifra').AsString;
    end
    else
    begin
        Filter := cFilterRadnik+cFilterUgovor+' VrstaRacuna = '+Inttostr(vkoji)+' and datum >= '+chr(39)+vDatumOd+chr(39)+' and datum <= '+chr(39)+vDatumDo+chr(39);
        Filtered := True;
    end;
    Open;
    DisableControls;

    uk:=0;
    while not Eof do
    begin
        uk := uk + FieldByName('Cifra').Value;
        Next;
    end;

    EnableControls;
    First;
    Label3.Caption := FloatToStr(uk);
  end;
end;

procedure TFPregRacunaCla.FormCreate(Sender: TObject);
begin
//
end;

procedure TFPregRacunaCla.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if key=VK_F9 then
        if PristupOpciji(998) then
        begin
            DlgCombo.DajCombo('radnici');
            if DlgCombo.ShowModal=mrOK then
            begin
                ShareUnit.UpitOpen(Podaci.myQuery1,
                'UPDATE racuni SET radnik='''+DlgCombo.ComboTablica.FieldByname('ID').AsString+''''+#13+
                'WHERE sifra='+Query1.FieldByName('sifra').AsString, True, False);
                PostaviFilter;
            end;
        end;
end;

end.
