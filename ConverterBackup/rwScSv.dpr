program rwScSv;

uses
  Forms,
  SysUtils,
  Dialogs,
  StrUtils,
  uScsv in 'uScsv.pas' {frmScreensaver},
  uSett in 'uSett.pas' {frmSettings},
  uConf in 'uConf.pas' {frmConfirm},
  uFont in 'uFont.pas' {frmFontConfig},
  uAbou in 'uAbou.pas' {frmAbout};

{$E scr}

{$R *.res}

{$D SCRNSAVE rndware Screen Saver}

begin
  Application.Initialize;
  Application.Title := 'rndware Screensaver';
  if (ParamCount > 0) then begin
    if (UpperCase(ParamStr(1)) = '/S') then begin
      Application.CreateForm(TfrmScreensaver, frmScreensaver);
      Application.CreateForm(TfrmSettings, frmSettings);
    end else if (LeftStr(UpperCase(ParamStr(1)),2) = '/C') then begin
      Application.CreateForm(TfrmSettings, frmSettings);
      Application.CreateForm(TfrmFontConfig, frmFontConfig);
      Application.CreateForm(TfrmAbout, frmAbout);
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
