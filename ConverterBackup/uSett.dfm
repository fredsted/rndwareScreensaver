object frmSettings: TfrmSettings
  Left = 204
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Screensaver settings'
  ClientHeight = 463
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    318
    463)
  PixelsPerInch = 96
  TextHeight = 13
  object shpFont: TShape
    Left = 14
    Top = 204
    Width = 27
    Height = 27
    Cursor = crHandPoint
    Pen.Style = psClear
  end
  object Bevel1: TBevel
    Left = 0
    Top = 145
    Width = 321
    Height = 4
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 53
    Top = 211
    Width = 48
    Height = 13
    Caption = 'Font color'
  end
  object shpBack: TShape
    Left = 14
    Top = 236
    Width = 27
    Height = 27
    Cursor = crHandPoint
    Brush.Color = clBlack
    Pen.Style = psClear
  end
  object Label2: TLabel
    Left = 53
    Top = 243
    Width = 82
    Height = 13
    Caption = 'Background color'
  end
  object Bevel4: TBevel
    Left = -8
    Top = 289
    Width = 329
    Height = 4
    Shape = bsTopLine
  end
  object Bevel5: TBevel
    Left = -8
    Top = 353
    Width = 329
    Height = 4
    Shape = bsTopLine
  end
  object SpeedButton1: TSpeedButton
    Left = 14
    Top = 204
    Width = 147
    Height = 26
    Cursor = crHandPoint
    Flat = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 14
    Top = 236
    Width = 147
    Height = 26
    Cursor = crHandPoint
    Flat = True
    OnClick = SpeedButton2Click
  end
  object Bevel2: TBevel
    Left = -9
    Top = 409
    Width = 329
    Height = 4
    Shape = bsTopLine
  end
  object Label5: TLabel
    Left = 10
    Top = 315
    Width = 43
    Height = 13
    Caption = 'Font size'
  end
  object btnFont: TSpeedButton
    Left = 192
    Top = 168
    Width = 113
    Height = 105
    Caption = 'Set font'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnFontClick
  end
  object Bevel3: TBevel
    Left = 176
    Top = 152
    Width = 9
    Height = 129
    Shape = bsLeftLine
  end
  object Label3: TLabel
    Left = 13
    Top = 376
    Width = 96
    Height = 13
    Caption = 'Duration of change:'
  end
  object Label4: TLabel
    Left = 181
    Top = 376
    Width = 39
    Height = 13
    Caption = 'seconds'
  end
  object Label7: TLabel
    Left = 72
    Top = 336
    Width = 33
    Height = 11
    Caption = 'smallest'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 280
    Top = 336
    Width = 29
    Height = 11
    Caption = 'biggest'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 180
    Top = 425
    Width = 105
    Height = 25
    Anchors = [akTop]
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 68
    Top = 425
    Width = 105
    Height = 25
    Anchors = [akTop]
    Caption = 'Test'
    TabOrder = 1
    OnClick = Button2Click
  end
  object chkRandom: TCheckBox
    Left = 15
    Top = 166
    Width = 97
    Height = 17
    Caption = 'Random Colors'
    TabOrder = 2
    OnClick = chkRandomClick
  end
  object Button3: TButton
    Left = 256
    Top = 12
    Width = 48
    Height = 17
    Hint = 'Add variables'
    Caption = 'Variables'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button3Click
  end
  object fontSize: TTrackBar
    Left = 69
    Top = 303
    Width = 241
    Height = 29
    Ctl3D = True
    Max = 250
    Min = 10
    ParentCtl3D = False
    PageSize = 1
    Frequency = 10
    Position = 10
    TabOrder = 4
  end
  object udDuration: TUpDown
    Left = 154
    Top = 373
    Width = 15
    Height = 21
    Associate = edChangeSeconds
    Min = 1
    Position = 5
    TabOrder = 5
  end
  object edChangeSeconds: TEdit
    Left = 121
    Top = 373
    Width = 33
    Height = 21
    TabOrder = 6
    Text = '5'
  end
  object screensaverMemo: TMemo
    Left = 16
    Top = 32
    Width = 289
    Height = 49
    Lines.Strings = (
      'rndware Screensaver')
    TabOrder = 7
  end
  object Button4: TButton
    Left = 33
    Top = 425
    Width = 25
    Height = 25
    Caption = '?'
    TabOrder = 8
    OnClick = Button4Click
  end
  object edPicturePath: TEdit
    Left = 16
    Top = 112
    Width = 217
    Height = 21
    TabOrder = 9
  end
  object Button6: TButton
    Left = 240
    Top = 112
    Width = 65
    Height = 21
    Caption = 'Select Files'
    TabOrder = 10
    OnClick = Button6Click
  end
  object chkShowText: TCheckBox
    Left = 16
    Top = 14
    Width = 97
    Height = 17
    Caption = 'Show Text'
    Checked = True
    State = cbChecked
    TabOrder = 11
  end
  object chkShowPictures: TCheckBox
    Left = 16
    Top = 94
    Width = 97
    Height = 17
    Caption = 'Show picture(s)'
    TabOrder = 12
  end
  object popVariables: TPopupMenu
    Left = 160
    Top = 449
    object ime00001: TMenuItem
      Caption = 'Time'
      OnClick = ime00001Click
    end
    object imeDate1: TMenuItem
      Caption = 'Date'
      OnClick = imeDate1Click
    end
    object ComputerName1: TMenuItem
      Caption = 'Computer Name'
      OnClick = ComputerName1Click
    end
    object Uptime1: TMenuItem
      Caption = 'Uptime'
      OnClick = Uptime1Click
    end
  end
  object ColorDialog1: TColorDialog
    Left = 112
    Top = 448
  end
  object ColorDialog2: TColorDialog
    Left = 72
    Top = 456
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 200
    Top = 464
  end
end
