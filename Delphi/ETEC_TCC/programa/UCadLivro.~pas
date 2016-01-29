unit UCadLivro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB, ADODB;

type
  TFrmLivro = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
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
    GENERO: TADOQuery;
    GENEROcodigo_gen: TAutoIncField;
    GENEROnome_gen: TWideStringField;
    GENEROcor_gen: TWideStringField;
    SpeedButton1: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLivro: TFrmLivro;

implementation

uses UDMeclipse, API_F11, UpesqGeral, ComObj, ConvUtils, Math, UPrincipal,
  UPrincipal2;

{$R *.dfm}

procedure TFrmLivro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMeclipse.TBlivro.active:=false;
  DMeclipse.TBgenero.active:=false;
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
  FrmLivro:= nil;
end;

procedure TFrmLivro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure TFrmLivro.BitBtn1Click(Sender: TObject);
begin
  botoes(self);
  DBLookupComboBox1.enabled:=true;
  mudaedit(self, true);
  DMeclipse.TBlivro.Insert;
  DMeclipse.TBlivrodisp_liv.AsString:='d';
end;

procedure TFrmLivro.BitBtn2Click(Sender: TObject);
begin
  if not(DMeclipse.TBlivro.IsEmpty)then
  begin
    botoes(self);
    DBLookupComboBox1.enabled:=true;
    mudaedit(self, true);
    DMeclipse.TBlivro.Edit;
  end
  else
    ShowMessage('Não existe registro para edição.');
end;

procedure TFrmLivro.BitBtn3Click(Sender: TObject);
begin
  if dmeclipse.TBlivro.isempty then
  begin
     showmessage('Não existe registro a ser excluido');
     exit;
  end;
  If messagedlg('Tem certeza que deseja excluir esse curso?'+#13+'Essa operação é irreversível!', mtconfirmation, [mbyes, mbno], 0) = mrno then
    exit;
  DMeclipse.TBlivro.Delete;
end;

procedure TFrmLivro.BitBtn4Click(Sender: TObject);
begin
  botoes(self);
  DBLookupComboBox1.enabled:=false;
  mudaedit(self, false);
  DMeclipse.TBlivro.Cancel;
end;

procedure TFrmLivro.BitBtn5Click(Sender: TObject);
begin
  trims(self);
  if DBEdit1.text='' then
  begin
    showmessage('Preencha o Código de Tombo do Livro');
    DBEdit1.SetFocus;
    exit;
  end;
  if DBEdit2.text='' then
  begin
    showmessage('Preencha o Nome do Livro');
    DBEdit2.SetFocus;
    exit;
  end;
  if DBLookupComboBox1.text='' then
  begin
    showmessage('Preencha o Genêro do Livro');
    DBLookupComboBox1.SetFocus;
    exit;
  end;
  if DBedit6.text='' then
  begin
    showmessage('Preencha o Código do Livro');
    DBEdit6.SetFocus;
    exit;
  end;
  botoes(self);
  DBLookupComboBox1.enabled:=false;
  mudaedit(self, false);
  DMeclipse.TBlivro.Post;
  DMeclipse.TBlivro.Refresh;
end;

procedure TFrmLivro.BitBtn7Click(Sender: TObject);
begin
  String_tb.Stabela := 'Livro';
  String_tb.Scampocod := 'codigo_tombo';
  String_tb.Scamponome := 'Nome_liv';
  String_tb.Qrytb := DMeclipse.TBlivro;
  String_tb.DStb := DMeclipse.DStblivro;
  abrirpesq(self);
//  String_tb.resultcodi := DMeclipse.TBlivrotombo_liv.AsInteger;
end;

procedure TFrmLivro.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmLivro.SpeedButton1Click(Sender: TObject);
begin
  String_tb.Stabela := 'Genero';
  String_tb.Scampocod := 'codigo_gen';
  String_tb.Scamponome := 'Nome_gen';
  String_tb.Qrytb := DMeclipse.TBgenero;
  String_tb.DStb := DMeclipse.DStbgenero;
  abrirpesq(self);
  dmeclipse.TBlivrocodigo_gen.AsString := DMeclipse.TBgenerocodigo_gen.AsString;
end;

procedure TFrmLivro.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If messagedlg('Tem certeza que deseja fechar o formulário de cadastro de livros?', mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    DMeclipse.TBlivro.cancel;
    canclose:=true;
  end
  else
    canclose:=false;
end;

procedure TFrmLivro.FormCreate(Sender: TObject);
begin
  DMeclipse.TBlivro.active:=true;
  DMeclipse.TBgenero.active:=true;
end;

end.
