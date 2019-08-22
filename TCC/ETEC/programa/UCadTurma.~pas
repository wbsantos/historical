unit UCadTurma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons;

type
  TFrmTurma = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTurma: TFrmTurma;

implementation

uses UDMeclipse, API_F11, UpesqGeral, UPrincipal, UPrincipal2;

{$R *.dfm}

procedure TFrmTurma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if menup='1900' then
  begin
    frmprincipal2.Enabled:=true;
  end
  else
  begin
    application.CreateForm(TFrmPrincipal,FrmPrincipal);
    FrmPrincipal.Show;
  end;
  DMeclipse.TBturma.Active:=false;
  DMeclipse.TBcurso.Active:=false;
  dmeclipse.TBvoluntario.active:=false;
  action:= cafree;
  FrmTurma:= nil;
end;

procedure TFrmTurma.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure TFrmTurma.BitBtn1Click(Sender: TObject);
begin
  botoes(self);
  DBLookupComboBox1.Enabled:=true;
  DBLookupComboBox2.Enabled:=true;
  DBMemo1.Enabled:=true;
  mudaedit(self, true);
  DMeclipse.TBturma.Insert;
  DMeclipse.TBturmadt_ini.AsString:=datetostr(date);
end;

procedure TFrmTurma.BitBtn2Click(Sender: TObject);
begin
  if not(DMeclipse.TBturma.IsEmpty)then
  begin
    botoes(self);
    DBLookupComboBox1.Enabled:=true;
    DBLookupComboBox2.Enabled:=true;
    DBMemo1.Enabled:=true;
    mudaedit(self, true);
    DMeclipse.TBturma.Edit;
  end
  else
    ShowMessage('Não existe registro para edição.');
end;

procedure TFrmTurma.BitBtn3Click(Sender: TObject);
begin
  if dmeclipse.TBturma.isempty then
  begin
     showmessage('Não existe registro a ser excluido');
     exit;
  end;
  If messagedlg('Tem certeza que deseja excluir essa locação?'+#13+'Essa operação é irreversível!', mtconfirmation, [mbyes, mbno], 0) = mrno then
    exit;
  DMeclipse.TBturma.Delete;
end;

procedure TFrmTurma.BitBtn4Click(Sender: TObject);
begin
  botoes(self);
  DBLookupComboBox1.Enabled:=false;
  DBLookupComboBox2.Enabled:=false;
  DBMemo1.Enabled:=false;
  mudaedit(self, false);
  DMeclipse.TBturma.Cancel;
end;

procedure TFrmTurma.BitBtn5Click(Sender: TObject);
begin
  trims(self);
  If DBEdit4.text='' then
  begin
    showmessage('Preencha o nome da turma');
    dbedit4.SetFocus;
    exit;
  end;
  If DBLookupComboBox1.text='' then
  begin
    showmessage('Preencha o nome do curso');
    DBLookupComboBox1.SetFocus;
    exit;
  end;
  If DBLookupComboBox2.text='' then
  begin
    showmessage('Preencha o nome do Professor');
    DBLookupComboBox2.SetFocus;
    exit;
  end;
  If DBedit8.text='' then
  begin
    showmessage('Preencha o número de vagas');
    DBedit8.SetFocus;
    exit;
  end;
  DMeclipse.TBturma.Post;
  DBLookupComboBox1.Enabled:=false;
  DBLookupComboBox2.Enabled:=false;
  DBMemo1.Enabled:=false;
  DMeclipse.TBturma.Refresh;
end;

procedure TFrmTurma.BitBtn7Click(Sender: TObject);
begin
  String_tb.Stabela := 'Turma';
  String_tb.Scampocod := 'Codigo_tur';
  String_tb.Scamponome := 'Nome_tur';
  String_tb.Qrytb := DMeclipse.TBturma;
  String_tb.DStb := DMeclipse.DStbturma;
  abrirpesq(self);
  String_tb.resultcodi := DMeclipse.TBturmacodigo_tur.AsInteger;
end;

procedure TFrmTurma.FormCreate(Sender: TObject);
begin
  DMeclipse.TBturma.Active:=true;
  DMeclipse.TBcurso.Active:=true;
  dmeclipse.TBvoluntario.active:=true;
end;

procedure TFrmTurma.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If messagedlg('Tem certeza que deseja fechar o formulário de cadastro de turma?', mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    DMeclipse.TBturma.cancel;
    canclose:=true;
  end
  else
end;

procedure TFrmTurma.SpeedButton1Click(Sender: TObject);
begin
  String_tb.Stabela := 'curso';
  String_tb.Scampocod := 'codigo_cur';
  String_tb.Scamponome := 'Nome_cur';
  String_tb.Qrytb := DMeclipse.TBcurso;
  String_tb.DStb := DMeclipse.DStbcurso;
  abrirpesq(self);
  DMeclipse.TBturmacodigo_cur.AsString:=DMeclipse.TBcursocodigo_cur.AsString;
end;

procedure TFrmTurma.SpeedButton2Click(Sender: TObject);
begin
  String_tb.Stabela := 'voluntario';
  String_tb.Scampocod := 'codigo_vol';
  String_tb.Scamponome := 'Nome_vol';
  String_tb.Qrytb := DMeclipse.TBvoluntario;
  String_tb.DStb := DMeclipse.DStbvoluntario;
  abrirpesq(self);
  DMeclipse.TBturmacodigo_vol.AsString:=DMeclipse.TBvoluntariocodigo_vol.AsString;
//  DBEdit3.Text:=DMeclipse.TBcursocodigo_cur.AsString;
end;

procedure TFrmTurma.BitBtn6Click(Sender: TObject);
begin
  close;
end;

end.
