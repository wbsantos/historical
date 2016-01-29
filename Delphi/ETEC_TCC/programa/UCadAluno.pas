unit UCadAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Mask, ComCtrls, DB, ToolWin,
  Buttons, Grids,shellapi, DBGrids, ADODB, DBClient;

type
  TFrmAluno = class(TForm)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBRGsexo: TDBRadioGroup;
    DBEdit3: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label12: TLabel;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    Label29: TLabel;
    DBEdit29: TDBEdit;
    Label30: TLabel;
    DBEdit30: TDBEdit;
    Label31: TLabel;
    DBEdit31: TDBEdit;
    Label32: TLabel;
    DBEdit32: TDBEdit;
    Label33: TLabel;
    DBEdit33: TDBEdit;
    Label34: TLabel;
    DBEdit34: TDBEdit;
    Label35: TLabel;
    DBEdit35: TDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    DBComboBox2: TDBComboBox;
    Label38: TLabel;
    DBEdit38: TDBEdit;
    DBImage1: TDBImage;
    Label39: TLabel;
    pagecontrol_alu: TPageControl;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    ADOQuery2: TADOQuery;
    ADOQuery2codigo_alu: TIntegerField;
    ADOQuery2tptel_fnalu: TWideStringField;
    ADOQuery2fone_fnalu: TWideStringField;
    SpeedButton1: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Button1: TButton;
    teste: TDataSource;
    BitBtn10: TBitBtn;
    data: TDateTimePicker;
    Data2: TDateTimePicker;
    DBRadioGroup3: TDBRadioGroup;
    Label24: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bloqletra(Sender: TObject; var Key: Char);
    procedure bloqletrarg(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Label24Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAluno: TFrmAluno;
  codi : integer;

implementation

uses UDMeclipse, UPrincipal, API_F11, UpesqGeral, Ufoto, UCadInteresse,
  UCadContato, UPrincipal2;

{$R *.dfm}

procedure TFrmAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMeclipse.TBaluno.Active:=false;
  DMeclipse.TBfnaluno.Active:=false;
  dmeclipse.TBtpfone.Active:=false;
  dmeclipse.TBlistaespera.Active:=false;
  if menup='1900' then
  begin
    frmprincipal2.Enabled:=true;
  end
  else
  begin
    application.CreateForm(TFrmPrincipal,FrmPrincipal);
    FrmPrincipal.Show;
  end;
  Action:= caFree;
  FrmAluno:= nil;
end;

procedure TFrmAluno.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If messagedlg('Tem certeza que deseja fechar o formulário de cadastro de aluno?', mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
//    ADOQuery1.Cancel;
    DMeclipse.TBaluno.cancel;
    DMeclipse.TBfnaluno.cancel;
    dmeclipse.TBtpfone.cancel;
    dmeclipse.TBlistaespera.cancel;
    canclose:=true;
  end
  else
    canclose:=false;
end;

procedure TFrmAluno.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure TFrmAluno.BitBtn1Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, true);
  DMeclipse.TBaluno.Insert;
  DMeclipse.TBalunodtcad_alu.AsString:=datetostr(date);
  DMeclipse.TBalunoStatus.AsString:='N';
  pagecontrol_alu.ActivePageIndex:=0;
  dbedit2.setfocus;
end;

procedure TFrmAluno.BitBtn2Click(Sender: TObject);
begin
  if not(DMeclipse.TBaluno.IsEmpty)then
  begin
    botoes(self);
    mudaedit(self, true);
    DMeclipse.TBaluno.Edit;
  end
  else
  begin
    ShowMessage('Não existe registro para edição.');
    exit;
  end;  

end;

procedure TFrmAluno.BitBtn3Click(Sender: TObject);
begin
  if dmeclipse.tbaluno.isempty then
  begin
     showmessage('Não existe registro a ser excluido');
     exit;
  end;
  If messagedlg('Tem certeza que deseja excluir esse aluno?'+#13+'Essa operação é irreversível!', mtconfirmation, [mbyes, mbno], 0) = mrno then
    exit;
  DMeclipse.TBaluno.Delete;
  data.Date:=DMeclipse.TBalunodtnasc_alu.AsDateTime;
  data2.Date:=dmeclipse.TBalunodtcad_alu.AsDateTime;

end;

procedure TFrmAluno.BitBtn4Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBaluno.Cancel;
  data.Date:=DMeclipse.TBalunodtnasc_alu.AsDateTime;
  data2.Date:=dmeclipse.TBalunodtcad_alu.AsDateTime;
end;

procedure TFrmAluno.BitBtn5Click(Sender: TObject);
begin
  trims(self);
  if (trim(dbedit2.text)='')or(DBRGsexo.Value='')or(DBEdit3.text='')or(trim(dbedit6.text)='')or(trim(dbedit7.text)='')or(trim(DBEdit8.Text)='')or(trim(DBEdit9.Text)= '') or (trim(dbedit11.text)='') or(Trim(dbedit13.text)='') or(DBComboBox1.text='') or(trim(dbedit15.text)='')or(trim(DBEdit19.Text)='')or((dbedit17.text='')and(dbedit18.text='') and (dbedit21.text='')and(dbedit22.text='')) then
  begin
    showmessage('Preencha todos os campos requeridos');
    exit;
  end;
  if (cpf(dbedit18.Text)=false)and(dbedit18.text<>'') then
  begin
    showmessage('CPF Inválido');
    pagecontrol_alu.ActivePageIndex:=1;
    DBEdit18.SetFocus;
    exit;
  end;
  if (cpf(dbedit22.Text)=false)and(dbedit22.text<>'') then
  begin
    showmessage('CPF Inválido');
    pagecontrol_alu.ActivePageIndex:=1;
    DBEdit22.SetFocus;
    exit;
  end;
  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBalunodtnasc_alu.AsDateTime:=data.Date;
  dmeclipse.TBalunodtcad_alu.AsDateTime:=data2.Date;
  DMeclipse.TBaluno.Post;

  //tel
  if(DMeclipse.TBaluno.State in [dsinsert])then
    begin
      if(FrmCadContato = nil)then
      begin
        Application.CreateForm(TFrmCadContato, FrmCadContato);
        FrmCadContato.Tela := 'ALUNO';
        FrmCadContato.ShowModal;
      end;
    end
    else
    begin
      If messagedlg('Deseja ir as formulário de cadastro de Contatos?', mtconfirmation, [mbyes, mbno], 0) = mryes then
      begin
        if(frmCad_Interesse = nil)then
          Application.CreateForm(TFrmCadContato, FrmCadContato);
        FrmCadContato.Tela := 'ALUNO';
        FrmCadContato.ShowModal;
      end;
    end;

 //interesse
  if(DMeclipse.TBaluno.State in [dsinsert])then
  begin
    if(frmCad_Interesse = nil)then
    begin
      Application.CreateForm(TfrmCad_Interesse, frmCad_Interesse);
      frmCad_Interesse.ShowModal;
    end;
  end
  else
  begin
    If messagedlg('Deseja ir as formulário de cadastro de Interesses?', mtconfirmation, [mbyes, mbno], 0) = mryes then
    begin
      if(frmCad_Interesse = nil)then
        Application.CreateForm(TfrmCad_Interesse, frmCad_Interesse);
      frmCad_Interesse.ShowModal;
    end;
  end;

//geral
  DMeclipse.ADOCBD.BeginTrans;
  try
    DMeclipse.ADOCBD.CommitTrans;
  except
    DMeclipse.ADOCBD.RollbackTrans;
  end;

end;

procedure TFrmAluno.BitBtn7Click(Sender: TObject);
begin
  String_tb.Stabela := 'Aluno';
  String_tb.Scampocod := 'Codigo_alu';
  String_tb.Scamponome := 'Nome_alu';
  String_tb.Qrytb := DMeclipse.TBaluno;
  String_tb.DStb := DMeclipse.DStbaluno;
  abrirpesq(self);
  data.Date:=DMeclipse.TBalunodtnasc_alu.AsDateTime;
  data2.Date:=dmeclipse.TBalunodtcad_alu.AsDateTime;
end;

procedure TFrmAluno.BitBtn10Click(Sender: TObject);
begin
  if(FrmCadContato = nil)then
  begin
    Application.CreateForm(TFrmCadContato, FrmCadContato);
  end;
  //PARAMETRO PARA CHAMADA DE CONTATOS
  FrmCadContato.Tela := 'ALUNO';
  FrmCadContato.ShowModal;

end;

procedure TFrmAluno.SpeedButton1Click(Sender: TObject);
begin
  If(foto = nil)then
  begin
    Application.CreateForm(Tfoto, foto);
    foto.Showmodal;
  end;
end;

procedure TFrmAluno.bloqletra(Sender: TObject; var Key: Char);
begin
  if ((key<#48)or(key>#57))and(key<>#8)then
    key:=#0;
end;

procedure TFrmAluno.bloqletrarg(Sender: TObject; var Key: Char);
begin
 if ((key<#48)or(key>#57))and(key<>#8)and(key<>#120)and (key<>#88)then
    key:=#0;
end;

procedure TFrmAluno.FormCreate(Sender: TObject);
begin
  DMeclipse.TBaluno.Active:=true;
  DMeclipse.TBfnaluno.Active:=true;
  dmeclipse.TBtpfone.Active:=true;
  dmeclipse.TBlistaespera.Active:=true;
  data.Date:=DMeclipse.TBalunodtnasc_alu.AsDateTime;
  data2.date:=dmeclipse.TBalunodtcad_alu.AsDateTime;
end;

procedure TFrmAluno.BitBtn6Click(Sender: TObject);
begin
  close;
end;

procedure TFrmAluno.Button1Click(Sender: TObject);
begin
  if(frmCad_Interesse = nil)then
  begin
    Application.CreateForm(TfrmCad_Interesse, frmCad_Interesse);
    frmCad_Interesse.ShowModal;
  end;
end;

procedure TFrmAluno.Label24Click(Sender: TObject);
begin
   ShellExecute(Handle, 'open','http://www.receita.fazenda.gov.br/aplicacoes/ATCTA/cpf/ConsultaPublica.asp', '', '', 1);
end;

end.
