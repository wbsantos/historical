unit UPrincipal2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, XPMan, ComCtrls, Buttons, ToolWin, shellapi,ExtCtrls,
  jpeg;

type
  TFrmPrincipal2 = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Cadastro1: TMenuItem;
    Aluno1: TMenuItem;
    Associado1: TMenuItem;
    Curso1: TMenuItem;
    Livro1: TMenuItem;
    Locador1: TMenuItem;
    Gnero1: TMenuItem;
    Usurio1: TMenuItem;
    Turma1: TMenuItem;
    Voluntrio1: TMenuItem;
    Segurana1: TMenuItem;
    Backup1: TMenuItem;
    Logdoprograma1: TMenuItem;
    Consulta1: TMenuItem;
    Sair2: TMenuItem;
    HistoricoAluno1: TMenuItem;
    Biblioteca1: TMenuItem;
    Locao1: TMenuItem;
    RestauraodeBackuo1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Help1: TMenuItem;
    Help2: TMenuItem;
    SobreoEclipse1: TMenuItem;
    Mudarmododeexibio1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Aluno1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Associado1Click(Sender: TObject);
    procedure Cargo1Click(Sender: TObject);
    procedure Curso1Click(Sender: TObject);
    procedure Gnero1Click(Sender: TObject);
    procedure Livro1Click(Sender: TObject);
    procedure Locador1Click(Sender: TObject);
    procedure Turma1Click(Sender: TObject);
    procedure Geral1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Voluntrio1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure HistoricoAluno1Click(Sender: TObject);
    procedure Locao1Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure RestauraodeBackuo1Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure Mudarmododeexibio1Click(Sender: TObject);
    procedure Logdoprograma1Click(Sender: TObject);
    procedure SobreoEclipse1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal2: TFrmPrincipal2;
  r:boolean;

implementation

uses API_F11, Math, UCadAluno, UCadAssociado, UCadCargo, UCadCurso,
  UCadGenero, UCadLivro, UCadLocador, UCadTurma, UpesqGeral, Ucadvol,
  UcadHistorico, ULocLivro, Ucadusu, ULogin, Uconf, UPrincipal, Usobre,
  Ulog;

{$R *.dfm}

procedure TFrmPrincipal2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:= cafree;
  FrmPrincipal2:= nil;
end;

procedure TFrmPrincipal2.Sair2Click(Sender: TObject);
begin
  descarregarlog;
  Application.Terminate;
end;

procedure TFrmPrincipal2.Sair1Click(Sender: TObject);
begin
  frmlogin.show;
  descarregarlog;
  Close;
end;

procedure TFrmPrincipal2.Aluno1Click(Sender: TObject);
begin
  If(FrmAluno = nil)then
  begin
    Application.CreateForm(TFrmAluno, FrmAluno);
    FrmAluno.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure TFrmPrincipal2.Associado1Click(Sender: TObject);
begin
  If(FrmAssociado = nil)then
  begin
    Application.CreateForm(TFrmAssociado, FrmAssociado);
    FrmAssociado.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.Cargo1Click(Sender: TObject);
begin
  If(FrmCargo = nil)then
  begin
    Application.CreateForm(TFrmCargo, FrmCargo);
    FrmCargo.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.Curso1Click(Sender: TObject);
begin
  If(FrmCurso = nil)then
  begin
    Application.CreateForm(TFrmCurso, FrmCurso);
    FrmCurso.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.Gnero1Click(Sender: TObject);
begin
  If(FrmGenero = nil)then
  begin
    Application.CreateForm(TFrmGenero, FrmGenero);
    FrmGenero.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.Livro1Click(Sender: TObject);
begin
  If(FrmLivro = nil)then
  begin
    Application.CreateForm(TFrmLivro, FrmLivro);
    FrmLivro.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.Locador1Click(Sender: TObject);
begin
  If(FrmLocador = nil)then
  begin
    Application.CreateForm(TFrmLocador, FrmLocador);
    FrmLocador.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.Turma1Click(Sender: TObject);
begin
  If(FrmTurma = nil)then
  begin
    Application.CreateForm(TFrmTurma, FrmTurma);
    FrmTurma.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.Geral1Click(Sender: TObject);
