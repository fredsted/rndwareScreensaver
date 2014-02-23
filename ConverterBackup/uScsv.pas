unit uScsv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, IniFiles, SHFolder, ShlObj, jpeg,
  CustomizeDlg;

type
  TfrmScreensaver = class(TForm)
    tmrScreensaver: TTimer;
    bl: TLabel;
    mouseTimer: TTimer;
    tmrTextUpdater: TTimer;
    Image1: TImage;

    procedure LoadSettings;
    function GetRandomColor: TColor;

    procedure FormShow(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mouseTimerTimer(Sender: TObject);
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


{$R *.dfm}

procedure TfrmScreensaver.LoadSettings;
var
  iniFile: TIniFile;
begin
  iniFile := TIniFile.Create(frmSettings.GetConfigFilePath);
  try
    with iniFile do begin
      bl.Caption := frmSettings.EnDeCrypt(ReadString('Config', 'Text', frmSettings.screensaverMemo.Text));
      originalText := bl.Caption;
      randomColors := ReadBool('Config', 'Random', False);
      bl.Font.Color := (ReadInteger('Config', 'FontColor', frmSettings.shpFont.Brush.Color));
      frmScreensaver.Color := ColorToRGB(ReadInteger('Config', 'BackColor', frmSettings.shpBack.Brush.Color));
      bl.Font.Color := ReadInteger('Config', 'FontColor', 0);
      tmrScreensaver.Interval := ReadInteger('Config', 'Duration', StrToInt(frmSettings.edChangeSeconds.Text)) * 1000;
      bl.Font.Size := (ReadInteger('Config', 'FontSize', 10) * Screen.Width) div 1000;
      bl.Font.Name := ReadString('Config', 'Font', 'Tahoma');
    end;
  finally
    iniFile.Free;
  end;

  Top := 0;
  Left := 0;
  Width := Screen.Width;
  Height := Screen.Height;

  if randomColors then begin
    Randomize;
    bl.Font.Color := RGB(RandomRange(0,255), Random(255), Random(255));
    Color := RGB(RandomRange(0,255), Random(255), Random(255));
  end;

  tmrTextUpdaterTimer(nil);

  mouseVal := 0;
end;

function TfrmScreensaver.GetRandomColor: TColor;
begin
  Result := RGB(Random(255), Random(255), Random(255));
end;

procedure TfrmScreensaver.FormShow(Sender: TObject);
begin
  tmrScreensaverTimer(nil);
  ShowCursor(false);
  LoadSettings;
end;

procedure TfrmScreensaver.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 Inc(mouseVal);
 if mouseVal > 15 then
  Close;
end;

procedure TfrmScreensaver.mouseTimerTimer(Sender: TObject);
begin
 mouseVal := 0;
end;

procedure TfrmScreensaver.tmrScreensaverTimer(Sender: TObject);
var
  randTop, randLeft: integer;
begin
  randLeft := RandomRange(0, Screen.Width-bl.Width+5);
  randTop := RandomRange(0, Screen.Height-bl.Height+5);
  bl.Left := randLeft;
  bl.Top := randTop;
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
  ShowCursor(true);
end;

end.
