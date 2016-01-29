unit Uprincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, XPMan, StdCtrls, Buttons, pngimage;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    barra: TImage;
    Time: TTimer;
    bolinha: TImage;
    XPManifest1: TXPManifest;
    btncomecar: TSpeedButton;
    fundo: TImage;
    image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Image27: TImage;
    Image28: TImage;
    Image29: TImage;
    Image30: TImage;
    Image31: TImage;
    Image32: TImage;
    Image33: TImage;
    Image34: TImage;
    Image35: TImage;
    Image36: TImage;
    Image37: TImage;
    Image38: TImage;
    Image39: TImage;
    Image40: TImage;
    Image41: TImage;
    Image42: TImage;
    Image43: TImage;
    Image44: TImage;
    Image45: TImage;
    Image46: TImage;
    Image47: TImage;
    Image48: TImage;
    Image49: TImage;
    Image50: TImage;
    btnpausar: TSpeedButton;
    lblresul: TLabel;
    temas: TGroupBox;
    velo: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    btnsobre: TSpeedButton;
    procedure TimeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure movebarra;
    procedure movebolinha;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncomecarClick(Sender: TObject);
    procedure btnpausarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure btnsobreClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  velocidade:byte;
  player,x,y:integer;
  placar,velocidadeb,i,pontos,veri:integer;
  bloco:array[1..50]of timage;
  controlpause,pause:byte;
  nada:boolean;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.TimeTimer(Sender: TObject);
begin
if nada=false then
begin
if veri=50 then
begin
  nada:=true;
  veri:=0;
  time.Enabled:=false;
  bolinha.Top:=572;
  bolinha.Left:=256;
  barra.Top:=592;
  barra.Left:=208;
  showmessage('Você Ganhou');
end;
if bolinha.top>652 then
begin
  nada:=true;
  veri:=0;
  pontos:=0;
  bolinha.Top:=572;
  bolinha.Left:=256;
  barra.Top:=592;
  barra.Left:=208;
  time.enabled:=false;
  showmessage('Você Perdeu');
end;
end;
movebarra;
movebolinha;

end;

procedure tform1.movebarra;
begin
if (barra.left<=0)then
barra.Left:=1;
if (barra.left>=432)then
barra.Left:=431;
if (barra.left>=0) and (barra.left<=432) then
 barra.Left:=barra.Left+velocidade*player;

end;

procedure tform1.movebolinha;
begin    
if bolinha.left<=0 then
 x:=random(4);
if bolinha.left>=531 then
begin
 x:=random(4);
 x:=-x;
end;
if bolinha.top<=0 then
 y:=3;
  if (bolinha.top>=barra.Top-20)and (bolinha.Top<=barra.Top+17)and(bolinha.Left>=barra.left-20)and(bolinha.left<=barra.left+120) then
  begin
    if (bolinha.left>=barra.Left-20)and(bolinha.Left<=barra.left+2) then
    begin
     x:=-3;
     if (bolinha.top>=barra.top-20)and(bolinha.top<=barra.top+10) then
     begin
       y:=-3;
     end
     else
     begin
       y:=3;
     end;
    end
    else
    begin
     if (bolinha.top>=barra.top-20)and(bolinha.Left<=barra.top+10) then
     begin
       y:=-3;
     end
     else
     begin
       y:=3;
     end;
    end;
    if (bolinha.top>=barra.top-20)and(bolinha.top<=barra.top+5) then
    begin
     if (bolinha.left>=barra.left-20)and(bolinha.Left<=barra.left+5) then
     begin
       x:=-3;
     end;
     if (bolinha.left>=barra.left+115)and(bolinha.Left<=barra.left+120) then
     begin
       x:=3;
     end;
     y:=-3;
    end
    else
    begin
     if (bolinha.left>=barra.left-20)and(bolinha.Left<=barra.left+5) then
     begin
       x:=-3;
     end;
     if (bolinha.left>=barra.left+115)and(bolinha.Left<=barra.left+120) then
     begin
       x:=3;
     end;
     y:=3;
     end;
  end;
