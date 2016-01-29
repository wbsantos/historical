object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form2'
  ClientHeight = 300
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 480
    Height = 300
    Align = alClient
    ExplicitLeft = 207
    ExplicitWidth = 300
    ExplicitHeight = 273
  end
  object SpeedButton1: TSpeedButton
    Left = 152
    Top = 232
    Width = 161
    Height = 49
    Caption = 'OK'
    OnClick = SpeedButton1Click
  end
  object XPManifest1: TXPManifest
    Left = 432
    Top = 248
  end
end
