unit UCadGenero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ExtCtrls, Buttons;

type
  TFrmGenero = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGenero: TFrmGenero;

implementation

uses UDMeclipse, API_F11, UpesqGeral, UPrincipal, UPrincipal2;

{$R *.dfm}

procedure TFrmGenero.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMeclipse.TBgenero.Active:=false;
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
  FrmGenero:= nil;
end;

procedure TFrmGenero.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure TFrmGenero.BitBtn1Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, true);
  DMeclipse.TBgenero.Insert;
end;

procedure TFrmGenero.BitBtn2Click(Sender: TObject);
begin
  if not(DMeclipse.TBgenero.IsEmpty)then
  begin
    botoes(self);
    mudaedit(self, true);
    DMeclipse.TBgenero.Edit;
  end
  else
    ShowMessage('Não existe registro para edição.');
end;

procedure TFrmGenero.BitBtn3Click(Sender: TObject);
begin
  if dmeclipse.TBgenero.isempty then
  begin
     showmessage('Não existe registro a ser excluido');
     exit;
  end;
  If messagedlg('Tem certeza que deseja excluir esse genêro?'+#13+'Essa operação é irreversível!', mtconfirmation, [mbyes, mbno], 0) = mrno then
    exit;
  DMeclipse.TBgenero.Delete;
end;

procedure TFrmGenero.BitBtn4Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBgenero.Cancel;
end;

procedure TFrmGenero.BitBtn5Click(Sender: TObject);
begin
  trims(self);
  if DBEdit2.Text='' then
  begin
    showmessage('Preencha o nome do genêro');
    DBEdit2.SetFocus;
    exit;
  end;
  if DBEdit3.Text='' then
  begin
    showmessage('Preencha a cor do genêro');
    DBEdit3.SetFocus;
    exit;
  end;
  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBgenero.Post;
  DMeclipse.TBgenero.Refresh;
end;

procedure TFrmGenero.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmGenero.BitBtn7Click(Sender: TObject);
begin
  String_tb.Stabela := 'Genero';
  String_tb.Scampocod := 'Codigo_gen';
  String_tb.Scamponome := 'Nome_gen';
  String_tb.Qrytb := DMeclipse.TBgenero;
  String_tb.DStb := DMeclipse.DStbgenero;
  abrirpesq(self);
  String_tb.resultcodi := DMeclipse.TBgenerocodigo_gen.AsInteger;
end;

procedure TFrmGenero.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If messagedlg('Tem certeza que deseja fechar o formulário de cadastro de genêros?', mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    DMeclipse.TBgenero.cancel;
    canclose:=true;
  end
  else
    canclose:=false;
end;

procedure TFrmGenero.FormCreate(Sender: TObject);
begin
  DMeclipse.TBgenero.Active:=true;
end;

end.
