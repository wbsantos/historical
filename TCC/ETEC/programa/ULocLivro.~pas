unit ULocLivro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask,db;

type
  TFrmLocLivro = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label2: TLabel;
    DBComboBox1: TDBComboBox;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure habilitarpesq;
    procedure desabilitarpesq;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLocLivro: TFrmLocLivro;

implementation

uses UDMeclipse, API_F11, UCadAluno, UpesqGeral, UPrincipal, UPrincipal2;

{$R *.dfm}

procedure TFrmLocLivro.BitBtn1Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, true);
  habilitarpesq;
  DMeclipse.TBlocacao.Insert;
  DMeclipse.TBlocacaopendencia_locac.AsString:='Sim';
end;

procedure TFrmLocLivro.BitBtn2Click(Sender: TObject);
begin
if not(DMeclipse.TBcargo.IsEmpty)then
  begin
    botoes(self);
    mudaedit(self, true);
    habilitarpesq;
    DMeclipse.TBlocacao.Edit;
  end
  else
    ShowMessage('Não existe registro para edição.');
end;

procedure TFrmLocLivro.BitBtn3Click(Sender: TObject);
begin
  if dmeclipse.TBlocacao.isempty then
  begin
     showmessage('Não existe registro a ser excluido');
     exit;
  end;
  If messagedlg('Tem certeza que deseja excluir essa locação?'+#13+'Essa operação é irreversível!', mtconfirmation, [mbyes, mbno], 0) = mrno then
    exit;
  DMeclipse.TBlocacao.delete;
end;

procedure TFrmLocLivro.BitBtn4Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, false);
  desabilitarpesq;
  DMeclipse.TBlocacao.Cancel;
end;

procedure TFrmLocLivro.BitBtn5Click(Sender: TObject);
begin
  trims(self);
  if (trim(dbedit7.text)='')or(dbedit1.text='')or(data(DBEdit3.text)=false) then
  begin
    showmessage('Preencha todos os campos requeridos');
    exit;
  end;
  botoes(self);
  mudaedit(self, false);
  desabilitarpesq;
  try
    DMeclipse.TBlocacao.Post;
    DMeclipse.TBlocacao.Refresh;
  except
    on e: edatabaseerror do
    showmessage(e.Message);
  end;
end;

procedure TFrmLocLivro.BitBtn7Click(Sender: TObject);
begin
  String_tb.Stabela := 'locacao';
  String_tb.Scampocod := 'tombo_liv';
  String_tb.Scamponome := 'pendencia_locac';
  String_tb.Qrytb := DMeclipse.TBlocacao;
  String_tb.DStb := DMeclipse.DStblocacao;
  abrirpesq(self); 
end;

procedure TFrmLocLivro.BitBtn6Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmLocLivro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMeclipse.TBlocador.active:=true;
  dmeclipse.TBlivro.Active:=true;
  dmeclipse.TBlocacao.Active:=true;
  if menup='1900' then
  begin
    frmprincipal2.Enabled:=true;
  end
  else
  begin
    application.CreateForm(TFrmPrincipal,FrmPrincipal);
    FrmPrincipal.Show;
  end;
  action:= caFree;
  FrmLocLivro:= nil;
end;

procedure TFrmLocLivro.DBLookupComboBox1Exit(Sender: TObject);
begin
  if dmeclipse.TBlocador.FieldByName('Block_loc').AsString='sim' then
  begin
    showmessage('Locador com pendências');
    dbedit1.SetFocus;
  end;
end;

procedure TFrmLocLivro.Button1Click(Sender: TObject);
begin
  String_tb.Stabela := 'Livro';
  String_tb.Scampocod := 'tombo_liv';
  String_tb.Scamponome := 'Nome_liv';
  String_tb.Qrytb := DMeclipse.TBlivro;
  String_tb.DStb := DMeclipse.DStblivro;
  abrirpesq(self);
//  DBEdit7.Text:=DMeclipse.TBlivrotombo_liv.AsString;
end;

procedure TFrmLocLivro.Button2Click(Sender: TObject);
begin
  String_tb.Stabela := 'Locador';
  String_tb.Scampocod := 'codigo_loc';
  String_tb.Scamponome := 'Nome_loc';
  String_tb.Qrytb := DMeclipse.TBlocador;
  String_tb.DStb := DMeclipse.DStblocador;
  abrirpesq(self);
  DBEdit1.Text:=DMeclipse.TBlocadorcodigo_loc.AsString;
end;

procedure TFrmLocLivro.desabilitarpesq;
begin
  BitBtn8.Enabled:=false;
  bitbtn9.Enabled:=false;
end;

procedure TFrmLocLivro.habilitarpesq;
begin
  BitBtn8.Enabled:=true;
  bitbtn9.Enabled:=true;
end;

procedure TFrmLocLivro.FormCreate(Sender: TObject);
begin
  DMeclipse.TBlocador.active:=true;
  dmeclipse.TBlivro.Active:=true;
  dmeclipse.TBlocacao.Active:=true;
end;

procedure TFrmLocLivro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If messagedlg('Tem certeza que deseja fechar o formulário de cadastro de aluno?', mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    dmeclipse.TBlocacao.cancel;
    canclose:=true;
  end
  else
    canclose:=false;
end;

end.
