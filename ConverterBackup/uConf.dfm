object frmConfirm: TfrmConfirm
  Left = 206
  Top = 121
  BorderStyle = bsDialog
  Caption = 'Really Close?'
  ClientHeight = 130
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    353
    130)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 321
    Height = 57
    Alignment = taCenter
    Anchors = [akTop]
    AutoSize = False
    Caption = 'Do you want to keep your changes?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object Bevel1: TBevel
    Left = 0
    Top = 72
    Width = 353
    Height = 4
    Shape = bsTopLine
  end
  object Button1: TButton
    Left = 27
    Top = 92
    Width = 97
    Height = 25
    Caption = 'Discard Changes'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 142
    Top = 92
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 238
    Top = 92
    Width = 91
    Height = 25
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 6
    ParentFont = False
    TabOrder = 0
    OnClick = Button3Click
  end
end
