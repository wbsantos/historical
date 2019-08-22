unit UCadVolCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, ExtCtrls, DB,
  ADODB;

type
  TfrmCadVol_cargo = class(TForm)
    Panel1: TPanel;
    DBEdit14: TDBEdit;
    Label44: TLabel;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    GroupBox2: TGroupBox;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    DSCargo: TDataSource;
    ADOCargo: TADOQuery;
    Label2: TLabel;
    DBEdit5: TDBEdit;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    BitBtn30: TBitBtn;
    ADOVoluntario_p: TADOQuery;
    ADOVoluntario_pcodigo_vol: TAutoIncField;
    ADOVoluntario_pnome_vol: TWideStringField;
    dsVoluntario_p: TDataSource;
    ADOCargocodigo_vol: TIntegerField;
    ADOCargocargo_vol: TWideStringField;
    ADOCargoVoluntario: TStringField;
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
    procedure ADOCargoBeforePost(DataSet: TDataSet);
        function validar :boolean;
    procedure ADOCargoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVol_cargo: TfrmCadVol_cargo;

implementation

uses API_F11, UDMeclipse, UPrincipal, UpesqGeral, UCadAluno, UCadInteresse;

{$R *.dfm}
                                      
procedure TfrmCadVol_cargo.BitBtn13Click(Sender: TObject);
begin
  if(validar)then
  begin
    if(ADOCargo.State in [dsinsert])then
    begin
      ADOCargo.Post;
    end;
    ADOCargo.Insert;
  end;
end;

procedure TfrmCadVol_cargo.SpeedButton1Click(Sender: TObject);
begin
  String_tb.Stabela := 'VOLUNTARIO';
  String_tb.Scampocod := 'CODIGO_VOL';
  String_tb.Scamponome := 'NOME_VOL';
  String_tb.Qrytb := ADOVoluntario_p;
  String_tb.DStb := dsVoluntario_p;
  abrirpesq(self);
  with ADOCargo do
  begin
    if not(ADOVoluntario_p.IsEmpty)then
    begin
      Close;
      Parameters.ParamByName('CODIVOL').Value := ADOVoluntario_pcodigo_vol.AsInteger;
      Open;
      Insert;
      DBEdit5.Text := ADOVoluntario_pcodigo_vol.AsVariant;
      Edit1.Text := ADOVoluntario_pnome_vol.AsString;
    end
    else
      ShowMessage('Associado não cadastrado');
  end;
end;

procedure TfrmCadVol_cargo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOCargo.Active:=false;
  ADOVoluntario_p.Active:=false;
//  Application.CreateForm(Tfrmprincipal,frmprincipal);
//  frmprincipal.show;
  action:= cafree;
  frmCadVol_cargo:= nil;
end;

procedure TfrmCadVol_cargo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If messagedlg('Tem certeza que deseja fechar o formulário de cadastro de Interesses?', mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    ADOCargo.cancel;
    canclose:=true;
  end
  else
    canclose:=false;
end;

procedure TfrmCadVol_cargo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure TfrmCadVol_cargo.BitBtn15Click(Sender: TObject);
begin
  ADOCargo.Edit;
end;

procedure TfrmCadVol_cargo.BitBtn14Click(Sender: TObject);
begin
  if not(ADOCargo.IsEmpty)then
    ADOCargo.Delete;
  if(DBEdit5.Text = '')then
    Edit1.Clear;
end;

procedure TfrmCadVol_cargo.DBEdit5Exit(Sender: TObject);
begin
  ADOVoluntario_p.Close;
  ADOVoluntario_p.SQL.Clear;
  ADOVoluntario_p.SQL.Add('select codigo_vol, nome_vol from tb_voluntario    ');
  ADOVoluntario_p.SQL.Add(' where codigo_vol = :codi                         ');
  ADOVoluntario_p.Parameters.ParamByName('CODI').Value := StrToInt(DBEdit5.Text);
  ADOVoluntario_p.Open;
  with ADOCargo do
  begin
    if not(ADOVoluntario_p.IsEmpty)then
    begin
      Close;
      Parameters.ParamByName('CODIVOL').Value := ADOVoluntario_pcodigo_vol.AsInteger;
      Open;
      Insert;
      DBEdit5.Text := ADOVoluntario_pcodigo_vol.AsVariant;
      Edit1.Text := ADOVoluntario_pnome_vol.AsString;
    end
    else
    begin
      ShowMessage('Voluntario não cadastrado');
      DBEdit5.SetFocus;
    end;
  end;
end;

procedure TfrmCadVol_cargo.FormShow(Sender: TObject);
begin
  Panel3.Enabled := false;
  ADOVoluntario_p.Active := true;
  ADOCargo.Active := true;
  ADOCargo.Insert;
end;

procedure TfrmCadVol_cargo.BitBtn30Click(Sender: TObject);
begin
  Panel3.Enabled := not Panel3.Enabled;
  ADOCargo.Cancel;
end;

procedure TfrmCadVol_cargo.ADOCargoBeforePost(DataSet: TDataSet);
begin
//validar;
  if(validar = false)then
  begin
    ADOCargo.Cancel;
  end;
end;

function TfrmCadVol_cargo.validar: boolean;
var
  valida : boolean;
begin
  valida := true;
  if(trim(DBEdit5.Text) = '')then
    valida := false;
  if(trim(DBEdit14.Text) = '')then
    valida := false;

  if(valida = false)then
  begin
    ShowMessage('Existem campos necessarios em branco');
    result := false;
  end
  else
    Result := true;
end;

procedure TfrmCadVol_cargo.ADOCargoAfterPost(DataSet: TDataSet);
begin
  if(trim(DBEdit5.Text) = '')then
    Edit1.Text := '';
end;

end.
