object frmfecharaba: Tfrmfecharaba
  Left = 0
  Top = 0
  Caption = 'Salvar?'
  ClientHeight = 120
  ClientWidth = 409
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
    Left = 16
    Top = 32
    Width = 216
    Height = 16
    Caption = 'Salvar as altera'#231#245'es em documento 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnsalvar: TBitBtn
    Left = 16
    Top = 64
    Width = 90
    Height = 25
    Caption = '&Salvar'
    DoubleBuffered = True
    Kind = bkYes
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = btnsalvarClick
  end
  object naosalvar: TBitBtn
    Left = 112
    Top = 64
    Width = 90
    Height = 25
    Caption = '&N'#227'o Salvar'
    DoubleBuffered = True
    Kind = bkNo
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = naosalvarClick
  end
  object cancelar: TBitBtn
    Left = 208
    Top = 64
    Width = 90
    Height = 25
    Caption = '&Cancelar'
    DoubleBuffered = True
    Kind = bkCancel
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = cancelarClick
  end
  object saveall: TBitBtn
    Left = 304
    Top = 64
    Width = 90
    Height = 25
    Caption = 'S&alvar Tudo'
    DoubleBuffered = True
    Kind = bkAll
    ParentDoubleBuffered = False
    TabOrder = 3
    Visible = False
    OnClick = saveallClick
  end
end
