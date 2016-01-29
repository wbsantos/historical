unit UCadContato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask,
  DBCtrls;

type
  TFrmCadContato = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    Label41: TLabel;
    DBEdit5: TDBEdit;
    Label42: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn12: TBitBtn;
    ADOQuery1: TADOQuery;
    ADOQuery1codigo_alu: TIntegerField;
    ADOQuery1tptel_fnalu: TWideStringField;
    ADOQuery1fone_fnalu: TWideStringField;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    ADOAluno_p: TADOQuery;
    ADOAluno_pcodigo_alu: TAutoIncField;
    ADOAluno_pnome_alu: TWideStringField;
    DSAluno_p: TDataSource;
    ADOAssociado: TADOQuery;
    ADOVoluntario: TADOQuery;
    dsAssociado: TDataSource;
    dsVoluntario: TDataSource;
    ADOVoluntariocodigo_vol: TIntegerField;
    ADOVoluntariotpfon_vol: TWideStringField;
    ADOVoluntariofone_vol: TWideStringField;
    ADOAssociadocodigo_ass: TIntegerField;
    ADOAssociadotpfone_fnass: TWideStringField;
    ADOAssociadofone_fnass: TWideStringField;
    ADOAssociado_p: TADOQuery;
    dsAssociado_p: TDataSource;
    ADOVoluntario_p: TADOQuery;
    dsVoluntario_p: TDataSource;
    ADOAssociado_pcodigo_ass: TAutoIncField;
    ADOAssociado_pnome_ass: TWideStringField;
    ADOVoluntario_pcodigo_vol: TAutoIncField;
    ADOVoluntario_pnome_vol: TWideStringField;
    BitBtn30: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function validar :boolean;
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure BitBtn30Click(Sender: TObject);
    procedure ADOAssociadoBeforePost(DataSet: TDataSet);
    procedure ADOVoluntarioBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Tela : String;
  end;

var
  FrmCadContato: TFrmCadContato;

implementation

uses UCadAluno, API_F11, UpesqGeral, UCadAssociado, UDMeclipse;

{$R *.dfm}

procedure TFrmCadContato.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure TFrmCadContato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //ALUNO
  if(Tela = 'ALUNO')then
  begin
    ADOQuery1.Active := false;
    ADOAluno_p.Active := false;
  end;

  //ASSOCIADO
  if(tela = 'ASSOCIADO')then
  begin
    ADOAssociado.Active := false;
    ADOAssociado_p.Active := false;
  end;

  //VOLUNTARIO
  if(tela = 'VOLUNTARIO')then
  begin
    ADOVoluntario.Active := false;
    ADOVoluntario_p.Active := false;
  end;

  //  Application.CreateForm(Tfrmprincipal,frmprincipal);
//  FrmAssociado.show;
  action:= cafree;
  FrmCadContato := nil;
end;

procedure TFrmCadContato.BitBtn8Click(Sender: TObject);
begin
//validar;
  if(validar)then
  begin
    if(Tela = 'ALUNO')then
    begin
      if(ADOQuery1.State in [dsinsert])then
      begin
        ADOQuery1.Post;
      end;
      ADOQuery1.Insert;
    end;

    if(tela = 'ASSOCIADO')then
    begin
      if(ADOAssociado.State in [dsinsert])then
      begin
        ADOAssociado.Post;
      end;
      ADOAssociado.Insert;
    end;

    if(tela = 'VOLUNTARIO')then
    begin
      if(ADOVoluntario.State in [dsinsert])then
      begin
        ADOVoluntario.Post;
      end;
      ADOVoluntario.Insert;
    end;
  end;
end;

procedure TFrmCadContato.BitBtn12Click(Sender: TObject);
begin
  if(Tela = 'ALUNO')then
  begin
    ADOQuery1.Edit;
  end;

  if(tela = 'ASSOCIADO')then
  begin
    ADOAssociado.Edit;
  end;

  if(tela = 'VOLUNTARIO')then
  begin
    ADOVoluntario.Edit;
  end;

