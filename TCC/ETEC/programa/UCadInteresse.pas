unit UCadInteresse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, ExtCtrls, DB,
  ADODB;

type
  TfrmCad_Interesse = class(TForm)
    Panel1: TPanel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label43: TLabel;
    DBEdit14: TDBEdit;
    Label44: TLabel;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    GroupBox2: TGroupBox;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    DSinteresse: TDataSource;
    ADOinteresse: TADOQuery;
    ADOinteressecodigo_alu: TIntegerField;
    ADOinteressecodigo_cur: TIntegerField;
    ADOinteressedtficha_esp: TDateTimeField;
    ADOinteresseCurso: TStringField;
    Label2: TLabel;
    DBEdit5: TDBEdit;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    DSAluno_p: TDataSource;
    ADOAluno_p: TADOQuery;
    ADOAluno_pcodigo_alu: TAutoIncField;
    ADOAluno_pnome_alu: TWideStringField;
    ADOinteresseNome: TStringField;
    BitBtn30: TBitBtn;
    procedure BitBtn13Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure ADOinteresseBeforePost(DataSet: TDataSet);
        function validar :boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCad_Interesse: TfrmCad_Interesse;

implementation

uses API_F11, UDMeclipse, UPrincipal, UpesqGeral, UCadAluno;

{$R *.dfm}
                                      
procedure TfrmCad_Interesse.BitBtn13Click(Sender: TObject);
begin
  if(validar)then
  begin
    if(ADOinteresse.State in [dsinsert])then
    begin
      ADOinteresse.Post;
    end;
    ADOinteresse.Insert;
  end;
end;

procedure TfrmCad_Interesse.SpeedButton1Click(Sender: TObject);
begin
  String_tb.Stabela := 'Aluno';
  String_tb.Scampocod := 'codigo_alu';
  String_tb.Scamponome := 'Nome_alu';
  String_tb.Qrytb := ADOAluno_p;
  String_tb.DStb := DSAluno_p;
  abrirpesq(self);
  if not(ADOAluno_p.IsEmpty)then
  begin
    ADOinteresse.Close;
    ADOinteresse.Parameters.ParamByName('codialu').Value := ADOAluno_pcodigo_alu.AsInteger;
    ADOinteresse.Open;
    ADOinteresse.Insert;
    DBEdit5.Text := ADOAluno_pcodigo_alu.AsVariant;
    Edit1.Text := ADOAluno_pnome_alu.AsString;
  end
  else
    ShowMessage('Aluno não cadastrado');
end;

procedure TfrmCad_Interesse.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOinteresse.Active:=false;
  ADOAluno_p.Active:=false;
//  Application.CreateForm(Tfrmprincipal,frmprincipal);
//  frmprincipal.show;
  action:= cafree;
  frmCad_Interesse:= nil;
end;

procedure TfrmCad_Interesse.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If messagedlg('Tem certeza que deseja fechar o formulário de cadastro de Interesses?', mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    ADOinteresse.cancel;
    canclose:=true;
  end
  else
    canclose:=false;
end;

procedure TfrmCad_Interesse.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure TfrmCad_Interesse.BitBtn15Click(Sender: TObject);
begin
  ADOinteresse.Edit;
end;

procedure TfrmCad_Interesse.BitBtn14Click(Sender: TObject);
begin
  if not(ADOinteresse.IsEmpty)then
    ADOinteresse.Delete;
  if(DBEdit5.Text = '')then
    Edit1.Clear;
end;

procedure TfrmCad_Interesse.DBEdit5Exit(Sender: TObject);
begin
  ADOAluno_p.Close;
  ADOAluno_p.SQL.Clear;
  ADOAluno_p.SQL.Add('select codigo_alu, nome_alu from tb_aluno    ');
  ADOAluno_p.SQL.Add(' where codigo_alu = :codi                    ');
  ADOAluno_p.Parameters.ParamByName('codi').Value := DBEdit5.Text;
  ADOAluno_p.Open;
  if not(ADOAluno_p.IsEmpty)then
  begin
    ADOinteresse.Close;
    ADOinteresse.Parameters.ParamByName('codialu').Value := ADOAluno_pcodigo_alu.AsInteger;
    ADOinteresse.Open;
    ADOinteresse.Insert;
    DBEdit5.Text := ADOAluno_pcodigo_alu.AsVariant;
    Edit1.Text := ADOAluno_pnome_alu.AsString;
  end
  else
    ShowMessage('Aluno não cadastrado');
end;

procedure TfrmCad_Interesse.FormShow(Sender: TObject);
begin
  Panel3.Enabled := false;
  frmCad_Interesse.ADOAluno_p.Active := true;
{  frmCad_Interesse.Edit1.Enabled := true;
  frmCad_Interesse.DBEdit5.Enabled := true;
  frmCad_Interesse.SpeedButton1.Enabled := true;    }
  frmCad_Interesse.ADOinteresse.Active := true;
  frmCad_Interesse.ADOinteresse.Insert;
end;

procedure TfrmCad_Interesse.BitBtn30Click(Sender: TObject);
begin
  Panel3.Enabled := not Panel3.Enabled;
  ADOinteresse.Cancel;
end;

procedure TfrmCad_Interesse.ADOinteresseBeforePost(DataSet: TDataSet);
begin
//validar;
  if(validar = false)then
  begin
    ADOinteresse.Cancel;
  end;
end;

function TfrmCad_Interesse.validar: boolean;
var
  valida : boolean;
begin
  valida := true;
  if(trim(DBEdit5.Text) = '')then
    valida := false;
  if(trim(DBEdit14.Text) = '')then
    valida := false;
  if(trim(DBLookupComboBox2.Text) = '')then
    valida := false;

  if(valida = false)then
  begin
    ShowMessage('Existem campos necessarios em branco');
    result := false;
  end
  else
    Result := true;
end;

end.
