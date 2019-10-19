unit VracanjeDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, lmdctrl, lmdeditb,
  lmdeditc, LMDEdit, DB, DBCtrls, Mask, Share, DBTables, MySQLDataset, DateUtils, Main;

type
  TFVracanjeDlg = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    wwDBGrid1: TwwDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Panel5: TPanel;
    Label3: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    Label6: TLabel;
    VEdit: TEdit;
    Label54: TLabel;
    DBEdit22: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    qMaxRacun: TMySQLQuery;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure VEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    ZaNaplatiti, ZaNaplatitiBezPopusta: Currency;
    procedure Naplati;
    procedure Oznaci;
    procedure StisRet;
    procedure SrediNaplatu;
    Function  dvijedecimale(D:Extended):Currency;
  public
    { Public declarations }
    procedure ShowMvracanje(brf:Integer);
  end;

var
  FVracanjeDlg: TFVracanjeDlg;

implementation
Uses Kartica, NaplatiDlg, PlatioJeDlg, BazeModul, IzborCjenikaDLG, UpitThreaded;
{$R *.DFM}

procedure TFVracanjeDlg.ShowMvracanje(brf:Integer);
Var h :Boolean;
begin
  wwdbgrid1.SelectedList.clear;
  wwdbgrid1.UnselectAll;
  if brf <> 0 then
     if not cross then
          if FKartica.qPos.Locate('SifraKazete',brf,[]) then Oznaci;

  if FKartica.qPos.RecordCount > 0 then ShowModal;
End;

procedure TFVracanjeDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFVracanjeDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FKartica.qPosVrati.Visible:=False;
  wwdbgrid1.SelectedList.clear;
end;

procedure TFVracanjeDlg.FormActivate(Sender: TObject);
begin
  FKartica.qPosVrati.Visible:=True;
  FKartica.qPos.First;
  vEdit.SetFocus;
end;

procedure TFVracanjeDlg.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   if (Field.FieldName='Vrati') then ABrush.Color:= clBtnFace
   else if  (not highlight) and (Sender as TwwDBGrid).isSelected then
   begin
      ABrush.Color:= clAqua;
      AFont.Color:= clBlack;
   end;

   if (Field.FieldName='datumpos') then
     if (DateOf(Field.AsDateTime) = DateOf(Date)) then
     begin
        ABrush.Color:= clRed;
        AFont.Color:= clWhite;
     end;
end;

procedure TFVracanjeDlg.VEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Case Key of
     VK_RETURN: begin
                  StisRet;
                  key := 0;
                End;
     VK_DELETE: Oznaci;
         VK_UP: FKartica.qPos.Prior;
       VK_DOWN: FKartica.qPos.Next;
     VK_ESCAPE: Close;
         VK_F9: if wwdbgrid1.SelectedList.Count > 0 then Naplati;
  End;
end;

procedure TFVracanjeDlg.StisRet;
Begin
  if FKartica.qPos.Locate('BcodeKaz',VEdit.text,[]) then Oznaci;
  VEdit.text := '';
  VEDit.SetFocus;
End;

procedure TFVracanjeDlg.Oznaci;
begin
  if wwdbgrid1.isselected then wwdbgrid1.UnselectRecord
  else begin
         wwdbgrid1.selectRecord;
         if wwdbgrid1.SelectedList.Count = FKartica.qPos.RecordCount then
            Naplati
         else FKartica.qPos.Next;
       End;
end;

procedure TFVracanjeDlg.Naplati;
var a:Boolean;
    i, vCij, cv: integer;
    kod: String;
