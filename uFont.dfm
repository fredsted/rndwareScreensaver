object frmFontConfig: TfrmFontConfig
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Font Chooser'
  ClientHeight = 271
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 216
    Top = 3
    Width = 505
    Height = 214
    Caption = 'Preview'
    TabOrder = 0
    object fontPreviewLabel: TLabel
      Left = 8
      Top = 24
      Width = 489
      Height = 169
      Alignment = taCenter
      AutoSize = False
      Caption = 'My girl wove six dozen plaid jackets before she quit. 123567890'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
  end
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 201
    Height = 209
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 1
    OnClick = ListBox1Click
  end
  object Button1: TButton
    Left = 616
    Top = 232
    Width = 107
    Height = 25
    Caption = 'Use this font'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 528
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Default'
    TabOrder = 4
    OnClick = Button3Click
  end
end
