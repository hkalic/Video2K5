unit IzvjestajTM;

interface

uses
  SysUtils, Classes, FR_RRect, FR_Shape, FR_DSet, FR_DBSet, FR_Desgn,
  FR_Class, DB, MySQLDataset, FR_BarC, Dialogs, frx2xto30, frxClass,
  frxDBSet, frxDesgn;

type
  TIzvjestaji = class(TDataModule)
    Poslovanje: TfrReport;
    frDesigner1: TfrDesigner;
    frDBDSPoslovanje: TfrDBDataSet;
    frShapeObject1: TfrShapeObject;
    frRoundRectObject1: TfrRoundRectObject;
    SviReporti: TMySQLDataset;
    dsReports: TDataSource;
    frBarCodeObject1: TfrBarCodeObject;
    KazeteUDugu: TMySQLQuery;
    frDBDSUDugu: TfrDBDataSet;
    frUDugu: TfrReport;
    frDBDSPoslovanje2: TfrDBDataSet;
    SviReportiSifraIzvjestaja: TAutoIncField;
    SviReportiNazivReporta: TMySQLStringField;
    SviReportiIzgled: TBlobField;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DajFRReport(Dizajn:Integer; Report:TfrReport; uvjet:String);
  end;

var
  Izvjestaji: TIzvjestaji;

implementation

uses BazeModul, Odabir_BC4Prt;

{$R *.dfm}

procedure TIzvjestaji.DajFRReport(Dizajn:Integer; Report:TfrReport; uvjet:String);
begin
    SviReporti.MacroByName('WHERE').AsString:=uvjet;
    SviReporti.Open;

    Report.LoadFromBlobField(SviReporti.FieldByName('Izgled'));
    // ubaci pripremu zaglavlja
    if Dizajn=1 then
    begin
        Report.DesignReport;

        if Report.Modified then
        begin
            SviReporti.Edit;
            Report.SaveToBlobField(SviReporti.FieldByName('Izgled'));
            SviReporti.Post;
        end;
    end
    else Report.ShowReport;

    SviReporti.Close;
end;

procedure TIzvjestaji.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

end.
