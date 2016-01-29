program Peclipse;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UDMeclipse in 'UDMeclipse.pas' {DMeclipse: TDataModule},
  UCadAluno in 'UCadAluno.pas' {FrmAluno},
  UCadAssociado in 'UCadAssociado.pas' {FrmAssociado},
  UCadCurso in 'UCadCurso.pas' {FrmCurso},
  UCadGenero in 'UCadGenero.pas' {FrmGenero},
  UCadLivro in 'UCadLivro.pas' {FrmLivro},
  UCadLocador in 'UCadLocador.pas' {FrmLocador},
  UCadTurma in 'UCadTurma.pas' {FrmTurma},
  API_F11 in 'API_F11.pas',
  Uatualizar in 'Uatualizar.pas',
  ULogin in 'ULogin.pas' {FrmLogin},
  UpesqGeral in 'UpesqGeral.pas' {Frmpesq},
  Ucadvol in 'Ucadvol.pas' {frmcadvol},
  UcadHistorico in 'UcadHistorico.pas' {frmCadHistorico},
  Unit1 in 'Unit1.pas' {frmPesq_hist},
  Ufoto in 'Ufoto.pas' {Foto},
  ULocLivro in 'ULocLivro.pas' {FrmLocLivro},
  Ucadusu in 'Ucadusu.pas' {Frmcadusuario},
  pesq_t in 'pesq_t.pas' {frmPesq_tur},
  Uconf in 'Uconf.pas' {frmconfirmsenha},
  UPrincipal2 in 'UPrincipal2.pas' {FrmPrincipal2},
  UCadInteresse in 'UCadInteresse.pas' {frmCad_Interesse},
  UCadContato in 'UCadContato.pas' {FrmCadContato},
  UCadVolCargo in 'UCadVolCargo.pas' {frmCadVol_cargo},
  Usobre in 'Usobre.pas' {FrmSobre},
  Ulog in 'Ulog.pas' {frmlog};

{$R *.res}
begin
  Application.Initialize;
  Application.Title := 'Eclipse';
  Application.CreateForm(Tfrmlogin, frmlogin);
  frmlogin.Show;
  Application.CreateForm(TDMeclipse, DMeclipse);
  Application.Run;
end.
