object FrmLocador: TFrmLocador
  Left = 394
  Top = 247
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Locador'
  ClientHeight = 291
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 86
    Height = 13
    Caption = 'C'#243'digo do locador'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 81
    Height = 13
    Caption = 'Nome do locador'
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 16
    Top = 112
    Width = 16
    Height = 13
    Caption = 'RG'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 104
    Top = 112
    Width = 20
    Height = 13
    Caption = 'CPF'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 16
    Top = 160
    Width = 46
    Height = 13
    Caption = 'Endere'#231'o'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 488
    Top = 160
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 664
    Top = 160
    Width = 14
    Height = 13
    Caption = 'UF'
  end
  object Label9: TLabel
    Left = 16
    Top = 208
    Width = 25
    Height = 13
    Caption = 'Email'
    FocusControl = DBEdit9
  end
  object Label10: TLabel
    Left = 344
    Top = 208
    Width = 57
    Height = 13
    Caption = 'Bloqueado?'
    FocusControl = DBEdit10
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 32
    Width = 134
    Height = 21
    DataField = 'codigo_loc'
    DataSource = DMeclipse.DStblocador
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 80
    Width = 521
    Height = 21
    DataField = 'nome_loc'
    DataSource = DMeclipse.DStblocador
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 16
    Top = 128
    Width = 73
    Height = 21
    DataField = 'rg_loc'
    DataSource = DMeclipse.DStblocador
    MaxLength = 12
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 104
    Top = 128
    Width = 73
    Height = 21
    DataField = 'cpf_loc'
    DataSource = DMeclipse.DStblocador
    MaxLength = 14
    TabOrder = 3
  end
  object DBEdit6: TDBEdit
    Left = 16
    Top = 176
    Width = 459
    Height = 21
    DataField = 'end_loc'
    DataSource = DMeclipse.DStblocador
    TabOrder = 4
  end
  object DBEdit7: TDBEdit
    Left = 488
    Top = 176
    Width = 161
    Height = 21
    DataField = 'cid_loc'
    DataSource = DMeclipse.DStblocador
    TabOrder = 5
  end
  object DBEdit9: TDBEdit
    Left = 16
    Top = 224
    Width = 313
    Height = 21
    CharCase = ecLowerCase
    DataField = 'email_loc'
    DataSource = DMeclipse.DStblocador
    TabOrder = 6
  end
  object DBEdit10: TDBEdit
    Left = 344
    Top = 224
    Width = 17
    Height = 21
    CharCase = ecLowerCase
    DataField = 'Block_loc'
    DataSource = DMeclipse.DStblocador
    TabOrder = 7
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 568
    Top = 64
    Width = 129
    Height = 41
    Caption = ' Sexo '
    Columns = 2
    DataField = 'sx_loc'
    DataSource = DMeclipse.DStblocador
    Items.Strings = (
      'Fem'
      'Masc')
    TabOrder = 8
    Values.Strings = (
      'F'
      'M')
  end
  object DBEdit8: TDBEdit
    Left = 664
    Top = 176
    Width = 30
    Height = 21
    DataField = 'uf_loc'
    DataSource = DMeclipse.DStblocador
    TabOrder = 9
  end
end
