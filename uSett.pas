unit uSett;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  IniFiles, Buttons, ExtCtrls, ComCtrls, Menus, ExtDlgs;

type

  { TfrmSettings }

  TfrmSettings = class(TForm)
    btnFont: TSpeedButton;
    Button1: TButton;
    btnShowDemo: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    chkRandom: TCheckBox;
    chkShowPictures: TCheckBox;
    chkShowText: TCheckBox;
    edChangeSeconds: TEdit;
    fontSize: TTrackBar;
    lblFont: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lvImgs: TListBox;
    PageControl1: TPageControl;
    screensaverMemo: TMemo;
    popVariables: TPopupMenu;
    ime00001: TMenuItem;
    imeDate1: TMenuItem;
    ColorDialog1: TColorDialog;
    ColorDialog2: TColorDialog;
    ComputerName1: TMenuItem;
    shpBack: TShape;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Button4: TButton;
    TabSheet4: TTabSheet;
    udDuration: TUpDown;
    Uptime1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;

    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblFontMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LoadConfig;
    procedure AfterLoadCondig;
    procedure SaveConfig;
    procedure DisableColorSettings;
    procedure EnableColorSettings;
    procedure AddScreenSaverText(Text: string);
    function EnDeCrypt(const Value : String) : String;

    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnShowDemoClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure chkRandomClick(Sender: TObject);
    procedure ComputerName1Click(Sender: TObject);
    procedure ime00001Click(Sender: TObject);
    procedure imeDate1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnFontClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure shpBackMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Uptime1Click(Sender: TObject);
    
    function SettingDir: string;
    function GetConfigFilePath: string;
    procedure Button6Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;

implementation

uses uScsv, uConf, uFont, uAbou;



var
  canSelColor: boolean;
  canCloseOrNot: Boolean;

{$R *.lfm}

{ TfrmSettings }


function TfrmSettings.SettingDir: string;
var
   FilePath: array [0..255] of char;
begin
  //SHGetSpecialFolderPath(0, @FilePath[0], CSIDL_APPDATA, True);
  Result := '~'; //FilePath;
end;

function TfrmSettings.GetConfigFilePath: string;
begin
  Result := self.SettingDir+'\screenconfig.ini';
end;

procedure TfrmSettings.LoadConfig;
var
  iniFile: TIniFile;
begin
  iniFile := TIniFile.Create(GetConfigFilePath);
  try
    with iniFile do begin
      screensaverMemo.Lines.Text :=   EnDeCrypt(ReadString('Config', 'Text', EnDeCrypt('rndware Screensaver')));
      chkRandom.Checked :=            ReadBool('Config', 'Random', chkRandom.Checked);
      chkShowText.Checked :=          ReadBool('Config', 'ShowText', chkShowText.Checked);
      chkShowPictures.Checked :=      ReadBool('Config', 'ShowPictures', chkShowPictures.Checked);
      lblFont.Font.Color :=           ReadInteger('Config', 'FontColor', 16777215);
      shpBack.Brush.Color :=          ReadInteger('Config', 'BackColor', 0);
      udDuration.Position :=          ReadInteger('Config', 'Duration', StrToInt(edChangeSeconds.Text));
      fontSize.Position :=            ReadInteger('Config', 'FontSize', fontSize.Position);
      btnFont.Font.Name :=            ReadString('Config', 'Font', 'Tahoma');
      lvImgs.Items.CommaText:=        EnDeCrypt(ReadString('Config', 'PicturePath', ''));
      chkShowText.Checked:=           ReadBool('Config', 'ShowText', True);
      chkShowPictures.Checked:=       ReadBool('Config', 'ShowPictures', False);
    end;
  finally
    iniFile.Free;
    AfterLoadCondig;
  end;
end;

procedure TfrmSettings.SaveConfig;
var
  iniFile: TIniFile;
begin
  iniFile := TIniFile.Create(GetConfigFilePath);
  try
    with iniFile do begin
      WriteString   ('Config', 'Text', EnDeCrypt(screensaverMemo.Text));
      WriteBool     ('Config', 'Random', chkRandom.Checked);
      WriteBool     ('Config', 'ShowText', chkShowText.Checked);
      WriteBool     ('Config', 'ShowPictures', chkShowPictures.Checked);
      WriteInteger  ('Config', 'FontColor', lblFont.Font.Color);
      WriteInteger  ('Config', 'BackColor', shpBack.Brush.Color);
      WriteInteger  ('Config', 'Duration', udDuration.Position);
      WriteInteger  ('Config', 'FontSize', fontSize.Position);
      WriteString   ('Config', 'Font', btnFont.Font.Name);
      WriteString   ('Config', 'PicturePath', EnDeCrypt(lvImgs.Items.CommaText));
      WriteBool     ('Config', 'ShowText', chkShowText.Checked);
      WriteBool     ('Config', 'ShowPictures', chkShowPictures.Checked);
    end;
    except
      ShowMessage('Could not save configuration');
  end;
