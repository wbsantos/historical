unit UCadAssociado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Mask, ImgList, ComCtrls, ToolWin,
  Buttons, DB, ADODB, ppModule, raCodMod, ppBands, ppCtrls, ppPrnabl,
  ppClass, ppVar, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, shellapi;

type
  TFrmAssociado = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
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
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label17: TLabel;
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
    DBText1: TDBText;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit17: TDBEdit;
    Panel1: TPanel;
    lbluf: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DBComboBox1: TDBComboBox;
    data1: TDateTimePicker;
    data2: TDateTimePicker;
    BitBtn10: TBitBtn;
    BitBtn8: TBitBtn;
    ppDBPipeline1: TppDBPipeline;
    ppDBPipeline1ppField1: TppField;
    ppDBPipeline1ppField2: TppField;
    ppDBPipeline1ppField3: TppField;
    ppDBPipeline1ppField4: TppField;
    ppDBPipeline1ppField5: TppField;
    ppDBPipeline1ppField6: TppField;
    ppDBPipeline1ppField7: TppField;
    ppDBPipeline1ppField8: TppField;
    ppDBPipeline1ppField9: TppField;
    ppDBPipeline1ppField10: TppField;
    ppDBPipeline1ppField11: TppField;
    ppDBPipeline1ppField12: TppField;
    ppDBPipeline1ppField13: TppField;
    ppDBPipeline1ppField14: TppField;
    ppDBPipeline1ppField15: TppField;
    ppDBPipeline1ppField16: TppField;
    ppDBPipeline1ppField17: TppField;
    ppDBPipeline1ppField18: TppField;
    ppDBPipeline1ppField19: TppField;
    ppDBPipeline1ppField20: TppField;
    ppDBPipeline1ppField21: TppField;
    ppDBPipeline1ppField22: TppField;
    ppDBPipeline1ppField23: TppField;
    ppReport1: TppReport;
    ppDBPipeline2: TppDBPipeline;
    ppDBPipeline2ppField1: TppField;
    ppDBPipeline2ppField2: TppField;
    ppDBPipeline2ppField3: TppField;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1fonecom: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppSystemVariable1: TppSystemVariable;
    ppLabel34: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppLabel11: TppLabel;
    ppDBText11: TppDBText;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    ppLabel13: TppLabel;
    ppDBText13: TppDBText;
    ppLabel14: TppLabel;
    ppDBText14: TppDBText;
    ppLabel15: TppLabel;
    ppDBText15: TppDBText;
    ppLabel16: TppLabel;
    ppDBText16: TppDBText;
    ppLabel17: TppLabel;
    ppDBText17: TppDBText;
    ppLabel18: TppLabel;
    ppDBText18: TppDBText;
    ppLabel19: TppLabel;
    ppDBText19: TppDBText;
    ppLabel20: TppLabel;
    ppDBText20: TppDBText;
    ppLabel21: TppLabel;
    ppDBText21: TppDBText;
    ppLabel22: TppLabel;
    ppDBText22: TppDBText;
    ppLabel23: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine6: TppLine;
    ppLabel38: TppLabel;
    raCodeModule1: TraCodeModule;
    Label24: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure bloqletra(Sender: TObject; var Key: Char);
    procedure bloqletrarg(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn10Click(Sender: TObject);
    procedure Label24Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAssociado: TFrmAssociado;

implementation

uses UDMeclipse, API_F11, UpesqGeral, UPrincipal, UPrincipal2, UCadContato;

{$R *.dfm}

procedure TFrmAssociado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMeclipse.TBassociado.Active:=false;
  dmeclipse.TBfnassociado.Active:=false;
  dmeclipse.TBtpfone.active:=false;
  if menup='1900' then
  begin
    FrmPrincipal2.Enabled := true;
  end
  else
  begin
    If(FrmPrincipal = nil)then
    begin
      application.CreateForm(TFrmPrincipal,FrmPrincipal);
      FrmPrincipal.Show;
    end;
    FrmPrincipal.Enabled := true;
  end;
  action:= cafree;
  FrmAssociado:= nil;
end;

procedure TFrmAssociado.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure TFrmAssociado.BitBtn2Click(Sender: TObject);
begin
  if not(DMeclipse.TBassociado.IsEmpty)then
  begin
    botoes(self);
    mudaedit(self, true);
    DMeclipse.TBassociado.Edit;
  end
  else
    ShowMessage('Não existe registro para edição.');
end;

procedure TFrmAssociado.BitBtn1Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, true);
  DMeclipse.TBassociado.Insert;
