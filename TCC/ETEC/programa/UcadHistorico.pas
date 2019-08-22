unit UcadHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons, StdCtrls, Mask, DBCtrls, ExtCtrls, DBTables;

type
  TfrmCadHistorico = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Panel2: TPanel;
    DBEdit5: TDBEdit;
    SpeedButton1: TSpeedButton;
    ADOAluno_p: TADOQuery;
    DSAluno_p: TDataSource;
    Edit1: TEdit;
    ADOAluno_pcodigo_alu: TAutoIncField;
    ADOAluno_pnome_alu: TWideStringField;
    DBEdit1: TDBEdit;
    SpeedButton2: TSpeedButton;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBText1: TDBText;
    ComboBox1: TComboBox;
    dsUpdate: TDataSource;
    ADOUpdateN: TADOQuery;
    ADOupdateC: TADOQuery;
    DataSource1: TDataSource;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadHistorico: TfrmCadHistorico;
  nomealu,nomecur:string;

implementation

uses UDMeclipse, API_F11, UpesqGeral, Unit1, pesq_t, Math, UPrincipal,
  UPrincipal2;

{$R *.dfm}

procedure TfrmCadHistorico.SpeedButton1Click(Sender: TObject);
begin
  String_tb.Stabela := 'Aluno';
  String_tb.Scampocod := 'codigo_alu';
  String_tb.Scamponome := 'Nome_alu';
  String_tb.Qrytb := ADOAluno_p;
  String_tb.DStb := DSAluno_p;
  abrirpesq(self);
  if not(ADOAluno_p.IsEmpty)then
  begin
    DBEdit5.Text := ADOAluno_pcodigo_alu.AsVariant;
    Edit1.Text := ADOAluno_pnome_alu.AsString;
    DMeclipse.TBhistoricocodigo_alu.AsInteger := ADOAluno_pcodigo_alu.AsInteger;
  end;
end;

procedure TfrmCadHistorico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMeclipse.TBhistorico.Active:=false;
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
  frmCadHistorico:= nil;
end;

procedure TfrmCadHistorico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure TfrmCadHistorico.BitBtn1Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, true);
  DMeclipse.TBhistorico.Insert;
  ComboBox1.Enabled := true;
  ComboBox1.ItemIndex:=0;
  Edit1.Text:='';
  edit2.Text:='';
end;

procedure TfrmCadHistorico.BitBtn2Click(Sender: TObject);
begin
  if not(DMeclipse.TBhistorico.IsEmpty)then
  begin
    botoes(self);
    mudaedit(self, true);
    DMeclipse.TBhistorico.Edit;
    ComboBox1.Enabled := true;
  end
  else
  begin
    ShowMessage('Não existe registro para edição.');
    exit;
  end;  
end;

procedure TfrmCadHistorico.BitBtn3Click(Sender: TObject);
begin
  if (DMeclipse.TBhistorico.IsEmpty)then
  begin
    ShowMessage('Não existe registro a ser excluido');
    exit;
  end;
  If messagedlg('Tem certeza que deseja excluir esse aluno?'+#13+'Essa operação é irreversível!', mtconfirmation, [mbyes, mbno], 0) = mrno then
    exit;
  DMeclipse.TBhistorico.Delete;
  if DMeclipse.TBhistoricostatus_alu.AsString='C' then
    ComboBox1.ItemIndex:=0
  else
    ComboBox1.ItemIndex:=1;
end;

procedure TfrmCadHistorico.BitBtn4Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBhistorico.Cancel;
  ComboBox1.Enabled := false;
end;

procedure TfrmCadHistorico.BitBtn5Click(Sender: TObject);
begin
  If DBEdit5.text='' then
  begin
    showmessage('Necessário escolher um aluno');
    dbedit5.SetFocus;
    exit;
  end;
  If DBEdit1.text='' then
  begin
    showmessage('Necessário escolher uma turma');
    dbedit1.SetFocus;
    exit;
  end;
  botoes(self);
  mudaedit(self, false);
  ComboBox1.Enabled := false;
  if(ComboBox1.ItemIndex = 0)then
  begin
    DMeclipse.TBhistoricostatus_alu.AsString := 'C';
  end
  else if(ComboBox1.ItemIndex = 1)then
  begin
    DMeclipse.TBhistoricostatus_alu.AsString := 'N';
  end;
  DMeclipse.TBhistorico.Post;
  
  ADOUpdateN.Close;
  ADOUpdateN.Parameters.ParamByName('CODI3').Value := strtoint(DBEdit5.Text);
  ADOUpdateN.Parameters.ParamByName('CODI4').Value := strtoint(DBEdit5.Text);
  ADOUpdateN.ExecSQL;

  ADOUpdateC.Close;
  ADOUpdateC.Parameters.ParamByName('CODI1').Value := strtoint(DBEdit5.Text);
  ADOUpdateC.Parameters.ParamByName('CODI2').Value := strtoint(DBEdit5.Text);
  ADOUpdateC.ExecSQL;
end;

procedure TfrmCadHistorico.BitBtn7Click(Sender: TObject);
begin
  If(Frmpesq_hist = nil)then
  begin
    Application.CreateForm(TFrmpesq_hist, Frmpesq_hist);
    Frmpesq_hist.Showmodal;
  end;
  ComboBox1.Enabled := false;
  if DMeclipse.TBhistoricostatus_alu.AsString='C' then
    ComboBox1.ItemIndex:=0
  else
    ComboBox1.ItemIndex:=1;
  ADOAluno_p.ExecSQL;
  Edit1.Text := nomealu;
  edit2.Text:=nomecur;
end;

procedure TfrmCadHistorico.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadHistorico.SpeedButton2Click(Sender: TObject);
begin
  If(Frmpesq_tur = nil)then
  begin
    Application.CreateForm(TFrmpesq_tur, Frmpesq_tur);
    Frmpesq_tur.ShowModal;
  end;
  if not(DMeclipse.TBturma.IsEmpty)then
  begin
     DBEdit1.Text := DMeclipse.TBturmacodigo_tur.AsVariant;
    Edit2.Text := DMeclipse.TBturmanome_tur.AsString;
    DMeclipse.TBhistoricocodigo_tur.AsInteger := DMeclipse.TBturmacodigo_tur.AsVariant;
    edit2.Text:=DMeclipse.TBturmanome_tur.AsString;
  end;
end;

procedure TfrmCadHistorico.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadHistorico.FormActivate(Sender: TObject);
begin
  if(DMeclipse.TBhistoricostatus_alu.AsString = 'C')then
    ComboBox1.ItemIndex := 0
  else if(DMeclipse.TBhistoricostatus_alu.AsString = 'F') then
    ComboBox1.ItemIndex := 1;
end;

procedure TfrmCadHistorico.FormCreate(Sender: TObject);
begin
  DMeclipse.TBaluno.Active:=true;
  if DMeclipse.TBhistoricostatus_alu.AsString='C' then
    ComboBox1.ItemIndex:=0
  else
    ComboBox1.ItemIndex:=1;
  Edit1.Text:=DMeclipse.TBalunonome_alu.AsString;
  edit2.Text:=DMeclipse.TBturmanome_tur.AsString;  
end;

procedure TfrmCadHistorico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If messagedlg('Tem certeza que deseja fechar o formulário de cadastro de histórico?', mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    DMeclipse.TBhistorico.cancel;
    canclose:=true;
  end
  else
    canclose:=false;
end;

end.
