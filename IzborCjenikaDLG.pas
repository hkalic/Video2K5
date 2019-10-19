unit IzborCjenikaDLG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Placemnt, DBCtrls, Mask;

type
  TFIzborCjenikaDLG = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    FormStorage1: TFormStorage;
    Label1: TLabel;
    Panel2: TPanel;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label34: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBText3: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIzborCjenikaDLG: TFIzborCjenikaDLG;

implementation
Uses Kartica;
{$R *.DFM}

end.
