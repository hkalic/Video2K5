unit PrijaveGRID;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids,  ExtCtrls, Db, StrUtils,
  Wwdatsrc, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  StdCtrls, dxTLClms, dxExEdtr, ComCtrls, ToolWin, dxLayout, DBTables,
  dxmdaset,  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk,
  dxPSdxDBGrLnk, ImgList, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, MySQLDataset;

type
  TSaveMethod = procedure (const FileName: String; ASaveAll: Boolean) of object;
  
  TFPrijaveGRID = class(TForm)
    Panel1: TPanel;
    TLCustomize: TdxTreeList;
    TLCustomizeColumn: TdxTreeListColumn;
    TLCustomizeIsVisible: TdxTreeListCheckColumn;
    Spliter1: TSplitter;
    ToolBar1: TToolBar;
    spHint: TShape;
    Panel2: TPanel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    Label1: TLabel;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    SaveDialog: TSaveDialog;
    ToolButton12: TToolButton;
    dxDBGridLayoutList1: TdxDBGridLayoutList;
    dxDBGrid1: TdxDBGrid;
    DClanovi: TwwDataSource;
    DKazete: TwwDataSource;
    Label2: TLabel;
    Label3: TLabel;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxDBGridReportLink;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ImageList2: TImageList;
    CLANOVIgrid2: TdxDBGridLayout;
    Tini: TdxMemData;
    Tinisection: TStringField;
    Tinigrid: TStringField;
    FilmoviGrid2: TdxDBGridLayout;
    ToolButton4: TToolButton;
    ToolButton11: TToolButton;
    DClanstvo: TwwDataSource;
    ClanstvoUgovor: TdxDBGridLayout;
    TMKaz: TdxMemData;
    TMKazSifra: TIntegerField;
    TMKazNaziv: TStringField;
    TMKazZadnjaPosudba: TDateField;
    TMKazDana: TIntegerField;
    wwDataSource2: TwwDataSource;
    FilmoviIzdavanje: TdxDBGridLayout;
    TMKazDatumBrisanja: TDateField;
    wwDataSource3: TwwDataSource;
    ClanoviPosudbe: TdxDBGridLayout;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    DCrnaLista: TwwDataSource;
    CrnaLista: TdxDBGridLayout;
    TMKazZanr: TStringField;
    TMKazObrisan: TStringField;
    Query1: TMySQLQuery;
    Query2: TMySQLQuery;
    Query3: TMySQLQuery;
    Query4: TMySQLQuery;
    Query6: TMySQLQuery;
    tClanovi: TMySQLTable;
    tClanoviSifra: TAutoIncField;
    tClanoviImePrezime: TMySQLStringField;
    tClanoviAdresa: TMySQLStringField;
    tClanoviMjStanovanja: TMySQLStringField;
    tClanoviTelefon: TMySQLStringField;
    tClanoviJmbg: TMySQLStringField;
    tClanoviOsobna: TMySQLStringField;
    tClanoviDuzan: TFloatField;
    tClanoviOvlast1: TMySQLStringField;
    tClanoviOvlast2: TMySQLStringField;
    tClanoviOvlast3: TMySQLStringField;
    tClanoviPopust: TSmallintField;
    tClanoviPopustVrijediDo: TDateField;
    tClanoviBrojZaduz: TIntegerField;
    tClanoviBarCode: TMySQLStringField;
    tClanoviNapomena: TMySQLStringField;
    tClanoviAzurirano: TDateTimeField;
    tClanoviDjelatnik: TIntegerField;
    tClanoviNapomena2: TMySQLStringField;
    tClanoviDatumUpisa: TDateField;
    tClanoviKlubUpisa: TSmallintField;
    tClanoviInfoBoxID: TMySQLStringField;
    tClanoviClanarinaVrijediDo: TDateTimeField;
    tClanoviStornoDug: TFloatField;
    tClanoviStornoRacBr: TMySQLStringField;
    tClanoviStornoRacDatum: TDateField;
    tClanoviStornoPlatitiDo: TDateField;
    tClanoviEMail: TMySQLStringField;
    tClanoviMobitel: TMySQLStringField;
    tClanoviNapomena3: TMySQLStringField;
    tClanoviSMS: TMySQLStringField;
    tClanoviVrstaPologa: TIntegerField;
    tClanoviPologVrijediDo: TDateField;
    tClanoviPrvaPosudba: TMySQLStringField;
    tClanoviStatusPoUgovoru: TMySQLStringField;
    tClanoviStatusClana: TIntegerField;
    tClanoviSifStatusPoUgovoru: TIntegerField;
    tClanoviDatumIzmEmail: TDateField;
    tClanoviDatumIzmMob: TDateField;
    tClanoviOsiguranjeVrijediDo: TDateField;
    tClanoviZadnjaPosudba: TDateField;
    Query7: TMySQLQuery;
    DViseOd2: TwwDataSource;
    ViseOd2: TdxDBGridLayout;
    qSadrzaj: TMySQLQuery;
    dsSadrzaj: TwwDataSource;
    Keywords: TdxDBGridLayout;
    qSP: TMySQLQuery;
    qSPnaziv: TMySQLStringField;
    qSPsifra: TAutoIncField;
    qSPimeprezime: TMySQLStringField;
    qSPkom: TLargeintField;
    TopZanrovi: TdxDBGridLayout;
    dsSP: TwwDataSource;
    qSPvrsta: TStringField;
    qRNpoKN: TMySQLQuery;
    dsRNpoKN: TwwDataSource;
    DaniPoKN: TdxDBGridLayout;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TLCustomizeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TLCustomizeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TLCustomizeStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure dxDBGrid1HeaderMoved(Sender: TObject;
      Column: TdxTreeListColumn);
    procedure dxDBGrid1HideHeader(Sender: TObject;
      AColumn: TdxTreeListColumn);
    procedure dxDBGrid1ShowHeader(Sender: TObject;
      AColumn: TdxTreeListColumn; BandIndex, RowIndex, ColIndex: Integer);
    procedure TLCustomizeIsVisibleToggleClick(Sender: TObject;
      const Text: String; State: TdxCheckBoxState);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure dxDBGrid1GetLevelColor(Sender: TObject; ALevel: Integer;
      var AColor: TColor);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
      var Continue: Boolean);
    procedure dxDBGrid1CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure Query2BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    DragNode: TdxTreeListNode;
    procedure Synchronize;
    procedure Save(ADefaultExt, AFilter, AFileName: String; AMethod: TSaveMethod);
    function  GetColor(BColor, EColor: TColor; N, H: Integer): TColor;
    procedure DodajZadnjiKAZETE;
    procedure DodajZadnjiCLAN;
  public
    { Public declarations }
    prikaz,gridje:string;
    dalje: Integer;
    procedure StartPregled(naziv:String;koji:integer);

  end;

