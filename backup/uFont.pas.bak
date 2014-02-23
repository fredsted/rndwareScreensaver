unit uFont;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmFontConfig = class(TForm)
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    fontPreviewLabel: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFontConfig: TfrmFontConfig;

implementation

uses uSett;

{$R *.dfm}

procedure TfrmFontConfig.FormShow(Sender: TObject);
begin
  Listbox1.Items.AddStrings(Screen.Fonts);
end;

procedure TfrmFontConfig.ListBox1Click(Sender: TObject);
begin
  if ListBox1.ItemIndex <> -1 then begin
   fontPreviewLabel.Font.Name := ListBox1.Items[ListBox1.ItemIndex];
  end;
end;

procedure TfrmFontConfig.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFontConfig.Button1Click(Sender: TObject);
begin
  frmSettings.btnFont.Font.Name := fontPreviewLabel.Font.Name;
  Close;
end;

procedure TfrmFontConfig.Button3Click(Sender: TObject);
var
I: integer;
begin
  for I := 0 to ListBox1.Items.Count-1 do
    if ListBox1.Items[I] = 'Tahoma' then
      ListBox1.Selected[I] := True;
      
  fontPreviewLabel.Font.Name := 'Tahoma';
end;

end.
