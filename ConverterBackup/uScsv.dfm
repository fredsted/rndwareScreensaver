object frmScreensaver: TfrmScreensaver
  Left = 539
  Top = 113
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Screensaver'
  ClientHeight = 268
  ClientWidth = 371
  Color = 8421440
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 105
    Height = 105
    AutoSize = True
    Center = True
    Transparent = True
  end
  object bl: TLabel
    Left = 16
    Top = 16
    Width = 49
    Height = 13
    Caption = 'Loading...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object tmrScreensaver: TTimer
    OnTimer = tmrScreensaverTimer
    Left = 104
    Top = 8
  end
  object mouseTimer: TTimer
    Interval = 10000
    OnTimer = mouseTimerTimer
    Left = 136
    Top = 8
  end
  object tmrTextUpdater: TTimer
    OnTimer = tmrTextUpdaterTimer
    Left = 168
    Top = 8
  end
end
