  unit uAbou;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI;

type
  TfrmAbout = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Button1: TButton;
    Bevel3: TBevel;
    Label8: TLabel;
    lblVersion: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Execute(What: string);
    procedure Label9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

uses uSett;

{$R *.dfm}

procedure TfrmAbout.Button1Click(Sender: TObject);
begin
 Close;
end;

function GetAppVersionStr: string;
var
  Exe: string;
  Size, Handle: DWORD;
  Buffer: array of Char;
  FixedPtr: PVSFixedFileInfo;
begin
  Exe := ParamStr(0);
  Size := GetFileVersionInfoSize(PChar(Exe), Handle);
  if Size = 0 then
    RaiseLastOSError;
  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(Exe), Handle, Size, Buffer) then
    RaiseLastOSError;
  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
    RaiseLastOSError;
  Result := Format('%d.%d.%d build %d',
    [LongRec(FixedPtr.dwFileVersionMS).Hi,  //major
     LongRec(FixedPtr.dwFileVersionMS).Lo,  //minor
     LongRec(FixedPtr.dwFileVersionLS).Hi,  //release
     LongRec(FixedPtr.dwFileVersionLS).Lo]) //build
end;

procedure TfrmAbout.Execute(What: string);
begin
  ShellExecute(handle,'open',PChar(What), '','',SW_SHOWNORMAL);
end;

procedure TfrmAbout.Label5Click(Sender: TObject);
begin
  Execute('http://www.rndware.info')
end;

procedure TfrmAbout.Label7Click(Sender: TObject);
begin
  Execute('support@rndware.info');
end;

procedure TfrmAbout.FormShow(Sender: TObject);
begin
  lblVersion.Caption := GetAppVersionStr;
end;

procedure TfrmAbout.Label9Click(Sender: TObject);
begin
 DeleteFile(frmSettings.configFile);
 Application.MessageBox(PChar('Reset Settings!'), PChar('Congrats.'));
 frmSettings.LoadConfig;
end;

end.
