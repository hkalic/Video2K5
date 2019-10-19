unit WebClass;

interface

uses
  Classes, comctrls, MySQLDataset, MySQLServer;

type
  TIzracunajWeb = class(TThread)
  private
    { Private declarations }
    ThreadUpit1, ThreadUpit2, ThreadUpit3, ThreadUpit4 : TMySQLQuery;
    ThreadDB: TMySQLServer;
  protected
    procedure Execute; override;
  published
    constructor CreateIt(PriorityLevel: cardinal);
    destructor Destroy; override;
  end;

implementation

uses Main, BazeModul, SysUtils, Graphics, Windows, Controls;

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TIzracunajWeb.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TIzracunajWeb }

constructor TIzracunajWeb.CreateIt(PriorityLevel: cardinal);
begin
  inherited Create(true);   // Create thread suspended

  ThreadDB:=TMySQLServer.Create(nil);
  with ThreadDB do
  begin
    Host:=serv;
    Port:=3306;
    DatabaseName:=baza;
    UserName:=user;
    Password:=Loz;
    if ide_schema='1' then
        Options:=[coLongPassword,coLongFlag,coNoSchema,coInteractive,coProtocol41,coMultiQueries,soCloseOnChildren]
    else
        Options:=[coLongPassword,coLongFlag,coInteractive,coProtocol41,coMultiQueries,soCloseOnChildren];
  end;

  ThreadUpit1:=TMySQLQuery.Create(nil);
  with ThreadUpit1 do //***************************** NARUDŽBE *******************************
  begin
    Server:=ThreadDB;
    SQL.LoadFromFile(PathSQL+'IzbrojNarucene.sql');
    MacroByName('KLUB').AsString:='AND b.sifra_videokluba='+IntToStr(SifraKluba);
  end;

  ThreadUpit2:=TMySQLQuery.Create(nil);
  with ThreadUpit2 do //***************************** VRAÈANJA ******************************
  begin
    Server:=ThreadDB;
    SQL.LoadFromFile(PathSQL+'IzbrojVracanje.sql');
    MacroByName('KLUB').AsString:='AND p.sifrakluba='+IntToStr(SifraKluba);
  end;

  ThreadUpit3:=TMySQLQuery.Create(nil);
  with ThreadUpit3 do //***************************** REZERVACIJE ****************************
  begin
    Server:=ThreadDB;
    SQL.LoadFromFile(PathSQL+'IzbrojRezervacije.sql');
    MacroByName('DATUM').AsString:=''''+FormatDateTime('yyyy-mm-dd',Now)+'''';
    MacroByName('KLUB').AsString:='AND r.sifra_videokluba='+IntToStr(SifraKluba);
  end;

  ThreadUpit4:=TMySQLQuery.Create(nil);
  with ThreadUpit4 do //***************************** WISH LISTA *****************************
  begin
    Server:=ThreadDB;
    SQL.LoadFromFile(PathSQL+'IzbrojWListu.sql');
    MacroByName('KLUB').AsString:=IntToStr(SifraKluba);
  end;

  Priority := TThreadPriority(PriorityLevel); // Set Priority Level
                                              // type  TThreadPriority = (tpIdle, tpLowest, tpLower, tpNormal, tpHigher, tpHighest, tpTimeCritical);
  FreeOnTerminate := true; // Thread Free Itself when terminated
  Suspended := false;      // Continue the thread
end;

procedure TIzracunajWeb.Execute;
begin
    ThreadUpit1.Open;
    ThreadUpit2.Open;
    ThreadUpit3.Open;
    ThreadUpit4.Open;

    if (ThreadUpit1.IsEmpty and ThreadUpit2.IsEmpty) then BrojNarudzbi:=0
    else if ThreadUpit1.IsEmpty then BrojNarudzbi:=ThreadUpit2.Fields[0].AsInteger
    else if ThreadUpit2.IsEmpty then BrojNarudzbi:=ThreadUpit1.Fields[0].AsInteger
    else BrojNarudzbi:=ThreadUpit1.Fields[0].AsInteger+ThreadUpit2.Fields[0].AsInteger;

    if ThreadUpit3.IsEmpty then BrojRezervacija:=0
    else BrojRezervacija:=ThreadUpit3.Fields[0].AsInteger;

    if ThreadUpit4.IsEmpty then BrojWishLista:=0
    else BrojWishLista:=ThreadUpit4.Fields[0].AsInteger;

    ThreadUpit1.Close;
    ThreadUpit2.Close;
    ThreadUpit3.Close;
    ThreadUpit4.Close;
end;

destructor TIzracunajWeb.Destroy;
begin
    MainForm.MojThread1Aktivan := false;
    inherited destroy;
end;

end.
