object FrmCadContato: TFrmCadContato
  Left = 261
  Top = 284
  Width = 637
  Height = 329
  Caption = 'Cadastro de contato'
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label41: TLabel
    Left = 24
    Top = 56
    Width = 21
    Height = 13
    Caption = 'Tipo'
  end
  object Label42: TLabel
    Left = 158
    Top = 56
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label2: TLabel
    Left = 24
    Top = 14
    Width = 30
    Height = 13
    Caption = 'Aluno:'
  end
  object SpeedButton1: TSpeedButton
    Left = 116
    Top = 29
    Width = 21
    Height = 23
    Glyph.Data = {
      9E020000424D9E0200000000000036000000280000000E0000000E0000000100
      18000000000068020000C40E0000C40E00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000587EA17A8F
      A50000000000000000000000000000A7A2A1A5A09DA39E9DA09A9BA296969B90
      8C9596942575B071CCF39AE5FF8CA3AB0000000000000000000000FFFAFAFFFA
      FAFFFBFDFCF7F8FFECEAEEEFF96E97BE6FCBFA90ECFF71B1CA00000000000000
      00000000000000FFF8FAFFF7FBFFF8FCF5F0F1E1DFE57194B647A0DDA4F5FF6E
      ACD20000000000000000000000000000000000978A88978A8C9B8F8FC0B7B3D9
      CAD25E83919EECFF9BB4C8F3E6E80000000000000000000000000000957F73E6
      D5CCFFF4F0F0E5DDC8B9A9AB8C93B3AAA0BCC4C3CDC3CFF7E2EA000000000000
      0000000000897066D8B4A4FFF3E2FFFBEEFFF5E3FFE9D1CEB7A8C0ABAED7C0C8
      E0CBCDEFE0DE000000000000000098887CBE876CECB086F6E5BEF9E4C9FFE0C3
      F6D3ABDDAF8DE3C2B3E0CACFD2BCC1F3E0DD0000000000000000997B70C68368
      E39A6EF1CFA4ECC9A8F2C5A4ECC097EABA90E4BFA9D5BFBACCB6B8EFDCD90000
      000000000000A1857AC3876AFBB88BFCD8AAFFE0BAFFDDBAFED8AEF5C9A0E8C6
      AED4BDB5C4AFAEE5D4D10000000000000000B8A8A1C39A83F5C9A0FFEABEFFEA
      C6FFEBC8FCE9C4EECFB0F1D9C7EEDBD6DDCECCDDCECC00000000000000000000
      00B7A49CBAA38DFFEFD8FFF7E5FFF6E4F3E7D5E1D7D0E5DEDBFFF8FBD3CBCC00
      00000000000000000000000000000000C8BDB5D1C3BDCFC3BDDED2CCDBCFC5FD
      F8F7E4DEDFFCF5F80000000000000000000000000000000000000000000000F8
      F1F4E7E1E2F7F2F1FFF9F5F7F0EDE2DADABDB5B5000000000000000000000000
      0000}
    OnClick = SpeedButton1Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 24
    Top = 72
    Width = 113
    Height = 21
    DataField = 'tpfone_fnass'
    DataSource = dsAssociado
    KeyField = 'sigla_tf'
    ListField = 'tpfone_tf'
    ListFieldIndex = 1
    ListSource = DMeclipse.DStbtpfone
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 158
    Top = 72
    Width = 121
    Height = 21
    DataField = 'fone_fnass'
    DataSource = dsAssociado
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 24
    Top = 120
    Width = 497
    Height = 161
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Enabled = False
    TabOrder = 4
    object DBGrid1: TDBGrid
      Left = 8
      Top = 13
      Width = 481
      Height = 132
      TabStop = False
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object GroupBox1: TGroupBox
    Left = 536
    Top = 120
    Width = 73
    Height = 161
    Caption = 'Contato'
    TabOrder = 5
    object BitBtn8: TBitBtn
      Left = 22
      Top = 24
      Width = 31
      Height = 30
      TabOrder = 0
      OnClick = BitBtn8Click
      Glyph.Data = {
        76050000424D7605000000000000360000002800000015000000150000000100
        18000000000040050000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000007E28007E27007E27007E27007E27007E
        27007E2800000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000C85321088361088360F88360F88360E88
        350A853100000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000259549C2FDD64FEE8C4EEE8C4EEE8CB2FD
        CB21954600000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000269549C5FDD838EB7E38EB7E38EB7EB5FD
        CD23954700000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000028954ACEFDDE38EB7E38EB7E38EB7EBFFD
        D424954800000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000029954BD2FDE138EB7E38EB7E38EB7EC2FD
        D625954900000000000000000000000000000000000000000000000000007E28
        0F85352E954E2D954E2C954D2C954D48A566DBFDE738EB7E38EB7E38EB7ECCFD
        DD42A5622695492695492595482495480C8532007E2800000000000000007E27
        15883AF1FDF6ECFDF3E9FDF0E6FDEEE2FDECACF7C938EB7E38EB7E38EB7EA1F7
        C2CEFDDEC9FDDBC8FDD9C3FDD6C2FDD6108836007E2700000000000000007E27
        15883A59EE9338EB7E38EB7E38EB7E38EB7E38EB7E38EB7E38EB7E38EB7E38EB
        7E38EB7E38EB7E38EB7E38EB7E52EE8E118837007E2700000000000000007E27
        15883A59EE9338EB7E38EB7E38EB7E38EB7E38EB7E38EB7E38EB7E38EB7E38EB
        7E38EB7E38EB7E38EB7E38EB7E53EE8F118837007E2700000000000000007E27
        15883A59EE9338EB7E38EB7E38EB7E38EB7E38EB7E38EB7E38EB7E38EB7E38EB
        7E38EB7E38EB7E38EB7E38EB7E54EE90128838007E2700000000000000007E27
        15883AF1FDF6EEFDF4EEFDF4EEFDF4EEFDF4B7F7D038EB7E38EB7E38EB7EB7F7
        D0EDFDF3E9FDF0E7FDEFE2FDECE2FDEC138838007E2700000000000000007E28
        0F85352E954F2E954F2E954F2E954F4EA56AEEFDF438EB7E38EB7E38EB7EEEFD
        F44EA56A2D954E2D954E2C954D2C954D0E8534007E2800000000000000000000
        0000000000000000000000000000002E954FEFFDF43AEB7F38EB7E38EB7EEEFD
        F42E954F00000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000002E954FF0FDF546ED873BEB8039EB7EEEFD
        F42E954F00000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000002E954FF3FEF766F29C5AF09454EF90F0FD
        F52E954F00000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000002E954FF6FEF98CF6B482F5AE7DF4ABF3FD
        F72E954F00000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000F853515883A15883A15883A15883A1588
        3A0F853500000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000007E28007E27007E27007E27007E27007E
        27007E2800000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object BitBtn9: TBitBtn
      Left = 22
      Top = 88
      Width = 31
      Height = 30
      TabOrder = 1
      OnClick = BitBtn9Click
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000004D9C9382
        D1C883CEC782CCC47FC7C07DC2BB7CC0B97BBCB57ABAB378B5AF77B2AB76AFA9
        76AEA876AEA86CA7A0074640000000000000000000000D0D80D0C760C5BB55BC
        B253B9AF4FB3A94CACA24AA99F47A299459F9643999041938A4090873F8E853F
        8E854D968E07544C00000000000000000005534A89D4CD5FC5BB5BC1B75ABEB3
        57B7AE53B1A851AEA44DA79E60AEA55DA9A144978E42938A408E853F8E853F8E
        85125F56063E39000000000000055A4F85D3CB64C7BD62C5BB60C2B862BEB489
        CBC487C9C267B5ADA5D2CEA7D1CDA6CECA75B1AA47928A46928944918828736B
        075852000000000000075B5283D2CB67C8BE65C7BD63C4BA87CEC78BCCC68ACA
        C458AFA570B8B087C1BA6DAFA86DAEA64A958D49948B47938A367E77055A5000
        00000000000B645A73CCC46BC9C06CCAC06AC8BEB3E1DC65BDB471C0B85EB3AB
        5CB0A75CACA385BEB885BCB6509A924F978F4D968E4E908A075F540000000000
        000E675D61C6BC53C1B66CCAC06DCAC0B2E1DCA6D9D396D1CB62B6AD60B3AA5D
        ADA483BDB787BEB8549E95539A925199905798910A62580000000000000B675E
        56C2B751C0B551C0B551C0B593D5CFAEDDD871C2B968BAB281C4BD9DCEC96DB3
        AB5EA9A05BA39B59A098579C9464A19A0C665C00000000000009675D51C0B551
        C0B551C0B551C0B54FBDB25EBEB47FC9C26FBFB64AABA0A3D2CD90C6C0459C92
        529F975AA29A5DA0986CA7A109665D0000000000000D6D6251C0B551C0B551C0
        B551C0B550BEB34FB7AD75C6BD6DBFB669BBB2A3D3CE7CBCB550A49A42978D41
        948B5098906CA9A10B6A5F000000000000167A7051C0B551C0B551C0B551C0B5
        50BFB44EB9AF4DB7AC4BB0A64AAEA348A79D46A298439B913C89803780773170
        6937736C126D630000000000001B827651C0B551C0B551C0B551C0B551C0B54C
        B2A849ABA1429D943F968C38837B31726B2F6C662E69622D67602C635D2C625C
        12665E000000165F58D9D8D5D9D8D4D8D7D4D8D7D3D8D7D3D7D6D2D6D5D2D6D5
        D2D6D5D1D5D4D1D5D4D0D4D3D0D4D3D0D4D3CFD3D2CFD2D1CED2D1CED2D1CD14
        5E56135E568888833F3F3B585C5A5A5F5D5C605E5E6361616664626765656A68
        666B69696E6C6C706E6D72707075737176748B918FCED5D2D1D5D2145E570E5A
        53B5B5B2403F3B585C5A5A5F5D5C605E5E6361616664626765656A68666B6969
        6E6C6C706E6D7270707573717674898E8CCED5D2E6E7E30D5952000000B5C9C4
        42433E585C5A5A5F5D5C605E5E6361616664626765656A68666B69696E6C6C70
        6E6D7270707573717674848987D0D2CF8AACA6000000000000568A8443444058
        5C5A5A5F5D5C605E5E6361616664626765656A68666B69696E6C6C706E6D7270
        707573717674838886F2F1ED1E665E000000000000166058E9EDE8F4F3EFF4F3
        EFF4F3EFF4F3EFF4F3EFF4F3EFF4F3EFF4F3EFF4F3EFF4F3EFF4F3EFF4F3EFF4
        F3EFF4F3EF307169085850000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000}
    end
    object BitBtn12: TBitBtn
      Left = 22
      Top = 56
      Width = 31
      Height = 30
      TabOrder = 2
      OnClick = BitBtn12Click
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000000000B39C95
        B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C95B39C
        95B39C95B39C95B39C95000000000000000000000000000000B39C95F4EDEAF5
        F0EDF6F1EFF7F2EFF8F4F1F9F5F4FAF7F4FBF8F6FBF9F7FCFAF9FEFCFBFEFDFC
        FEFEFDB39C95000000000000000000000000000000B39C95EFE7E3F0E9E6F1EB
        E8F2ECE8F3EEEAF5F0EDF5F1EEF7F3F1F7F3F1F8F5F3F9F7F5FAF8F7FAF8F7B3
        9C95000000000000000000000000000000B39C95F1EAE6F2ECE9F3EEEBF4EEEB
        F5F0EEF6F2F0F7F3F1F8F5F3F8F5F4F9F7F6FBF9F8FBFAF9FAF8F8B39C950000
        00000000000000000000000000B39C95F2ECE9F3EEEBE6DCD9ECE4E1EDDDD9FA
        F5F4FAF6F3F9F6F5FAF7F6FBF9F8FCFBFAFDFCFBFAF9F8B39C95000000000000
        000000000000000000B39C95F3EDEAF4EEECF2EBE9F7F0EEBBC8D3FBF9F3F9F3
        F1FCFAF8FCFAF9FBF9F9FCFBFBFDFCFCFAF9F9B39C9500000000000000000000
        0000000000B39C95F4EFECF5F0EEF5F1EFF6F2F0FFFEFD57ACD84D84A6D6CDC8
        D1CDCCEDECECFFFFFFFFFFFFFBF9F9B39C950000000000000000000000000000
        00B39C95F5F0EEF6F2EFF6F2F0F7F3F1FDFDF876A2C7A0B7E38EADC4E8DBD4CD
        CDCEECECECFCFDFDFDFAFAB39C95000000000000000000000000000000B39C95
        F6F2F0F7F4F2E3D7D5F3EEECF3EEEDACD2E4378FC21ECCFC0382D2F1D5CDCCCA
        C7D0D1D1D4D3D3B39C95000000000000000000000000000000B39C95F8F4F2F7
        F3F1F0EBE9F0E9E8F2EEECE3DADAFCF1F1358EC2AAEAFA0163B2FFFAF7FFFFFF
        E3E2E1B39C95000000000000000000000000000000B39C95F8F5F3F9F7F5E2D6
        D5E1D5D3F6F3F2ECE1E1FCFAFBA8BBC93791C416C6FAA4B3C2FFFFFFFBF9F9B3
        9C95000000000000000000000000000000B39C95F9F7F5F9F6F5EBE4E3F2EDEC
        F4F0EFEFE9E9F3EFEFF5F0F3FDFAF82F88BC1FC4F9016FBCFFFDFCB39C950000
        00000000000000000000000000B39C95FAF8F7F9F6F5EDE7E6F3EEEDF6F3F3EC
        E5E5F8F4F4F7F4F4F6F0F1AACDE0B1E3F720C7F7CCE5F0B39C95000000000000
        000000000000000000B39C95FCFAF9FCFBFBE7DDDDFFFFFFEAE2E2FFFFFFF4F1
        F0E1D3D2FCFBFAFCF9FAACD0E4328DC132DDFC0082D6C9C1BD00000000000000
        0000000000B39C95FDFCFCFEFDFDFFFFFFFFFFFFFFFFFFFEFEFDFEFDFDFDFBFB
        FBF9F8E6DAD6B39C95B39C95258DC7818485858585CAC9DBF4F5F80000000000
        00B39C95FDFDFDFEFEFEF8F5F5FCFAFAF8F5F5FEFDFDFCFAFAFBF8F8F9F6F5B3
        9C95FFFFFFFFFFFFE9D5CD685754FDFEFF534E62232372000000000000B39C95
        FFFFFEFFFFFFFFFFFFFFFFFFFFFEFEFCFAFAFAF8F8F6F2F0F4EEECB39C95FDFD
        FBE7DCD8A88A85BCC2C3665B562C4FC7091285000000000000B39C95FFFFFFFF
        FFFFFEFEFEFEFEFEFDFBFBFAF7F6F8F5F4F3EDEBF0E9E6B39C95ECE2DEB39C95
        FBF9FAE1E1E2C0BFB13656C53453C2000000000000B39C95FFFFFFFFFFFFFFFF
        FFFFFFFFFEFDFDFAF7F6F8F3F1F0E8E5ECE1DDE6DAD5A4898400000000000000
        0000000000000000000000000000000000B39C95B39C95B39C95B39C95B39C95
        B39C95B39C95B39C95B39C95B39C95A78D880000000000000000000000000000
        00000000000000000000}
    end
    object BitBtn30: TBitBtn
      Left = 22
      Top = 120
      Width = 31
      Height = 30
      TabOrder = 3
      OnClick = BitBtn30Click
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000300
        0003000003000003000003000003000003000003000003000003000003000003
        0000030000030000030000000000000000000000000000000000030000030000
        0300000300000300000300000300000300000300000300000300000300000300
        0003000003000003000000000000000000000000000000000000147FE8147FE8
        147FE8147FE8147FE8147FE8147FE8147FE8147FE8147FE8147FE8147FE80000
        000000000000000000000000000000000000000000001289EB1289EB1289EB12
        89EB1289EB138DF0138DF01289EB1289EB1289EB1289EB1289EB000000000000
        000000000000000000000000000000000000108FEC108FEC108FEC108FEC108F
        EC0D0C0E0D0C0E108FEC108FEC108FEC108FEC108FEC00000000000000000000
        00000000000000000000000000000D99EE0D99EE0D99EE0D99EE0D99EE10131A
        10131B0D99EE0D99EE0D99EE0D99EE0D99EE0000000000000000000000000000
        000000000000000000000B9FF00B9FF00B9FF00B9FF00B9FF00E0C151210170B
        9FF00B9FF00B9FF00B9FF00B9FF0000000000000000000000000000000000000
        00000000000008A9F208A9F208A9F208A9F208A9F214243914243908A9F208A9
        F208A9F208A9F208A9F200000000000000000000000000000000000000000000
        000000B2F405B4F405B4F405B4F405B4F405B4F405B4F405B4F405B4F405B4F4
        05B4F400B2F40000000000000000000000000000000000000000000000000BBB
        F600B8F503B9F603B9F603B9F603B9F603B9F603B9F603B9F603B9F600B8F517
        BEF6000000000000000000000000000000000000000000000000000000000000
        ACAAAA000000000000000000000000000000ACAAAAACAAAA0000000000000000
        00000000000000000000000000000000000000000000000000000000ACACAD00
        0000000000000000000000000000ACACADACACAD000000000000000000000000
        000000000000000000000000000000000000000000000000B0B0B10000000000
        00000000000000000000B0B0B1B0B0B100000000000000000000000000000000
        0000000000000000000000000000000000000000B3B3B4E6E6E6000000000000
        000000000000B3B3B4B3B3B40000000000000000000000000000000000000000
        00000000000000000000000000000000B5B5B6B4B4B500000000000000000000
        0000B5B5B6B5B5B6000000000000000000000000000000000000000000000000
        000000000000000000000000B7B7B8B9B9BAB9B9BA000000000000B9B9BAB9B9
        BABEBEBF00000000000000000000000000000000000000000000000000000000
        0000000000000000F1F1F2B9B9BABBBBBCBBBBBCBBBBBCBBBBBCD5D6D6D8D8D8
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000C0C0C1C3C4C4C4C4C5BDBDBE00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000}
    end
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 30
    Width = 93
    Height = 21
    Color = clBtnFace
    TabOrder = 0
    OnExit = DBEdit1Exit
  end
  object Edit1: TEdit
    Left = 159
    Top = 29
    Width = 278
    Height = 21
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object ADOQuery1: TADOQuery
    Connection = DMeclipse.ADOCBD
    CursorType = ctStatic
    BeforePost = ADOQuery1BeforePost
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
    Left = 544
    Top = 16
    object ADOQuery1codigo_alu: TIntegerField
      FieldName = 'codigo_alu'
    end
    object ADOQuery1tptel_fnalu: TWideStringField
      FieldName = 'tptel_fnalu'
      Size = 15
    end
    object ADOQuery1fone_fnalu: TWideStringField
      FieldName = 'fone_fnalu'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 576
    Top = 16
  end
  object ADOAluno_p: TADOQuery
    Connection = DMeclipse.ADOCBD
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'codi'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select codigo_alu, nome_alu from tb_aluno'
      'where codigo_alu = :codi')
    Left = 424
    Top = 16
    object ADOAluno_pcodigo_alu: TAutoIncField
      FieldName = 'codigo_alu'
      ReadOnly = True
    end
    object ADOAluno_pnome_alu: TWideStringField
      FieldName = 'nome_alu'
      Size = 50
    end
  end
  object DSAluno_p: TDataSource
    DataSet = ADOAluno_p
    Left = 456
    Top = 16
  end
  object ADOAssociado: TADOQuery
    Active = True
    Connection = DMeclipse.ADOCBD
    CursorType = ctStatic
    BeforePost = ADOAssociadoBeforePost
    Parameters = <
      item
        Name = 'CODIASS'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT tb_fnassociado.*'
      
        'FROM tb_associado RIGHT JOIN tb_fnassociado ON tb_associado.codi' +
        'go_ass = tb_fnassociado.codigo_ass'
      'WHERE tb_fnassociado.codigo_ass = :CODIASS')
    Left = 544
    Top = 48
    object ADOAssociadocodigo_ass: TIntegerField
      FieldName = 'codigo_ass'
    end
    object ADOAssociadotpfone_fnass: TWideStringField
      FieldName = 'tpfone_fnass'
      Size = 15
    end
    object ADOAssociadofone_fnass: TWideStringField
      FieldName = 'fone_fnass'
      Size = 15
    end
  end
  object ADOVoluntario: TADOQuery
    Connection = DMeclipse.ADOCBD
    CursorType = ctStatic
    BeforePost = ADOVoluntarioBeforePost
    Parameters = <
      item
        Name = 'CODIVOL'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT tb_fnvoluntario.*'
      
        'FROM tb_voluntario RIGHT JOIN tb_fnvoluntario ON tb_voluntario.c' +
        'odigo_vol = tb_fnvoluntario.codigo_vol'
      'WHERE tb_fnvoluntario.codigo_vol = :CODIVOL')
    Left = 544
    Top = 80
    object ADOVoluntariocodigo_vol: TIntegerField
      FieldName = 'codigo_vol'
    end
    object ADOVoluntariotpfon_vol: TWideStringField
      FieldName = 'tpfon_vol'
      Size = 15
    end
    object ADOVoluntariofone_vol: TWideStringField
      FieldName = 'fone_vol'
      Size = 15
    end
  end
  object dsAssociado: TDataSource
    DataSet = ADOAssociado
    Left = 576
    Top = 48
  end
  object dsVoluntario: TDataSource
    DataSet = ADOVoluntario
    Left = 576
    Top = 80
  end
  object ADOAssociado_p: TADOQuery
    Connection = DMeclipse.ADOCBD
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'codi'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select codigo_ass, nome_ass from tb_associado'
      'where codigo_ass = :codi')
    Left = 424
    Top = 48
    object ADOAssociado_pcodigo_ass: TAutoIncField
      FieldName = 'codigo_ass'
      ReadOnly = True
    end
    object ADOAssociado_pnome_ass: TWideStringField
      FieldName = 'nome_ass'
      Size = 50
    end
  end
  object dsAssociado_p: TDataSource
    DataSet = ADOAssociado_p
    Left = 456
    Top = 48
  end
  object ADOVoluntario_p: TADOQuery
    Connection = DMeclipse.ADOCBD
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'codi'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'select codigo_vol, nome_vol from tb_voluntario'
      'where codigo_vol = :codi')
    Left = 424
    Top = 80
    object ADOVoluntario_pcodigo_vol: TAutoIncField
      FieldName = 'codigo_vol'
      ReadOnly = True
    end
    object ADOVoluntario_pnome_vol: TWideStringField
      FieldName = 'nome_vol'
      Size = 50
    end
  end
  object dsVoluntario_p: TDataSource
    DataSet = ADOVoluntario_p
    Left = 456
    Top = 80
  end
end