end;

procedure TFrmAssociado.BitBtn3Click(Sender: TObject);
begin
  if dmeclipse.TBassociado.isempty then
  begin
     showmessage('Não existe registro a ser excluido');
     exit;
  end;
  If messagedlg('Tem certeza que deseja excluir esse aluno?'+#13+'Essa operação é irreversível!', mtconfirmation, [mbyes, mbno], 0) = mrno then
    exit;
  DMeclipse.TBassociado.Delete;
  data1.Date:=dmeclipse.TBassociadodtadm_ass.AsDateTime;
  data2.Date:=DMeclipse.TBassociadodtnasc_ass.AsDateTime;
end;

procedure TFrmAssociado.BitBtn4Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBassociado.Cancel;
  data1.Date:=dmeclipse.TBassociadodtadm_ass.AsDateTime;
  data2.Date:=DMeclipse.TBassociadodtnasc_ass.AsDateTime;
end;

procedure TFrmAssociado.BitBtn5Click(Sender: TObject);
begin
  trims(self);
  if (trim(DBEdit3.text)='')or(DBRadioGroup1.value='')or((DBEdit6.Text='')and(dbedit7.text=''))or(trim(dbedit8.text)='')or(trim(dbedit9.text)='')or(DBEdit10.text='')or(dbedit11.text='')or(dbedit13.text='')or(dbedit15.text='')Or(DBComboBox1.text='') then
  begin
    showmessage('Preencha todos os campos requeridos');
    exit;
  end;
  if (cpf(dbedit7.Text)=false)and(dbedit7.text<>'') then
  begin
   showmessage('CPF Inválido');
   DBEdit7.SetFocus;
   exit;
  end;
  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBassociadodtadm_ass.AsDateTime:=data1.Date;
  DMeclipse.TBassociadodtnasc_ass.AsDateTime:=data2.Date;
  DMeclipse.TBassociado.Post;
  DMeclipse.TBassociado.Refresh;
end;

procedure TFrmAssociado.BitBtn7Click(Sender: TObject);
begin
  String_tb.Stabela := 'Associado';
  String_tb.Scampocod := 'Codigo_ass';
  String_tb.Scamponome := 'Nome_ass';
  String_tb.Qrytb := DMeclipse.TBassociado;
  String_tb.DStb := DMeclipse.DStbassociado;
  abrirpesq(self);
  String_tb.resultcodi := DMeclipse.TBassociadocodigo_ass.AsInteger;
  data1.Date:=dmeclipse.TBassociadodtadm_ass.AsDateTime;
  data2.Date:=DMeclipse.TBassociadodtnasc_ass.AsDateTime;
end;

procedure TFrmAssociado.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAssociado.bloqletra(Sender: TObject; var Key: Char);
begin
  if ((key<#48)or(key>#57))and(key<>#8)then
    key:=#0;
end;

procedure TFrmAssociado.bloqletrarg(Sender: TObject; var Key: Char);
begin
  if ((key<#48)or(key>#57))and(key<>#8)and(key<>#120)and (key<>#88)then
    key:=#0;
end;

procedure TFrmAssociado.FormCreate(Sender: TObject);
begin
  DMeclipse.TBassociado.Active:=true;
  dmeclipse.TBfnassociado.Active:=true;
  dmeclipse.TBtpfone.active:=true;
  data1.Date:=dmeclipse.TBassociadodtadm_ass.AsDateTime;
  data2.Date:=DMeclipse.TBassociadodtnasc_ass.AsDateTime;
end;

procedure TFrmAssociado.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If messagedlg('Tem certeza que deseja fechar o formulário de cadastro de associado?', mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    DMeclipse.TBassociado.cancel;
    DMeclipse.TBfnassociado.cancel;
    dmeclipse.TBtpfone.cancel;
    canclose:=true;
  end
  else
    canclose:=false;
end;

procedure TFrmAssociado.BitBtn10Click(Sender: TObject);
begin
  if(FrmCadContato = nil)then
  begin
    Application.CreateForm(TFrmCadContato, FrmCadContato);
  end;
//PARAMETRO PARA CHAMADA DE CONTATOS
   FrmCadContato.Tela := 'ASSOCIADO';
   FrmCadContato.ShowModal;
end;

procedure TFrmAssociado.Label24Click(Sender: TObject);
begin
   ShellExecute(Handle, 'open','http://www.receita.fazenda.gov.br/aplicacoes/ATCTA/cpf/ConsultaPublica.asp', '', '', 1);
end;

end.