//  Panel2.Enabled := true;
end;

procedure TFrmCadContato.BitBtn9Click(Sender: TObject);
begin
  if(Tela = 'ALUNO')then
  begin
    if not(ADOQuery1.IsEmpty)then
      ADOQuery1.Delete;
  if(DBEdit5.Text = '')then
    Edit1.Clear;
  end;

  if(tela = 'ASSOCIADO')then
  begin
    if not(ADOAssociado.IsEmpty)then
      ADOAssociado.Delete;
  end;

  if(tela = 'VOLUNTARIO')then
  begin
    if not(ADOVoluntario.IsEmpty)then
      ADOVoluntario.Delete;
  end;

  Panel2.Enabled := false;
end;

procedure TFrmCadContato.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If messagedlg('Tem certeza que deseja fechar o formulário de cadastro de contatos?', mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    if(Tela = 'ALUNO')then
    begin
      ADOQuery1.cancel;
      ADOAluno_p.Cancel;
    end;

    if(tela = 'ASSOCIADO')then
    begin
      ADOAssociado.Cancel;
      ADOAssociado_p.Cancel;
    end;

    if(tela = 'VOLUNTARIO')then
    begin
      ADOVoluntario.Cancel;
      ADOVoluntario_p.Cancel;
    end;

    canclose:=true;
  end
  else
    canclose:=false;
end;

procedure TFrmCadContato.SpeedButton1Click(Sender: TObject);
begin
  //ALUNO
  if(Tela = 'ALUNO')then
  begin
    String_tb.Stabela := 'Aluno';
    String_tb.Scampocod := 'codigo_alu';
    String_tb.Scamponome := 'Nome_alu';
    String_tb.Qrytb := ADOAluno_p;
    String_tb.DStb := DSAluno_p;
    abrirpesq(self);
    if not(ADOAluno_p.IsEmpty)then
    begin
      ADOQuery1.Close;
      ADOQuery1.Parameters.ParamByName('codialu').Value := ADOAluno_pcodigo_alu.AsInteger;
      ADOQuery1.Open;
      ADOQuery1.Insert;
      DBEdit1.Text := ADOAluno_pcodigo_alu.AsVariant;
      Edit1.Text := ADOAluno_pnome_alu.AsString;
    end
    else
      if(Tela = 'ALUNO')then
        ShowMessage('Aluno não cadastrado');
  end;

  //ASSOCIADO
  if(Tela = 'ASSOCIADO')then
  begin
    String_tb.Stabela := 'Associado';
    String_tb.Scampocod := 'codigo_ass';
    String_tb.Scamponome := 'Nome_ass';
    String_tb.Qrytb := ADOAssociado_p;
    String_tb.DStb := dsAssociado_p;
    abrirpesq(self);
    if not(ADOAssociado_p.IsEmpty)then
    begin
      with ADOAssociado do
      begin
        Close;
        Parameters.ParamByName('CODIASS').Value := ADOAssociado_pcodigo_ass.AsInteger;
        Open;
        Insert;
        DBEdit1.Text := ADOAssociado_pcodigo_ass.AsVariant;
        Edit1.Text := ADOAssociado_pnome_ass.AsString;
      end;
    end
    else
      ShowMessage('Associado não cadastrado');
  end;

  if(Tela = 'VOLUNTARIO')then
  begin
    String_tb.Stabela := 'VOLUNTARIO';
    String_tb.Scampocod := 'CODIGO_VOL';
    String_tb.Scamponome := 'NOME_VOL';
    String_tb.Qrytb := ADOVoluntario_p;
    String_tb.DStb := dsVoluntario_p;
    abrirpesq(self);
    with ADOVoluntario do
    begin
      if not(ADOVoluntario_p.IsEmpty)then
      begin
        Close;
        Parameters.ParamByName('CODIVOL').Value := ADOVoluntario_pcodigo_vol.AsInteger;
        Open;
        Insert;
        DBEdit1.Text := ADOVoluntario_pcodigo_vol.AsVariant;
        Edit1.Text := ADOVoluntario_pnome_vol.AsString;
      end
      else
        ShowMessage('Associado não cadastrado');
    end;
  end;

end;

procedure TFrmCadContato.DBEdit1Exit(Sender: TObject);
begin
  if(trim(DBEdit1.Text) <> '')then
  begin
    if(tela = 'ALUNO')then
    begin
      ADOAluno_p.Close;
      ADOAluno_p.SQL.Clear;
      ADOAluno_p.SQL.Add('select codigo_alu, nome_alu from tb_aluno    ');
      ADOAluno_p.SQL.Add(' where codigo_alu = :codi                    ');
      ADOAluno_p.Parameters.ParamByName('CODI').Value := StrToInt(DBEdit1.Text);
      ADOAluno_p.Open;
      if not(ADOAluno_p.IsEmpty)then
      begin
        ADOQuery1.Close;
        ADOQuery1.Parameters.ParamByName('codialu').Value := ADOAluno_pcodigo_alu.AsInteger;
        ADOQuery1.Open;
        ADOQuery1.Insert;
        DBEdit1.Text := ADOAluno_pcodigo_alu.AsVariant;
        Edit1.Text := ADOAluno_pnome_alu.AsString;
      end
      else
        begin
          ShowMessage('Aluno não cadastrado');
          DBEdit1.SetFocus;
        end;
    end;


    if(tela = 'ASSOCIADO')then
    begin
      ADOAssociado_p.Close;
      ADOAssociado_p.SQL.Clear;
      ADOAssociado_p.SQL.Add('select codigo_ass, nome_ass from tb_associado     ');
      ADOAssociado_p.SQL.Add(' where codigo_ass = :codi                         ');
      ADOAssociado_p.Parameters.ParamByName('CODI').Value := StrToInt(DBEdit1.Text);
      ADOAssociado_p.Open;
      if not(ADOAssociado_p.IsEmpty)then
      begin
        with ADOAssociado do
        begin
          Close;
          Parameters.ParamByName('CODIASS').Value := ADOAssociado_pcodigo_ass.AsInteger;
          Open;
          Insert;
          DBEdit1.Text := ADOAssociado_pcodigo_ass.AsVariant;
          Edit1.Text := ADOAssociado_pnome_ass.AsString;
        end;
      end
      else
      begin
        ShowMessage('Associado não cadastrado');
        DBEdit1.SetFocus;
      end;
    end;

    if(tela = 'VOLUNTARIO')then
    begin
      ADOVoluntario_p.Close;
      ADOVoluntario_p.SQL.Clear;
      ADOVoluntario_p.SQL.Add('select codigo_vol, nome_vol from tb_voluntario    ');
      ADOVoluntario_p.SQL.Add(' where codigo_vol = :codi                         ');
      ADOVoluntario_p.Parameters.ParamByName('CODI').Value := StrToInt(DBEdit1.Text);
      ADOVoluntario_p.Open;
      with ADOVoluntario do
      begin
        if not(ADOVoluntario_p.IsEmpty)then
        begin
          Close;
          Parameters.ParamByName('CODIVOL').Value := ADOVoluntario_pcodigo_vol.AsInteger;
          Open;
          Insert;
          DBEdit1.Text := ADOVoluntario_pcodigo_vol.AsVariant;
          Edit1.Text := ADOVoluntario_pnome_vol.AsString;
        end
        else
        begin
          ShowMessage('Voluntario não cadastrado');
          DBEdit1.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TFrmCadContato.FormShow(Sender: TObject);
begin
  DBEdit5.DataField := '';
  DBEdit1.DataField := '';
  DBLookupComboBox1.DataField := '';
  Panel2.Enabled := false;

  //ALUNO
  if(tela = 'ALUNO')then
  begin
    Label2.Caption := 'Aluno';
    ADOQuery1.Active := true;
    ADOAluno_p.Active := true;
    DBEdit1.DataSource := DataSource1;
    DBEdit1.DataField  := 'codigo_alu';
    DBLookupComboBox1.DataSource := DataSource1;
    DBLookupComboBox1.DataField  := 'tptel_fnalu';
    DBEdit5.DataSource := DataSource1;
    DBEdit5.DataField  := 'fone_fnalu';
    DBGrid1.DataSource := DataSource1;
    ADOQuery1.Insert;
  end;

  //ASSOCIADO
  if(tela = 'ASSOCIADO')then
  begin
    Label2.Caption := 'Associado';
    ADOAssociado.Active := true;
    ADOAssociado_p.Active := true;
    DBEdit1.DataSource := dsAssociado;
    DBEdit1.DataField  := 'codigo_ass';
    DBLookupComboBox1.DataSource := dsAssociado;
    DBLookupComboBox1.DataField  := 'tpfone_fnass';
    DBEdit5.DataSource := dsAssociado;
    DBEdit5.DataField  := 'fone_fnass';
    DBGrid1.DataSource := dsAssociado;
    ADOAssociado.Insert;
  end;

  //VOLUNTARIO
  if(tela = 'VOLUNTARIO')then
  begin
    Label2.Caption := 'Voluntario';
    ADOVoluntario.Active := true;
    ADOVoluntario_p.Active := true;
    DBEdit1.DataSource := dsVoluntario;
    DBEdit1.DataField  := 'codigo_vol';
    DBLookupComboBox1.DataSource := dsVoluntario;
    DBLookupComboBox1.DataField  := 'tpfon_vol';
    DBEdit5.DataSource := dsVoluntario;
    DBEdit5.DataField  := 'fone_vol';
    DBGrid1.DataSource := dsVoluntario;
    ADOVoluntario.Insert;
  end;

  DBGrid1.Columns[0].Title.Caption := 'Cod.';
  DBGrid1.Columns[1].Title.Caption := 'Tipo';
  DBGrid1.Columns[2].Title.Caption := 'Número';

end;

function TFrmCadContato.validar: boolean;
var
  valida: boolean;
begin
  valida := true;
  if(trim(DBEdit5.Text) = '')then
    valida := false;
  if(trim(DBEdit1.Text) = '')then
    valida := false;
  if(trim(DBLookupComboBox1.Text) = '')then
    valida := false;

  if(valida = false)then
  begin
    ShowMessage('Existem campos necessarios em branco');
    result := false;
  end
  else
    Result := true;
end;

procedure TFrmCadContato.ADOQuery1BeforePost(DataSet: TDataSet);
begin
//validar;
  if(validar = false)then
  begin
    ADOQuery1.Cancel;
    ADOAssociado.Cancel;
    ADOVoluntario.Cancel;
  end;
end;
procedure TFrmCadContato.BitBtn30Click(Sender: TObject);
begin
  Panel2.Enabled := not Panel2.Enabled;
  ADOQuery1.Cancel;
  ADOAssociado.Cancel;
  ADOVoluntario.Cancel;
end;

procedure TFrmCadContato.ADOAssociadoBeforePost(DataSet: TDataSet);
begin
//validar;
  if(validar = false)then
  begin
    ADOQuery1.Cancel;
    ADOAssociado.Cancel;
    ADOVoluntario.Cancel;
  end;
end;

procedure TFrmCadContato.ADOVoluntarioBeforePost(DataSet: TDataSet);
begin
//validar;
  if(validar = false)then
  begin
    ADOQuery1.Cancel;
    ADOAssociado.Cancel;
    ADOVoluntario.Cancel;
  end;
end;

end.
