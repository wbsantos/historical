unit pesq_t;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, ADODB;

type
  TfrmPesq_tur = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    dspesq_t: TDataSource;
    ADOpesq_t: TADOQuery;
    ADOpesq_tcodigo_tur: TAutoIncField;
    ADOpesq_tnome_tur: TWideStringField;
    ADOpesq_tnome_cur: TWideStringField;
    ADOpesq_tstatus_tur: TWideStringField;
    ADOpesq_tnome_vol: TWideStringField;
    ADOpesq_tdt_ini: TDateTimeField;
    procedure Edit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesq_tur: TfrmPesq_tur;

implementation

uses API_F11, UpesqGeral, UDMeclipse, Uatualizar;

{$R *.dfm}

procedure TfrmPesq_tur.Edit1Exit(Sender: TObject);
begin
  with ADOpesq_t do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT tb_turma.codigo_tur,                                      ');
    SQL.Add('       tb_turma.nome_tur,                                        ');
    SQL.Add('       tb_curso.nome_cur,                                        ');
    SQL.Add('       tb_turma.status_tur,                                      ');
    SQL.Add('       tb_voluntario.nome_vol,                                   ');
    SQL.Add('       tb_turma.dt_ini                                           ');
    SQL.Add('       FROM tb_voluntario                                        ');
    SQL.Add('            INNER JOIN (tb_curso                                 ');
    SQL.Add('                        INNER JOIN tb_turma                      ');
    SQL.Add('                                ON tb_curso.codigo_cur = tb_turma.codigo_cur)');
    SQL.Add('                        ON tb_voluntario.codigo_vol = tb_turma.codigo_vol ');
    SQL.Add('WHERE                                                             ');
    if(ComboBox1.ItemIndex = 1)then
      SQL.Add('tb_turma.codigo_tur = :codi                                       ');
    if(ComboBox1.ItemIndex = 0)then
      SQL.Add('tb_turma.nome_tur Like :nome                                      ');
    if(ComboBox1.ItemIndex = 2)then
      SQL.Add('tb_turma.dt_ini > :dt                                             ');

    if(ComboBox1.ItemIndex = 1)then
      Parameters.ParamByName('codi').Value := Edit1.Text;
    if(ComboBox1.ItemIndex = 0)then
      Parameters.ParamByName('nome').Value := Edit1.Text;
    if(ComboBox1.ItemIndex = 2)then
      Parameters.ParamByName('dt').Value := Edit1.Text;
    Open;
  end;
end;

procedure TfrmPesq_tur.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADOpesq_t.Close;
  ADOpesq_t.Active := false;
  action:= cafree;
  frmPesq_tur:= nil;
end;

procedure TfrmPesq_tur.DBGrid1DblClick(Sender: TObject);
begin
  DMeclipse.TBturma.Close;
  DMeclipse.TBturma.SQL.Text := 'SELECT * FROM TB_TURMA WHERE CODIGO_TUR = :CODI';
  DMeclipse.TBturma.Parameters.ParamByName('CODI').Value := ADOpesq_tcodigo_tur.AsInteger;
  DMeclipse.TBturma.Open;
  Button1.Click;
end;

procedure TfrmPesq_tur.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
  
end;

procedure TfrmPesq_tur.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesq_tur.FormShow(Sender: TObject);
begin
  ADOpesq_t.Active := true;
end;

procedure TfrmPesq_tur.FormCreate(Sender: TObject);
begin
  Edit1.Text:='%';
  Edit1Exit(edit1);
  edit1.Text:='';
end;

end.
