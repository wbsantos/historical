unit UCadCurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ExtCtrls, Buttons;

type
  TFrmCurso = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBText1: TDBText;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCurso: TFrmCurso;

implementation

uses UDMeclipse, API_F11, UpesqGeral, UPrincipal, UPrincipal2;

{$R *.dfm}

procedure TFrmCurso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMeclipse.TBcurso.Active:=false;
  if menup='1900' then
  begin
    frmprincipal2.Enabled:=true;
  end
  else
  begin
    application.CreateForm(TFrmPrincipal,FrmPrincipal);
    FrmPrincipal.Show;
  end;
  action:= cafree;
  FrmCurso:= nil;
end;

procedure TFrmCurso.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure TFrmCurso.BitBtn1Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, true);
  DMeclipse.TBcurso.Insert;
end;

procedure TFrmCurso.BitBtn2Click(Sender: TObject);
begin
  if not(DMeclipse.TBcurso.IsEmpty)then
  begin
    botoes(self);
    mudaedit(self, true);
    DMeclipse.TBcurso.Edit;
  end
  else
    ShowMessage('Não existe registro para edição.');
end;

procedure TFrmCurso.BitBtn3Click(Sender: TObject);
begin
  if dmeclipse.TBcurso.isempty then
  begin
     showmessage('Não existe registro a ser excluido');
     exit;
  end;
  If messagedlg('Tem certeza que deseja excluir esse curso?'+#13+'Essa operação é irreversível!', mtconfirmation, [mbyes, mbno], 0) = mrno then
    exit;
  DMeclipse.TBcurso.Delete;
end;

procedure TFrmCurso.BitBtn4Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBcurso.Cancel;
end;

procedure TFrmCurso.BitBtn5Click(Sender: TObject);
begin
  trims(self);
  if DBEdit2.Text='' then
  begin
    showmessage('Preencha o nome do curso');
    DBEdit2.SetFocus;
    exit;
  end;
  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBcurso.Post;
  DMeclipse.TBcurso.Refresh;
end;

procedure TFrmCurso.BitBtn6Click(Sender: TObject);
begin
  close;
end;

procedure TFrmCurso.BitBtn7Click(Sender: TObject);
begin
  String_tb.Stabela := 'Curso';
  String_tb.Scampocod := 'Codigo_cur';
  String_tb.Scamponome := 'Nome_cur';
  String_tb.Qrytb := DMeclipse.TBcurso;
  String_tb.DStb := DMeclipse.DStbcurso;
  abrirpesq(self);
  String_tb.resultcodi := DMeclipse.TBcursocodigo_cur.AsInteger;
end;

procedure TFrmCurso.FormCreate(Sender: TObject);
begin
  DMeclipse.TBcurso.Active:=true;
end;

procedure TFrmCurso.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If messagedlg('Tem certeza que deseja fechar o formulário de cadastro de curso?', mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    DMeclipse.TBcurso.cancel;
    canclose:=true;
  end
  else
    canclose:=false;
end;

end.
