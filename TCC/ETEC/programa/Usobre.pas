unit Usobre;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TFrmSobre = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label3: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSobre: TFrmSobre;

implementation

uses Uatualizar;

{$R *.dfm}

procedure TFrmSobre.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Versão: ' + vers.versao;
end;

procedure TFrmSobre.OKButtonClick(Sender: TObject);
begin
  close;
end;

procedure TFrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  frmsobre:=nil;
end;

end.

