unit PostavkeDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, wwdbdatetimepicker, StdCtrls, ExtCtrls, DBCtrls, Mask, DBTables,
  ComCtrls, Buttons, jpeg, DbiTypes, DBIProcs, LMDCustomComponent,
  LMDContainerComponent, LMDBaseDialog, LMDDirDlg, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxDBELib, MySQLDataset, wwclearbuttongroup, wwradiogroup;

type
  TFPostavkeDlg = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DataSource1: TDataSource;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    Label8: TLabel;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    DBCheckBox4: TDBCheckBox;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    GroupBox1: TGroupBox;
    DBCheckBox6: TDBCheckBox;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    GroupBox2: TGroupBox;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    Label20: TLabel;
    Label21: TLabel;
    wwDBDateTimePicker2: TwwDBDateTimePicker;
    DBCheckBox7: TDBCheckBox;
    Label22: TLabel;
    DBEdit18: TDBEdit;
    Panel2: TPanel;
    Btnizlaz: TBitBtn;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    TabSheet3: TTabSheet;
    Label18: TLabel;
    DBEdit19: TDBEdit;
    DBRadioGroup5: TDBRadioGroup;
    Button1: TButton;
    Label15: TLabel;
    DBCheckBox10: TDBCheckBox;
    DBRadioGroup2: TDBRadioGroup;
    Label24: TLabel;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    Label25: TLabel;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    Label27: TLabel;
    DBEdit20: TDBEdit;
    Label28: TLabel;
    DBEdit21: TDBEdit;
    Label29: TLabel;
    DBEdit22: TDBEdit;
    DBCheckBox12: TDBCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    DBCheckBox13: TDBCheckBox;
    GroupBox3: TGroupBox;
    Label31: TLabel;
    DBEdit23: TDBEdit;
    Label32: TLabel;
    DBEdit24: TDBEdit;
    Label33: TLabel;
    DBEdit25: TDBEdit;
    Label34: TLabel;
    DBEdit26: TDBEdit;
    Label35: TLabel;
    DBEdit27: TDBEdit;
    Label36: TLabel;
    DBEdit28: TDBEdit;
    Label37: TLabel;
    DBEdit29: TDBEdit;
    Label38: TLabel;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    TabSheet4: TTabSheet;
    Bevel4: TBevel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label3: TLabel;
    Bevel5: TBevel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    TabSheet5: TTabSheet;
    DInfo: TDataSource;
    DBMemo1: TDBMemo;
    Label26: TLabel;
    Label30: TLabel;
    DBMemo2: TDBMemo;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit10: TDBEdit;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    Label46: TLabel;
    DBCheckBox22: TDBCheckBox;
    Label19: TLabel;
    DBEdit31: TDBEdit;
    Label23: TLabel;
    DBEdit32: TDBEdit;
    Label47: TLabel;
    DBCheckBox23: TDBCheckBox;
    Label48: TLabel;
    Panel1: TPanel;
    Label39: TLabel;
    Image1: TImage;
    TabSheet6: TTabSheet;
    Memo4: TMemo;
    Memo2: TMemo;
    Label49: TLabel;
    Label51: TLabel;
    Memo3: TMemo;
    Label50: TLabel;
    Memo1: TMemo;
    Label40: TLabel;
    Label52: TLabel;
    DBEdit33: TDBEdit;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    Label53: TLabel;
    dxDBButtonEdit1: TdxDBButtonEdit;
    LMDDirDlg1: TLMDDirDlg;
    Label54: TLabel;
    DBEdit34: TDBEdit;
    Label55: TLabel;
    DBEdit35: TDBEdit;
    Panel3: TPanel;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup7: TDBRadioGroup;
    RadioGroup1: TRadioGroup;
    Panel4: TPanel;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox27: TDBCheckBox;
    GroupBox4: TGroupBox;
    DBEdit36: TDBEdit;
    Label56: TLabel;
    TInfo: TMySQLDataset;
    GroupBox5: TGroupBox;
    DBCheckBox29: TDBCheckBox;
    wwRadioGroup1: TwwRadioGroup;
    DBCheckBox28: TDBCheckBox;
    DBCheckBox30: TDBCheckBox;
    DBRadioGroup8: TDBRadioGroup;
    procedure Kdown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnizlazClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxDBButtonEdit1ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dxDBButtonEdit1Exit(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    procedure NapuniSysInfo;
  public
    { Public declarations }
  end;

var
  FPostavkeDlg: TFPostavkeDlg;

implementation
Uses BazeModul, MAin;
{$R *.DFM}


procedure TFPostavkeDlg.Kdown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Case Key of
      VK_Up:
           begin
             selectnext(sender as twincontrol,False,true);
             key:=0;
           End;
      VK_Down, VK_return:
           begin
             selectnext(sender as twincontrol,True,true);
             key:=0;
           End;
End;
end;

procedure TFPostavkeDlg.BtnizlazClick(Sender: TObject);
begin
    Close;
end;

procedure TFPostavkeDlg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure TFPostavkeDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if DataSource1.DataSet.State in DsEditModes then
        if confirm('Da li želite snimiti izmjene?') Then
        begin
            if DataSource1.DataSet.FieldByName('BlagdanVikendu').Value='D' then
            begin
                BlagdanVikendu:=True;
                MainForm.LMDSimpleLabel1.Caption:='Dodaj blagdan vikendu';
            end
            else
            begin
                BlagdanVikendu:=False;
                MainForm.LMDSimpleLabel1.Caption:='Blagdan je normalan';
            end;
            DataSource1.DataSet.Post;
        end
        Else DataSource1.DataSet.Cancel;

    if DInfo.State in DsEditModes then
        tinfo.post;

    Action := caFree;
end;

procedure TFPostavkeDlg.Button2Click(Sender: TObject);
begin
  Podaci.ComPort1.ShowSetupDialog;
end;

procedure TFPostavkeDlg.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  NapuniSysInfo;
  RadioGroup1Click(RadioGroup1);
  //  Label23.caption := Session.PrivateDir;
  //GroupBox3.Enabled := not (MainForm.Slock1.Status = stRegistered);
  GroupBox3.Enabled := true;
  try
    DBCheckBox18.DataSource := DataSource1;
  except
    DBCheckBox18.DataSource := nil;
  End;

  try
    DBCheckBox19.DataSource := DataSource1;
  except
    DBCheckBox19.DataSource := nil;
  End;

  try
    DBCheckBox20.DataSource := DataSource1;
  except
    DBCheckBox20.DataSource := nil;
  End;
  try
    DBCheckBox21.DataSource := DataSource1;
  except
    DBCheckBox21.DataSource := nil;
  End;

  DBEdit25.visible := (not Registriran);
  Label48.visible := Registriran;

  TInfo.open;
  TabSheet5.Visible := TInfo.Active;

   if low_rights then // iskljuèi "rich" opcije, web i sl.
   begin
        DBCheckBox26.Visible:=False; // sakrivanje postavki za potvrde
        DBCheckBox27.Visible:=False;
   end;
end;

procedure TFPostavkeDlg.NapuniSysInfo;
begin
    Memo1.lines.Add('Server: '+Podaci.myDB.Host);
    Memo1.lines.Add('Database: '+Podaci.myDB.DatabaseName);
    Memo1.lines.Add('User: '+Podaci.myDB.UserName);
    Memo1.lines.Add('Charset: '+mojCharSet);
    Memo1.lines.Add('Collation: '+mojCollation);

    Memo3.lines.Add('Client: '+Podaci.myDB.ClientVersion);
    Memo3.lines.Add('Server: '+Podaci.myDB.ServerVersion);

    if logiraj_upite then Memo4.lines.Add('Logiraj upite: DA')
    else Memo4.lines.Add('Logiraj upite: NE');
    if ide_lib='1' then Memo4.lines.Add('DLL library: DA')
    else Memo4.lines.Add('DLL library: NE');
End;

procedure TFPostavkeDlg.dxDBButtonEdit1ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var dod :String;
begin
    if LMDDirDlg1.Execute then
    begin
        with DataSource1.DataSet do
        begin
            Edit;
            if (Sender as TdxDBButtonEdit).Tag=1 then dod:='\' else dod:='';
            FieldByName((Sender as TdxDBButtonEdit).DataField).Value:=LMDdirDlg1.Path+dod;
        end;
    end;
end;

procedure TFPostavkeDlg.dxDBButtonEdit1Exit(Sender: TObject);
var t :String;
begin
    t:=DataSource1.DataSet.FieldByName((Sender as TdxDBButtonEdit).DataField).Value;
    if t[Length(t)]<>'\' then t:=t+'\';
    DataSource1.DataSet.FieldByName((Sender as TdxDBButtonEdit).DataField).Value:=t;
end;

procedure TFPostavkeDlg.RadioGroup1Click(Sender: TObject);
begin
    if RadioGroup1.ItemIndex=0 then
    begin
        Panel3.Visible:=True;
        Panel4.Visible:=False;
    end
    else
    begin
        Panel3.Visible:=False;
        Panel4.Visible:=True;
    end;
end;

end.