for i := 1 to 50 do
begin
 if (bloco[i].visible=true) then
 begin
  if (bolinha.top>=bloco[i].Top-20)and (bolinha.Top<=bloco[i].Top+25)and(bolinha.Left>=bloco[i].left-20)and(bolinha.left<=bloco[i].left+73) then
  begin
  veri:=veri+1;
  pontos:=pontos+1;
  lblresul.caption:=inttostr(pontos);
    if (bolinha.left>=bloco[i].Left-20)and(bolinha.Left<=bloco[i].left+2) then
    begin
     x:=-3;
     if (bolinha.top>=bloco[i].top-20)and(bolinha.top<=bloco[i].top+10) then
     begin
       y:=-3;
     end
     else
     begin
       y:=3;
     end;
     bloco[i].Visible:=false;
    end
    else
    begin
     if (bolinha.top>=bloco[i].top-20)and(bolinha.Left<=bloco[i].top+10) then
     begin
       y:=-3;
     end
     else
     begin
       y:=3;
     end;
     x:=3;
     bloco[i].Visible:=false;
    end;
    if (bolinha.top>=bloco[i].top-20)and(bolinha.top<=bloco[i].top+5) then
    begin
     if (bolinha.left>=bloco[i].left-20)and(bolinha.Left<=bloco[i].left+35) then
     begin
       x:=-3;
     end
     else
     begin
       x:=3;
     end;
     y:=-3;
     bloco[i].Visible:=false;
    end
    else
    begin
     if (bolinha.left>=bloco[i].left-20)and(bolinha.Left<=bloco[i].left+35) then
     begin
       x:=-3;
     end
     else
     begin
       x:=3;
     end;
     y:=3;
     bloco[i].Visible:=false;
     end;
    end;
  end;
end;
bolinha.left:=bolinha.Left+x*velocidadeb;
bolinha.Top:=bolinha.top+y*velocidadeb;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
for I := 1 to 50 do
  begin
    bloco[i].Picture.loadfromfile('imagens/bloco/bloco1.png');
  end;
fundo.Picture.loadfromfile('imagens/fundo/fundo.jpg');
barra.picture.loadfromfile('imagens/barra/barra2.png');
bolinha.picture.loadfromfile('imagens/bolinha/bola1.png');
radiobutton1.Enabled:=false;
radiobutton1.enabled:=true;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
for I := 1 to 50 do
  begin
    bloco[i].Picture.loadfromfile('imagens/bloco/bloco2.png');
  end;
fundo.Picture.loadfromfile('imagens/fundo/fundo2.jpg');
barra.picture.loadfromfile('imagens/barra/barra2.jpg');
bolinha.picture.loadfromfile('imagens/bolinha/bola2.png');
radiobutton1.Focused;
radiobutton2.Enabled:=false;
radiobutton2.enabled:=true;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
velocidadeb:=1;
velocidade:=3;
radiobutton3.Enabled:=false;
radiobutton3.enabled:=true;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
velocidadeb:=2;
velocidade:=3;
radiobutton4.Enabled:=false;
radiobutton4.enabled:=true;
end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
velocidadeb:=3;
velocidade:=3;
radiobutton5.Enabled:=false;
radiobutton5.enabled:=true;
end;

procedure TForm1.RadioButton6Click(Sender: TObject);
begin
velocidadeb:=4;
velocidade:=4;
radiobutton6.Enabled:=false;
radiobutton6.enabled:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
for I := 1 to 50 do
  begin
    bloco[i] := Timage(FindComponent('image' + inttostr(i)));
    bloco[i].Picture.loadfromfile('imagens/bloco/bloco1.png');
    bloco[i].Stretch:=true;
  end;
barra.picture.loadfromfile('imagens/barra/barra2.png');
bolinha.Picture.loadfromfile('imagens/bolinha/bola1.png');
DoubleBuffered:=true;
randomize;
pontos:=0;
velocidadeb:=1;
veri:=0;
pause:=0;
player:=0;
velocidade:=3;
panel1.color:=clWhite;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
player:=0;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=37 then
   begin
       player:=-2;
   end;
   if key=39 then
   begin
       player:=2;
   end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#80)or(key=#112) then
btnpausar.click;
if key=#13 then
btncomecar.click;
end;





procedure TForm1.btncomecarClick(Sender: TObject);
var sorteio:byte;
begin
time.enabled:=true;
nada:=false;
for I := 1 to 50 do
  begin
    bloco[i].visible:=true;
  end;
sorteio:=random(2);
if sorteio=1 then
x:=3
else
x:=-3;
y:=-3;
bolinha.Top:=572;
bolinha.Left:=256;
barra.Top:=592;
barra.Left:=208;
end;

procedure TForm1.btnpausarClick(Sender: TObject);
begin
pause:=pause+1;
controlpause:=pause mod 2;
if controlpause=1 then
time.enabled:=false
else
time.Enabled:=true;
end;

procedure TForm1.btnsobreClick(Sender: TObject);
begin
btnpausar.click;
form2:=tform2.create(application);
form2.Show;
end;

end.