var
  FPrijaveGRID: TFPrijaveGRID;

implementation
Uses BazeModul, OdabirPrikazaDlg, PregledDLG, Share;
{$R *.DFM}

procedure TFPrijaveGRID.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if tClanovi.Active then tClanovi.Close;
    Action := caFree;
end;

procedure TFPrijaveGRID.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure TFPrijaveGRID.TLCustomizeDragDrop(Sender, Source: TObject; X, Y: Integer);
Var column : TdxTreeListColumn;
begin
  DragNode.MoveTo(TLCustomize.FocusedNode, natlInsert);
  column := TdxTreeListColumn(DragNode.Data);
  if (TLCustomize.FocusedNode <> nil) then
    column.Index := TLCustomize.FocusedNode.AbsoluteIndex
  else column.Index := 0;
end;

procedure TFPrijaveGRID.TLCustomizeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = Sender;
end;

procedure TFPrijaveGRID.TLCustomizeStartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  DragNode := TdxTreeList(Sender).FocusedNode;
end;

procedure TFPrijaveGRID.Synchronize;
var
  I: Integer;
  Node: TdxTreeListNode;
begin
  TLCustomize.ClearNodes;
  for I := 0 to dxDBGrid1.ColumnCount - 1 do
  begin
    Node := TLCustomize.Add;
    Node.Values[TLCustomizeColumn.Index] := dxDBGrid1.Columns[I].Caption;
    if dxDBGrid1.Columns[I].Visible then
      Node.Values[TLCustomizeIsVisible.Index] := TLCustomizeIsVisible.ValueChecked;
    Node.Data := dxDBGrid1.Columns[I];
  end;
