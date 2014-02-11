object frmScreensaver: TfrmScreensaver
  Left = 500
  Top = 408
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Screensaver'
  ClientHeight = 45
  ClientWidth = 170
  Color = 8421440
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
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
    Left = 136
    Top = 8
  end
end
