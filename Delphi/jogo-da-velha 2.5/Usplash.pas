unit Usplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, jpeg, JvProgressBar, JvXPProgressBar;

type
  TForm6 = class(TForm)
    Image1: TImage;
    barra: TJvXPProgressBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  load:byte;

implementation

uses Ujogo;

{$R *.dfm}

procedure TForm6.FormCreate(Sender: TObject);
begin
load:=0;
end;

procedure TForm6.Timer1Timer(Sender: TObject);
begin
load:=load+1;
barra.position:=load;
if load=100 then
begin
 timer1.Enabled:=false;
 form1:=tform1.create(application);
 form1.show;
 form6.hide;
end;
end;

end.
