unit UpitThreaded;

interface

uses
  Classes, comctrls, MySQLDataset, MySQLServer;

type
  ThreadUpitClass = class(TThread)
  private
    { Private declarations }
    ThreadUpit1: TMySQLQuery;
    ThreadDB: TMySQLServer;
    IdeSelect: Boolean;
  protected
    procedure Execute; override;
    procedure UpdateKartica;
  published
    constructor CreateIt(PriorityLevel: cardinal; Select: Boolean; SQLUpit: String);
    destructor Destroy; override;
  end;

implementation

uses Main, BazeModul, SysUtils, Graphics, Windows, Controls, Kartica;

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure ThreadUpitClass.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ ThreadUpitClass }

constructor ThreadUpitClass.CreateIt(PriorityLevel: cardinal; Select: Boolean; SQLUpit: String);
begin
  inherited Create(true);   // Create thread suspended

  IdeSelect:=Select;
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
    SQL.Text:=SQLUpit;
  end;

  Priority := TThreadPriority(PriorityLevel); // Set Priority Level
                                              // type  TThreadPriority = (tpIdle, tpLowest, tpLower, tpNormal, tpHigher, tpHighest, tpTimeCritical);
  FreeOnTerminate := true; // Thread Free Itself when terminated
  Suspended := false;      // Continue the thread
end;

procedure ThreadUpitClass.Execute;
begin
    if IdeSelect then
        ThreadUpit1.Open
    else
        ThreadUpit1.Execute;
end;

destructor ThreadUpitClass.Destroy;
begin
//    Synchronize(UpdateKartica);

    MainForm.MojThreadUpitAktivan := false;
    inherited destroy;
end;

procedure ThreadUpitClass.UpdateKartica;
begin
    FKartica.qPos.Close;
    FKartica.qPos.Open;
end;

end.
