object frmAbout: TfrmAbout
  Left = 192
  Top = 408
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 229
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 249
    Height = 33
    Caption = 'rndware Screensaver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 64
    Width = 66
    Height = 13
    Caption = 'Developed by'
  end
  object Label3: TLabel
    Left = 144
    Top = 64
    Width = 74
    Height = 13
    Caption = 'Simon Fredsted'
  end
  object Label4: TLabel
    Left = 40
    Top = 88
    Width = 22
    Height = 13
    Caption = 'Web'
  end
  object Label5: TLabel
    Left = 144
    Top = 88
    Width = 90
    Height = 13
    Cursor = crHandPoint
    Caption = 'www.rndware.info'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label5Click
  end
  object Label6: TLabel
    Left = 40
    Top = 112
    Width = 18
    Height = 13
    Caption = 'Mail'
  end
  object Label7: TLabel
    Left = 144
    Top = 112
    Width = 109
    Height = 13
    Cursor = crHandPoint
    Caption = 'support@rndware.info'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label7Click
  end
  object Bevel1: TBevel
    Left = -8
    Top = 168
    Width = 321
    Height = 3
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 110
    Top = 184
    Width = 77
    Height = 27
  end
  object Bevel3: TBevel
    Left = -24
    Top = 48
    Width = 321
    Height = 3
    Shape = bsTopLine
  end
  object Label8: TLabel
    Left = 40
    Top = 136
    Width = 35
    Height = 13
    Caption = 'Version'
  end
  object lblVersion: TLabel
    Left = 144
    Top = 136
    Width = 46
    Height = 13
    Caption = 'loading...'
  end
  object Label9: TLabel
    Left = 216
    Top = 136
    Width = 66
    Height = 13
    Cursor = crHandPoint
    Caption = 'reset settings'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label9Click
  end
  object Button1: TButton
    Left = 111
    Top = 185
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
end
