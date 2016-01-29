unit Uconf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfrmconfirmsenha = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label3: TLabel;
    procedure Label3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconfirmsenha: Tfrmconfirmsenha;
  conf,cancel:boolean;

implementation

uses API_F11;

{$R *.dfm}

procedure Tfrmconfirmsenha.Label3Click(Sender: TObject);
begin
  showmessage(User_id.frase);
end;

procedure Tfrmconfirmsenha.Button1Click(Sender: TObject);
begin
  if Edit1.text= User_id.senha then conf:=true;
  close;
end;

procedure Tfrmconfirmsenha.Button2Click(Sender: TObject);
begin
  cancel:=true;
  close;
end;

procedure Tfrmconfirmsenha.FormCreate(Sender: TObject);
begin
  cancel:=false;
  conf:=false;
end;

procedure Tfrmconfirmsenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
  frmconfirmsenha:=nil;
end;

end.
