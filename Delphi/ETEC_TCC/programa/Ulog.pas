unit Ulog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfrmlog = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlog: Tfrmlog;

implementation

uses UPrincipal2, UPrincipal, API_F11;

{$R *.dfm}

procedure Tfrmlog.Button1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmlog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if menup='1900' then
  begin
    frmprincipal2.Enabled:=true;
  end
  else
  begin
    application.CreateForm(TFrmPrincipal,FrmPrincipal);
    FrmPrincipal.Show;
  end;
  action:=cafree;
  frmlog:=nil;
end;

procedure Tfrmlog.FormCreate(Sender: TObject);
var linha:string;
    logtemp:textfile;
    laco:integer;
begin
  assignfile(logtemp,'log.txt');
  reset(logtemp);
  while (not (eof (logtemp))) do
  begin
    readln(logtemp,linha);
    memo1.Lines.Add(crypt('D',linha));
  end;
  closefile(logtemp);
end;

end.
