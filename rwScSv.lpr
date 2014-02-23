program rwScSv;

{$MODE Delphi}

uses
  Forms,
  LCLIntf, LCLType, LMessages,
  SysUtils,
  Dialogs, Interfaces,
  StrUtils,

  uScsv in 'uScsv.pas' {frmScreensaver},
  uSett in 'uSett.pas' {frmSettings},
  uConf in 'uConf.pas' {frmConfirm},
  uFont in 'uFont.pas' {frmFontConfig},
  uAbou in 'uAbou.pas' {frmAbout},
  Unit1 in 'Unit1.pas' {Form1};

{$E scr}


//var
 // Mutex: THandle;

{$R *.res}

begin
  // Prevent multiple instances from running
 // Mutex := CreateMutex(nil, True, 'rndware_Screensaver');
 // if (Mutex = 0) OR (GetLastError = ERROR_ALREADY_EXISTS) then
 //   Application.Terminate;
    
  Application.Initialize;
  Application.Title := 'rndware Screensaver';

  // Allows us to debug screensaver while showing the screensaver when
  // launching the executable from e.g. Explorer.
  if (ParamCount > 0) then begin
    if (UpperCase(ParamStr(1)) = '/S') then begin
      Application.CreateForm(TfrmScreensaver, frmScreensaver);
      Application.CreateForm(TfrmSettings, frmSettings);
    end else if (LeftStr(UpperCase(ParamStr(1)),2) = '/C') then begin
      Application.CreateForm(TForm1, Form1);
      Application.CreateForm(TfrmSettings, frmSettings);
      Application.CreateForm(TfrmFontConfig, frmFontConfig);
      Application.CreateForm(TfrmAbout, frmAbout);
      Application.CreateForm(TfrmConfirm, frmConfirm);
      Application.CreateForm(TfrmScreensaver, frmScreensaver);
    end;
  end else begin
      Application.CreateForm(TfrmSettings, frmSettings);
      Application.CreateForm(TfrmFontConfig, frmFontConfig);
      Application.CreateForm(TfrmAbout, frmAbout);
      Application.CreateForm(TfrmConfirm, frmConfirm);
      Application.CreateForm(TfrmScreensaver, frmScreensaver);
   end;
  Application.Run;
end.
