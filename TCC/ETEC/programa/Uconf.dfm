object frmconfirmsenha: Tfrmconfirmsenha
  Left = 349
  Top = 143
  Width = 190
  Height = 150
  Caption = 'Confirma'#231#227'o de Senha'
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 134
    Height = 13
    Caption = 'Digite sua senha de usu'#225'rio:'
  end
  object Label3: TLabel
    Left = 17
    Top = 95
    Width = 101
    Height = 13
    Cursor = crHandPoint
    Caption = 'Esqueci minha senha'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    OnClick = Label3Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 32
    Width = 145
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 64
    Width = 65
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 64
    Width = 65
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = Button2Click
  end
end