end;

procedure TFPrijaveGRID.dxDBGrid1HeaderMoved(Sender: TObject;
  Column: TdxTreeListColumn);
begin
  Synchronize;
end;

procedure TFPrijaveGRID.dxDBGrid1HideHeader(Sender: TObject;
  AColumn: TdxTreeListColumn);
begin
  Synchronize;
end;

procedure TFPrijaveGRID.dxDBGrid1ShowHeader(Sender: TObject;
  AColumn: TdxTreeListColumn; BandIndex, RowIndex, ColIndex: Integer);
begin
  Synchronize;
end;

procedure TFPrijaveGRID.TLCustomizeIsVisibleToggleClick(Sender: TObject; const Text: String; State: TdxCheckBoxState);
var column : TdxTreeListColumn;
begin
   column := TdxTreeListColumn(TLCustomize.FocusedNode.Data);
   column.Visible := State = cbsChecked;
end;

procedure TFPrijaveGRID.ToolButton1Click(Sender: TObject);
begin
  if TLCustomize.visible then TLCustomize.visible := false
  Else TLCustomize.visible:=true;
end;

procedure TFPrijaveGRID.ToolButton3Click(Sender: TObject);
begin
dxDBGrid1.FullCollapse;
end;

procedure TFPrijaveGRID.ToolButton2Click(Sender: TObject);
begin
dxDBGrid1.fullexpand;
end;

procedure TFPrijaveGRID.ToolButton6Click(Sender: TObject);
var
  InputString: string;
begin
  if confirm('Da li želite snimiti trenutni prikaz + filter ?') then begin
    InputString:= InputBox('Upit', 'Naziv (opis) prikaza :', dxDBGrid1.iniSectionName);
    if inputstring <> '' then begin
      dxDBGrid1.iniSectionName := inputstring;
      dxDBGrid1.SaveToIniFile(dxDBGrid1.iniFileName);

      SaveDBGridFilterToFile(PathBIN+dxDBGrid1.iniSectionName+'.fil',dxDBGrid1.Filter);


      tini.Open;
      if FileExists(PathBIN+'PregledGrid.bin') then tini.LoadFromBinaryFile(PathBIN+'PregledGrid.bin');
      if not tini.locate('section',inputstring,[]) then begin
        tini.append;
        Tinigrid.Value := gridJe;
        Tinisection.value := inputstring;
        tini.post;
        tini.SaveToBinaryFile(PathBIN+'PregledGrid.bin');
      End;
    End;
  End;
  Close;
end;

procedure TFPrijaveGRID.ToolButton5Click(Sender: TObject);
begin
  dxDBGrid1.ShowGrid := ToolButton5.Down;
end;

procedure TFPrijaveGRID.ToolButton8Click(Sender: TObject);
begin
   Save('htm', 'HTML File (*.htm; *.html)|*.htm', Label1.caption+'.htm', dxDBGrid1.SaveToHTML);
end;

procedure TFPrijaveGRID.Save(ADefaultExt, AFilter, AFileName: String; AMethod: TSaveMethod);
begin
  with SaveDialog do
  begin
    InitialDir := 'C:\My Documents';
    DefaultExt := ADefaultExt;
    Filter := AFilter;
    FileName := AFileName;
    if Execute then AMethod(FileName, True);      //cbSaveAll.Checked
  end;
end;

procedure TFPrijaveGRID.ToolButton9Click(Sender: TObject);
begin
  Save('xls', 'Microsoft Excel 4.0 Worksheet (*.xls)|*.xls', Label1.caption+'.xls', dxDBGrid1.SaveToXLS);
end;

