object frmPesq_tur: TfrmPesq_tur
  Left = 287
  Top = 188
  Width = 491
  Height = 407
  Caption = 'Pesquisa de Turma'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 483
    Height = 373
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 16
      Top = 96
      Width = 449
      Height = 209
      DataSource = dspesq_t
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo_tur'
          Title.Caption = 'Cod. Turma'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome_tur'
          Title.Caption = 'Nome turma'
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome_cur'
          Title.Caption = 'Nome curso'
          Width = 133
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'status_tur'
          Title.Caption = 'Turma fin.'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome_vol'
          Title.Caption = 'Nome vol.'
          Width = 201
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_ini'
          Title.Caption = 'Dt. inicial'
          Width = 67
          Visible = True
        end>
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 32
      Width = 113
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'Nome'
      Items.Strings = (
        'Nome'
        'Codigo'
        'Dt. Inicial')
    end
    object Edit1: TEdit
      Left = 144
      Top = 32
      Width = 321
      Height = 21
      TabOrder = 2
      OnExit = Edit1Exit
    end
    object Button1: TButton
      Left = 16
      Top = 328
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object dspesq_t: TDataSource
    DataSet = ADOpesq_t
    Left = 312
    Top = 224
  end
  object ADOpesq_t: TADOQuery
    Connection = DMeclipse.ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT tb_turma.codigo_tur,'
      '               tb_turma.nome_tur, '
      '               tb_curso.nome_cur,'
      '               tb_turma.status_tur,'
      '               tb_voluntario.nome_vol, '
      '               tb_turma.dt_ini'
      'FROM tb_voluntario '
      '           INNER JOIN (tb_curso '
      '                                 INNER JOIN tb_turma '
      
        '                                               ON tb_curso.codig' +
        'o_cur = tb_turma.codigo_cur) '
      
        '                                 ON tb_voluntario.codigo_vol = t' +
        'b_turma.codigo_vol')
    Left = 280
    Top = 224
    object ADOpesq_tcodigo_tur: TAutoIncField
      FieldName = 'codigo_tur'
      ReadOnly = True
    end
    object ADOpesq_tnome_tur: TWideStringField
      FieldName = 'nome_tur'
      Size = 35
    end
    object ADOpesq_tnome_cur: TWideStringField
      FieldName = 'nome_cur'
      Size = 25
    end
    object ADOpesq_tstatus_tur: TWideStringField
      FieldName = 'status_tur'
    end
    object ADOpesq_tnome_vol: TWideStringField
      FieldName = 'nome_vol'
      Size = 50
    end
    object ADOpesq_tdt_ini: TDateTimeField
      FieldName = 'dt_ini'
    end
  end
end
