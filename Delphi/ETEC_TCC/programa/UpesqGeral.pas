unit UpesqGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TFrmpesq = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type
    TString_tb = class
      Stabela : String;
      Scampocod : String;
      Scamponome : String;
      CField : TAutoIncField;
      Qrytb : TADOQuery;
      DStb : TDataSource;
      resultcodi : integer;

  end;

var
  Frmpesq: TFrmpesq;
  String_tb : TString_tb;

implementation

uses UDMeclipse, UCadLocador, StrUtils, API_F11;

{$R *.dfm}

procedure TFrmpesq.DBGrid1DblClick(Sender: TObject);
begin
  Button1.Click;
end;

procedure TFrmpesq.Button1Click(Sender: TObject);
begin
  CLOSE;
end;

procedure TFrmpesq.Edit1Exit(Sender: TObject);
begin
  pesq(Self, String_tb.Qrytb, String_tb.Stabela, String_tb.Scamponome, String_tb.Scampocod);
end;

procedure TFrmpesq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:= cafree;
  Frmpesq:= nil;
end;

procedure TFrmpesq.FormCreate(Sender: TObject);
begin
//  String_tb := TString_tb.Create;
  DBGrid1.DataSource := String_tb.DStb;
  Edit1.Text:='%';
  Edit1Exit(edit1);
  edit1.Text:='';
end;

procedure TFrmpesq.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key = #13)then
  begin
    Key := #13;
    SelectNext(ActiveControl,true,true);
  end;
end;

end.