procedure TFPrijaveGRID.dxDBGrid1GetLevelColor(Sender: TObject; ALevel: Integer; var AColor: TColor);
begin
    if ALevel < 9 then  AColor := GetColor(TdxDBGrid(Sender).GroupNodeColor, clYellow, ALevel, 8);
end;

function TFPrijaveGRID.GetColor(BColor, EColor: TColor; N, H: Integer): TColor;
begin
  Result := RGB(Trunc(GetRValue(BColor) + (GetRValue(EColor)-GetRValue(BColor)) * N / H),
    Trunc(GetGValue(BColor) + (GetGValue(EColor)-GetGValue(BColor)) * N / H), Trunc(GetBValue(BColor) + (GetBValue(EColor)-GetBValue(BColor)) * N / H));
end;

procedure TFPrijaveGRID.DodajZadnjiKAZETE;
begin
   if date - Query4.FieldByName('Posudjen').AsDateTime > 4 then
   begin
     TMKaz.append;
     TMKaz.FieldByName('Sifra').value := Query4.FieldByName('SifraKazete').value;
     TMKaz.FieldByName('Naziv').value := Query4.FieldByName('Naziv').value;
     TMKaz.FieldByName('ZadnjaPosudba').value := Query4.FieldByName('Posudjen').value;
     TMKaz.FieldByName('Dana').asinteger := date - Query4.FieldByName('Posudjen').value;
     TMKaz.FieldByName('Obrisan').Value := Query4.FieldByName('Obrisan').Value;
     TMKaz.FieldByName('DatumBrisanja').value := Query4.FieldByName('DatumBrisanja').value;
     TMKaz.FieldByName('Zanr').value := Query4.FieldByName('Zanr').value;
     TMKaz.Post;
   End;
End;

procedure TFPrijaveGRID.DodajZadnjiClan;
begin
end;

procedure TFPrijaveGRID.StartPregled(naziv:String;koji:integer);
Var s1,s2: string;
    source, target: WideString;
    vBr: Integer;
begin
  prikaz := '';
  Label1.caption := naziv;
  sdxPanelText := 'na ovaj dio panela prevucite kolonu po kojoj želite grupiranje';

  s1:='';
  dxComponentPrinter1Link1.PrinterPage.PageHeader.LeftTitle.add(Klub);
