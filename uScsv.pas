unit uScsv;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, IniFiles{,
  CustomizeDlg};

type

  { TfrmScreensaver }

  TfrmScreensaver = class(TForm)
    img: TImage;
    tmrScreensaver: TTimer;
    bl: TLabel;
    tmrMouse: TTimer;
    tmrTextUpdater: TTimer;

    procedure FormCreate(Sender: TObject);
    procedure LoadSettings;
    function GetRandomColor: TColor;

    procedure FormShow(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tmrMouseTimer(Sender: TObject);
    procedure tmrScreensaverTimer(Sender: TObject);
    procedure tmrTextUpdaterTimer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frmScreensaver: TfrmScreensaver;

implementation

uses Math, uSett, StrUtils;

var
  mouseVal: integer;
  originalText: string;
  randomColors: boolean;
  imageList: TStringList;
  imagePtr: integer;


{$R *.lfm}

procedure TfrmScreensaver.LoadSettings;
var
  iniFile: TIniFile;
  images: TStringList;
begin
  iniFile := TIniFile.Create(frmSettings.GetConfigFilePath);
  imageList := TStringList.Create;
  try
    with iniFile do begin
      bl.Caption := frmSettings.EnDeCrypt(ReadString('Config', 'Text', frmSettings.screensaverMemo.Text));
      originalText := bl.Caption;
      randomColors := ReadBool('Config', 'Random', False);
      bl.Font.Color := (ReadInteger('Config', 'FontColor', frmSettings.lblFont.Font.Color));
      frmScreensaver.Color := ColorToRGB(ReadInteger('Config', 'BackColor', frmSettings.shpBack.Brush.Color));
      bl.Font.Color := ReadInteger('Config', 'FontColor', 0);
      tmrScreensaver.Interval := ReadInteger('Config', 'Duration', StrToInt(frmSettings.edChangeSeconds.Text)) * 1000;
      bl.Font.Size := (ReadInteger('Config', 'FontSize', 10) * Screen.Width) div 1000;
      bl.Font.Name := ReadString('Config', 'Font', 'Tahoma');
      imageList.DelimitedText:=frmSettings.EnDeCrypt(ReadString('Config', 'PicturePath', ''));
      img.Visible:=ReadBool('Config', 'ShowPictures', False);
       bl.Visible:=ReadBool('Config', 'ShowText', False);
    end;
  finally
    iniFile.Free;
  end;

  // Make fullscreen
  Top := 0;
  Left := 0;
  Width := Screen.Width;
  Height := Screen.Height;


  //Initialize default values
  imagePtr := 0;
  mouseVal := 0;

  // Make sure there's a new color
  if randomColors then begin
    Randomize;
    bl.Font.Color := RGB(RandomRange(0,255), Random(255), Random(255));
    Color := RGB(RandomRange(0,255), Random(255), Random(255));
  end;

  tmrTextUpdaterTimer(nil);

  tmrScreensaver.Enabled := True;
  tmrMouse.Enabled := True;
  tmrTextUpdater.Enabled := True;


end;

procedure TfrmScreensaver.FormCreate(Sender: TObject);
begin
  imageList := TStringList.Create;
end;

function TfrmScreensaver.GetRandomColor: TColor;
begin
  Result := RGB(Random(255), Random(255), Random(255));
end;

procedure TfrmScreensaver.FormShow(Sender: TObject);
begin
  // ShowCursor(false);  (Doesn't work with lazarus apparently)
  LoadSettings;
  tmrScreensaverTimer(nil);
end;

procedure TfrmScreensaver.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 Inc(mouseVal);
 if mouseVal > 15 then
  Close;
end;

procedure TfrmScreensaver.tmrMouseTimer(Sender: TObject);
begin
 mouseVal := 0;
end;

procedure TfrmScreensaver.tmrScreensaverTimer(Sender: TObject);
var
  randTop, randLeft, randTopImg, randLeftImg: integer;
begin

 if (imageList.Count > 0) then begin
  img.Picture.LoadFromFile(imageList.Strings[imagePtr]);

  if (imagePtr = imageList.Count-1) then begin
   imagePtr := 0;
  end else begin
   Inc(imagePtr);
  end;
 end;

  bl.Left := RandomRange(0, Screen.Width-bl.Width+5);
  bl.Top := RandomRange(0, Screen.Height-bl.Height+5);
  img.Left := RandomRange(0, Screen.Width-img.Width+5);
  img.Top := RandomRange(0, Screen.Height-img.Height+5);
end;

function TicksToStr(Ticks: Cardinal): string;    //Convert Ticks to String
var
  aDatetime : TDateTime;
begin
   aDatetime := Ticks  / SecsPerDay / MSecsPerSec;
   Result := Format('%d days, %s', [Trunc(aDatetime), FormatDateTime('hh:nn:ss.z', Frac(aDatetime))]) ;
end;

procedure TfrmScreensaver.tmrTextUpdaterTimer(Sender: TObject);
  var currentText,
  compnameStr, dateStr, dateTimeStr, uptimeStr: string;
begin
  currentText := originalText;

  compnameStr := GetEnvironmentVariable('COMPUTERNAME');
  dateStr :=  DateToStr(Now);
  dateTimeStr := TimeToStr(Now);
  uptimeStr := TicksToStr(GetTickCount);

  currentText := StringReplace(currentText, '{compname}', compnameStr, [rfReplaceAll, rfIgnoreCase]);
  currentText := StringReplace(currentText, '{time}', dateTimeStr, [rfReplaceAll, rfIgnoreCase]);
  currentText := StringReplace(currentText, '{date}', dateStr, [rfReplaceAll, rfIgnoreCase]);
  currentText := StringReplace(currentText, '{uptime}', uptimeStr, [rfReplaceAll, rfIgnoreCase]);

  bl.Caption := currentText;
end;

procedure TfrmScreensaver.FormKeyPress(Sender: TObject; var Key: Char);
begin
 Close;
end;

procedure TfrmScreensaver.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //frmScreensaver.Cursor:=;
  //ShowCursor(true);
end;

end.