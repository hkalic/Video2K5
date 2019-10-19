unit Splash;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls,  Jpeg, ComCtrls, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDGraphicControl,
  LMDCustomGraphicLabel, LMDGraphicLabel;

type
  TSplashForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    LMDGraphicLabel1: TLMDGraphicLabel;
    Label1: TLabel;
  end;

var
  SplashForm: TSplashForm;



implementation

{$R *.DFM}

end.