//  dxComponentPrinter1Link1.PrinterPage.PageHeader.LeftTitle.add(NAZIV_USTANOVE+' u '+MJESTO+'u');
  Screen.Cursor := crHourGlass;
 try
  case koji of
        1: begin
             ToolButton4.visible:=True;
             Query1.open;
             dxDBGridLayoutList1.Items[0].AssignTo(dxDBGrid1);
             Query1.first;
           End;
           
        2: begin
             Query2.open;
             dxDBGridLayoutList1.Items[1].AssignTo(dxDBGrid1);
             Query2.first;
           End;

        3: begin
             Query3.open;
             dxDBGridLayoutList1.Items[2].AssignTo(dxDBGrid1);
             Query3.first;
           End;

        4: begin
             Query4.Open;
             TMKaz.Open;
             try
               vBr:= Query4.FieldByName('SifraKazete').value;
               while not Query4.Eof do
               begin
                    if vBr = Query4.FieldByName('SifraKazete').value then Query4.next
                    Else
                    begin
                       Query4.Prior;
                       DodajZadnjiKAZETE;
                       Query4.next;
                       vBr:= Query4.FieldByName('SifraKazete').value;
                    End;
               End;
               Query4.Last;
               DodajZadnjiKAZETE;
               TMKaz.First;
             except
               ShowMessage('Baza posudbi èlanova je prazna!');
             end;
             Query4.Close;
             dxDBGridLayoutList1.Items[3].AssignTo(dxDBGrid1);
           End;

        5: begin
             tClanovi.Open;
             dxDBGridLayoutList1.Items[4].AssignTo(dxDBGrid1);
           End;

        6: begin
             Query6.open;
             dxDBGridLayoutList1.Items[5].AssignTo(dxDBGrid1);
             Query6.first;
           End;

        7: begin
             Query7.open;
             dxDBGridLayoutList1.Items[6].AssignTo(dxDBGrid1);
             Query7.first;
           End;

        8: begin
             qSadrzaj.open;
             dxDBGridLayoutList1.Items[7].AssignTo(dxDBGrid1);
             qSadrzaj.first;
           End;

        9: begin
                FPregledDLG.Label3.Visible := True;
                FPregledDLG.DatumDo.Visible := true;
                FPregledDLG.Kuda.Visible := False;
                FPregledDLG.CheckBox1.Visible:= False;
                FPregledDLG.CheckBox2.Visible:= False;

                if FPregledDLG.ShowMpre('Odaberite period') = mrOK then
                begin
                    ShareUnit.UpitOpen(Podaci.myQuery1,
                        'SELECT distinct v.sifra '+
                        'FROM pos_solid k, setup s, kazete x, vrsta v '+
                        'WHERE k.sifrakluba=s.sifrakluba AND k.sifrakazete=x.sifra AND v.sifra=x.zanr '+
                        'AND s.sifrafirme='+IntToStr(SifraFirme)+' '+
                        'AND k.datumpos BETWEEN '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',FPregledDLG.DatumOd.Date)+''' AND '''+
                        FormatDateTime('yyyy-mm-dd hh:mm:ss',FPregledDLG.DatumDo.Date)+'''', False, True);

                    target:='SELECT v1.naziv, c.sifra, c.imeprezime, v2.naziv as vrsta, t.kom FROM clanovi c left outer join vrstaupisa v2 on c.sifstatuspougovoru=v2.sifra, vrsta v1, (';
                    Podaci.myQuery1.First;
                    while not Podaci.myQuery1.Eof do
                    begin
                        target:=target+ '(SELECT v.sifra, k.sifraclana, COUNT(k.sifraclana) KOM FROM pos_solid k, setup s, kazete x, vrsta v'+
                                        ' WHERE k.sifrakluba=s.sifrakluba AND k.sifrakazete=x.sifra AND v.sifra=x.zanr AND s.sifrafirme='+IntToStr(SifraFirme)+
                                        ' AND v.sifra='+Podaci.myQuery1.Fields[0].AsString+
                                        ' AND k.datumpos BETWEEN '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',FPregledDLG.DatumOd.Date)+''' AND '''+FormatDateTime('yyyy-mm-dd hh:mm:ss',FPregledDLG.DatumDo.Date)+''''+
                                        ' GROUP BY v.sifra, k.sifraclana ORDER BY KOM DESC LIMIT '+limit_po_zanru+') UNION ';
                        Podaci.myQuery1.Next;
                    end;
                    Delete(target, Length(target)-6, 6); // obriši zadnjih 6 karaktera ' UNION '
                    target:=target+') AS t WHERE c.sifra=t.sifraclana AND v1.sifra=t.sifra ORDER BY 1, 4 DESC';

                    ShareUnit.UpitOpen(qSP, target, False, True);
                    dxDBGridLayoutList1.Items[8].AssignTo(dxDBGrid1);
                End;
           End;

       10: begin
            if FileExists(PathSQL+'BrojDANApoKN.sql') then
            begin
             qRNpoKN.SQL.LoadFromFile(PathSQL+'BrojDANApoKN.sql');
             qRNpoKN.MacroByName('KLUB').AsString:='='+IntToStr(SifraKluba);
             qRNpoKN.MacroByName('OD').AsString:=''''+FormatDateTime('yyyy-mm-dd hh:mm:ss', FPregledDLG.DatumOd.Date)+'''';
             qRNpoKN.MacroByName('DO').AsString:=''''+FormatDateTime('yyyy-mm-dd hh:mm:ss', FPregledDLG.DatumDo.Date)+'''';

             qRNpoKN.Open;
             dxDBGridLayoutList1.Items[9].AssignTo(dxDBGrid1);
            end
            else ShowMessage('Fali vam SQL upit '+PathSQL+'BrojDANApoKN.sql');
           End;
  End;

  gridJe:=dxDBGrid1.iniFileName;

  dxDBGrid1.iniFileName := pathbin+dxDBGrid1.iniFileName;
 finally
  Screen.Cursor := crDefault;
 End;

  if FileExists(PathBIN+'PregledGrid.bin') then
  begin
    Application.CreateForm(TFOdabirPrikazaDlg,FOdabirPrikazaDlg);
    FOdabirPrikazaDlg.showModal;
    Label3.caption := prikaz;
    dxDBGrid1.iniSectionName := prikaz;
    if prikaz <> '' then
    begin
      dxDBGrid1.LoadFromIniFile(dxDBGrid1.iniFileName);

      if FileExists(PathBIN+dxDBGrid1.iniSectionName+'.fil') then
        LoadDBGridFilterFromFile(PathBIN+dxDBGrid1.iniSectionName+'.fil',dxDBGrid1.Filter);
    End
    else Label3.caption := 'osnovni prikaz';
  End;

  Synchronize;
  if dalje>-1 then ShowModal;
end;


procedure TFPrijaveGRID.ToolButton7Click(Sender: TObject);
begin
  dxComponentPrinter1Link1.OnlySelected := ToolButton15.Down;
  dxComponentPrinter1Link1.ReportTitle.text := InputBox('Upit', 'Naslov izvještaja', Label1.caption);
  if (Sender as TToolButton).Tag = 0 then dxComponentPrinter1.Preview(True,nil)
  Else dxComponentPrinter1.PageSetup(nil);
end;

procedure TFPrijaveGRID.ToolButton4Click(Sender: TObject);
Var
  F: TextFile;
  List: TStringList;
  baz:TDataSet;
begin

  List := TStringList.Create;
  try
    List.SaveToFile('Video_Email.csv');
  finally
    List.Free;
  end;


//function ExtractWord(N: Integer; const S: string; const WordDelims: TCharSet): string;
  baz := dxDBGrid1.Datasource.dataset;

  baz.DisableControls;
  baz.first;

  AssignFile(F, 'Video_Email.csv');
  Append(f);
  Write(F,'First Name;Last Name;Middle Name;Name;Nickname;E-mail Address;Home Street;Home City;Home Postal Code;');
  WriteLn(F,'Home State;Home Country/Region;Home Phone;Business Street;Business City;Business Postal Code;Business State;Business Country/Region;Business Phone;Company;Job Title');

  while not Baz.eof do
  begin
  //**********************************************
  //      olik CSV OutLook 6.0
  //**********************************************
//      WriteLn(F,'<DT><A HREF="mailto:'+Baz.FieldByName('Email').asstring+'" NICKNAME="[key]">'+Baz.FieldByName('ImePrezime').asstring+'</A>');
      WriteLn(F,';;;'+Baz.FieldByName('ImePrezime').asstring+';;'+Baz.FieldByName('Email').asstring+';'+Baz.FieldByName('Adresa').asstring+';'+Baz.FieldByName('MjStanovanja').asstring+';;;;;;;;;;;;');
//First Name;Last Name;Middle Name;Name;Nickname;E-mail Address;Home Street;Home City;Home Postal Code;Home State;Home Country/Region;Home Phone;Business Street;Business City;Business Postal Code;Business State;Business Country/Region;Business Phone;Company;Job Title
//;;;Miroslav Katic;;kmirok;Ul;Gr;;;;;;;;;;;;

    baz.Next;
  end;
  CloseFile(F);
  baz.first;
  baz.EnableControls;
  MessageDlg('Uspješno napravljena datoteka -> '+ExtractFilePath(ParamStr(0))+'Video_Email.csv', mtInformation, [mbOK], 0);
end;

procedure TFPrijaveGRID.Loguj(Dataset: TMySQLDatasetBase; var SQL: String;
  var Continue: Boolean);
begin
    Logiraj(Dataset.Name+':>'+SQL, Continue);
end;

procedure TFPrijaveGRID.dxDBGrid1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
    if AFocused then AColor:=clFuchsia;
end;

procedure TFPrijaveGRID.Query2BeforeOpen(DataSet: TDataSet);
begin
    Query2.ParamByName('WHERE').AsString:='WHERE kazetedetail.SifraFirme='+IntToStr(SifraFirme);
end;

End.
