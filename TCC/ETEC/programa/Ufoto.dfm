object Foto: TFoto
  Left = 242
  Top = 180
  Width = 531
  Height = 394
  Caption = 'Foto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 232
    Top = 320
    Width = 73
    Height = 25
    Caption = 'Fotografar'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 328
    Top = 320
    Width = 73
    Height = 25
    Caption = 'Confirmar'
    Enabled = False
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 136
    Top = 320
    Width = 73
    Height = 25
    Caption = 'Descartar'
    Enabled = False
    OnClick = SpeedButton3Click
  end
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 505
    Height = 305
    Stretch = True
    Visible = False
  end
  object JLCVideo1: TJLCVideo
    Left = 8
    Top = 8
    Width = 505
    Height = 305
    FicheroVideo = 'Video.avi'
    FicheroImagen = 'foto.bmp'
    Overlay = False
  end
end
