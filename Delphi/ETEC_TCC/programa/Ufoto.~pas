unit Ufoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, JLCVideo;

type
  TFoto = class(TForm)
    JLCVideo1: TJLCVideo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Image1: TImage;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Foto: TFoto;

implementation

uses UCadAluno, UDMeclipse;

{$R *.dfm}

procedure TFoto.SpeedButton1Click(Sender: TObject);
begin
  JLCVideo1.GrabarImagenDisco;
  image1.Picture.LoadFromFile('foto.bmp');
  image1.visible:=true;
  JLCVideo1.Visible:=false;
  SpeedButton2.Enabled:=true;
  SpeedButton1.Enabled:=false;
  SpeedButton3.Enabled:=true;
end;

procedure TFoto.SpeedButton3Click(Sender: TObject);
begin
    SpeedButton2.Enabled:=false;
    SpeedButton1.Enabled:=true;
    speedbutton3.Enabled:=false;
    image1.Visible:=false;
    JLCVideo1.Visible:=true;
end;

procedure TFoto.SpeedButton2Click(Sender: TObject);
begin
 //   FrmAluno.DBImage1.Picture.LoadFromFile('foto.bmp');
    DMeclipse.TBalunofoto.LoadFromFile('foto.bmp');
    close;
end;

procedure TFoto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  foto:=nil;
end;

procedure TFoto.FormCreate(Sender: TObject);
begin
  JLCVideo1.Activo:=true;
end;

end.
