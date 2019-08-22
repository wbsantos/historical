unit Ucadvol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,shellapi, Mask, DBCtrls, ExtCtrls, ComCtrls, Buttons;

type
  Tfrmcadvol = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    ex: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label2: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    DBEdit6: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBRadioGroup2: TDBRadioGroup;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DBComboBox2: TDBComboBox;
    BitBtn10: TBitBtn;
    data2: TDateTimePicker;
    data1: TDateTimePicker;
    Button1: TButton;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure bloqletrarg(Sender: TObject; var Key: Char);
    procedure bloqletra(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadvol: Tfrmcadvol;

implementation

uses UDMeclipse, API_F11, UpesqGeral, DB, UPrincipal, UCadContato,
  UPrincipal2, UCadVolCargo;

{$R *.dfm}



procedure Tfrmcadvol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMeclipse.TBvoluntario.Active := false;
  DMeclipse.TBfnvoluntario.Active := false;
  DMeclipse.TBcargo.Active := false;
  DMeclipse.TBtpfone.Active := false;
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
  frmcadvol:= nil;
end;

procedure Tfrmcadvol.FormCreate(Sender: TObject);
begin
   DMeclipse.TBvoluntario.Active := true;
   DMeclipse.TBfnvoluntario.Active := true;
   DMeclipse.TBcargo.Active := true;
   DMeclipse.TBtpfone.Active := true;
end;

procedure Tfrmcadvol.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure Tfrmcadvol.BitBtn1Click(Sender: TObject);
begin
  botoes(self);
  data1.Enabled:=true;
  data2.Enabled:=true;
  mudaedit(self, true);
  DMeclipse.TBvoluntario.Insert;
end;

procedure Tfrmcadvol.BitBtn2Click(Sender: TObject);
begin
  if not(DMeclipse.TBvoluntario.IsEmpty)then
  begin
    botoes(self);
    mudaedit(self, true);
    data1.Enabled:=true;
    data2.Enabled:=true;
    DMeclipse.TBvoluntario.Edit;
  end
  else
    ShowMessage('Não existe registro para edição.');
end;

procedure Tfrmcadvol.BitBtn3Click(Sender: TObject);
begin
  if dmeclipse.TBvoluntario.isempty then
  begin
     showmessage('Não existe registro a ser excluido');
     exit;
  end;
  If messagedlg('Tem certeza que deseja excluir esse aluno?'+#13+'Essa operação é irreversível!', mtconfirmation, [mbyes, mbno], 0) = mrno then
    exit;
  DMeclipse.TBvoluntario.Delete;
end;

procedure Tfrmcadvol.BitBtn4Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, false);
  data1.Enabled:=false;
  data2.Enabled:=false;
  DMeclipse.TBvoluntario.Cancel;
  data1.Date:=DMeclipse.TBvoluntariodtadm_vol.AsDateTime;
  data2.Date:=DMeclipse.TBvoluntariodtnasc_vol.AsDateTime;
end;

procedure Tfrmcadvol.BitBtn5Click(Sender: TObject);
begin
  trims(self);
  if (DBEdit3.text='')or(DBRadioGroup1.Value='')or(ex.Text='')or(DBEdit9.text='')or((dbedit6.text='')and(dbedit7.text=''))or(DBRadioGroup2.value='')then
  begin
    showmessage('Preencha todos os campos requeridos');
    exit;
  end;
  if (cpf(dbedit7.Text)=false)and(dbedit7.text<>'') then
  begin
   showmessage('CPF Inválido');
   PageControl1.ActivePageIndex:=0;
   DBEdit7.SetFocus;
   exit;
 end;

  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBvoluntario.Post;
  DMeclipse.TBvoluntario.Refresh;

  //tel
  if(DMeclipse.TBvoluntario.State in [dsinsert])then
    begin
      if(FrmCadContato = nil)then
      begin
        Application.CreateForm(TFrmCadContato, FrmCadContato);
        FrmCadContato.Tela := 'VOLUNTARIO';
        FrmCadContato.ShowModal;
      end;
    end
    else
    begin
      If messagedlg('Deseja ir as formulário de cadastro de Contatos?', mtconfirmation, [mbyes, mbno], 0) = mryes then
      begin
        if(FrmCadContato = nil)then
          Application.CreateForm(TFrmCadContato, FrmCadContato);
        FrmCadContato.Tela := 'VOLUNTARIO';
        FrmCadContato.ShowModal;
      end;
    end;

  //cargo
  if(DMeclipse.TBvoluntario.State in [dsinsert])then
  begin
    if(frmCadVol_cargo = nil)then
    begin
      Application.CreateForm(TfrmCadVol_cargo, frmCadVol_cargo);
      frmCadVol_cargo.ShowModal;
    end;
  end
  else
  begin
    If messagedlg('Deseja ir as formulário de cadastro de cargos?', mtconfirmation, [mbyes, mbno], 0) = mryes then
    begin
      if(frmCadVol_cargo = nil)then
        Application.CreateForm(TfrmCadVol_cargo, frmCadVol_cargo);
      frmCadVol_cargo.ShowModal;
    end;
  end;

end;

procedure Tfrmcadvol.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrmcadvol.BitBtn7Click(Sender: TObject);
begin
  String_tb.Stabela := 'Voluntario';
  String_tb.Scampocod := 'Codigo_vol';
  String_tb.Scamponome := 'Nome_vol';
  String_tb.Qrytb := DMeclipse.TBvoluntario;
  String_tb.DStb := DMeclipse.DStbvoluntario;
  abrirpesq(self);
  String_tb.resultcodi := DMeclipse.TBvoluntariocodigo_vol.AsInteger;
  data1.Date:=DMeclipse.TBvoluntariodtadm_vol.AsDateTime;
  data2.Date:=DMeclipse.TBvoluntariodtnasc_vol.AsDateTime;
end;

procedure Tfrmcadvol.bloqletrarg(Sender: TObject; var Key: Char);
begin
  if ((key<#48)or(key>#57))and(key<>#8)and(key<>#120)and (key<>#88)then
    key:=#0;
end;

procedure Tfrmcadvol.bloqletra(Sender: TObject; var Key: Char);
begin
  if ((key<#48)or(key>#57))and(key<>#8)then
    key:=#0;
end;

procedure Tfrmcadvol.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If messagedlg('Tem certeza que deseja fechar o formulário de cadastro de voluntário?', mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    DMeclipse.TBvoluntario.cancel;
    DMeclipse.TBfnvoluntario.cancel;
    dmeclipse.TBtpfone.cancel;
    DMeclipse.TBcargo.Cancel;
    canclose:=true;
  end
  else
    canclose:=false;
end;

procedure Tfrmcadvol.BitBtn10Click(Sender: TObject);
begin
  if(FrmCadContato = nil)then
  begin
    Application.CreateForm(TFrmCadContato, FrmCadContato);
  end;
  //PARAMETRO PARA CHAMADA DE CONTATOS
  FrmCadContato.Tela := 'VOLUNTARIO';
  FrmCadContato.ShowModal;
end;

procedure Tfrmcadvol.Button1Click(Sender: TObject);
begin
  if(frmCadVol_cargo = nil)then
  begin
    Application.CreateForm(TfrmCadVol_cargo, frmCadVol_cargo);
    frmCadVol_cargo.ShowModal;
  end;
end;

procedure Tfrmcadvol.Label4Click(Sender: TObject);
begin
   ShellExecute(Handle, 'open','http://www.receita.fazenda.gov.br/aplicacoes/ATCTA/cpf/ConsultaPublica.asp', '', '', 1);
end;

end.