begin
  FKartica.qPos.DisableControls;
  ZaNaplatiti := 0;
  ZaNaplatitiBezPopusta := 0;
  vCij := 1;
  if Podaci.tabSetUp.FieldByName('BrojCjenika').Value > 1 then
  begin
    Application.CreateForm(TFIzborCjenikaDLG,FIzborCjenikaDLG);
    FIzborCjenikaDLG.Label4.caption := IntToStr(wwdbgrid1.SelectedList.Count);
    if Podaci.tabSetUp.FieldByName('BrojCjenika').Value = 2 then
        FIzborCjenikaDLG.Button2.Visible := True;

    if Podaci.tabSetUp.FieldByName('BrojCjenika').Value = 3 then
    begin
        FIzborCjenikaDLG.Button2.Visible := True;
        FIzborCjenikaDLG.Button3.Visible := True;
    End;

    case FIzborCjenikaDLG.ShowModal of
         2: vcij := 1;
         3: vcij := 2;
         4: vcij := 3;
    End;
    FIzborCjenikaDLG.Release;
  end;

  cv := 0;
  for i:= 0 to wwdbgrid1.SelectedList.Count-1 do
  begin
     FKartica.qPos.GotoBookmark(wwdbgrid1.SelectedList.items[i]);
     kod:=FKartica.qPos.fieldByName('bcodekaz').AsString;
     if Podaci.tabSetUp.FieldByName('BesplatanSvaki').Value = 0 then
        Zanaplatiti := ZaNaplatiti + Podaci.Naplata(FKartica.qPos, vCij, kod, Date)
     Else
     begin
        inc(cv);
        if cv < Podaci.tabSetUp.FieldByName('BesplatanSvaki').asInteger then // ako je besplatni onda ga zaboravi
            Zanaplatiti := ZaNaplatiti + Podaci.Naplata(FKartica.qPOs, vCij, kod, date)
        Else cv := 0;
     End;
  end;

  // Razdvojiti sa popustom i bez popusta (2 podatka)

  ZaNaplatitiBezPopusta := ZaNaplatiti;

  ZaNaplatiti := ZaNaplatiti - (ZaNaplatiti*(Fkartica.qClan.FieldByName('Popust').Value/100));

  FNaplatiDlg.CurrencyEdit2.Value := ZaNaplatitiBezPopusta;

  FNaplatiDlg.CurrencyEdit1.Value := ZaNaplatiti;

  //naplati := 1 , 3 promjeni iznos, 2 odustani, 5 skini sa salda iznos bez popusta

  FNaplatiDlg.Label2.visible := (Fkartica.qClan.FieldByName('Popust').Value <> 0);
  FNaplatiDlg.CurrencyEdit2.visible := FNaplatiDlg.Label2.visible;
  FNaplatiDlg.Button1.visible := FNaplatiDlg.Label2.visible;

  case FNaplatiDlg.ShowModal of
         1: SrediNaplatu;
         2: Close;
         3: begin // Skini sa salda
              Application.CreateForm(TFPlatioJeDlg, FPlatioJeDlg);
              FPlatioJeDlg.CurrencyEdit1.Value := ZaNaplatiti;
              If FPlatioJeDlg.Showmodal = mrOk then
                Podaci.SrediSaldo(Fkartica.qClan.FieldByName('Sifra').VAlue, 0, ZaNaplatiti-FPlatioJeDlg.Platio.Value);
              FPlatioJeDlg.Destroy;
              Fkartica.qClan.Refresh;
              SrediNaplatu;
            End;
         5: begin     // skini sa salda
              Podaci.SrediSaldo(Fkartica.qClan.FieldByName('Sifra').VAlue, 0, ZaNaplatitiBezPopusta);
              Fkartica.qClan.Refresh;
              SrediNaplatu;
            End;
  End;

//  FKartica.qPos.Close;
//  FKartica.qPos.Open;
  FKartica.qPos.EnableControls;
  Close;
end;

procedure TFVracanjeDlg.SrediNaplatu;
var i: integer;
    sljedeci, sada, datum_pos, rac_master, clan, kazeta, barkod_kaz, rac_master2: string;
    racdet_temp, koi_temp, del_temp, film_temp, izdano_temp, wish_temp, tablica: string;
