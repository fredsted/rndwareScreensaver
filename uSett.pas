unit uSett;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  IniFiles, Buttons, ExtCtrls, ComCtrls, Menus, SHFolder, ShlObj;

type
  TfrmSettings = class(TForm)
    Button1: TButton;
    Button2: TButton;
    shpFont: TShape;
    Label1: TLabel;
    shpBack: TShape;
    Label2: TLabel;
    Bevel4: TBevel;
    Bevel1: TBevel;
    chkRandom: TCheckBox;
    Button3: TButton;
    Bevel5: TBevel;
    popVariables: TPopupMenu;
    ime00001: TMenuItem;
    imeDate1: TMenuItem;
    ColorDialog1: TColorDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Bevel2: TBevel;
    fontSize: TTrackBar;
    Label5: TLabel;
    ColorDialog2: TColorDialog;
    ComputerName1: TMenuItem;
    Label6: TLabel;
    btnFont: TSpeedButton;
    Bevel3: TBevel;
    Label3: TLabel;
    udDuration: TUpDown;
    Label4: TLabel;
    changeSeconds: TEdit;
    screensaverMemo: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    Button4: TButton;
    Uptime1: TMenuItem;

    procedure LoadConfig;
    procedure AfterLoadCondig;
    procedure SaveConfig;
    procedure DisableColorSettings;
    procedure EnableColorSettings;
    procedure AddScreenSaverText(Text: string);
    function EnDeCrypt(const Value : String) : String;

    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure chkRandomClick(Sender: TObject);
    procedure ComputerName1Click(Sender: TObject);
    procedure ime00001Click(Sender: TObject);
    procedure imeDate1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnFontClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Uptime1Click(Sender: TObject);
    
    function SettingDir: string;
    function configFile: string;
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

{$R *.dfm}

{ TfrmSettings }


function TfrmSettings.SettingDir: string;
var
   FilePath: array [0..255] of char;
begin
  SHGetSpecialFolderPath(0, @FilePath[0], CSIDL_APPDATA, True);
  Result := FilePath;
end;

function TfrmSettings.configFile: string;
begin
  Result := self.SettingDir+'\screenconfig.ini';
end;

procedure TfrmSettings.LoadConfig;
var
  iniFile: TIniFile;
begin

  iniFile := TIniFile.Create(configFile);
  try
    with iniFile do begin
      screensaverMemo.Lines.Text := EnDeCrypt(ReadString('Config', 'Text', EnDeCrypt('rndware Screensaver')));
      chkRandom.Checked :=    ReadBool('Config', 'Random', chkRandom.Checked);
      shpFont.Brush.Color :=  ReadInteger('Config', 'FontColor', 16777215);
      shpBack.Brush.Color :=  ReadInteger('Config', 'BackColor', 0);
      udDuration.Position :=  ReadInteger('Config', 'Duration', 0);
      fontSize.Position :=    ReadInteger('Config', 'FontSize', 5);
      btnFont.Font.Name :=    ReadString('Config', 'Font', 'Tahoma');
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
  iniFile := TIniFile.Create(configFile);

  try
    with iniFile do begin
      WriteString   ('Config', 'Text', EnDeCrypt(screensaverMemo.Text));
      WriteBool     ('Config', 'Random', chkRandom.Checked);
      WriteInteger  ('Config', 'FontColor', shpFont.Brush.Color);
      WriteInteger  ('Config', 'BackColor', shpBack.Brush.Color);
      WriteInteger  ('Config', 'Duration', udDuration.Position);
      WriteInteger  ('Config', 'FontSize', fontSize.Position);
      WriteString   ('Config', 'Font', btnFont.Font.Name);
    end;

    except
      ShowMessage('Could not save configuration');
  end;

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

procedure TfrmSettings.Button2Click(Sender: TObject);
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

procedure TfrmSettings.SpeedButton2Click(Sender: TObject);
begin
  if canSelColor and ColorDialog2.Execute then
     shpBack.Brush.Color := ColorDialog2.Color;
end;

procedure TfrmSettings.SpeedButton1Click(Sender: TObject);
begin
    if canSelColor and ColorDialog2.Execute then
      shpFont.Brush.Color := ColorDialog2.Color;
end;

procedure TfrmSettings.DisableColorSettings;
begin
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
  Label1.Enabled := False;
  Label2.Enabled := False;
  shpFont.Pen.Mode := pmXor;
  shpBack.Pen.Mode := pmXor;
  canSelColor := False;
end;

procedure TfrmSettings.EnableColorSettings;
begin
  SpeedButton1.Enabled := True;
  SpeedButton2.Enabled := True;
  Label1.Enabled := True;
  Label2.Enabled := True;
  shpFont.Pen.Mode := pmCopy;
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


end.
