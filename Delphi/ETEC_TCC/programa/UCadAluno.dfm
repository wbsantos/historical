object FrmAluno: TFrmAluno
  Left = 76
  Top = 125
  VertScrollBar.ParentColor = False
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Aluno'
  ClientHeight = 378
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pagecontrol_alu: TPageControl
    Left = 0
    Top = 48
    Width = 754
    Height = 330
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Dados do aluno'
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 84
        Height = 13
        Caption = 'C'#243'digo do Aluno: '
      end
      object DBText1: TDBText
        Left = 96
        Top = 16
        Width = 65
        Height = 17
        DataField = 'codigo_alu'
        DataSource = DMeclipse.DStbaluno
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 72
        Height = 13
        Caption = 'Nome do aluno'
        FocusControl = DBEdit2
      end
      object Label4: TLabel
        Left = 8
        Top = 96
        Width = 95
        Height = 13
        Caption = 'Data de nascimento'
      end
      object Label5: TLabel
        Left = 117
        Top = 96
        Width = 16
        Height = 13
        Caption = 'RG'
      end
      object Label6: TLabel
        Left = 235
        Top = 96
        Width = 68
        Height = 13
        Caption = 'Nacionalidade'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 399
        Top = 96
        Width = 60
        Height = 13
        Caption = 'Naturalidade'
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 8
        Top = 144
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 414
        Top = 144
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit9
      end
      object Label10: TLabel
        Left = 474
        Top = 144
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = DBEdit10
      end
      object Label11: TLabel
        Left = 8
        Top = 192
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit11
      end
      object Label13: TLabel
        Left = 311
        Top = 192
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBEdit13
      end
      object Label14: TLabel
        Left = 507
        Top = 192
        Width = 14
        Height = 13
        Caption = 'UF'
      end
      object Label12: TLabel
        Left = 216
        Top = 192
        Width = 21
        Height = 13
        Caption = 'CEP'
      end
      object Label39: TLabel
        Left = 584
        Top = 56
        Width = 66
        Height = 13
        Caption = 'Foto do Aluno'
      end
      object Label3: TLabel
        Left = 8
        Top = 240
        Width = 25
        Height = 13
        Caption = 'Email'
      end
      object SpeedButton1: TSpeedButton
        Left = 584
        Top = 240
        Width = 49
        Height = 22
        Caption = 'Foto'
        Enabled = False
        OnClick = SpeedButton1Click
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 64
        Width = 417
        Height = 21
        Color = clBtnFace
        DataField = 'nome_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        Left = 235
        Top = 112
        Width = 150
        Height = 21
        Color = clBtnFace
        DataField = 'nacional_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        TabOrder = 3
      end
      object DBEdit7: TDBEdit
        Left = 403
        Top = 112
        Width = 154
        Height = 21
        Color = clBtnFace
        DataField = 'natural_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        TabOrder = 4
      end
      object DBEdit8: TDBEdit
        Left = 8
        Top = 160
        Width = 393
        Height = 21
        Color = clBtnFace
        DataField = 'end_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        TabOrder = 5
      end
      object DBEdit9: TDBEdit
        Left = 414
        Top = 160
        Width = 45
        Height = 21
        Color = clBtnFace
        DataField = 'num_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        TabOrder = 6
      end
      object DBEdit10: TDBEdit
        Left = 474
        Top = 160
        Width = 83
        Height = 21
        Color = clBtnFace
        DataField = 'compl_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        TabOrder = 7
      end
      object DBEdit11: TDBEdit
        Left = 8
        Top = 208
        Width = 193
        Height = 21
        Color = clBtnFace
        DataField = 'bairro_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        TabOrder = 8
      end
      object DBEdit12: TDBEdit
        Left = 216
        Top = 208
        Width = 81
        Height = 21
        Color = clBtnFace
        DataField = 'cep_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        MaxLength = 9
        TabOrder = 9
        OnKeyPress = bloqletra
      end
      object DBEdit13: TDBEdit
        Left = 311
        Top = 208
        Width = 185
        Height = 21
        Color = clBtnFace
        DataField = 'cid_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        TabOrder = 10
      end
      object DBRGsexo: TDBRadioGroup
        Left = 442
        Top = 51
        Width = 115
        Height = 41
        Caption = ' Sexo '
        Columns = 2
        DataField = 'sx_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        Items.Strings = (
          'Fem'
          'Masc')
        TabOrder = 1
        Values.Strings = (
          'F'
          'M')
      end
      object DBEdit3: TDBEdit
        Left = 117
        Top = 112
        Width = 105
        Height = 21
        CharCase = ecLowerCase
        Color = clBtnFace
        DataField = 'rg_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        MaxLength = 12
        TabOrder = 2
        OnKeyPress = bloqletrarg
      end
      object DBComboBox1: TDBComboBox
        Left = 507
        Top = 208
        Width = 50
        Height = 21
        Style = csDropDownList
        Color = clBtnFace
        DataField = 'uf_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ItemHeight = 13
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RR'
          'RO'
          'RJ'
          'RN'
          'RS'
          'SC'
          'SP'
          'SE'
          'TO')
        TabOrder = 11
      end
      object DBImage1: TDBImage
        Left = 584
        Top = 72
        Width = 153
        Height = 161
        Color = clBtnFace
        DataField = 'foto'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        Stretch = True
        TabOrder = 13
        TabStop = False
      end
      object DBEdit4: TDBEdit
        Left = 8
        Top = 256
        Width = 257
        Height = 21
        Color = clBtnFace
        DataField = 'email'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        TabOrder = 12
      end
      object data: TDateTimePicker
        Left = 8
        Top = 112
        Width = 97
        Height = 21
        Date = 39978.647282511570000000
        Time = 39978.647282511570000000
        Color = clBtnFace
        Enabled = False
        TabOrder = 14
      end
      object DBRadioGroup3: TDBRadioGroup
        Left = 315
        Top = 241
        Width = 217
        Height = 41
        Caption = 'Status do aluno'
        Columns = 2
        DataField = 'Status'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        Items.Strings = (
          'Cursando'
          'N'#227'o Cursando')
        TabOrder = 15
        Values.Strings = (
          'C'
          'N')
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Dados paternos'
      ImageIndex = 1
      object Label15: TLabel
        Left = 8
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Nome da m'#227'e'
        FocusControl = DBEdit15
      end
      object Label16: TLabel
        Left = 352
        Top = 8
        Width = 81
        Height = 13
        Caption = 'Profiss'#227'o da m'#227'e'
        FocusControl = DBEdit16
      end
      object Label17: TLabel
        Left = 504
        Top = 8
        Width = 54
        Height = 13
        Caption = 'RG da m'#227'e'
        FocusControl = DBEdit17
      end
      object Label18: TLabel
        Left = 592
        Top = 8
        Width = 58
        Height = 13
        Caption = 'CPF da m'#227'e'
        FocusControl = DBEdit18
      end
      object Label19: TLabel
        Left = 8
        Top = 56
        Width = 61
        Height = 13
        Caption = 'Nome do Pai'
        FocusControl = DBEdit19
      end
      object Label20: TLabel
        Left = 352
        Top = 56
        Width = 75
        Height = 13
        Caption = 'Profiss'#227'o do pai'
        FocusControl = DBEdit20
      end
      object Label21: TLabel
        Left = 504
        Top = 56
        Width = 48
        Height = 13
        Caption = 'RG do pai'
        FocusControl = DBEdit21
      end
      object Label22: TLabel
        Left = 592
        Top = 56
        Width = 52
        Height = 13
        Caption = 'CPF do pai'
        FocusControl = DBEdit22
      end
      object Label24: TLabel
        Left = 605
        Top = 100
        Width = 75
        Height = 13
        Cursor = crHandPoint
        Caption = 'Receita Federal'
        Color = clAppWorkSpace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentColor = False
        ParentFont = False
        Transparent = True
        OnClick = Label24Click
      end
      object DBEdit15: TDBEdit
        Left = 8
        Top = 24
        Width = 337
        Height = 21
        Color = clBtnFace
        DataField = 'mae_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit16: TDBEdit
        Left = 352
        Top = 24
        Width = 145
        Height = 21
        Color = clBtnFace
        DataField = 'profmae_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit17: TDBEdit
        Left = 504
        Top = 24
        Width = 81
        Height = 21
        CharCase = ecLowerCase
        Color = clBtnFace
        DataField = 'rgmae_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        MaxLength = 12
        ReadOnly = True
        TabOrder = 2
        OnKeyPress = bloqletrarg
      end
      object DBEdit18: TDBEdit
        Left = 592
        Top = 24
        Width = 89
        Height = 21
        Color = clBtnFace
        DataField = 'cpfmae_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        MaxLength = 14
        ReadOnly = True
        TabOrder = 3
        OnKeyPress = bloqletra
      end
      object DBEdit19: TDBEdit
        Left = 8
        Top = 72
        Width = 337
        Height = 21
        Color = clBtnFace
        DataField = 'pai_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit20: TDBEdit
        Left = 352
        Top = 72
        Width = 145
        Height = 21
        Color = clBtnFace
        DataField = 'profpai_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit21: TDBEdit
        Left = 504
        Top = 72
        Width = 81
        Height = 21
        CharCase = ecLowerCase
        Color = clBtnFace
        DataField = 'rgpai_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        MaxLength = 12
        ReadOnly = True
        TabOrder = 6
        OnKeyPress = bloqletrarg
      end
      object DBEdit22: TDBEdit
        Left = 592
        Top = 72
        Width = 89
        Height = 21
        Color = clBtnFace
        DataField = 'cpfpai_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        MaxLength = 14
        ReadOnly = True
        TabOrder = 7
        OnKeyPress = bloqletra
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Informa'#231#245'es gerais'
      ImageIndex = 2
      object Label23: TLabel
        Left = 144
        Top = 176
        Width = 67
        Height = 13
        Caption = 'Renda familiar'
        FocusControl = DBEdit23
      end
      object Label25: TLabel
        Left = 448
        Top = 176
        Width = 62
        Height = 13
        Caption = 'Valor Aluguel'
        FocusControl = DBEdit25
      end
      object Label26: TLabel
        Left = 296
        Top = 176
        Width = 106
        Height = 13
        Caption = 'Pessoas na residencia'
        FocusControl = DBEdit26
      end
      object Label27: TLabel
        Left = 8
        Top = 176
        Width = 122
        Height = 13
        Caption = 'Como conheceu o curso?'
        FocusControl = DBEdit27
      end
      object Label29: TLabel
        Left = 547
        Top = 8
        Width = 137
        Height = 13
        Caption = 'Tipo da escola a qual estuda'
        FocusControl = DBEdit29
      end
      object Label30: TLabel
        Left = 208
        Top = 8
        Width = 139
        Height = 13
        Caption = 'Nome da escola onde estuda'
        FocusControl = DBEdit30
      end
      object Label31: TLabel
        Left = 105
        Top = 8
        Width = 24
        Height = 13
        Caption = 'S'#233'rie'
        FocusControl = DBEdit31
      end
      object Label32: TLabel
        Left = 8
        Top = 64
        Width = 95
        Height = 13
        Caption = 'Endere'#231'o da escola'
        FocusControl = DBEdit32
      end
      object Label33: TLabel
        Left = 456
        Top = 64
        Width = 76
        Height = 13
        Caption = 'Bairro da escola'
        FocusControl = DBEdit33
      end
      object Label34: TLabel
        Left = 352
        Top = 64
        Width = 70
        Height = 13
        Caption = 'CEP da escola'
        FocusControl = DBEdit34
      end
      object Label35: TLabel
        Left = 8
        Top = 120
        Width = 82
        Height = 13
        Caption = 'Cidade da escola'
        FocusControl = DBEdit35
      end
      object Label36: TLabel
        Left = 152
        Top = 120
        Width = 63
        Height = 13
        Caption = 'UF da escola'
      end
      object Label37: TLabel
        Left = 160
        Top = 232
        Width = 82
        Height = 13
        Caption = 'Data de cadastro'
      end
      object Label38: TLabel
        Left = 8
        Top = 232
        Width = 83
        Height = 13
        Caption = 'C'#243'digo Volunt'#225'rio'
        FocusControl = DBEdit38
      end
      object DBEdit23: TDBEdit
        Left = 144
        Top = 192
        Width = 132
        Height = 21
        Color = clBtnFace
        DataField = 'renda_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 9
        OnKeyPress = bloqletra
      end
      object DBEdit25: TDBEdit
        Left = 448
        Top = 192
        Width = 132
        Height = 21
        Color = clBtnFace
        DataField = 'vlalug_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 11
        OnKeyPress = bloqletra
      end
      object DBEdit26: TDBEdit
        Left = 296
        Top = 192
        Width = 132
        Height = 21
        Color = clBtnFace
        DataField = 'qt_resid_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 10
        OnKeyPress = bloqletra
      end
      object DBEdit27: TDBEdit
        Left = 8
        Top = 192
        Width = 105
        Height = 21
        Color = clBtnFace
        DataField = 'conhece_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit29: TDBEdit
        Left = 547
        Top = 24
        Width = 158
        Height = 21
        Color = clBtnFace
        DataField = 'tpesc_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit30: TDBEdit
        Left = 208
        Top = 24
        Width = 327
        Height = 21
        Color = clBtnFace
        DataField = 'nomeesc_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit31: TDBEdit
        Left = 105
        Top = 24
        Width = 87
        Height = 21
        Color = clBtnFace
        DataField = 'serieesc_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit32: TDBEdit
        Left = 8
        Top = 80
        Width = 329
        Height = 21
        Color = clBtnFace
        DataField = 'endesc_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit33: TDBEdit
        Left = 456
        Top = 80
        Width = 145
        Height = 21
        Color = clBtnFace
        DataField = 'bairroesc_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit34: TDBEdit
        Left = 352
        Top = 80
        Width = 89
        Height = 21
        Color = clBtnFace
        DataField = 'cepesc_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        MaxLength = 9
        ReadOnly = True
        TabOrder = 4
        OnKeyPress = bloqletra
      end
      object DBEdit35: TDBEdit
        Left = 8
        Top = 136
        Width = 129
        Height = 21
        Color = clBtnFace
        DataField = 'cidesc_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBComboBox2: TDBComboBox
        Left = 152
        Top = 136
        Width = 57
        Height = 21
        Style = csDropDownList
        Color = clBtnFace
        DataField = 'ufesc_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ItemHeight = 13
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RR'
          'RO'
          'RJ'
          'RN'
          'RS'
          'SC'
          'SP'
          'SE'
          'TO')
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit38: TDBEdit
        Left = 8
        Top = 248
        Width = 134
        Height = 21
        Color = clBtnFace
        DataField = 'codigo_vol'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        ReadOnly = True
        TabOrder = 12
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 7
        Top = 8
        Width = 93
        Height = 41
        Caption = 'Estudante?'
        Columns = 2
        DataField = 'estuda_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 13
        Values.Strings = (
          's'
          'n')
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 596
        Top = 174
        Width = 93
        Height = 41
        Caption = 'Casa Pr'#243'pria?'
        Columns = 2
        DataField = 'csap_alu'
        DataSource = DMeclipse.DStbaluno
        Enabled = False
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 14
        Values.Strings = (
          's'
          'n')
      end
      object Data2: TDateTimePicker
        Left = 161
        Top = 248
        Width = 97
        Height = 21
        Date = 39978.647282511570000000
        Time = 39978.647282511570000000
        Color = clBtnFace
        Enabled = False
        TabOrder = 15
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 48
    Align = alTop
    BevelInner = bvLowered
    Color = clActiveBorder
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 4
      Top = 2
      Width = 49
      Height = 43
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        20000000000000100000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007D2712007E284A007E2756007E2756007E2756007E2756007E2756007E
        2756007E2756007E2756007E284A007D27120000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E283C0C8532E7108836FF108836FF108836FF0F8836FF0F8836FF0F88
        36FF0F8835FF0E8835FF0A8531E7007E283C0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E2840249548EBC6FED8FFB4FCCCFFABFBC7FFAAFBC6FFA7FBC4FFA6FB
        C3FFA9FCC5FFB5FECDFF209546EB007E28400000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E2840259549EBC2FDD6FF6FF2A1FF4FEE8CFF4FEE8CFF4EEE8CFF4EEE
        8CFF69F29DFFB2FDCBFF219546EB007E28400000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E2840269549EBC5FDD8FF5EF096FF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF5AF093FFB5FDCDFF239547EB007E28400000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E284027954AEBC9FDDBFF5FF097FF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF5BF094FFB9FDD0FF239547EB007E28400000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E284028954AEBCEFDDEFF60F098FF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF5DF095FFBFFDD4FF249548EB007E28400000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E284029954BEBD2FDE1FF61F098FF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF5EF096FFC2FDD6FF259549EB007E28400000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007D2712007E283C007E2840007E2840007E2840007E2840007E2840007E
        2840007E287029944BEFD7FDE4FF63F099FF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF5FF097FFC7FDD9FF259448EF007E2870007E2840007E2840007E2840007E
        2840007E2840007E2840007E283C007D27120000000000000000000000000000
        0000007E284A0F8535E72E954FEB2E954EEB2D954EEB2D954EEB2C954DEB2C95
        4DEB2A944CEF48A566FFDBFDE7FF64F09AFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF60F098FFCCFDDDFF42A562FF269449EF269549EB269549EB259549EB2595
        48EB249548EB249548EB0C8532E7007E284A0000000000000000000000000000
        0000007E275615883AFFFCFEFDFFF1FDF6FFECFDF3FFEBFDF2FFE9FDF0FFE6FD
        EEFFE4FDEDFFE2FDECFFACF7C9FF49ED89FF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF48ED88FFA1F7C2FFCEFDDEFFCCFDDDFFC9FDDBFFC8FDD9FFC5FDD8FFC3FD
        D6FFC2FDD6FF85D39EFF108836FF007E27560000000000000000000000000000
        0000007E275615883AFFE6FCEFFF82F2AEFF69F09EFF69F09EFF68F09DFF68F0
        9DFF67F09CFF67F09CFF4AED89FF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF38EB7EFF48ED88FF61F098FF60F098FF60F097FF5FF097FF5FF096FF5EF0
        96FF71F2A2FFBCFCD2FF118836FF007E27560000000000000000000000000000
        0000007E275615883AFFDEFBE9FF59EE93FF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF52EE8EFFBAFBD1FF118837FF007E27560000000000000000000000000000
        0000007E275615883AFFDEFBE9FF59EE93FF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF53EE8FFFBEFBD4FF118837FF007E27560000000000000000000000000000
        0000007E275615883AFFDEFBE9FF59EE93FF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF53EE90FFC2FBD7FF128838FF007E27560000000000000000000000000000
        0000007E275615883AFFDEFBE9FF59EE93FF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF54EE90FFC6FBD9FF128838FF007E27560000000000000000000000000000
        0000007E275615883AFFE6FCEFFF82F2AEFF69F09EFF69F09EFF69F09EFF69F0
        9EFF69F09EFF69F09EFF4BED8AFF38EB7EFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF38EB7EFF4BED8AFF68F09DFF68F09DFF67F09CFF67F09CFF66F09CFF66F0
        9BFF7BF2A9FFD2FCE1FF128838FF007E27560000000000000000000000000000
        0000007E275615883AFFFCFEFDFFF1FDF6FFEEFDF4FFEEFDF4FFEEFDF4FFEEFD
        F4FFEEFDF4FFEEFDF4FFB7F7D0FF4BED8AFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF4BED8AFFB7F7D0FFEDFDF3FFEBFDF2FFE9FDF0FFE7FDEFFFE4FDEEFFE2FD
        ECFFE2FDECFFEAFEF1FF138838FF007E27560000000000000000000000000000
        0000007E284A0F8535E72E954FEB2E954FEB2E954FEB2E954FEB2E954FEB2E95
        4FEB2D944EEF4EA56AFFEEFDF4FF69F09EFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF69F09EFFEEFDF4FF4EA56AFF2D944EEF2D954EEB2D954EEB2D954EEB2C95
        4DEB2C954DEB2B954DEB0E8534E7007E284A0000000000000000000000000000
        0000007D2712007E283C007E2840007E2840007E2840007E2840007E2840007E
        2840007E28702D944EEFEEFDF4FF69F09EFF38EB7EFF38EB7EFF38EB7EFF38EB
        7EFF69F09EFFEEFDF4FF2D944EEF007E2870007E2840007E2840007E2840007E
        2840007E2840007E2840007E283C007D27120000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E28402E954FEBEFFDF4FF6EF0A1FF3AEB7FFF39EB7EFF38EB7EFF38EB
        7EFF69F09EFFEEFDF4FF2E954FEB007E28400000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E28402E954FEBF0FDF5FF78F2A7FF46ED87FF41EC83FF3BEB80FF39EB
        7EFF69F09EFFEEFDF4FF2E954FEB007E28400000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E28402E954FEBF1FEF6FF85F4B0FF58F092FF52EF8FFF4BEE8AFF46ED
        87FF70F1A2FFEFFDF4FF2E954FEB007E28400000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E28402E954FEBF3FEF7FF90F6B7FF66F29CFF60F198FF5AF094FF54EF
        90FF7AF2A9FFF0FDF5FF2E954FEB007E28400000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E28402E954FEBF6FEF9FFACF9CAFF8CF6B4FF87F6B2FF82F5AEFF7DF4
        ABFF9AF6BDFFF3FDF7FF2E954FEB007E28400000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E28402E954FEBFDFEFDFFEFFEF5FFE9FDF0FFE8FDF0FFE7FDEFFFE6FD
        EEFFEBFDF2FFFCFEFDFF2E954FEB007E28400000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007E283C0F8535E715883AFF15883AFF15883AFF15883AFF15883AFF1588
        3AFF15883AFF15883AFF0F8535E7007E283C0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007D2712007E284A007E2756007E2756007E2756007E2756007E2756007E
        2756007E2756007E2756007E284A007D27120000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object BitBtn2: TBitBtn
      Left = 53
      Top = 2
      Width = 49
      Height = 43
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000000000000000
        B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C
        95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B3
        9C95B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFB39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFF4EDEAF5F0EDF6F0EDF6F1EFF7F2EFF8F3F1F8F4F1F8F5F3F9F5
        F4FAF7F4FAF7F5FBF8F6FBF9F7FCFAF8FCFAF9FDFCFAFEFCFBFEFDFCFFFFFFFE
        FEFDB39C95000000000000000000000000000000000000000000000000000000
        B39C95FEFCFBEFE7E3F0E9E6F1EAE6F1EBE8F2ECE8F3EDEAF3EEEAF4EFECF5F0
        EDF5F1EEF6F1EFF7F3F1F7F3F1F8F4F3F8F5F3F9F6F5F9F7F5FAF8F7FCFBF9FA
        F8F7B39C95000000000000000000000000000000000000000000000000000000
        B39C95FEFCFBF0E9E5F1EBE7F1EBE8F2ECE9F3EDEAF3EEEBF4EFECF5F0EDF5F0
        EEF6F2EFF6F2F0F7F3F1F7F4F2F8F5F3F9F6F4F9F7F6FAF7F6FBF9F7FCFBFAFA
        F8F7B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFDFCF1EAE6F2ECE9F2ECE9F3EEEBF4EEEBF4EFEDF5F0EEF6F1EFF6F2
        F0F7F3F1F7F3F2F8F5F3F8F5F4F9F6F5F9F7F6FAF8F7FBF9F8FBFAF9FDFCFCFA
        F8F8B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFDFCF1EBE7F2ECE9F5F0EDF5F0EEF5F0EEF7F5F4F8F4F1F6F2F0F6F2
        F0F7F3F2F8F4F2F8F5F4F9F6F4FAF7F6FAF8F6FBF9F8FBF9F8FCFAFAFDFDFCFA
        F9F8B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFEFEF2ECE9F3EEEBDCCDCBE6DCD9ECE4E1DCCBC8EDDDD9FFFDFAFAF5
        F4FAF6F3F9F6F4F9F6F5FAF7F6FAF8F7FBF9F8FCFAF9FCFBFAFDFCFBFEFEFEFA
        F9F8B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFEFDF3EDEAF4EEECEFE8E5F2EBE9F7F0EEF9F3EEBBC8D3E8E2E6FBF9
        F3F9F3F1F7F5F3FCFAF8FCFAF9FBFAF9FBF9F9FCFBFAFCFBFBFDFCFCFFFFFFFA
        F9F9B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFEF3EEECF5F0EDF4EFECF5F0EDF5F1EEFEFBFAADB9CE0D245E6D81
        93D2C5C3E0DED6DEDCDAEDECEBFBFAF9FFFDFCFEFDFCFDFDFCFEFEFDFFFFFFFB
        F9F9B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFF4EFECF5F0EEF5F0EDF5F1EFF6F2F0F9F7F2FFFEFD7EA0BD57AC
        D84D84A69EA2ACD6CDC8D1CDCCDAD9D8EDECECFCFBFBFFFFFFFFFFFFFFFFFFFB
        F9F9B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFF5F0EEF6F2EFF5F1EFF6F2F0F7F3F1F7F5F3FDFDF8F7F0E876A2
        C7A0B7E306367B8EADC4E8DBD4CBCCCBCDCDCEDADADAECECECFCFDFDFFFFFFFD
        FAFAB39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFF6F1EEF6F2F0F8F5F2F9F6F4F8F5F3FAF8F6FAFBF7FFFDFEB8BF
        C93268930BDAFD0187D5B8D1E2F4F1ECD8D8D7CECECED1D1D1D8D8D8EBECECF6
        F4F4B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFF6F2F0F7F4F2E3D8D6E3D7D5F3EEECE8E0DFF3EEEDF6F2EFACD2
        E4378FC296E5F81ECCFC0382D2B3C5D6F1D5CDE1DEDECCCAC7D0D1D1CFD0CFD4
        D3D3B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFF7F3F1F6F2F0E3D8D6F0EBE9F3EEEDEFE9E8F2ECEBF2ECECEBDF
        DBACD2E32989C2A8E7F817CDFC0178C2B7CCDBFFFDFBF4EFEFE6E9E7D6D6D6CA
        C9C9B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFF8F4F2F7F3F1E4D9D7F0EBE9F0E9E8F2EDECF2EEECF2EDECE3DA
        DAFCF1F1ACD2E7358EC2AAEAFA1CC6FA0163B2BBCEDCFFFAF7FFFFFFF9F8F9E3
        E2E1B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFF8F5F3F9F7F5E7DEDCE2D6D5E1D5D3F7F3F3F6F3F2F1EBEBECE1
        E1FCFAFBFEFEFDA8BBC93791C4AEE9FA16C6FA0069BAA4B3C2FFFFFFFFFFFEFB
        F9F9B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFF9F6F5FAF7F6E5DBD9F1ECEBF7F5F3F0E9E9E8E0DFF7F4F4FCFA
        FAE3D8D8E2D6D7EADDDAACD2E53892C4ACE8F926CCFA0276C2BFD3E1FFFFFEFC
        FAFAB39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFF9F7F5F9F6F5F2ECEBEBE4E3F2EDECF5F2F1F4F0EFF9F6F6EFE9
        E9F3EFEFF8F5F5F5F0F3FDFAF8ACD0E02F88BCADE9FA1FC4F9016FBCB9CFDFFF
        FDFCB39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFFAF8F7F9F6F5F2ECEBEDE7E6F3EEEDF5F1F0F6F3F3F8F6F6ECE5
        E5F8F4F4FBF9F8F7F4F4F6F0F1FEFAF5AACDE0298DC4B1E3F720C7F70371BBCC
        E5F0B39C95000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFFBF9F8FAF7F6E4D9D8FAF8F8F6F4F3EBE3E2F4F0F0F3EEEEEBE3
        E3F8F6F5F6F3F2F7F5F4F4EFEEFFFFFFFFFFFEACD2E8358EC3B1E4F81CCCFC01
        81C62A6688A1BBDF000000000000000000000000000000000000000000000000
        B39C95FFFFFFFCFAF9FCFBFBE8DFDEE7DDDDFFFFFFF2EDEDEAE2E2F7F3F3FFFF
        FFF4F1F0F6F2F3E1D3D2FCFBFAFDFBFDFCF9FAFEFDFCACD0E4328DC1B1E3F632
        DDFC0082D60064B5C9C1BD000000000000000000000000000000000000000000
        B39C95FFFFFFFCFBFAFDFCFBFAF8F8FBF9F9FFFFFFFCFBFBFBFAFAFCFBFCFDFD
        FCFBF9F9FBF9F9F6F2F2FCFAF9FBF9F8F6F1F0F5F3F0FDF9F676B4D6348DC2AF
        E7FC2CD0F7466D83675F5BD0CECB000000000000000000000000000000000000
        B39C95FFFFFFFDFCFCFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FDFEFDFDFFFFFFFDFBFBFBF9F8FAF8F6E6DAD6B39C95B39C95B39C95A1ABB525
        8DC7818485FAF6EF858585696C5FCAC9DBF4F5F8000000000000000000000000
        B39C95FFFFFFFDFDFDFEFEFEEFE8E8F8F5F5FCFAFAFCFAFAF8F5F5EEE8E8FEFD
        FDFCFAFAF4EFEEFBF8F8F9F6F5F5EFECB39C95FFFFFFFFFFFFFFFFFFFFFFFFE9
        D5CD685754D1D1D1FDFEFF878582534E62232372000000000000000000000000
        B39C95FFFFFFFEFEFEFFFFFFEFE9E9F8F5F5FCFAFAFCFAFAF7F4F4EEE7E6FDFC
        FBFAF8F7F2EDECF9F6F5F7F3F1ECE4E1B39C95FFFFFFFFFFFFFFFFFFE6D7D3B3
        9C958B746C566161D2D1C6CDEDF84567BA121A83000000000000000000000000
        B39C95FFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFEFFFFFEFCFA
        FAFAF8F8FAF7F6F6F2F0F4EEECE9E0DBB39C95FFFFFFFDFDFBE7DCD8B39C95A8
        8A85BCC2C395999C665B562961CA2C4FC7091285000000000000000000000000
        B39C95FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFDFCFCFDFBFBFBFAF9FAF7
        F6F8F5F4F6F1EFF3EDEBF0E9E6E6DAD5B39C95FFFFFFECE2DEB39C95A48884FB
        F9FAE1E1E2C6C7C5C0BFB13656C53656C53453C2000000000000000000000000
        B39C95FFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFBFBFCF9F9FAF7F6F7F4
        F3F5F1EFF2ECEAEFE7E4EBE1DEE1D2CDB39C95F2EBE9B39C95A4898400000000
        0000000000E4E4ECD5D6E3D9DAE6EBEBF1FAF9FB000000000000000000000000
        B39C95FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFDFBF9FAF7
        F6F8F3F1F4EEECF0E8E5ECE1DDE7DAD5E6DAD5B39C95A4898400000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        B39C95FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFDDD2CFB39C95A3888300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C
        95B39C95B39C95B39C95B39C95B39C95A78D8800000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object BitBtn3: TBitBtn
      Left = 102
      Top = 2
      Width = 49
      Height = 43
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        20000000000000100000C40E0000C40E00000000000000000000000000000000
        00000000000000000008000000120000001A0000001E0000001E0000001E0000
        001E0000001E0000001E0000001E0000001E0000001E0000001E0000001E0000
        001E0000001E0000001E0000001E0000001E0000001E0000001E0000001E0000
        001E0000001A000000160000000E000000030000000000000000000000000000
        00030000001504231F3A0A544CD4065149FF065149FF065149FF065149FF0651
        49FF065149FF065149FF065149FF065149FF065149FF065149FF065149FF0651
        49FF065149FF065149FF065149FF065149FF065149FF065149FF065149FF0651
        49FF08534AF6094D47BC00110D3B000000250000000F00000000000000000000
        000E000000220A524BC64D9C93FD82D1C8FF84D1C9FF83CEC7FF82CCC4FF81C9
        C2FF7FC7C0FF7FC4BDFF7DC2BBFF7CC0B9FF7CBEB7FF7BBCB5FF7ABAB3FF79B8
        B1FF78B5AFFF77B4ADFF77B2ABFF76AFA9FF76AEA8FF76AEA8FF76AEA8FF75AE
        A7FF6CA7A0FF31756DFA074640B3000000350000002200000009000000000000
        000F000D0D2808544DFB80D0C7FF60C5BBFF57C0B5FF55BCB2FF53B9AFFF51B6
        ACFF4FB3A9FF4EB0A6FF4CACA2FF4AA99FFF48A69CFF47A299FF459F96FF449C
        93FF439990FF42968DFF41938AFF409087FF3F8E85FF3F8E85FF3F8E85FF408E
        85FF4D968EFF69A59EFF07544CF600000036000000230000000E000000000000
        0005053530350F6056F58BD5CDFF5CC4B9FF5AC2B7FF58BEB4FF56BBB1FF55B8
        AFFF53B5ABFF51B2A8FF50AFA5FF4DABA2FF4BA89EFF4AA59BFF48A199FF60AC
        A4FF56A49CFF43978EFF41948BFF409188FF3F8E85FF3F8E85FF3F8E85FF3F8E
        85FF408E85FF75AEA7FF08554EFC0010102F0000001700000004000000000000
        000005534A371C6C63F189D4CDFF5FC5BBFF5DC4BAFF5BC1B7FF5ABEB3FF58BB
        B1FF57B7AEFF55B4ABFF53B1A8FF51AEA4FF4FAAA1FF4DA79EFF60AEA5FFA1CE
        CAFF5DA9A1FF469A91FF44978EFF42938AFF419087FF408E85FF3F8E85FF3F8E
        85FF3F8E85FF71ACA5FF125F56F4063E392D0000000200000000000000000000
        0000075A4F47297A72F187D3CCFF61C6BCFF61C6BCFF5FC3B9FF5DC0B6FF5BBD
        B3FF59BAAFFF63BCB2FF7FC5BFFF85C7C0FF53ADA4FF61B2A9FFA0CFCAFFA7D2
        CDFFA6D0CCFFA3CDC9FF80B8B2FF48968EFF44938AFF449188FF439087FF4290
        87FF418F86FF6EA9A2FF1C6861F105574D350000000000000000000000000000
        0000055A4F5E398B81F385D3CBFF64C7BDFF63C7BDFF62C5BBFF60C2B8FF5FBF
        B5FF62BEB4FF77C5BEFF89CBC4FF87C9C2FF56AFA6FF67B5ADFFA5D2CEFFA8D3
        CEFFA7D1CDFFA6D0CBFFA6CECAFF75B1AAFF48968DFF47928AFF469289FF4592
        89FF449188FF6BA8A1FF28736BF10758524B0000000000000000000000000000
        0000075B5270479990F983D2CBFF67C8BEFF66C8BEFF65C7BDFF63C4BAFF61C1
        B7FF87CEC7FF6BC1B8FF8BCCC6FF8ACAC4FF59B2A9FF58AFA5FF70B8B0FFA9D3
        CEFF87C1BAFF6EB2ABFF6DAFA8FF6DAEA6FF549D96FF4A958DFF49948BFF4893
        8BFF47938AFF68A69FFF367E77F4055A50600000000000000000000000000000
        0000085E568556A69DFF82D1CAFF6AC9C0FF6AC9BFFF69C9BFFF67C6BCFF6DC6
        BDFFB0DFDAFF74C5BCFF5FBAB0FF5EB7AEFF5CB4ABFF5BB1A8FF59AEA5FF7ABC
        B5FF72B6AFFF54A59CFF6AAEA7FF77B3ADFF64A7A0FF4D988FFF4C968DFF4B95
        8DFF4A958CFF66A59EFF418881FB075C54740000000000000000000000000000
        00000B645AA455A9A1FF73CCC4FF6BC9C0FF6CCAC1FF6CCAC0FF6AC8BEFF83CF
        C7FFB3E1DCFFA4D9D4FF65BDB4FF71C0B8FF60B6AEFF5EB3ABFF5CB0A7FF5AAD
        A4FF5CACA3FF62ADA4FF85BEB8FF85BCB6FF81B9B2FF509A92FF4F978FFF4E97
        8FFF4D968EFF63A39CFF4E908AFF075F54910000000000000000000000000000
        00000E675DBA5BB1A8FF61C6BCFF53C1B6FF5FC5BBFF6CCAC0FF6DCAC0FF73CA
        C1FFB2E1DCFFB4E0DCFFA6D9D3FF96D1CBFF64B9B0FF62B6ADFF60B3AAFF5FB0
        A7FF5DADA4FF6CB3ABFF83BDB7FF87BEB8FF75B2ACFF549E95FF539A92FF5299
        91FF519990FF60A29AFF579891FF0A6258AB0000000000000000000000000000
        00000C695FCF5FB7AEFF5CC4BAFF51C0B5FF51C0B5FF52C0B5FF5DC4BAFF68C6
        BDFFA3DBD6FFB5E1DDFFB4E0DBFF84CAC2FF66BBB1FF65B8AFFF63B5ACFF62B2
        AAFF60AFA7FF5FACA4FF5EA9A1FF6CAFA8FF60A69FFF57A098FF569D95FF559B
        93FF549A92FF5EA099FF5D9D96FF0C655BC50000000000000000000000000000
        00000B675EE363BEB4FF56C2B7FF51C0B5FF51C0B5FF51C0B5FF51C0B5FF74CB
        C2FF93D5CFFFA0D9D3FFAEDDD8FF71C2B9FF6BBDB4FF68BAB2FF81C4BDFF90C9
        C3FF9DCEC9FFA9D4CFFF6DB3ABFF5EA9A0FF5DA69EFF5BA39BFF59A098FF589D
        95FF579C94FF5B9F97FF64A19AFF0C665CD90000000000000000000000000000
        00000A685EF166C2B9FF53C1B6FF51C0B5FF51C0B5FF51C0B5FF51C0B5FF50BF
        B4FF4FBCB1FF4EB9AEFF4DB6ABFF5EBBB1FF7AC4BCFF55B2A9FF59B2A8FF95CC
        C6FFA9D4D0FFAAD4D0FF83BFB8FF60AAA2FF60A8A0FF5EA59EFF5CA29BFF5B9F
        98FF5A9E96FF5B9F97FF68A69FFF0A665CEB0000000000000000000000000000
        000009675DFD66C6BDFF51C0B5FF51C0B5FF51C0B5FF51C0B5FF51C0B5FF51C0
        B5FF4FBDB2FF4EBAAFFF5EBEB4FF7FC9C2FF7FC7BFFF6FBFB6FF4AABA0FF93CC
        C6FFA3D2CDFFA2D0CBFF90C6C0FF459C92FF4A9D93FF529F97FF5AA29AFF5EA2
        9AFF5DA098FF5C9F98FF6CA7A1FF09665DFA0000000000000000000000000069
        5A110D6D62F860C5BBFF51C0B5FF51C0B5FF51C0B5FF51C0B5FF51C0B5FF51C0
        B5FF50BEB3FF4FBAB0FF4FB7ADFF75C6BDFF7FC8C0FF6DBFB6FF69BBB2FFA4D4
        CFFFA3D3CEFF63B1A9FF7CBCB5FF50A49AFF439A90FF42978DFF41948BFF4594
        8BFF509890FF5C9F98FF6CA9A1FF0B6A5FFB0066660A00000000000000000767
        6025127368F25AC3B9FF51C0B5FF51C0B5FF51C0B5FF51C0B5FF51C0B5FF51C0
        B5FF50BFB4FF4FBBB1FF4EB8AEFF4FB7ACFF5DBAB0FF5AB6ADFF9CD2CCFF9FD2
        CDFF81C3BCFF46A49AFF45A197FF469F95FF439B91FF42988EFF41958BFF4092
        89FF3E8D84FF3E8980FF51938CFF106D64F308645D210000000000000000096B
        5D37167A70F055C1B7FF51C0B5FF51C0B5FF51C0B5FF51C0B5FF51C0B5FF51C0
        B5FF50BFB4FF4FBCB2FF4EB9AFFF4DB7ACFF4CB3A9FF4BB0A6FF4AAEA3FF49AB
        A0FF48A79DFF47A59BFF46A298FF439B91FF409389FF3C8980FF378077FF3376
        6FFF317069FF316F68FF37736CFF126D63F1056A60350000000000000000076D
        604D1B8276F051C0B5FF51C0B5FF51C0B5FF51C0B5FF51C0B5FF51C0B5FF51C0
        B5FF51C0B5FF4FBAAFFF4CB2A8FF49ABA1FF45A49BFF429D94FF3F968CFF3C8C
        84FF38837BFF357C74FF31726BFF2F6C66FF2E6B64FF2E6962FF2D6760FF2C65
        5EFF2C635DFF2B615BFF2C625CFF12665EF207695F4B0000000007534C250E5A
        53EF06554DFF06554DFF06554DFF06554DFF06554DFF06554DFF06554DFF0655
        4DFF06554DFF06554DFF06554DFF06554DFF06554DFF06554DFF06554DFF0655
        4DFF06554DFF06554DFF06554DFF06554DFF06554DFF06554DFF06554DFF0655
        4DFF06554DFF06554DFF06554DFF06554DFF0E5A53EE07574A26165F58C68DA9
        A5FED9D8D5FFD9D8D4FFD9D8D4FFD8D7D4FFD8D7D4FFD8D7D3FFD8D7D3FFD7D6
        D3FFD7D6D2FFD6D5D2FFD6D5D2FFD6D5D2FFD6D5D1FFD6D5D1FFD5D4D1FFD5D4
        D1FFD5D4D0FFD5D4D0FFD4D3D0FFD4D3D0FFD4D3CFFFD4D3CFFFD3D2CFFFD3D2
        CFFFD2D1CEFFD2D1CEFFD2D1CEFFD2D1CDFF86A39DFE145E56C90B5850F8E9EC
        E8FFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3
        EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3
        EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3
        EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFE9ECE8FF0B5850F8135E56E6CAD7
        D3FF888883FF37352FFF3F3F3BFF585C5AFF595D5BFF5A5F5DFF5C605EFF5D61
        5FFF5E6361FF606462FF616664FF626765FF646866FF656A68FF666B69FF686C
        6AFF696E6CFF6A6F6DFF6C706EFF6D7270FF6E7371FF707573FF717674FF7277
        75FF8B918FFFBCC4C0FFCED5D2FFD1D5D2FFBFD1CCFF145E57E00E5A538E729D
        97FAB5B5B2FF36342EFF403F3BFF585C5AFF595D5BFF5A5F5DFF5C605EFF5D61
        5FFF5E6361FF606462FF616664FF626765FF646866FF656A68FF666B69FF686C
        6AFF696E6CFF6A6F6DFF6C706EFF6D7270FF6E7371FF707573FF717674FF7277
        75FF898E8CFFBCC4C0FFCED5D2FFE6E7E3FF5C8E87F50D59527906554F2A1761
        5AF5F1F1EDFF3C3B35FF41423DFF585C5AFF595D5BFF5A5F5DFF5C605EFF5D61
        5FFF5E6361FF606462FF616664FF626765FF646866FF656A68FF666B69FF686C
        6AFF696E6CFF6A6F6DFF6C706EFF6D7270FF6E7371FF707573FF717674FF7277
        75FF888D8BFFBCC4C0FFC0C6C3FFE4E9E4FF0E5B53F700594D1400000000155F
        57D9B5C9C4FF61615CFF42433EFF585C5AFF595D5BFF5A5F5DFF5C605EFF5D61
        5FFF5E6361FF606462FF616664FF626765FF646866FF656A68FF666B69FF686C
        6AFF696E6CFF6A6F6DFF6C706EFF6D7270FF6E7371FF707573FF717674FF7277
        75FF848987FFBCC4C0FFD0D2CFFF8AACA6FD155E57AD00000000000000000956
        4F6E568A84F5A5A4A0FF434440FF585C5AFF595D5BFF5A5F5DFF5C605EFF5D61
        5FFF5E6361FF606462FF616664FF626765FF646866FF656A68FF666B69FF686C
        6AFF696E6CFF6A6F6DFF6C706EFF6D7270FF6E7371FF707573FF717674FF7277
        75FF838886FFB5BCB9FFF2F1EDFF1E665EF304554C3900000000000000000055
        49150E5A52F8E4E7E3FF565753FF626664FF636765FF646967FF666A68FF676B
        69FF686C6BFF6A6D6BFF6B6F6DFF6B706EFF6D706FFF656A68FF666B69FF686C
        6AFF696E6CFF6A6F6DFF6C706EFF6D7270FF6E7371FF707573FF717674FF7277
        75FF808583FFBDC1BDFFB4C8C3FF145E57DC0000000000000000000000000000
        0000166058B97AA29CFCE9EDE8FFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3
        EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3
        EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3EFFFF4F3
        EFFFF4F3EFFFDFE5E0FF307169F3085850600000000000000000000000000000
        00000952491C166058C50B5851F906554DFF06554DFF06554DFF06554DFF0655
        4DFF06554DFF06554DFF06554DFF06554DFF06554DFF06554DFF06554DFF0655
        4DFF06554DFF06554DFF06554DFF06554DFF06554DFF06554DFF06554DFF0655
        4DFF06554DFF0C5951F6135D5689000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object BitBtn4: TBitBtn
      Left = 151
      Top = 2
      Width = 49
      Height = 43
      Enabled = False
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000000000000000
        000000000000000000000000000000000000120E6D0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000019
        16CB000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000221B630000B3120C930000000000000000
        000000000000000000000000000000000000000000000000000000000E0A9100
        00B5221B5F000000000000000000000000000000000000000000000000000000
        000000000000000000000000211B660100C02935FF1927FF110B940000000000
        000000000000000000000000000000000000000000000000000E0A921F2EFF2A
        36FF0000C4211B64000000000000000000000000000000000000000000000000
        000000000000000000231B6A0000C20413FF364FFF2642FF010BFC0C08970000
        000000000000000000000000000000000000000000000B0797020FFD2E4CFF3B
        58FF1623FF0000C3231B68000000000000000000000000000000000000000000
        000000000000221A6F0000C6010DFF122FFF1835FF1C3AFF1331FF0005FE0A07
        9D0000000000000000000000000000000000000E09A1000EFE173AFF1E39FF17
        35FF1A3AFF0918FF0000C7221A6D000000000000000000000000000000000000
        000000231B6F0000C80008FF011CFF0420FF031FFF031FFF0628FF0425FF0006
        FE0503A10000000000000000000000000B07A40008FE0424FF0426FF0221FF02
        21FF011EFF0322FF000DFF0000CC231B69000000000000000000000000000000
        221A730000CC0002FF000CFF0010FF000EFF0003FF0004FF0013FF001BFF001A
        FF0004FF0704A90000000000000B07AB0007FF001BFF001AFF0013FF0009FF00
        10FF0011FF0010FF000FFF0004FF0000CE211969534089000000000000241B77
        0000CC0000FF0000FF0003FF0005FF0002FF0000FF0001FF0006FF0010FF0011
        FF0012FF0007FE0503A30604BA0008FE0012FF0011FF000FFF0007FF0000FF00
        01FF0007FF0005FF0000FF0001FF0000FF0000D3251C6B000000231D822D30C5
        0001FF0000FF0000FF0000FF0001FF0005FF0008FF0009FF000DFF0010FF000F
        FF0013FF0013FF0013FF0012FF0014FF0013FF000DFF000EFF000DFF0009FF00
        08FF0005FF0001FF0000FF0000FF0000FF0001FF3839D51916CB0000004E4FAC
        6C81FF0001FF0000FF0007FF000AFF000EFF0012FF0013FF0014FF0017FF0018
        FF0018FF0019FF001CFF001DFF0019FF0018FF0018FF0017FF0014FF0013FF00
        11FF000EFF000AFF0007FF0000FF0000FF7B84FD5957A8000000000000000000
        4543AA6E80FC0003FF000AFF0015FF0017FF0019FF001AFF011BFF011EFF021E
        FF041EFF0420FF0520FF0321FF0420FF031CFF011EFF001EFF001BFF001AFF00
        1AFF0018FF0015FF000AFF0003FF7F91FC4C4BA7000000000000000000000000
        0000004847AD768EFD0106FF000FFF001DFF011EFF0421FF0822FF0B26FF0C27
        FF0D28FF0E2AFF112BFF0F2BFF0E2AFF0D28FF0D27FF0D26FF0822FF0321FF01
        1EFF001DFF000DFF0106FF7A9BFE4D47AB000000000000000000000000000000
        0000000000004B48B18B9FFD020BFF0217FF0F28FF112CFF112DFF132FFF1431
        FF1532FF1733FF1733FF1733FF1735FF1533FF1431FF1330FF112DFF112CFF0E
        27FF011AFF010DFF8A9AFE4949B2000000000000000000000000000000000000
        000000000000000000464CB69BADFE0214FF0624FF1734FF1834FF1936FF1C38
        FF1D38FF1E39FF1E39FF1E37FF1E39FF1D38FF1C38FF1936FF1834FF1732FF08
        24FF041AFF8FA1FE4749B8000000000000000000000000000000000000000000
        0000000000000000000000004544C0A8BBFF0E2EFF1736FF1F3EFF213DFF233F
        FF2441FF2642FF2643FF2643FF2642FF2441FF233FFF213DFF1F3CFF1836FF15
        32FF92A3FE4549C2000000000000000000000000000000000000000000000000
        0000000000000000000000000000004844BF1A34FF1A34FF2743FF2A46FF2B48
        FF2D49FF2E4AFF2F4AFF2F4AFF2E4AFF2D49FF2B48FF2A46FF2743FF1D39FF1A
        34FF4343C4000000000000000000000000000000000000000000000000000000
        0000000000000000000000001916CB0C08C82A49FF2B47FF314DFF334FFF3550
        FF3651FF3753FF3853FF3752FF3753FF3651FF3550FF334FFF304CFF2C48FF2B
        49FF140FD15236B3000000000000000000000000000000000000000000000000
        0000000000000000001916CB0707D53256FF3456FF3551FF3853FF3B56FF3D58
        FF3F59FF405AFF425BFF425BFF405AFF3F59FF3D58FF3B56FF3853FF3551FF33
        4FFF2A4AFF1A17D3000000000000000000000000000000000000000000000000
        0000000000001916CB080BD63658FF3959FF3954FF3D57FF415AFF455FFF4760
        FF4962FF4B64FF4D67FF4E66FF4B64FF4962FF4760FF455FFF415AFF3D57FF39
        54FF3653FF2F4BFF1C19D5000000000000000000000000000000000000000000
        0000001916CB0A0AD53859FF3B5AFF3C54FF415BFF455EFF4A63FF4E67FF526B
        FF546DFF566EFF5770FF576FFF566EFF546DFF526BFF4E67FF4A63FF455EFF41
        5BFF3C56FF3855FF304EFF1B19D4000000000000000000000000000000000000
        1916CB0C0CD7375CFF3C5AFF3E59FF425FFF4A63FF5068FF556DFF5971FF5F76
        FF6178FF6179FF6279FF6279FF6179FF6078FF5E75FF5971FF556DFF5068FF4A
        63FF435FFF3E59FF3B58FF3251FF1918D50000000000000000000000001916CB
        0D0ED1355DFF3F5CFF3C58FF455FFF4C64FF536CFF5A73FF5F78FF637AFF657E
        FF6A7DFF6B80FF6F83FF7083FF6B80FF6A7EFF667EFF637AFF5F78FF5A73FF53
        6CFF4C65FF455FFF3D59FF3D57FF3354FF1415D30000000000001916CB1916CB
        2B50FF3C57FF3F58FF445BFF4D66FF556DFF5C79FF627AFF687EFF6D85FF7287
        FF778CFF728AFF667CFF6581FF7288FF798DFF7287FF6D84FF687EFF627AFF5C
        75FF556DFF4D66FF455EFF3E58FF3857FF2E4EFF2120CF0000002F2BADD8E5FF
        6686FF1D3FFF445CFF4F65FF556FFF5D73FF647BFF6982FF7288FF798CFF7E90
        FF7289FF839CFFE0E7FFDBE6FF859EFF728CFF7F90FF798CFF7288FF6A82FF64
        7BFF5D74FF556EFF4C65FF445DFF2B46FF627EFFC7CCF61916CB0000003930AA
        D8E5FF607EFF2A49FF546CFF607AFF647BFF6F82FF758BFF7C8FFF8194FF7D96
        FF8AA2FFDFE8FF2A38F42636F4E0E9FF8A9FFF7D95FF8294FF7E8FFF768AFF6E
        82FF647BFF5D78FF536CFF3857FF5F78FFC7CCF63E35B1000000000000000000
        221DABD8E5FF7392FF3F5BFF5E7AFF6B83FF788CFF7B8FFF8197FF8096FF90A8
        FFDAE3FF4556F20000000000004759F6E1EBFF8FA9FF7D96FF8197FF7B8FFF77
        8EFF6B83FF6079FF4A66FF6B86FFC7CCF6332BB1000000000000000000000000
        0000001D18A9D8E5FF89A5FF506DFF7289FF7D90FF8197FF8298FF94ABFFDBE3
        FF4756F30000000000000000000000004753F6E4EEFF95AFFF7F97FF8197FF7F
        8FFF7289FF5772FF8499FFC7CCF63228B4000000000000000000000000000000
        0000000000001D17B1D8E5FF96A9FF687FFF8096FF8097FF96ADFFD8E5FF4D59
        F00000000000000000000000000000000000004755F4E6EDFF96ADFF7C94FF80
        96FF6882FF8CA4FFC7CCF62F27BA000000000000000000000000000000000000
        000000000000000000211BB8D8E5FF96B1FF718AFF8EA6FFD6DDFF4B57F30000
        000000000000000000000000000000000000000000004854F6E4EBFF8FA6FF6C
        86FF98AEFFC7CCF62C23BF000000000000000000000000000000000000000000
        0000000000000000000000002E25C7D8E5FFB7CAFFD8E5FF4D58F10000000000
        000000000000000000000000000000000000000000000000004555F2D2E2FFBE
        D2FFC7CCF63228C5000000000000000000000000000000000000000000000000
        0000000000000000000000000000003A30CBD8E5FF525DEA0000000000000000
        00000000000000000000000000000000000000000000000000000000525CEAC7
        CCF6382ECC000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000474BD80000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000047
        4AD8000000000000000000000000000000000000000000000000}
    end
    object BitBtn5: TBitBtn
      Left = 200
      Top = 2
      Width = 46
      Height = 43
      Enabled = False
      TabOrder = 4
      OnClick = BitBtn5Click
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000001E5B
        001E5D001E5A0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000001D5A002366
        062368071E5E001E5A0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000001D59002367063F8B
        21579A3C256B081C5D0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000001D58002268073C942568AB
        5674B16357A243246C091C5D001E580000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001D58002267073A9B2C63B05A66B1
        5C54A74968B15E54A847246E0A1C5D0000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000001D580022680838A2365EB76162B7623FA8
        422A9F2D46A94765B76450AE4D236E0B1C5D001E580000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000001D580022690837AB445ABE6A5BBD693DB2502DAB
        412FAB432FAA4044B2535FBC6B4BB456236F0C1C5C0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000001D5700236A083AB44C59C6715AC36F40BA5934B64F37B7
        5237B75235B64F33B44D47BA5D5DC17049BB5E23710E1B5C001E570000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000001C5700236A093FBB535ACA765AC87445C2613DC05B3FC25E3FC2
        5E3FC15D3EC05C3DBE5A3ABC574AC0635BC5714AC26324710F1B5C0000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000001C5600236B0944C25B5ED27D5DCF784BCD6B47CC6749CD6B4ACE6B4ACE
        6B4ACC6B49CC6948CA6744C76441C5604EC76A5CCA744BC7682472101B5C001E
        5700000000000000000000000000000000000000000000000000000000000000
        1B5600236B0A48C86260D7815FD57D51D4744FD47252D77653D77655D87754D8
        7753D77653D77651D5744FD3714CD16E49CE6A53CE6F5BCD774DCB6D2573111B
        5C000000000000000000000000000000000000000000000000000000001B5500
        236C0A4CCE6863DD8662DA8258DA7C57DB7E5BDC835CDD855DDD865EDF875ADE
        8559DD835BDD845BDD8359DB7F57DA7B53D87650D57256D3765CD27B4FCF7125
        74121B5C001E5600000000000000000000000000000000000000175500236B0A
        50D36C64E08A63DE885DDE875FDF8A63E09164E19467E29667E19761E09486EB
        AF8FEDBF65E19562E19163E0905FDF8B5DDD8558DB7F55D97959D7795BD57C52
        D4742674121C5D000000000000000000000000000000000000002B6E1066DB83
        5EE28966E08D63E09165E2976AE39C6DE4A26FE5A471E5A66BE3A58FEDBFDFFD
        F0DFFDF08FEDBF6AE4A26AE39E6AE39C66E39662E0905EDE8959DD815BDA7E5C
        D97E51D8772775131B5D001D5500000000000000000000000000337418D5FBE3
        72E59E61E0946CE3A170E4A674E5AB76E7AF78E8B273E7B197F3CBDFFDF0306E
        17226509DFFDF08FEDBF71E7AD70E6A970E5A56CE39F68E29963E0905EDE875C
        DC815AD97E53D9772775131C5D0000000000000000000000000018580138751D
        D6FAE57DE9B36FE6AA7AE8B57CEAB97FECBD7DEBBD9EF6D6DFFDF0316F170040
        00004000236608DFFDF08FEDBF78EAB876E8B376E6AE71E4A76DE3A066E29661
        E08C5DDD845ADB7E53DC792775141C5C001D5500000000000000000000105400
        38761DDAFCEB8AEFC67BEBBD84EDC37FECC1A2F6DADFFDF0316F170044000000
        00000000014100236608DFFDF08FEDBF7CEDBF7BEAB97AE8B475E6AD6FE4A469
        E29A62E08F5CDC8557DA7C51DC782775131C5D00000000000000000000000000
        11540038751DDFFDF091F2CF7EECC2A5F7DBDFFDF0316F170043000000000000
        00000000000000004000236608DFFDF08FEDBF80EEC47EECBE7DEAB977E7B071
        E6A76BE39D63E1915CDD8556DA7C50DA77277513185C00195400000000000000
        00000011550038761DDEFCF0B7FDE8DFFDF0316E170245000000000000000000
        00000000000000000000014100236609DFFDF08FEDBF82EFC680EDC17FEBBC79
        E8B373E5A86BE39D64E1915CDD8455DA7A48D66F2976162B670F000000000000
        00000000000011550038761DDFFDF0306F170043000000000000000000000000
        00000000000000000000000000014100236608DFFDF08FEDBF84EFC581EDC180
        ECBE79E8B372E6A96AE29D64E09052DA7A67E18CDFFDF0296B0D000000000000
        00000000000000000017580024660B0D4D000000000000000000000000000000
        00000000000000000000000000000000024200236609DFFDF08FEDBF82EFC681
        EDC180ECBD79E8B271E4A65FE09370E79CDFFDF0337119185902000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000014100236608DFFDF08FEDBF83
        EFC681EDC180EBBC6FE5AA7DECB3DFFDF0327117074F00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000024200236609DFFDF08F
        EDBF83EFC677ECBB8CF1C8DFFDF03271170A5100000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000014100236608DF
        FDF08FEDBF99F5D6DFFDF0327117084F00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000002420023
        6609DFFDF0DFFDF03171160A5100000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000003
        4300296A0D35721A145A00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object BitBtn6: TBitBtn
      Left = 704
      Top = 2
      Width = 48
      Height = 43
      TabOrder = 5
      OnClick = BitBtn6Click
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000585858666666898989B9
        B9B9D3D3D3000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000005B5B5B3C3C3C3F3F3F8A
        8A8AA2A2A2D6D6D6E9E9E9000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000005B5B5B87878795959545
        45453E3E3E7171718F8F8FC3C3C3DCDCDC000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000005B5B5B898989A9A9A99A
        9A9A6D6D6D4343434F4F4F929292ACACACDEDEDE000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000CECECE565656898989A9A9A9FF
        FFFFF7F7F7A9A9A99393934A4A4A4A4A4A8080809C9C9C000000000000000000
        000000000000000000000000000000000000DBDBE7A4A4A9ADADAD0000000000
        00000000000000D0D0D0AFAFAF9A9A9A9A9A9A9797974E4E4E8A8A8AADADADFB
        FBFBFCFCFCF3F3F3C8C8C89090906262624E4E4E666666C6C6C6000000000000
        000000000000000000000000000000000000DFDFE801017D151579A7A7A70000
        000000000000003B3B3B4A4A4A4C4C4C4C4C4C4D4D4D434343919191ABABABF7
        F7F7F7F7F7FAFAFAFAFAFAFEFEFEE6E6E6939393535353BBBBBB000000000000
        000000000000000000000000000000000000DFDFE802027F01007B808082A8A8
        A80000000000003B3B3B8C8C8C9C9C9C9C9C9C9D9D9D5656568F8F8FABABABF4
        F4F4F3F3F3F7F7F7F8F8F8FBFBFBFFFFFFA4A4A4535353BBBBBB000000000000
        000000000000000000000000000000000000D4D4DE0B12A61E33FC0000791B1B
        77A9A9A9CECECE3A3A3A8A8A8A9999999797979999995656568E8E8EAFAFAFEE
        EEEEEEEEEEF2F2F2F3F3F3F6F6F6F8F8F8A0A0A0565656BBBBBB000000EFEFEF
        DCDCDCCECECECECECECECECECECECECECECEB5B5BE0B12A52237FD080EA10000
        79868686A7A7A73A3A3A8A8A8A979797969696969696565656919191ACACACEB
        EBEBECECECEFEFEFF0F0F0F2F2F2F5F5F5A2A2A2585858BBBBBB000000020288
        01018601008400008301018200008100008000007F0E13A6283BFA2236F82034
        F800007A2525773E3E3C898989959595949494949494595959929292B1B1B1E7
        E7E7E7E7E7EAEAEAEBEBEBEEEEEEF0F0F0A7A7A75A5A5ABBBBBB000000060687
        04058D151AA91519A71317A61317A71115A61014A41922BF2C3FFA2639F62337
        F8080D9A00007B40403D8A8A889494949393939393935A5A5A929292B0B0B0E5
        E5E5E5E5E5E8E8E8E9E9E9EBEBEBECECECA8A8A85C5C5CBBBBBB000000060688
        0E119B4D5BFA4B59FA4654FA4452F93D4DF93B4BF83647F83344F82E3FF72A3D
        F72639F82234F600007A3A3A859494929191919292925B5B5B939393B1B1B1DF
        DFDFE0E0E0E3E3E3E4E4E4E7E7E7E9E9E9A9A9A95E5E5EBBBBBB000000060689
        0F119B525FFB4E5BFA4A58FA4755FA4150F93E4EF93949F83647F83142F72E40
        F7283BF7273AF80609920000799595929292909090905C5C5C959595B2B2B2DC
        DCDCDDDDDDDFDFDFE1E1E1E3E3E3E5E5E5ACACAC5F5F5FBBBBBB00000006068A
        10129C5A65FC5661FB525EFB4E5BFA4957FA4654FA404FF93D4DF93848F83647
        F83041F72E40F7293DFD141DBD06067E86868C8F8F8F5D5D5D979797B3B3B3D7
        D7D7D8D8D8DBDBDBDCDCDCDFDFDFE0E0E0ACACAC626262BBBBBB00000006068B
        11129D5D68FC5B66FC5461FB525FFB4C5AFA4A58FA4553FA4150F93C4CF93949
        F83545F83143F81822C200007B7C7C8C90908D8C8C8C5F5F5F979797B2B2B2D3
        D3D3D5D5D5D8D8D8DADADADCDCDCDDDDDDA6A6A6636363BBBBBB00000006068C
        13149F6670FF646EFE5E69FE5C68FE5562FD5460FD4D5BFB4957FB4452F9404F
        F93E4EFC2029C503037B7979858C8C8C8A8A8A8A8A8A606060979797B0B0B0CF
        CFCFD1D1D1D4D4D4D5D5D5D7D7D7D9D9D9ABABAB666666BBBBBB00000006068D
        0E0F994850DA464DDA434AD94148D93D45D83B43D73F49E34D5CFC4856FA4654
        FB232DC600007F4242538585828B8B8B8A8A8A8A8A8A616161989898B1B1B1CC
        CCCCCECECED1D1D1D2D2D2D5D5D5D6D6D6ABABAB676767BBBBBB0000009898CE
        8F8FC78C8CC38C8CC28C8CC28C8CC28C8CC17979B51E20AE5664FF515EFE2D35
        C9070783B1B1BC50504F828282898989888888888888646464989898B1B1B1C5
        C5C5C9C9C9CCCCCCCDCDCDD0D0D0D1D1D1ADADAD6A6A6ABBBBBB000000000000
        000000000000000000000000000000000000DFDFE81E22AE5C68FF3038CA0000
        82A9A9BBE2E2E2525252818181888888868686868686646464959595A7A7A7BA
        BABAC0C0C0C9C9C9CACACACDCDCDCFCFCFADADAD6C6C6CBBBBBB000000000000
        000000000000000000000000000000000000DEDEE92326B13E44D2060686ADAD
        BCF8F8F80000005454548080808686868585858383837C7C7C5D5D5D61616195
        9595A4A4A4B5B5B5BCBCBCC7C7C7CBCBCBA7A7A76F6F6FBBBBBB000000000000
        000000000000000000000000000000000000DFDFE90A0B93010189A6A6BAE5E5
        E500000000000056565680808085858583838381818181818178787867676766
        66667C7C7CA5A5A5ADADADBFBFBFC4C4C4A8A8A8707070BBBBBB000000000000
        000000000000000000000000000000000000E3E3ED06068BB2B2C2F7F7F70000
        000000000000005959597F7F7F8383838282827F7F7F7E7E7E7C7C7C7B7B7B79
        79797272726A6A6A707070A1A1A1A5A5A5AAAAAA737373BBBBBB000000000000
        000000000000000000000000000000000000E2E2EFBFBFD5EBEBEB0000000000
        000000000000005A5A5A7E7E7E8282828080807E7E7E7C7C7C7B7B7B79797977
        77777575757070706D6D6D7676768C8C8CA1A1A1747474BBBBBB000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000005E5E5E7777777B7B7B7A7A7A78787878787876767675757573
        7373737373717171717171717171747474747474747474D0D0D0000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000006060606060606363636464646666666868686A6A6A6B6B6B6E
        6E6E707070727272737373757575757575757575757575EAEAEA000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object BitBtn7: TBitBtn
      Left = 246
      Top = 2
      Width = 49
      Height = 43
      TabOrder = 6
      OnClick = BitBtn7Click
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000778BAE5E7095707186928B98000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000065879F587EA15A7D9F7A8FA5929BA9000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00004984B23680B6579FC779BCDB639CB683ABBE92A3AC000000000000000000
        000000000000000000000000000000ABA6A7A7A2A1A6A1A0A5A09DA5A09DA39E
        9DA19C9BA09A9BA09A9BA79C9EA296969D918F9B908CA1988F9596946F838E3B
        6A892575B04AAAE671CCF38EE5FF9AE5FF6FA7C08CA3AB000000000000000000
        000000000000000000000000000000B7B2B1F9F1F1F8F0F0FAF0F0FCF2F2F9F1
        F1F5F0EFF3EDEEF8EEEEFFEDEBFFF0EEFFF3F1F7EFEFDFDEE0D3E4F7608BBC35
        7BB64EA8DE64C7F382E1FF9FF7FF85D2F36FA8C2000000000000000000000000
        000000000000000000000000000000BAB5B4FFFAFAFFF9F9FFFAFAFFFDFDFFFB
        FDFFF9FAFCF7F8FFF8F8FFF4F2FFECEAFFF3F5EEEFF9E0F1FF6E97BE357AB94D
        A3E56FCBFA7DDBFF90ECFF7DCFEE71B1CA000000000000000000000000000000
        000000000000000000000000000000BDB9B8FFFDFFFFFAFCFFF9FBFFF9FBFFF5
        F8F6EEEFEDE8E9EEE8E9DFD5D5F0E5E7D7D2DBB5C1D95783B23C82BD4AA7DF5E
        BFF189DBFFA7F5FF84D6FF5DA0C1000000000000000000000000000000000000
        000000000000000000000000000000BEBAB9FFF8FAFFF6F8FFF7FBFFFAFEFFF8
        FCFCF3F6F5F0F1F5F0F1FEF6F6E1DFE5D4E0F27194B63D80B947A0DD5FC4F185
        E6FFA4F5FF87CCF36EACD2567F98000000000000000000000000000000000000
        000000000000000000000000000000C1BCBBFFFCFEFFF6F8FCEDF1F6E6EDF0E2
        E6E7DEE1E1DCDDE1DCDBE2D6D4C9CBD36E92B0397AA653ACDE61C3F18EE7FF9A
        F0FF72CAF273B9DEACCADD84878F000000000000000000000000000000000000
        000000000000000000000000000000C5BEBBFFF4F4F1E4E6E7D8DCEADCE0F4E6
        EAF5EDEEF4EFEEF6EFECF3E1E0E5E2EB769BB74084A963BBDF87E6FF9DF0FF92
        DCF863AACC93C2DDDEE4EB9A8B89000000000000000000000000000000000000
        000000000000000000000000000000978D86978A88968889978A8C9A8D8F9B8F
        8FA39A97C0B7B3E0D4D0EAD3D8D9CAD289959F5E83916FAFC19EECFF86D8F76D
        ADCB9BB4C8CBCCD6F3E6E8988A8B000000000000000000000000000000000000
        0000000000000000008F7F7882736A86766F9D8F89A39793ADA1A1B3A7A5AFA4
        A0A99D97A99F95B2A29CB89CA2A38B93A9A1A195A2A074979A7AACB86EA7C194
        BCD5CECCD8E6D1D4F3DEE197898B000000000000000000000000000000000000
        0000000000008C776F957F73957F73B19D92E6D5CCF2E5DDFFF4F0FEF4EDF0E5
        DDDBCFC3C8B9A9BBA69EB7979CAB8C93B8A49FB3AAA0B8BCB1BCC4C3B7BFCCC4
        C6D8CDC3CFE2D1DAF7E2EA988790000000000000000000000000000000000000
        0000008B78718D71669E8172D3B6A7F2D8CAFFFDF0FFFAEEFFF6EDFEF5EBFFFB
        EFFFF9E9F5E1CFDFC6B6C3A5A0D8BAB9C9AFA9BCA79FE9D7D0EAD9D6EDD9DEDD
        CAD3D3C4CCE0D1D9F5E3EA998990000000000000000000000000000000000000
        000000897066AA897AD8B4A4E8C7B4ECD0BFFFF3E2FFF9E9FFFBEEFFF7E9FFF5
        E3FFF1DCFFE9D1F9DFC7D7C0AACEB7A8BBA7A2C0ABAEE9D2DAD7C0C8DCC4C6E0
        C8C8E0CBCDDCCCCDEFE0DE9C8F8D000000000000000000000000000000000000
        927B73927162C89E8BE7BBA3E2BDA3EED0B7FFF9E2FFF6E3FFF3E1FDF1DFFFEF
        DAFFEAD1FBE1C3F5D9BAE9CDAEC9AF97D6BCB5C9B2B6D8BECBE0C7D1DDC5C7D9
        C2C0D2BDBCD8C7C4F2E4DE9F918B000000000000000000000000000000978C84
        98796AB68A73DEA88AE8B490E3BC96E8CEA9FEEFCEFCF1D5FEF0D9FFECD6FFE8
        CEFFE1C4F7D9B6F4D3ACF0CBA5DFB79AD4B3A0E1C4BDD7BEC2ECD5DDDBC6CEE1
        CDD2DAC5C8E2CECDF9E8E59C8E8800000000000000000000000000000098887C
        9D7563BE876CE2A27FECB086E0B689E0C396F6E5BEF4E5C4F9E4C9FDE2C8FFE0
        C3FFDABAF6D3ABF0CAA0EBBD94DDAF8DD3AB92E3C2B3D6BAB9E0CACFCDBBC2CD
        BBC2D2BCC1D8C3C5F3E0DD9F8F89000000000000000000000000000000927A6E
        A37361C5856CE39C77EEAA7FE2AE7FE1BA8DF9E0B6F6DEBAF8DABDFCDABDFFD8
        BBFFD6B3F8CFA8F3C89DEDBC90E3B28CD3A98CE8C7B4DFC3BCE8D3D2E1CDD2DF
        CBD0E0CBCEE1CCCBF3E0DDA2928C000000000000000000000000000000997B70
        AA7665C68368D88C68E39A6EDEA473DFB483F1CFA4EACDA6ECC9A8EDC6A6F2C5
        A4F1C49FECC097E9BC90F3C193EABA90D0A485E4BFA9D3B7ACD5BFBAD2BCBECA
        B5B8CCB6B8D6C1C0EFDCD9A495920000000000000000000000000000009F7F72
        A77460C07E61D58A64E59C70E9AE7CF1C28FF8D4A6F5D5ACF9D3B0F8CFAEFBCD
        ABF9CCA6F6CBA0F3C99CF4C395F0C096D9AE8DF3CFB7E8CBBDEAD2CCEAD2D2DF
        C9CBDDC8C7E8D3D2F6E3E0A59693000000000000000000000000000000A1857A
        A47560C3876AEAA47FFBB88BFEC794FFD5A2FCD8AAFDDDB2FFE0BAFFDFBCFFDD
        BAFFDAB5FED8AEFDD6AAFFD2A6F5C9A0D7B18FE8C6AED7BAACD4BDB5CCB7B5C2
        AEADC4AFAED4C0BFE5D4D1A09391000000000000000000000000000000B09C91
        AA8472C9997DF8BE9AFFC89BFFD09DFFD8A7FFE4B5FFE7BBFFEAC5FFEAC7FFE9
        C6FFE8C3FFE5BDFFE2B9FBD7AFF2CDA7DDBB9DF5D6C1ECD2C4F7E1DBF5E2DFF2
        E0DFEEDAD9EFDDDCF1E0DDA89B99000000000000000000000000000000B8A8A1
        A6897AC39A83F0C3A1F5C9A0FCD5A8FFE3B5FFEABEFFECC3FFEAC6FEEAC7FFEB
        C8FFEBC8FCE9C4FAE4C0F6DAB7EECFB0DCC1A7F1D9C7E5D1C6EEDBD6E5D3D2E0
        D0D1DDCECCDCCDCBDDCECCA09492000000000000000000000000000000000000
        AB978CB19380D5B396F6D4B0F8D9B2FFE8C0FFEDC7FFEFCBFFF1D1FFF1D4FFEF
        D2F9EBCEF8EBCBFAEDCDF9E4C9D7C0AAE9D5C4D3C1B6BEAEA8C5B8B6CDC0C2C1
        B4B6CBBDBEBAADABAC9F9DA09492000000000000000000000000000000000000
        BEAEA7B7A091B1977FECD0B2F5DCBCFDE8C8FFEECFFFF1D5FFF2D8FFF3DBFFF4
        DDFFF5DDF9F0D5F2E8D0E1D1C0DBCBBEE5D6CDD4C8C2D8CCCAFFF5F7FFF5F8FF
        F8FBF7ECEECFC5C5B6AAAA000000000000000000000000000000000000000000
        000000B7A49CC6AF9FBAA38DECD6BDF9E5CCFFEFD8FFF4E1FFF7E5FFF6E4FFF6
        E4FFF3E1F3E7D5E3D9C8D5C9BFE1D7D0DED5D1E5DEDBCFC9CAFFF8FBFFFCFFFF
        FBFED3CBCCB5ADAD000000000000000000000000000000000000000000000000
        000000000000BBAB9FBCAC9CC0AE9DD6C4B3ECDBCEF5E5D8FBEDE1F8ECE0F1E5
        D9EADCD0E2D5C7D9CDC1DCD2CBE0D9D6F3EEEDECE6E7DDD8DAFAF4F9FFF9FED9
        D2D5B0A8A9000000000000000000000000000000000000000000000000000000
        000000000000000000C8BDB5BDB1A7C4B5ACD1C3BDCEC0BACFC3BDD7CBC5DED2
        CCE0D3CBDBCFC5D6CBC3EBE2DEFDF8F7FFFFFEE4DEDFCFC8CBFCF5F8E1DADDB0
        A9AC000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000C5BCB8C4B8B8CAC0C0D6CCCCDAD1CED6CA
        C8D5CAC6E7DBD5FBF1EAFFFDFAFEF9F8FFFEFEE2DCDDDFD7D8E4DEDFB2ACAD00
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000E7E3E2F8F1F4EEE7EAE7E1E2ECE7E8F7F2
        F1FFF8F5FFF9F5FFF9F5FEF5F1F7F0EDFDF4F1E2DADACAC0C0BDB5B500000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000D8D8D8E4DEE3E3DDE2DDDADCD9D7D7DAD5
        D6DAD5D2DAD3D0DAD1CDDCD3CFD0C7C3D4CBC8CFC6C3CDC4C100000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object Button1: TButton
      Left = 351
      Top = 2
      Width = 57
      Height = 43
      Caption = 'Interesses'
      TabOrder = 7
      OnClick = Button1Click
    end
    object BitBtn10: TBitBtn
      Left = 408
      Top = 2
      Width = 52
      Height = 43
      Caption = 'Contatos'
      TabOrder = 8
      OnClick = BitBtn10Click
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DMeclipse.ADOCBD
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CODIALU'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT tb_fnaluno.*'
      
        'FROM tb_aluno RIGHT JOIN tb_fnaluno ON tb_aluno.codigo_alu = tb_' +
        'fnaluno.codigo_alu'
      'WHERE tb_fnaluno.codigo_alu = :CODIALU')
    Left = 520
    Top = 88
    object ADOQuery2codigo_alu: TIntegerField
      FieldName = 'codigo_alu'
    end
    object ADOQuery2tptel_fnalu: TWideStringField
      FieldName = 'tptel_fnalu'
      Size = 15
    end
    object ADOQuery2fone_fnalu: TWideStringField
      FieldName = 'fone_fnalu'
      Size = 15
    end
  end
  object teste: TDataSource
    Left = 552
    Top = 88
  end
end
