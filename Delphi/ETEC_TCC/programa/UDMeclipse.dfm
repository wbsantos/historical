object DMeclipse: TDMeclipse
  OldCreateOrder = False
  Left = 490
  Top = 99
  Height = 581
  Width = 536
  object ADOCBD: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=BD\bd' +
      'eclipse.mdb;Mode=Share Deny None;Extended Properties="";Persist ' +
      'Security Info=False;Jet OLEDB:System database="";Jet OLEDB:Regis' +
      'try Path="";Jet OLEDB:Database Password=*Senha01;Jet OLEDB:Engin' +
      'e Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Part' +
      'ial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:Ne' +
      'w Database Password="";Jet OLEDB:Create System Database=False;Je' +
      't OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Co' +
      'mpact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet O' +
      'LEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 360
    Top = 336
  end
  object TBvoluntario: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_voluntario')
    Left = 371
    Top = 72
    object TBvoluntariocodigo_vol: TAutoIncField
      FieldName = 'codigo_vol'
      ReadOnly = True
    end
    object TBvoluntariodtadm_vol: TDateTimeField
      FieldName = 'dtadm_vol'
    end
    object TBvoluntarionome_vol: TWideStringField
      FieldName = 'nome_vol'
      Size = 50
    end
    object TBvoluntariosx_vol: TWideStringField
      FieldName = 'sx_vol'
      Size = 1
    end
    object TBvoluntariodtnasc_vol: TDateTimeField
      FieldName = 'dtnasc_vol'
    end
    object TBvoluntariorg_vol: TWideStringField
      FieldName = 'rg_vol'
      Size = 15
    end
    object TBvoluntariocpf_vol: TWideStringField
      FieldName = 'cpf_vol'
      Size = 15
    end
    object TBvoluntarionacional_vol: TWideStringField
      FieldName = 'nacional_vol'
      Size = 15
    end
    object TBvoluntarionatural_vol: TWideStringField
      FieldName = 'natural_vol'
      Size = 25
    end
    object TBvoluntarioend_vol: TWideStringField
      FieldName = 'end_vol'
      Size = 35
    end
    object TBvoluntarionum_vol: TIntegerField
      FieldName = 'num_vol'
    end
    object TBvoluntariocompl_vol: TWideStringField
      FieldName = 'compl_vol'
      Size = 35
    end
    object TBvoluntariobairro_vol: TWideStringField
      FieldName = 'bairro_vol'
    end
    object TBvoluntariocep_vol: TWideStringField
      FieldName = 'cep_vol'
      Size = 10
    end
    object TBvoluntariocid_vol: TWideStringField
      FieldName = 'cid_vol'
    end
    object TBvoluntariouf_vol: TWideStringField
      FieldName = 'uf_vol'
      Size = 2
    end
    object TBvoluntarioemail_vol: TWideStringField
      FieldName = 'email_vol'
      Size = 50
    end
    object TBvoluntarioescolar_vol: TWideStringField
      FieldName = 'escolar_vol'
      Size = 15
    end
    object TBvoluntariofrmcao_vol: TWideStringField
      FieldName = 'frmcao_vol'
      Size = 30
    end
    object TBvoluntarioprofis_vol: TWideStringField
      FieldName = 'profis_vol'
      Size = 25
    end
    object TBvoluntarioaptid_vol: TWideStringField
      FieldName = 'aptid_vol'
      Size = 50
    end
    object TBvoluntariotrabassoci_vol: TWideStringField
      FieldName = 'trabassoci_vol'
      Size = 3
    end
    object TBvoluntarioarea_vol: TWideStringField
      FieldName = 'area_vol'
      Size = 15
    end
    object TBvoluntariodias_vol: TWideStringField
      FieldName = 'dias_vol'
      Size = 15
    end
    object TBvoluntariohra_vol: TWideStringField
      FieldName = 'hra_vol'
      Size = 15
    end
    object TBvoluntarioindicacao_vol: TWideStringField
      FieldName = 'indicacao_vol'
      Size = 25
    end
  end
  object TBfnvoluntario: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_fnvoluntario')
    Left = 371
    Top = 129
    object TBfnvoluntariocodigo_vol: TIntegerField
      FieldName = 'codigo_vol'
    end
    object TBfnvoluntariotpfon_vol: TWideStringField
      FieldName = 'tpfon_vol'
      Size = 15
    end
    object TBfnvoluntariofone_vol: TWideStringField
      FieldName = 'fone_vol'
      Size = 15
    end
  end
  object TBcargo: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_cargo'
      '')
    Left = 30
    Top = 129
    object TBcargocodigo_vol: TIntegerField
      FieldName = 'codigo_vol'
    end
    object TBcargocargo_vol: TWideStringField
      FieldName = 'cargo_vol'
      Size = 25
    end
  end
  object TBusuario: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_usuario')
    Left = 371
    Top = 185
    object TBusuariocodigo_usu: TAutoIncField
      FieldName = 'codigo_usu'
      ReadOnly = True
    end
    object TBusuarionome_usu: TWideStringField
      FieldName = 'nome_usu'
      Size = 15
    end
    object TBusuariosenha_usu: TWideStringField
      FieldName = 'senha_usu'
    end
    object TBusuarionacesso_usu: TWideStringField
      FieldName = 'nacesso_usu'
      Size = 2
    end
    object TBusuariofrase_usu: TWideStringField
      FieldName = 'frase_usu'
      Size = 50
    end
  end
  object TBlistaespera: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_listaespera')
    Left = 30
    Top = 352
    object TBlistaesperacodigo_alu: TIntegerField
      FieldName = 'codigo_alu'
    end
    object TBlistaesperadtficha_esp: TDateTimeField
      FieldName = 'dtficha_esp'
    end
    object TBlistaesperacodigo_cur: TIntegerField
      FieldName = 'codigo_cur'
    end
  end
  object TBcontribuicao: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_contribuicao')
    Left = 184
    Top = 129
    object TBcontribuicaocodigo_con: TAutoIncField
      FieldName = 'codigo_con'
      ReadOnly = True
    end
    object TBcontribuicaocodigo_ass: TIntegerField
      FieldName = 'codigo_ass'
    end
    object TBcontribuicaovlr_con: TIntegerField
      FieldName = 'vlr_con'
    end
    object TBcontribuicaodtpagto_con: TDateTimeField
      FieldName = 'dtpagto_con'
    end
  end
  object TBlocador: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_locador ')
    Left = 184
    Top = 240
    object TBlocadorcodigo_loc: TAutoIncField
      FieldName = 'codigo_loc'
      ReadOnly = True
    end
    object TBlocadornome_loc: TWideStringField
      FieldName = 'nome_loc'
      Size = 50
    end
    object TBlocadorsx_loc: TWideStringField
      FieldName = 'sx_loc'
      Size = 1
    end
    object TBlocadorrg_loc: TWideStringField
      FieldName = 'rg_loc'
      Size = 15
    end
    object TBlocadorcpf_loc: TWideStringField
      FieldName = 'cpf_loc'
      Size = 15
    end
    object TBlocadorend_loc: TWideStringField
      FieldName = 'end_loc'
      Size = 35
    end
    object TBlocadorcid_loc: TWideStringField
      FieldName = 'cid_loc'
    end
    object TBlocadoruf_loc: TWideStringField
      FieldName = 'uf_loc'
      Size = 2
    end
    object TBlocadoremail_loc: TWideStringField
      FieldName = 'email_loc'
      Size = 50
    end
    object TBlocadorBlock_loc: TWideStringField
      FieldName = 'Block_loc'
      Size = 1
    end
  end
  object TBlocacao: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_locacao')
    Left = 184
    Top = 296
    object TBlocacaocodigo_locacao: TAutoIncField
      FieldName = 'codigo_locacao'
      ReadOnly = True
    end
    object TBlocacaocodigo_loc: TIntegerField
      FieldName = 'codigo_loc'
    end
    object TBlocacaodt_locado: TDateTimeField
      FieldName = 'dt_locado'
    end
    object TBlocacaodtprev_locac: TDateTimeField
      FieldName = 'dtprev_locac'
    end
    object TBlocacaodtentg_locac: TDateTimeField
      FieldName = 'dtentg_locac'
    end
    object TBlocacaopendencia_locac: TWideStringField
      FieldName = 'pendencia_locac'
      Size = 100
    end
    object TBlocacaoobs_locac: TMemoField
      FieldName = 'obs_locac'
      BlobType = ftMemo
    end
    object TBlocacaotombo_liv: TIntegerField
      FieldName = 'tombo_liv'
    end
  end
  object TBgenero: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_genero')
    Left = 184
    Top = 185
    object TBgenerocodigo_gen: TAutoIncField
      FieldName = 'codigo_gen'
      ReadOnly = True
    end
    object TBgeneronome_gen: TWideStringField
      FieldName = 'nome_gen'
      Size = 25
    end
    object TBgenerocor_gen: TWideStringField
      FieldName = 'cor_gen'
    end
  end
  object TBfnlocador: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_fnlocador')
    Left = 30
    Top = 296
    object TBfnlocadorcodigo_loc: TIntegerField
      FieldName = 'codigo_loc'
    end
    object TBfnlocadortpfone_fnloc: TWideStringField
      FieldName = 'tpfone_fnloc'
      Size = 15
    end
    object TBfnlocadorfone_fnloc: TWideStringField
      FieldName = 'fone_fnloc'
      Size = 15
    end
  end
  object TBaluno: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_aluno')
    Left = 30
    Top = 16
    object TBalunocodigo_alu: TAutoIncField
      FieldName = 'codigo_alu'
      ReadOnly = True
    end
    object TBalunonome_alu: TWideStringField
      FieldName = 'nome_alu'
      Size = 50
    end
    object TBalunosx_alu: TWideStringField
      FieldName = 'sx_alu'
      Size = 1
    end
    object TBalunodtnasc_alu: TDateTimeField
      FieldName = 'dtnasc_alu'
    end
    object TBalunorg_alu: TWideStringField
      FieldName = 'rg_alu'
      Size = 15
    end
    object TBalunonacional_alu: TWideStringField
      FieldName = 'nacional_alu'
      Size = 15
    end
    object TBalunonatural_alu: TWideStringField
      FieldName = 'natural_alu'
      Size = 25
    end
    object TBalunoend_alu: TWideStringField
      FieldName = 'end_alu'
      Size = 35
    end
    object TBalunonum_alu: TIntegerField
      FieldName = 'num_alu'
    end
    object TBalunocompl_alu: TWideStringField
      FieldName = 'compl_alu'
      Size = 35
    end
    object TBalunobairro_alu: TWideStringField
      FieldName = 'bairro_alu'
    end
    object TBalunocep_alu: TWideStringField
      FieldName = 'cep_alu'
      Size = 10
    end
    object TBalunocid_alu: TWideStringField
      FieldName = 'cid_alu'
    end
    object TBalunouf_alu: TWideStringField
      FieldName = 'uf_alu'
      Size = 2
    end
    object TBalunomae_alu: TWideStringField
      FieldName = 'mae_alu'
      Size = 35
    end
    object TBalunoprofmae_alu: TWideStringField
      FieldName = 'profmae_alu'
      Size = 25
    end
    object TBalunorgmae_alu: TWideStringField
      FieldName = 'rgmae_alu'
      Size = 15
    end
    object TBalunocpfmae_alu: TWideStringField
      FieldName = 'cpfmae_alu'
      Size = 15
    end
    object TBalunopai_alu: TWideStringField
      FieldName = 'pai_alu'
      Size = 35
    end
    object TBalunoprofpai_alu: TWideStringField
      FieldName = 'profpai_alu'
      Size = 25
    end
    object TBalunorgpai_alu: TWideStringField
      FieldName = 'rgpai_alu'
      Size = 15
    end
    object TBalunocpfpai_alu: TWideStringField
      FieldName = 'cpfpai_alu'
      Size = 15
    end
    object TBalunorenda_alu: TIntegerField
      FieldName = 'renda_alu'
    end
    object TBalunocsap_alu: TWideStringField
      FieldName = 'csap_alu'
      Size = 3
    end
    object TBalunovlalug_alu: TIntegerField
      FieldName = 'vlalug_alu'
    end
    object TBalunoqt_resid_alu: TIntegerField
      FieldName = 'qt_resid_alu'
    end
    object TBalunoconhece_alu: TWideStringField
      FieldName = 'conhece_alu'
      Size = 100
    end
    object TBalunoestuda_alu: TWideStringField
      FieldName = 'estuda_alu'
      Size = 255
    end
    object TBalunotpesc_alu: TWideStringField
      FieldName = 'tpesc_alu'
      Size = 12
    end
    object TBalunonomeesc_alu: TWideStringField
      FieldName = 'nomeesc_alu'
      Size = 25
    end
    object TBalunoserieesc_alu: TWideStringField
      FieldName = 'serieesc_alu'
      Size = 15
    end
    object TBalunoendesc_alu: TWideStringField
      FieldName = 'endesc_alu'
      Size = 35
    end
    object TBalunobairroesc_alu: TWideStringField
      FieldName = 'bairroesc_alu'
    end
    object TBalunocepesc_alu: TWideStringField
      FieldName = 'cepesc_alu'
      Size = 10
    end
    object TBalunocidesc_alu: TWideStringField
      FieldName = 'cidesc_alu'
    end
    object TBalunoufesc_alu: TWideStringField
      FieldName = 'ufesc_alu'
      Size = 2
    end
    object TBalunodtcad_alu: TDateTimeField
      FieldName = 'dtcad_alu'
    end
    object TBalunocodigo_vol: TIntegerField
      FieldName = 'codigo_vol'
    end
    object TBalunofoto: TBlobField
      FieldName = 'foto'
    end
    object TBalunoStatus: TWideStringField
      FieldName = 'Status'
      Size = 1
    end
    object TBalunoemail: TWideStringField
      FieldName = 'email'
      Size = 38
    end
  end
  object TBfnaluno: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_fnaluno')
    Left = 184
    Top = 16
    object TBfnalunocodigo_alu: TIntegerField
      FieldName = 'codigo_alu'
    end
    object TBfnalunotptel_fnalu: TWideStringField
      FieldName = 'tptel_fnalu'
      Size = 15
    end
    object TBfnalunofone_fnalu: TWideStringField
      FieldName = 'fone_fnalu'
      Size = 15
    end
  end
  object TBcurso: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_curso')
    Left = 30
    Top = 185
    object TBcursocodigo_cur: TAutoIncField
      FieldName = 'codigo_cur'
      ReadOnly = True
    end
    object TBcursonome_cur: TWideStringField
      FieldName = 'nome_cur'
      Size = 25
    end
  end
  object TBturma: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_turma')
    Left = 371
    Top = 16
    object TBturmacodigo_tur: TAutoIncField
      FieldName = 'codigo_tur'
      ReadOnly = True
    end
    object TBturmacodigo_cur: TIntegerField
      FieldName = 'codigo_cur'
    end
    object TBturmacodigo_vol: TIntegerField
      FieldName = 'codigo_vol'
    end
    object TBturmanome_tur: TWideStringField
      FieldName = 'nome_tur'
      Size = 35
    end
    object TBturmadt_ini: TDateTimeField
      FieldName = 'dt_ini'
    end
    object TBturmadt_prev: TDateTimeField
      FieldName = 'dt_prev'
    end
    object TBturmadt_fin: TDateTimeField
      FieldName = 'dt_fin'
    end
    object TBturmanumvagas_tur: TSmallintField
      FieldName = 'numvagas_tur'
    end
    object TBturmanumalu_tur: TSmallintField
      FieldName = 'numalu_tur'
    end
    object TBturmaobs_tur: TMemoField
      FieldName = 'obs_tur'
      BlobType = ftMemo
    end
    object TBturmastatus_tur: TWideStringField
      FieldName = 'status_tur'
    end
  end
  object TBhistorico: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_historico')
    Left = 30
    Top = 240
    object TBhistoricocodigo_alu: TIntegerField
      FieldName = 'codigo_alu'
    end
    object TBhistoricocodigo_tur: TIntegerField
      FieldName = 'codigo_tur'
    end
    object TBhistoriconfaltas: TWideStringField
      FieldName = 'nfaltas'
      Size = 6
    end
    object TBhistoricostatus_alu: TWideStringField
      FieldName = 'status_alu'
      Size = 2
    end
    object TBhistoricoobs_alu: TMemoField
      FieldName = 'obs_alu'
      BlobType = ftMemo
    end
    object TBhistoricomediafinal_alu: TWideStringField
      FieldName = 'mediafinal_alu'
      Size = 40
    end
    object TBhistoricocodigo_hist: TAutoIncField
      FieldName = 'codigo_hist'
      ReadOnly = True
    end
  end
  object TBassociado: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_associado')
    Left = 30
    Top = 72
    object TBassociadocodigo_ass: TAutoIncField
      FieldName = 'codigo_ass'
      ReadOnly = True
    end
    object TBassociadodtadm_ass: TDateTimeField
      FieldName = 'dtadm_ass'
    end
    object TBassociadonome_ass: TWideStringField
      FieldName = 'nome_ass'
      Size = 50
    end
    object TBassociadosx_ass: TWideStringField
      FieldName = 'sx_ass'
      Size = 1
    end
    object TBassociadodtnasc_ass: TDateTimeField
      FieldName = 'dtnasc_ass'
    end
    object TBassociadorg_ass: TWideStringField
      FieldName = 'rg_ass'
      Size = 15
    end
    object TBassociadocpf_ass: TWideStringField
      FieldName = 'cpf_ass'
      Size = 15
    end
    object TBassociadonacional_ass: TWideStringField
      FieldName = 'nacional_ass'
      Size = 15
    end
    object TBassociadonatural_ass: TWideStringField
      FieldName = 'natural_ass'
      Size = 25
    end
    object TBassociadoend_ass: TWideStringField
      FieldName = 'end_ass'
      Size = 35
    end
    object TBassociadonum_ass: TIntegerField
      FieldName = 'num_ass'
    end
    object TBassociadocompl_ass: TWideStringField
      FieldName = 'compl_ass'
      Size = 35
    end
    object TBassociadobairro_ass: TWideStringField
      FieldName = 'bairro_ass'
    end
    object TBassociadocep_ass: TWideStringField
      FieldName = 'cep_ass'
      Size = 10
    end
    object TBassociadocid_ass: TWideStringField
      FieldName = 'cid_ass'
    end
    object TBassociadouf_ass: TWideStringField
      FieldName = 'uf_ass'
      Size = 2
    end
    object TBassociadoemail_ass: TWideStringField
      FieldName = 'email_ass'
      Size = 50
    end
    object TBassociadoescolar_ass: TWideStringField
      FieldName = 'escolar_ass'
      Size = 15
    end
    object TBassociadofrmcao_ass: TWideStringField
      FieldName = 'frmcao_ass'
      Size = 30
    end
    object TBassociadoaptid_ass: TWideStringField
      FieldName = 'aptid_ass'
      Size = 255
    end
    object TBassociadoconhece_ass: TWideStringField
      FieldName = 'conhece_ass'
      Size = 255
    end
    object TBassociadoprofis_ass: TWideStringField
      FieldName = 'profis_ass'
      Size = 25
    end
    object TBassociadoindicacao_vol: TWideStringField
      FieldName = 'indicacao_vol'
      Size = 35
    end
  end
  object TBfnassociado: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_fnassociado')
    Left = 184
    Top = 72
    object TBfnassociadocodigo_ass: TIntegerField
      FieldName = 'codigo_ass'
    end
    object TBfnassociadotpfone_fnass: TWideStringField
      FieldName = 'tpfone_fnass'
      Size = 15
    end
    object TBfnassociadofone_fnass: TWideStringField
      FieldName = 'fone_fnass'
      Size = 15
    end
  end
  object TBmulta: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_multa')
    Left = 182
    Top = 408
    object TBmultacodigo_mul: TAutoIncField
      FieldName = 'codigo_mul'
      ReadOnly = True
    end
    object TBmultacodigo_loca: TIntegerField
      FieldName = 'codigo_loca'
    end
    object TBmultamultad_mul: TSmallintField
      FieldName = 'multad_mul'
    end
    object TBmultadatrazo_mul: TSmallintField
      FieldName = 'datrazo_mul'
    end
    object TBmultatotal_mul: TIntegerField
      FieldName = 'total_mul'
    end
  end
  object TBtpfone: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_tpfone')
    Left = 371
    Top = 240
    object TBtpfonesigla_tf: TWideStringField
      FieldName = 'sigla_tf'
      Size = 2
    end
    object TBtpfonetpfone_tf: TWideStringField
      FieldName = 'tpfone_tf'
      Size = 30
    end
    object TBtpfonestatus_tf: TWideStringField
      FieldName = 'status_tf'
      Size = 30
    end
  end
  object TBmencao: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_mencao')
    Left = 30
    Top = 408
    object TBmencaonota_men: TWideStringField
      FieldName = 'nota_men'
      Size = 10
    end
  end
  object DStbaluno: TDataSource
    DataSet = TBaluno
    Left = 102
    Top = 16
  end
  object DStbassociado: TDataSource
    DataSet = TBassociado
    Left = 102
    Top = 72
  end
  object DStbcargo: TDataSource
    DataSet = TBcargo
    Left = 102
    Top = 129
  end
  object DStbcontribuicao: TDataSource
    DataSet = TBcontribuicao
    Left = 266
    Top = 129
  end
  object DStbcurso: TDataSource
    DataSet = TBcurso
    Left = 102
    Top = 185
  end
  object DStbfnaluno: TDataSource
    DataSet = TBfnaluno
    Left = 266
    Top = 16
  end
  object DSfnassociado: TDataSource
    DataSet = TBfnassociado
    Left = 266
    Top = 72
  end
  object DStbfnlocador: TDataSource
    DataSet = TBfnlocador
    Left = 102
    Top = 296
  end
  object DSfnvoluntario: TDataSource
    DataSet = TBfnvoluntario
    Left = 447
    Top = 129
  end
  object DStbgenero: TDataSource
    DataSet = TBgenero
    Left = 266
    Top = 185
  end
  object DStbhistorico: TDataSource
    DataSet = TBhistorico
    Left = 102
    Top = 240
  end
  object DStblistaespera: TDataSource
    DataSet = TBlistaespera
    Left = 102
    Top = 352
  end
  object DStblivro: TDataSource
    DataSet = TBlivro
    Left = 266
    Top = 352
  end
  object DStblocacao: TDataSource
    DataSet = TBlocacao
    Left = 266
    Top = 296
  end
  object DStblocador: TDataSource
    DataSet = TBlocador
    Left = 266
    Top = 240
  end
  object DStbmencao: TDataSource
    DataSet = TBmencao
    Left = 102
    Top = 408
  end
  object DStbmulta: TDataSource
    DataSet = TBmulta
    Left = 266
    Top = 408
  end
  object DStbtpfone: TDataSource
    DataSet = TBtpfone
    Left = 448
    Top = 240
  end
  object DStbturma: TDataSource
    DataSet = TBturma
    Left = 448
    Top = 16
  end
  object DStbusuario: TDataSource
    DataSet = TBusuario
    Left = 447
    Top = 185
  end
  object DStbvoluntario: TDataSource
    DataSet = TBvoluntario
    Left = 447
    Top = 72
  end
  object TBlivro: TADOQuery
    Active = True
    Connection = ADOCBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_livro')
    Left = 184
    Top = 352
    object TBlivrotombo_liv: TIntegerField
      FieldName = 'tombo_liv'
    end
    object TBlivronome_liv: TWideStringField
      FieldName = 'nome_liv'
      Size = 50
    end
    object TBlivroautor_liv: TWideStringField
      FieldName = 'autor_liv'
      Size = 35
    end
    object TBlivrosinopse_liv: TMemoField
      FieldName = 'sinopse_liv'
      BlobType = ftMemo
    end
    object TBlivrocodigo_gen: TIntegerField
      FieldName = 'codigo_gen'
    end
    object TBlivrosub_cod_gen: TIntegerField
      FieldName = 'sub_cod_gen'
    end
    object TBlivrodisp_liv: TWideStringField
      FieldName = 'disp_liv'
    end
  end
  object Log_reg: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 312
    object Log_regNome: TStringField
      FieldName = 'Nome'
      Size = 35
    end
    object Log_regData: TDateField
      FieldName = 'Data'
    end
    object Log_regHora: TTimeField
      FieldName = 'Hora'
    end
  end
end