begin
  If(Frmpesq = nil)then
  begin
    Application.CreateForm(TFrmpesq, Frmpesq);
    Frmpesq.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.FormCreate(Sender: TObject);
begin
  String_tb := TString_tb.Create;
  r:=true;
end;

procedure TFrmPrincipal2.Voluntrio1Click(Sender: TObject);
begin
  If(frmcadvol = nil)then
  begin
    Application.CreateForm(Tfrmcadvol, frmcadvol);
    frmcadvol.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.FormShow(Sender: TObject);
begin
 if(User_id.nivel = 1)then
 begin
   Cadastro1.Enabled:=true;
   Biblioteca1.Enabled:=false;
   Segurana1.Enabled:=false;
 end;
 if(User_id.nivel = 2)then
 begin
   Cadastro1.Enabled:=false;
   Biblioteca1.Enabled:=true;
   Segurana1.Enabled:=false;
 end;
 if(User_id.nivel = 3)then
 begin
   Cadastro1.Enabled:=true;
   Biblioteca1.Enabled:=true;
   Segurana1.Enabled:=true;
 end;

 FrmPrincipal2.Enabled := true;
end;

procedure TFrmPrincipal2.Button2Click(Sender: TObject);
//var x : integer;
begin
//  for x:=0 To Cadastro1.Count do
//  showmessage(IntToStr(Cadastro1.Count));

end;

procedure TFrmPrincipal2.HistoricoAluno1Click(Sender: TObject);
begin
  If(frmCadHistorico = nil)then
  begin
    Application.CreateForm(TfrmCadHistorico, frmCadHistorico);
    frmCadHistorico.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.Locao1Click(Sender: TObject);
begin
  If(FrmLocLivro = nil)then
  begin
    Application.CreateForm(Tfrmloclivro, frmloclivro);
    frmloclivro.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.Usurio1Click(Sender: TObject);
begin
  If(Frmcadusuario = nil)then
  begin
    Application.CreateForm(TFrmcadusuario, Frmcadusuario);
    Frmcadusuario.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.Backup1Click(Sender: TObject);
begin
  SaveDialog1.Execute;
  copyfile(pchar('bd\bdeclipse.mdb'),pchar(SaveDialog1.filename),true);
end;

procedure TFrmPrincipal2.RestauraodeBackuo1Click(Sender: TObject);
begin
  if(OpenDialog1.Execute)then
    begin
    If messagedlg('Tem certeza que deseja substituir o Banco de dados?'+#13+'Essa operação é irreversível!', mtconfirmation, [mbyes, mbno], 0) = mryes then
    begin
      Application.CreateForm(Tfrmconfirmsenha,frmconfirmsenha);
      frmconfirmsenha.ShowModal;
      if conf=true then
      begin
        copyfile(pchar(OpenDialog1.filename),pchar('bd\bdeclipse.mdb'),false);
      end
      else if cancel<> true then
      begin
        showmessage('Senha Incorreta'+#13+'A seção será encerrada.');
        close;
      end;
    end;
  end;
end;

procedure TFrmPrincipal2.Help2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open','help\eclipsehelp.chm', '', '', 1);
end;

procedure TFrmPrincipal2.Mudarmododeexibio1Click(Sender: TObject);
begin
  rewrite(p);
  writeln(p,crypt('C','2900'));
  closefile(p);
  menup:='2900';
  Application.CreateForm(tfrmprincipal,frmprincipal);
  frmprincipal.show;
  close;
end;

procedure TFrmPrincipal2.Logdoprograma1Click(Sender: TObject);
begin
  If(frmlog = nil)then
  begin
    Application.CreateForm(Tfrmlog, frmlog);
    frmlog.Show;
    FrmPrincipal2.Enabled:=false;
  end;
end;

procedure TFrmPrincipal2.SobreoEclipse1Click(Sender: TObject);
begin
  If(FrmSobre = nil)then
  begin
    Application.CreateForm(TFrmSobre, FrmSobre);
    FrmSobre.ShowModal;
  end;
end;

end.
