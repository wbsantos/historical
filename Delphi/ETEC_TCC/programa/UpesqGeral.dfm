object Frmpesq: TFrmpesq
  Left = 286
  Top = 77
  Width = 464
  Height = 450
  Caption = 'Consulta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 416
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 374
      Width = 454
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      Color = clActiveBorder
      TabOrder = 3
      object Button1: TButton
        Left = 184
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Sair'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object Edit1: TEdit
      Left = 152
      Top = 24
      Width = 273
      Height = 21
      TabOrder = 1
      OnExit = Edit1Exit
    end
    object ComboBox1: TComboBox
      Left = 24
      Top = 24
      Width = 113
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Nome'
      Items.Strings = (
        'Nome'
        'Codigo')
    end
    object DBGrid1: TDBGrid
      Left = 24
      Top = 88
      Width = 401
      Height = 273
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
    end
  end
end