end;

procedure TfrmSettings.FormShow(Sender: TObject);
begin
 PageControl1.ActivePage := TabSheet1;
end;

procedure TfrmSettings.lblFontMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TfrmSettings.Button2Click(Sender: TObject);
begin
      if canSelColor and ColorDialog2.Execute then
     lblFont.Font.Color := ColorDialog2.Color;
end;

procedure TfrmSettings.Button5Click(Sender: TObject);
begin
if lvImgs.SelCount = 1 then
 lvImgs.Items.Delete(lvImgs.ItemIndex);
end;

procedure TfrmSettings.Button7Click(Sender: TObject);
begin
        if canSelColor and ColorDialog2.Execute then
     shpBack.Brush.Color := ColorDialog2.Color;
end;

procedure TfrmSettings.FormCreate(Sender: TObject);
begin
  LoadConfig;
end;

procedure TfrmSettings.Button1Click(Sender: TObject);
begin
  canCloseOrNot := True;
  SaveConfig;
  Close;
end;

procedure TfrmSettings.btnShowDemoClick(Sender: TObject);
begin
  SaveConfig;
  frmScreensaver.Show;
end;

procedure TfrmSettings.Button3Click(Sender: TObject);
var
  cursorPos: TPoint;
begin
  cursorPos := Mouse.CursorPos;
  popVariables.Popup(cursorPos.X, cursorPos.Y);
end;

procedure TfrmSettings.DisableColorSettings;
begin
  Button2.Enabled := False;
  Button7.Enabled := False;
  lblFont.Enabled := False;

  shpBack.Pen.Mode := pmXor;
  canSelColor := False;
end;

procedure TfrmSettings.EnableColorSettings;
begin
  Button2.Enabled := True;
  Button7.Enabled := True;
  lblFont.Enabled := True;
  shpBack.Pen.Mode := pmCopy;
  canSelColor := True;
end;

procedure TfrmSettings.AfterLoadCondig;
begin
  if chkRandom.Checked then
    DisableColorSettings
 else
    EnableColorSettings;
end;

procedure TfrmSettings.chkRandomClick(Sender: TObject);
begin
  AfterLoadCondig;
end;

procedure TfrmSettings.AddScreenSaverText(Text: string);
begin
  screensaverMemo.Text := screensaverMemo.Text + ' ' + Text;
end;

procedure TfrmSettings.ComputerName1Click(Sender: TObject);
begin
  AddScreenSaverText('{compname}');
end;

procedure TfrmSettings.ime00001Click(Sender: TObject);
begin
  AddScreenSaverText('{time}');
end;

procedure TfrmSettings.imeDate1Click(Sender: TObject);
begin
  AddScreenSaverText('{time}');
end;

procedure TfrmSettings.Uptime1Click(Sender: TObject);
begin
  AddScreenSaverText('{uptime}');
end;

procedure TfrmSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if canCloseOrNot <> True then  begin
    CanClose := False;
    frmConfirm.Show;
  end else begin
    CanClose := True;
  end;
end;

procedure TfrmSettings.btnFontClick(Sender: TObject);
begin
  frmFontConfig.Show;
  frmFontConfig.fontPreviewLabel.Font.Name := TSpeedButton(Sender).Font.Name;
  frmFontConfig.ListBox1.Selected[frmFontConfig.ListBox1.Items.IndexOf(frmFontConfig.fontPreviewLabel.Font.Name)] := True;

end;

// Function for saving multi line text in ini value. We keep everything in 1 file
function TfrmSettings.EnDeCrypt(const Value: String): String;
var
  CharIndex : integer;
begin
  Result := Value;
  for CharIndex := 1 to Length(Value) do
    Result[CharIndex] := chr(not(ord(Value[CharIndex])));
end;

procedure TfrmSettings.Button4Click(Sender: TObject);
begin
  frmAbout.Show;
end;

procedure TfrmSettings.shpBackMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

end;


procedure TfrmSettings.Button6Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    lvImgs.Items.Commatext := lvImgs.Items.Commatext + OpenPictureDialog1.Files.CommaText;
end;

end.