Begin
 sada:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Now);
 clan:=Fkartica.qClan.FieldByName('Sifra').AsString;

 if Top10 then
    if zvjezdica then tablica:='2' else tablica:='';

 try // naði sljedeæi broj raèuna
     qMaxRacun.TableName:='racuni'+tablica;
     qMaxRacun.ParamByName('SifraKluba').AsInteger:=SifraKluba;
     qMaxRacun.Open;
     if qMaxRacun.FieldByName('racun').IsNull then sljedeci:='1' else sljedeci:=qMaxRacun.FieldByName('racun').Asstring;
     qMaxRacun.Close;
     rac_master:=ShareUnit.PopuniXljevo(IntToStr(SifraKluba),'0',2)+'-'+ShareUnit.PopuniXljevo(sljedeci,'0',6);

     // napravi novi RAÈUN
     ShareUnit.UpitOpen(Podaci.myQuery1,
     ' INSERT INTO racuni'+tablica+' '+
     ' (SifraKluba, BrojRacuna, VrstaRacuna, Datum, Radnik, SifraClana, Popust, Cifra, StopaPoreza, Duzan, VrstaPlacanja)'+
     ' VALUES ('+IntToStr(SifraKluba)+', '''+rac_master+''','+
     ' 1, '''+sada+''', '''+VRadnik+''', '+clan+','+
     ' '+Fkartica.qClan.FieldByName('Popust').AsString+', '+CurrToStr(ZaNaplatiti)+','+
     ' '+Podaci.tabSetUp.FieldByName('IznosPoreza').AsString+','+
     ' '+FloatToStr(Fkartica.qClan.FieldByName('Duzan').AsCurrency)+','+
     ' '+IntToStr(Podaci.tVrstePlacanja.FieldByName('Sifra').AsInteger)+')', True, False);

(*     ShareUnit.UpitOpen(Podaci.myQuery1,  // naði šifru raèuna za detail
     ' SELECT Sifra FROM racuni'+tablica+' WHERE BrojRacuna='''+rac_master+'''', True, True);
     rac_master2:=Podaci.myQuery1.Fields[0].AsString;
*)
     rac_master2:=Podaci.myQuery1.LastInsertID;

     racdet_temp:=' INSERT INTO racunidetail'+tablica+' '+
     ' (SifraRacuna, SifraKazete, barcode, DatumPos, Dan, Svaki, Vikend, Blagdan, BrDan, BrSvaki, BrVikend, BrBlagdan) VALUES ';

     koi_temp:=' INSERT INTO koi'+
     ' (SifraClana, SifraKazete, barcode, Posudjen, Vracen, SifraKluba) VALUES ';

     film_temp:='';   // sreðivanje podataka u tKazete
     izdano_temp:=''; // vrati barkod za izdavanje
     wish_temp:='';   // popis filmova

  // idi redom selektirane one koje vraæa
     for i:= 0 to wwdbgrid1.SelectedList.Count-1 do
     begin
        FKartica.qPos.GotoBookmark(wwdbgrid1.SelectedList.items[i]);
        FKartica.qPos.Freebookmark(wwdbgrid1.SelectedList.items[i]);
        kazeta:=Fkartica.qPos.FieldByName('SifraKazete').AsString;
        barkod_kaz:=FKartica.qPos.FieldByName('BcodeKaz').AsString;
        datum_pos:=FormatDateTime('yyyy-mm-dd hh:mm:ss',Fkartica.qPos.FieldByName('DatumPos').AsDateTime);  // možda su posudbe sa drugaèijim datumima

//     If ZaNaplatiti>0 then
        ShareUnit.UpitOpen(Podaci.myQuery1,
            'SELECT CijenaDan, CijenaSvaki, CijenaVikend, CijenaBlagdan, '+
            'PrviDan, Naredni, Vikenda, Blagdana '+
            'FROM pos WHERE BCodeKaz='''+barkod_kaz+'''', True, False);

        racdet_temp:=racdet_temp+#13+'('+rac_master2+', '+kazeta+','+
        ' '''+barkod_kaz+''','+
        ' '''+datum_pos+''','+
        ' '+Podaci.myQuery1.FieldByName('CijenaDan').AsString+','+
        ' '+Podaci.myQuery1.FieldByName('CijenaSvaki').AsString+','+
        ' '+Podaci.myQuery1.FieldByName('CijenaVikend').AsString+','+
        ' '+Podaci.myQuery1.FieldByName('CijenaBlagdan').AsString+','+
        ' '+Podaci.myQuery1.FieldByName('PrviDan').AsString+','+
        ' '+Podaci.myQuery1.FieldByName('Naredni').AsString+','+
        ' '+Podaci.myQuery1.FieldByName('Vikenda').AsString+','+
        ' '+Podaci.myQuery1.FieldByName('Blagdana').AsString+'),';

        if not zvjezdica then
        begin
            // ažuriraj podatke o filmu
            film_temp:=film_temp+
                ' UPDATE kazetedetail'+
                ' SET IzdatPuta=IzdatPuta+1,'+
                ' IzdanoKop=IzdanoKop-1,'+
                ' ZaradioKn=ZaradioKn+'+Fkartica.qPos.FieldByName('Iznos').AsString+
//                ','+' ZaradioDem=ZaradioDem+'+FloatToStr(Fkartica.qPos.FieldByName('Iznos').AsCurrency / Podaci.TabSetUp.FieldByName('TecajDem').AsCurrency)+
                ' WHERE sifrakazete='+kazeta+
                ' AND SifraFirme='+IntToStr(SifraFirme)+';';

            film_temp:=film_temp+
                ' UPDATE kazete'+
                ' SET IzdatPuta=IzdatPuta+1,'+
                ' IzdanoKop=IzdanoKop-1,'+
                ' ZaradioKn=ZaradioKn+'+Fkartica.qPos.FieldByName('Iznos').AsString+
//                ','+' ZaradioDem=ZaradioDem+'+FloatToStr(Fkartica.qPos.FieldByName('Iznos').AsCurrency / Podaci.TabSetUp.FieldByName('TecajDem').AsCurrency)+
                ' WHERE sifra='+kazeta+';';

        end
        else
        begin
            film_temp:=film_temp+' UPDATE kazetedetail SET IzdanoKop=IzdanoKop-1 WHERE sifrakazete='+kazeta
                                 +' AND SifraFirme='+IntToStr(SifraFirme)+';';

            film_temp:=film_temp+' UPDATE kazete SET IzdanoKop=IzdanoKop-1 WHERE sifra='+kazeta+';';
        end;

        // Upiši filmove koje vraæa u bazu KOI
        koi_temp:=koi_temp+#13+
            '('+clan+', '+kazeta+', '''+barkod_kaz+''', '''+datum_pos+''', '''+sada+''', '+IntToStr(SifraKluba)+'),';

        // oznaèi IZDANO u tBarkodova
        izdano_temp:=izdano_temp+''''+barkod_kaz+''',';

        // obriši ga iz posudbe
        del_temp:=del_temp+FKartica.qPos.FieldByName('sifraNebitna').AsString+',';

        // provjera wishlista i rezervacija za prijedlog nove posudbe
        wish_temp:=wish_temp+kazeta+',';

        end; // od FOR selektirane

    Delete(racdet_temp, Length(racdet_temp), 1);  // obriši zadnji karakter -> ','
    Delete(koi_temp, Length(koi_temp), 1);        // obriši zadnji karakter -> ','
    Delete(izdano_temp, Length(izdano_temp), 1);  // obriši zadnji karakter -> ','
    Delete(del_temp, Length(del_temp), 1);        // obriši zadnji karakter -> ','
    Delete(wish_temp, Length(wish_temp), 1);      // obriši zadnji karakter -> ','

    FKartica.qPos.Close;   // Zatvori qPos zbog moguèih LOCKova

    ShareUnit.UpitOpen(Podaci.myQuery1,
        racdet_temp+';'+#13+
        koi_temp+';'+#13+
        'UPDATE bcodekazete SET Izdano=''N'' WHERE BarCode IN ('+izdano_temp+');'+#13+
        film_temp+#13+
        'UPDATE clanovi SET PrvaPosudba=''N'', ZadnjaPosudba='''+sada+''' WHERE Sifra='+clan+#13+';'+
        'DELETE FROM pos WHERE sifranebitna IN ('+del_temp+')', True, False);

    // na kraju ispiši raèun ako nije zvjezdica
    if not zvjezdica then
        if Podaci.TabSetUp.FieldByName('PostojiPrinterRacuni').Value='D' then IspRacun(rac_master);

    FKartica.qPos.Open;

 except
   on E: Exception do
   begin
        Logiraj(Podaci.myQuery1.Name+'::Error - TFVracanjeDlg.SrediNaplatu: '+E.Message, True);
   end;
 End;

    // ovdje dodati kontrolu za wish listu i rezervacije
    if Podaci.DajRezervacije(wish_temp) then
    begin
        film_temp:='';
        with Podaci.Qwww do
        begin
            First;
            while not Eof do
            begin
                film_temp:=film_temp+'Web rezervacija: '+FieldByName('sifra').AsString+' - '+FieldByName('naziv').AsString+
                            ' za èlana '+FieldByName('sifraclana').AsString+' - '+FieldByName('imeprezime').AsString+#13;
                Next;
            end;
        end;

        with Podaci.myQuery1 do
        begin
            First;
            while not Eof do
            begin
                film_temp:=film_temp+'Današnja rezervacija: '+FieldByName('sifra').AsString+' - '+FieldByName('naziv').AsString+
                            ' za èlana '+FieldByName('sifraclana').AsString+' - '+FieldByName('imeprezime').AsString;
                if FieldByName('dostava').AsString='da' then film_temp:=film_temp+' (dostava)';
                film_temp:=film_temp+#13;
                Next;
            end;
        end;

        with Podaci.myQuery2 do
        begin
            First;
            while not Eof do
            begin
                film_temp:=film_temp+'Wish lista: '+FieldByName('sifra').AsString+' - '+FieldByName('naziv').AsString+
                            ' za èlana '+FieldByName('sifraclana').AsString+' - '+FieldByName('imeprezime').AsString+#13;
                Next;
            end;
        end;

        DodajPodsjetnik(film_temp);
        ShowMessage(film_temp);
    end;

End;

Function TFVracanjeDlg.dvijedecimale(D:Extended):Currency;
begin
    Result:=trunc(D)+round(frac(D)*100)/100;
end;

procedure TFVracanjeDlg.VEditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

end.
