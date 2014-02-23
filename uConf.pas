unit uConf;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmConfirm = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Bevel1: TBevel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfirm: TfrmConfirm;

implementation

uses uSett;

{$R *.lfm}

procedure TfrmConfirm.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmConfirm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfirm.Button3Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
