unit UCadCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ExtCtrls, Buttons;

type
  TFrmCargo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    DBEdit2: TDBEdit;
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
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCargo: TFrmCargo;

implementation

uses UDMeclipse, API_F11, UpesqGeral;

{$R *.dfm}

procedure TFrmCargo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:= cafree;
  FrmCargo:= nil;
end;

procedure TFrmCargo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

procedure TFrmCargo.BitBtn1Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, true);
  DMeclipse.TBcargo.Insert;
end;

procedure TFrmCargo.BitBtn2Click(Sender: TObject);
begin
  if not(DMeclipse.TBcargo.IsEmpty)then
  begin
    botoes(self);
    mudaedit(self, true);
    DMeclipse.TBcargo.Edit;
  end
  else
    ShowMessage('Não existe registro para edição.');
end;

procedure TFrmCargo.BitBtn3Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBcargo.delete;
end;

procedure TFrmCargo.BitBtn4Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBcargo.Cancel;
end;

procedure TFrmCargo.BitBtn5Click(Sender: TObject);
begin
  botoes(self);
  mudaedit(self, false);
  DMeclipse.TBcargo.Post;
  DMeclipse.TBcargo.Refresh;
end;


procedure TFrmCargo.BitBtn7Click(Sender: TObject);
begin
  String_tb.Stabela := 'Cargo';
  String_tb.Scampocod := 'Codigo_vol';
  String_tb.Scamponome := 'Nome_vol';
  String_tb.Qrytb := DMeclipse.TBcargo;
  String_tb.DStb := DMeclipse.DStbcargo;
  abrirpesq(self);
  String_tb.resultcodi := DMeclipse.TBcargocodigo_vol.AsInteger;
end;

procedure TFrmCargo.BitBtn6Click(Sender: TObject);
begin
  close;
end;

end.
