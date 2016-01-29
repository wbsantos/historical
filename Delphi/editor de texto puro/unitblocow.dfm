object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 396
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pgcarquivos: TPageControl
    Left = 32
    Top = 32
    Width = 273
    Height = 289
    Align = alCustom
    TabOrder = 0
    TabStop = False
    OnEnter = pgcarquivosEnter
  end
  object Status: TStatusBar
    Left = 0
    Top = 377
    Width = 659
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object pgcarquivos2: TPageControl
    Left = 336
    Top = 32
    Width = 273
    Height = 289
    TabOrder = 2
    Visible = False
    OnEnter = pgcarquivos2Enter
  end
  object Memo1: TMemo
    Left = 488
    Top = 200
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 64
    Top = 328
    object arquivo: TMenuItem
      Caption = '&Arquivo'
      object NovaAba: TMenuItem
        Caption = 'Nova Aba'
        ShortCut = 16468
        OnClick = NovaAbaClick
      end
      object FecharAba: TMenuItem
        Caption = 'Fechar Aba'
        ShortCut = 16471
        OnClick = FecharAbaClick
      end
      object AbrirArquivo: TMenuItem
        Caption = 'Abrir Arquivo'
        ShortCut = 16463
        OnClick = AbrirArquivoClick
      end
      object SalvarArquivo: TMenuItem
        Caption = 'Salvar Arquivo'
        ShortCut = 16467
        OnClick = SalvarArquivoClick
      end
      object SalvarComo: TMenuItem
        Caption = 'Salvar Como'
        ShortCut = 49228
        OnClick = SalvarComoClick
      end
      object SalvarTudo: TMenuItem
        Caption = 'Salvar Tudo'
        ShortCut = 49235
        OnClick = SalvarTudoClick
      end
      object SalvamentoAutomtico1: TMenuItem
        Caption = 'Salvamento Autom'#225'tico'
        object Nunca: TMenuItem
          AutoCheck = True
          Caption = 'Nunca'
          Checked = True
          RadioItem = True
          OnClick = NuncaClick
        end
        object m1: TMenuItem
          AutoCheck = True
          Caption = '1 minuto'
          RadioItem = True
          OnClick = m1Click
        end
        object m2: TMenuItem
          AutoCheck = True
          Caption = '2 minutos'
          RadioItem = True
          OnClick = m2Click
        end
        object m3: TMenuItem
          AutoCheck = True
          Caption = '3 minutos'
          RadioItem = True
          OnClick = m3Click
        end
        object m4: TMenuItem
          AutoCheck = True
          Caption = '4 minutos'
          RadioItem = True
          OnClick = m4Click
        end
        object m5: TMenuItem
          AutoCheck = True
          Caption = '5 minutos'
          RadioItem = True
          OnClick = m5Click
        end
        object m6: TMenuItem
          AutoCheck = True
          Caption = '6 minutos'
          RadioItem = True
          OnClick = m6Click
        end
        object m7: TMenuItem
          AutoCheck = True
          Caption = '7 minutos'
          RadioItem = True
          OnClick = m7Click
        end
        object m8: TMenuItem
          AutoCheck = True
          Caption = '8 minutos'
          RadioItem = True
          OnClick = m8Click
        end
        object m9: TMenuItem
          AutoCheck = True
          Caption = '9  minutos'
          RadioItem = True
          OnClick = m9Click
        end
        object m10: TMenuItem
          AutoCheck = True
          Caption = '10 minutos'
          RadioItem = True
          OnClick = m10Click
        end
      end
      object ConfigurarPgina1: TMenuItem
        Caption = 'Configurar P'#225'gina'
        OnClick = ConfigurarPgina1Click
      end
      object Imprimir1: TMenuItem
        Caption = 'Imprimir'
        OnClick = Imprimir1Click
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        ShortCut = 16499
        OnClick = Sair1Click
      end
    end
    object Editar: TMenuItem
      Caption = '&Editar'
      object Desfazer1: TMenuItem
        Caption = 'Desfazer'
        OnClick = Desfazer1Click
      end
      object Refazer1: TMenuItem
        Caption = 'Refazer'
        OnClick = Refazer1Click
      end
      object Copiar1: TMenuItem
        Caption = 'Copiar'
        ShortCut = 16451
        OnClick = Copiar1Click
      end
      object Colar1: TMenuItem
        Caption = 'Colar'
        ShortCut = 16470
        OnClick = Colar1Click
      end
      object Recortar1: TMenuItem
        Caption = 'Recortar'
        ShortCut = 16472
        OnClick = Recortar1Click
      end
      object Excuir1: TMenuItem
        Caption = 'Excuir'
        ShortCut = 16452
        OnClick = Excuir1Click
      end
      object SelecionarTudo1: TMenuItem
        Caption = 'Selecionar Tudo'
        ShortCut = 16449
        OnClick = SelecionarTudo1Click
      end
    end
    object Formatar: TMenuItem
      Caption = '&Formatar'
      object mniquebra: TMenuItem
        AutoCheck = True
        Caption = 'Quebra de Linha autom'#225'tica'
        ShortCut = 16465
        OnClick = mniquebraClick
      end
      object Fonte1: TMenuItem
        Caption = 'Fonte'
        ShortCut = 16453
        OnClick = Fonte1Click
      end
    end
    object Exibir: TMenuItem
      Caption = 'E&xibir'
      object Barradestatus: TMenuItem
        AutoCheck = True
        Caption = 'Barra de status'
        Checked = True
        OnClick = BarradestatusClick
      end
      object SempreAcima1: TMenuItem
        AutoCheck = True
        Caption = 'Sempre Acima'
        OnClick = SempreAcima1Click
      end
      object DividirTela1: TMenuItem
        Caption = 'Dividir Tela'
        object nd: TMenuItem
          AutoCheck = True
          Caption = 'N'#227'o Dividir'
          Checked = True
          RadioItem = True
          OnClick = ndClick
        end
        object dh: TMenuItem
          AutoCheck = True
          Caption = 'Dividir Horizontalmente'
          RadioItem = True
          OnClick = dhClick
        end
        object dv: TMenuItem
          AutoCheck = True
          Caption = 'Dividir Verticalmente'
          RadioItem = True
          OnClick = dvClick
        end
      end
    end
  end
  object openfile: TOpenDialog
    DefaultExt = '.txt'
    Filter = 
      'Arquivo Texto (*.txt)|*.txt|P'#225'gina Web (*.htm)|*.html|P'#225'gina Web' +
      ' (*.dhml)|*.dhtml|P'#225'gina Web (*.xml)|*.xml|Banco de Dados Web (*' +
      '.php)|*.php|Banco de Dados Web (*.asp)|*.asp|Todos Arquivos (*.*' +
      ')|*.*'
    Left = 264
    Top = 328
  end
  object formatfont: TFontDialog
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    Left = 192
    Top = 328
  end
  object Savefile: TSaveDialog
    DefaultExt = '.txt'
    Filter = 
      'Arquivo Texto (*.txt)|*.txt|P'#225'gina Web (*.htm)|*.html|P'#225'gina Web' +
      ' (*.dhml)|*.dhtml|P'#225'gina Web (*.xml)|*.xml|Banco de Dados Web (*' +
      '.php)|*.php|Banco de Dados Web (*.asp)|*.asp|Todos Arquivos (*.*' +
      ')|*.*'
    Left = 328
    Top = 328
  end
  object Find: TFindDialog
    Ctl3D = False
    Options = [frDown, frFindNext]
    Left = 384
    Top = 328
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 128
    Top = 328
  end
  object Print: TPrintDialog
    Left = 440
    Top = 328
  end
  object PageSetup: TPageSetupDialog
    MinMarginLeft = 0
    MinMarginTop = 0
    MinMarginRight = 0
    MinMarginBottom = 0
    MarginLeft = 2500
    MarginTop = 2500
    MarginRight = 2500
    MarginBottom = 2500
    PageWidth = 21000
    PageHeight = 29700
    Units = pmMillimeters
    Left = 488
    Top = 328
  end
end
