unit Umulti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,pngimage, jpeg, ExtCtrls, Menus, JvMenus;

type
  TForm3 = class(TForm)
    btnsingle: TButton;
    Image1: TImage;
    GroupBox1: TGroupBox;
    lbljogador1: TLabel;
    lbljogador2: TLabel;
    lblvelha: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    rbtfolha: TRadioButton;
    rbtlousa: TRadioButton;
    rbtraio: TRadioButton;
    rbtasia: TRadioButton;
    rbtvampi: TRadioButton;
    rbtsombrio: TRadioButton;
    btnnovo: TButton;
    btnnovojogs: TButton;
    btnzerar: TButton;
    i2: TImage;
    i3: TImage;
    i4: TImage;
    i5: TImage;
    i6: TImage;
    i7: TImage;
    i8: TImage;
    i9: TImage;
    btnverificar: TButton;
    i1: TImage;
    btninstrucoes: TButton;
    btnsobre: TButton;
    JvPopupMenu1: TJvPopupMenu;
    NovoJogo1: TMenuItem;
    NovosJogadores1: TMenuItem;
    ZerarPlacar1: TMenuItem;
    SinglePlayer1: TMenuItem;
    Instrues1: TMenuItem;
    Sobre1: TMenuItem;
    Sair1: TMenuItem;
    procedure btnsingleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnzerarClick(Sender: TObject);
    procedure btnverificarClick(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure btnnovojogsClick(Sender: TObject);
    procedure i1Click(Sender: TObject);
    procedure i2Click(Sender: TObject);
    procedure i3Click(Sender: TObject);
    procedure i4Click(Sender: TObject);
    procedure i5Click(Sender: TObject);
    procedure i6Click(Sender: TObject);
    procedure i7Click(Sender: TObject);
    procedure i8Click(Sender: TObject);
    procedure i9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbtfolhaClick(Sender: TObject);
    procedure rbtlousaClick(Sender: TObject);
    procedure rbtraioClick(Sender: TObject);
    procedure rbtasiaClick(Sender: TObject);
    procedure rbtvampiClick(Sender: TObject);
    procedure rbtsombrioClick(Sender: TObject);
    procedure btninstrucoesClick(Sender: TObject);
    procedure btnsobreClick(Sender: TObject);
    procedure NovoJogo1Click(Sender: TObject);
    procedure NovosJogadores1Click(Sender: TObject);
    procedure ZerarPlacar1Click(Sender: TObject);
    procedure SinglePlayer1Click(Sender: TObject);
    procedure Instrues1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Ujogo, Uinstru, sobre;
var nomem1,nomem2:string;
jogador1,jogador2,velha,controle,checkcontrole,xo:byte;

{$R *.dfm}

procedure TForm3.btninstrucoesClick(Sender: TObject);
begin
form4:=tform4.create(application);
form4.show;
end;

procedure TForm3.btnnovoClick(Sender: TObject);
var vezxo:byte;
begin
vezxo:=xo mod 2;
if vezxo=0 then
controle:=0
else
controle:=1;
j1:='n';
j2:='n';
j3:='n';
j4:='n';
j5:='n';
j6:='n';
j7:='n';
j8:='n';
j9:='n';
i1.picture.loadfromfile('imagens/vazio.gif');
i2.picture.loadfromfile('imagens/vazio.gif');
i3.picture.loadfromfile('imagens/vazio.gif');
i4.picture.loadfromfile('imagens/vazio.gif');
i5.picture.loadfromfile('imagens/vazio.gif');
i6.picture.loadfromfile('imagens/vazio.gif');
i7.picture.loadfromfile('imagens/vazio.gif');
i8.picture.loadfromfile('imagens/vazio.gif');
i9.picture.loadfromfile('imagens/vazio.gif');
end;

procedure TForm3.btnnovojogsClick(Sender: TObject);
begin
repeat
nomem1:=inputbox('Jogador 1','Digite seu nome','');
if length(nomem1)>10 then
begin
  showmessage('Máximo 10 caracteres');
  nomem1:='wa+1-2/naoseimesmo';
end;
until (nomem1<>'wa+1-2/naoseimesmo'); ;
repeat
if nomem1<>'' then
begin
nomem2:=inputbox('Jogador 2','Digite seu nome','');
if length(nomem2)>10 then
begin
  showmessage('Máximo 10 caracteres');
  nomem2:='wa+1-2/naoseimesmo';
end;
end;
until (nomem2<>'wa+1-2/naoseimesmo');
if (nomem2<>'')and(nomem1<>'') then
begin
btnzerar.click;
lbljogador1.caption:=nomem1+':';
lbljogador2.caption:=nomem2+':';
end;
end;

procedure TForm3.btnsingleClick(Sender: TObject);
begin
form1:=tform1.create(application);
form1.show;
form3.free;
end;

procedure TForm3.btnsobreClick(Sender: TObject);
begin
form5:=tform5.create(application);
form5.show;
end;

procedure TForm3.btnverificarClick(Sender: TObject);
var vari:byte;
begin
vari:=0;
if (j1='x') and  (j2='x') and  (j3='x')then
begin
  showmessage(nomem1+' Ganhou');
  jogador1:=jogador1+1;
  xo:=xo+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador1);
  vari:=1;
end;
if (j4='x') and  (j5='x') and  (j6='x')then
begin
  showmessage(nomem1+' Ganhou');
  jogador1:=jogador1+1;
  xo:=xo+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador1);
  vari:=1;
end;
if (j7='x') and  (j8='x') and  (j9='x')then
begin
  showmessage(nomem1+' Ganhou');
  jogador1:=jogador1+1;
  xo:=xo+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador1);
  vari:=1;
end;                           
if (j1='x') and  (j4='x') and  (j7='x')then
begin
  showmessage(nomem1+' Ganhou');
  jogador1:=jogador1+1;
  xo:=xo+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador1);
  vari:=1;
end;
if (j2='x') and  (j5='x') and  (j8='x')then
begin
  showmessage(nomem1+' Ganhou');
  jogador1:=jogador1+1;
  xo:=xo+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador1);
  vari:=1;
end;
if (j3='x') and  (j6='x') and  (j9='x')then
begin
  showmessage(nomem1+' Ganhou');
  jogador1:=jogador1+1;
  xo:=xo+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador1);
  vari:=1;
end;
if (j1='x') and  (j5='x') and  (j9='x')then
begin
  showmessage(nomem1+' Ganhou');
  jogador1:=jogador1+1;
  xo:=xo+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador1);
  vari:=1;
end;
if (j3='x') and  (j5='x') and  (j7='x')then
begin
  showmessage(nomem1+' Ganhou');
  jogador1:=jogador1+1;
  xo:=xo+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador1);
  vari:=1;
end;

if (j1='o') and  (j2='o') and  (j3='o')then
begin
  showmessage(nomem2+' Ganhou');
  jogador2:=jogador2+1;
  xo:=xo+1;
  btnnovo.click;
  label2.Caption:=inttostr(jogador2);
  vari:=1;
end;
if (j4='o') and  (j5='o') and  (j6='o')then
begin
  showmessage(nomem2+' Ganhou');
  jogador2:=jogador2+1;
  xo:=xo+1;
  btnnovo.click;
  label2.Caption:=inttostr(jogador2);
  vari:=1;
end;
if (j7='o') and  (j8='o') and  (j9='o')then
begin
  showmessage(nomem2+' Ganhou');
  jogador2:=jogador2+1;
  xo:=xo+1;
  btnnovo.click;
  label2.Caption:=inttostr(jogador2);
  vari:=1;
end;
if (j1='o') and  (j4='o') and  (j7='o')then
begin
  showmessage(nomem2+' Ganhou');
  jogador2:=jogador2+1;
  xo:=xo+1;
  btnnovo.click;
  label2.Caption:=inttostr(jogador2);
  vari:=1;
end;
if (j3='o') and  (j6='o') and  (j9='o')then
begin
  showmessage(nomem2+' Ganhou');
  jogador2:=jogador2+1;
  xo:=xo+1;
  btnnovo.click;
  label2.Caption:=inttostr(jogador2);
  vari:=1;
end;
if (j1='o') and  (j5='o') and  (j9='o')then
begin
  showmessage(nomem2+' Ganhou');
  jogador2:=jogador2+1;
  xo:=xo+1;
  btnnovo.click;
  label2.Caption:=inttostr(jogador2);
  vari:=1;
end;
if (j3='o') and  (j5='o') and  (j7='o')then
begin
  showmessage(nomem2+' Ganhou');
  jogador2:=jogador2+1;
  xo:=xo+1;
  btnnovo.click;
  label2.Caption:=inttostr(jogador2);
  vari:=1;
end;
if (j2='o') and  (j5='o') and  (j8='o')then
begin
  showmessage(nomem2+' Ganhou');
  jogador2:=jogador2+1;
  xo:=xo+1;
  btnnovo.click;
  label2.Caption:=inttostr(jogador2);
  vari:=1;
end;
if vari=0 then
begin
  if (j1<>'n')and (j2<>'n')and(j3<>'n')and(j4<>'n')and(j5<>'n')and(j6<>'n')and(j7<>'n')and(j8<>'n')and(j9<>'n') then
   begin
    showmessage('Deu Velha');
    velha:=velha+1;
    xo:=xo+1;
     btnnovo.click;
    label3.Caption:=inttostr(velha);
    vari:=1;
   end;
end;
end;

procedure TForm3.btnzerarClick(Sender: TObject);
begin
xo:=0;
controle:=0;
jogador1:=0;
jogador2:=0;
velha:=0;
label1.caption:=inttostr(jogador1);
label2.caption:=inttostr(jogador2);
label3.caption:=inttostr(velha);
btnnovo.Click;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
repeat
nomem1:=inputbox('Jogador 1','Digite seu nome','');
if length(nomem1)>10 then
begin
  showmessage('Máximo 10 caracteres');
  nomem1:='';
end;
until nomem1<>'';
repeat
nomem2:=inputbox('Jogador 2','Digite seu nome','');
if length(nomem2)>10 then
begin
  showmessage('Máximo 10 caracteres');
  nomem2:='';
end;
until nomem2<>'';
xo:=0;
lbljogador1.caption:=nomem1+':';
lbljogador2.caption:=nomem2+':';
jogador1:=0;
jogador2:=0;
velha:=0;
j1:='n';
j2:='n';
j3:='n';
j4:='n';
j5:='n';
j6:='n';
j7:='n';
j8:='n';
j9:='n';
btnnovo.click;
btnzerar.click;
randomize;
end;

procedure TForm3.i1Click(Sender: TObject);
begin
if j1='n' then
begin
 controle:=controle+1;
 checkcontrole:=controle mod 2;
 if checkcontrole=1 then
 begin
  j1:='x';
  if rbtfolha.Checked=true then
   i1.picture.LoadFromFile('imagens/x/1.png');
  if rbtlousa.Checked=true then
   i1.picture.LoadFromFile('imagens/lousa/x/1.png');
  if rbtraio.checked=true then
   i1.picture.LoadFromFile('imagens/raio/x.png');
  if rbtasia.Checked=true then
   i1.picture.LoadFromFile('imagens/asia/x.png');
  if rbtvampi.Checked=true then
   i1.picture.LoadFromFile('imagens/vampi/x.png');
  if rbtsombrio.Checked=true then
   i1.picture.LoadFromFile('imagens/sombrio/x.png');
 end
 else
 begin
  j1:='o';
  if rbtfolha.Checked=true then
   i1.picture.LoadFromFile('imagens/o/1.png');
  if rbtlousa.Checked=true then
   i1.picture.LoadFromFile('imagens/lousa/o/1.png');
  if rbtraio.checked=true then
   i1.picture.LoadFromFile('imagens/raio/o.png');
  if rbtasia.Checked=true then
   i1.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampi.Checked=true then
   i1.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtsombrio.Checked=true then
   i1.picture.LoadFromFile('imagens/sombrio/o.png');
 end;
 btnverificar.click;
end;
end;

procedure TForm3.i2Click(Sender: TObject);
begin
if j2='n' then
begin
 controle:=controle+1;
 checkcontrole:=controle mod 2;
 if checkcontrole=1 then
 begin
  j2:='x';
  if rbtfolha.Checked=true then
   i2.picture.LoadFromFile('imagens/x/2.png');
  if rbtlousa.Checked=true then
   i2.picture.LoadFromFile('imagens/lousa/x/2.png');
  if rbtraio.checked=true then
   i2.picture.LoadFromFile('imagens/raio/x.png');
  if rbtasia.Checked=true then
   i2.picture.LoadFromFile('imagens/asia/x.png');
  if rbtvampi.Checked=true then
   i2.picture.LoadFromFile('imagens/vampi/x.png');
  if rbtsombrio.Checked=true then
   i2.picture.LoadFromFile('imagens/sombrio/x.png');
 end
 else
 begin
  j2:='o';
  if rbtfolha.Checked=true then
   i2.picture.LoadFromFile('imagens/o/2.png');
  if rbtlousa.Checked=true then
   i2.picture.LoadFromFile('imagens/lousa/o/2.png');
  if rbtraio.checked=true then
   i2.picture.LoadFromFile('imagens/raio/o.png');
  if rbtasia.Checked=true then
   i2.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampi.Checked=true then
   i2.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtsombrio.Checked=true then
   i2.picture.LoadFromFile('imagens/sombrio/o.png');
 end;
 btnverificar.click;
end;
end;


procedure TForm3.i3Click(Sender: TObject);
begin
if j3='n' then
begin
 controle:=controle+1;
 checkcontrole:=controle mod 2;
 if checkcontrole=1 then
 begin
  j3:='x';
  if rbtfolha.Checked=true then
   i3.picture.LoadFromFile('imagens/x/3.png');
  if rbtlousa.Checked=true then
   i3.picture.LoadFromFile('imagens/lousa/x/3.png');
  if rbtraio.checked=true then
   i3.picture.LoadFromFile('imagens/raio/x.png');
  if rbtasia.Checked=true then
   i3.picture.LoadFromFile('imagens/asia/x.png');
  if rbtvampi.Checked=true then
   i3.picture.LoadFromFile('imagens/vampi/x.png');
  if rbtsombrio.Checked=true then
   i3.picture.LoadFromFile('imagens/sombrio/x.png');
 end
 else
 begin
  j3:='o';
  if rbtfolha.Checked=true then
   i3.picture.LoadFromFile('imagens/o/3.png');
  if rbtlousa.Checked=true then
   i3.picture.LoadFromFile('imagens/lousa/o/3.png');
  if rbtraio.checked=true then
   i3.picture.LoadFromFile('imagens/raio/o.png');
  if rbtasia.Checked=true then
   i3.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampi.Checked=true then
   i3.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtsombrio.Checked=true then
   i3.picture.LoadFromFile('imagens/sombrio/o.png');
 end;
 btnverificar.click;
end;
end;

procedure TForm3.i4Click(Sender: TObject);
begin
if j4='n' then
begin
 controle:=controle+1;
 checkcontrole:=controle mod 2;
 if checkcontrole=1 then
 begin
  j4:='x';
  if rbtfolha.Checked=true then
   i4.picture.LoadFromFile('imagens/x/4.png');
  if rbtlousa.Checked=true then
   i4.picture.LoadFromFile('imagens/lousa/x/4.png');
  if rbtraio.checked=true then
   i4.picture.LoadFromFile('imagens/raio/x.png');
  if rbtasia.Checked=true then
   i4.picture.LoadFromFile('imagens/asia/x.png');
  if rbtvampi.Checked=true then
   i4.picture.LoadFromFile('imagens/vampi/x.png');
  if rbtsombrio.Checked=true then
   i4.picture.LoadFromFile('imagens/sombrio/x.png');
 end
 else
 begin
  j4:='o';
  if rbtfolha.Checked=true then
   i4.picture.LoadFromFile('imagens/o/4.png');
  if rbtlousa.Checked=true then
   i4.picture.LoadFromFile('imagens/lousa/o/4.png');
  if rbtraio.checked=true then
   i4.picture.LoadFromFile('imagens/raio/o.png');
  if rbtasia.Checked=true then
   i4.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampi.Checked=true then
   i4.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtsombrio.Checked=true then
   i4.picture.LoadFromFile('imagens/sombrio/o.png');
 end;
 btnverificar.click;
end;
end;

procedure TForm3.i5Click(Sender: TObject);
begin
if j5='n' then
begin
 controle:=controle+1;
 checkcontrole:=controle mod 2;
 if checkcontrole=1 then
 begin
  j5:='x';
  if rbtfolha.Checked=true then
   i5.picture.LoadFromFile('imagens/x/5.png');
  if rbtlousa.Checked=true then
   i5.picture.LoadFromFile('imagens/lousa/x/5.png');
  if rbtraio.checked=true then
   i5.picture.LoadFromFile('imagens/raio/x.png');
  if rbtasia.Checked=true then
   i5.picture.LoadFromFile('imagens/asia/x.png');
  if rbtvampi.Checked=true then
   i5.picture.LoadFromFile('imagens/vampi/x.png');
  if rbtsombrio.Checked=true then
   i5.picture.LoadFromFile('imagens/sombrio/x.png');
 end
 else
 begin
  j5:='o';
  if rbtfolha.Checked=true then
   i5.picture.LoadFromFile('imagens/o/5.png');
  if rbtlousa.Checked=true then
   i5.picture.LoadFromFile('imagens/lousa/o/5.png');
  if rbtraio.checked=true then
   i5.picture.LoadFromFile('imagens/raio/o.png');
  if rbtasia.Checked=true then
   i5.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampi.Checked=true then
   i5.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtsombrio.Checked=true then
   i5.picture.LoadFromFile('imagens/sombrio/o.png');
 end;
 btnverificar.click;
end;
end;

procedure TForm3.i6Click(Sender: TObject);
begin
if j6='n' then
begin
 controle:=controle+1;
 checkcontrole:=controle mod 2;
 if checkcontrole=1 then
 begin
  j6:='x';
  if rbtfolha.Checked=true then
   i6.picture.LoadFromFile('imagens/x/6.png');
  if rbtlousa.Checked=true then
   i6.picture.LoadFromFile('imagens/lousa/x/6.png');
  if rbtraio.checked=true then
   i6.picture.LoadFromFile('imagens/raio/x.png');
  if rbtasia.Checked=true then
   i6.picture.LoadFromFile('imagens/asia/x.png');
  if rbtvampi.Checked=true then
   i6.picture.LoadFromFile('imagens/vampi/x.png');
  if rbtsombrio.Checked=true then
   i6.picture.LoadFromFile('imagens/sombrio/x.png');
 end
 else
 begin
  j6:='o';
  if rbtfolha.Checked=true then
   i6.picture.LoadFromFile('imagens/o/6.png');
  if rbtlousa.Checked=true then
   i6.picture.LoadFromFile('imagens/lousa/o/6.png');
  if rbtraio.checked=true then
   i6.picture.LoadFromFile('imagens/raio/o.png');
  if rbtasia.Checked=true then
   i6.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampi.Checked=true then
   i6.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtsombrio.Checked=true then
   i6.picture.LoadFromFile('imagens/sombrio/o.png');
 end;
 btnverificar.click;
end;
end;

procedure TForm3.i7Click(Sender: TObject);
begin
if j7='n' then
begin
 controle:=controle+1;
 checkcontrole:=controle mod 2;
 if checkcontrole=1 then
 begin
  j7:='x';
  if rbtfolha.Checked=true then
   i7.picture.LoadFromFile('imagens/x/7.png');
  if rbtlousa.Checked=true then
   i7.picture.LoadFromFile('imagens/lousa/x/7.png');
  if rbtraio.checked=true then
   i7.picture.LoadFromFile('imagens/raio/x.png');
  if rbtasia.Checked=true then
   i7.picture.LoadFromFile('imagens/asia/x.png');
  if rbtvampi.Checked=true then
   i7.picture.LoadFromFile('imagens/vampi/x.png');
  if rbtsombrio.Checked=true then
   i7.picture.LoadFromFile('imagens/sombrio/x.png');
 end
 else
 begin
  j7:='o';
  if rbtfolha.Checked=true then
   i7.picture.LoadFromFile('imagens/o/7.png');
  if rbtlousa.Checked=true then
   i7.picture.LoadFromFile('imagens/lousa/o/7.png');
  if rbtraio.checked=true then
   i7.picture.LoadFromFile('imagens/raio/o.png');
  if rbtasia.Checked=true then
   i7.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampi.Checked=true then
   i7.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtsombrio.Checked=true then
   i7.picture.LoadFromFile('imagens/sombrio/o.png');
 end;
 btnverificar.click;
end;
end;

procedure TForm3.i8Click(Sender: TObject);
begin
if j8='n' then
begin
 controle:=controle+1;
 checkcontrole:=controle mod 2;
 if checkcontrole=1 then
 begin
  j8:='x';
  if rbtfolha.Checked=true then
   i8.picture.LoadFromFile('imagens/x/8.png');
  if rbtlousa.Checked=true then
   i8.picture.LoadFromFile('imagens/lousa/x/8.png');
  if rbtraio.checked=true then
   i8.picture.LoadFromFile('imagens/raio/x.png');
  if rbtasia.Checked=true then
   i8.picture.LoadFromFile('imagens/asia/x.png');
  if rbtvampi.Checked=true then
   i8.picture.LoadFromFile('imagens/vampi/x.png');
  if rbtsombrio.Checked=true then
   i8.picture.LoadFromFile('imagens/sombrio/x.png');
 end
 else
 begin
  j8:='o';
  if rbtfolha.Checked=true then
   i8.picture.LoadFromFile('imagens/o/8.png');
  if rbtlousa.Checked=true then
   i8.picture.LoadFromFile('imagens/lousa/o/8.png');
  if rbtraio.checked=true then
   i8.picture.LoadFromFile('imagens/raio/o.png');
  if rbtasia.Checked=true then
   i8.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampi.Checked=true then
   i8.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtsombrio.Checked=true then
   i8.picture.LoadFromFile('imagens/sombrio/o.png');
 end;
 btnverificar.click;
end;
end;

procedure TForm3.i9Click(Sender: TObject);
begin
if j9='n' then
begin
 controle:=controle+1;
 checkcontrole:=controle mod 2;
 if checkcontrole=1 then
 begin
  j9:='x';
  if rbtfolha.Checked=true then
   i9.picture.LoadFromFile('imagens/x/9.png');
  if rbtlousa.Checked=true then
   i9.picture.LoadFromFile('imagens/lousa/x/9.png');
  if rbtraio.checked=true then
   i9.picture.LoadFromFile('imagens/raio/x.png');
  if rbtasia.Checked=true then
   i9.picture.LoadFromFile('imagens/asia/x.png');
  if rbtvampi.Checked=true then
   i9.picture.LoadFromFile('imagens/vampi/x.png');
  if rbtsombrio.Checked=true then
   i9.picture.LoadFromFile('imagens/sombrio/x.png');
 end
 else
 begin
  j9:='o'; 
  if rbtfolha.Checked=true then
   i9.picture.LoadFromFile('imagens/o/9.png');
  if rbtlousa.Checked=true then
   i9.picture.LoadFromFile('imagens/lousa/o/9.png');
  if rbtraio.checked=true then
   i9.picture.LoadFromFile('imagens/raio/o.png');
  if rbtasia.Checked=true then
   i9.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampi.Checked=true then
   i9.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtsombrio.Checked=true then
   i9.picture.LoadFromFile('imagens/sombrio/o.png');
 end;
 btnverificar.click;
end;
end;

procedure TForm3.Instrues1Click(Sender: TObject);
begin
btninstrucoes.click;
end;

procedure TForm3.NovoJogo1Click(Sender: TObject);
begin
btnnovo.click;
end;

procedure TForm3.NovosJogadores1Click(Sender: TObject);
begin
btnnovojogs.Click;
end;

procedure TForm3.rbtasiaClick(Sender: TObject);
begin
image1.picture.loadfromfile('imagens/fundo/asia.jpg');
if j1='x' then
i1.picture.loadfromfile('imagens/asia/x.png');
if j2='x' then
i2.picture.loadfromfile('imagens/asia/x.png');
if j3='x' then
i3.picture.loadfromfile('imagens/asia/x.png');
if j4='x' then
i4.picture.loadfromfile('imagens/asia/x.png');
if j5='x' then
i5.picture.loadfromfile('imagens/asia/x.png');
if j6='x' then
i6.picture.loadfromfile('imagens/asia/x.png');
if j7='x' then
i7.picture.loadfromfile('imagens/asia/x.png');
if j8='x' then
i8.picture.loadfromfile('imagens/asia/x.png');
if j9='x' then
i9.picture.loadfromfile('imagens/asia/x.png');
if j1='o' then
i1.picture.loadfromfile('imagens/asia/o.png');
if j2='o' then
i2.picture.loadfromfile('imagens/asia/o.png');
if j3='o' then
i3.picture.loadfromfile('imagens/asia/o.png');
if j4='o' then
i4.picture.loadfromfile('imagens/asia/o.png');
if j5='o' then
i5.picture.loadfromfile('imagens/asia/o.png');
if j6='o' then
i6.picture.loadfromfile('imagens/asia/o.png');
if j7='o' then
i7.picture.loadfromfile('imagens/asia/o.png');
if j8='o' then
i8.picture.loadfromfile('imagens/asia/o.png');
if j9='o' then
i9.picture.loadfromfile('imagens/asia/o.png');
end;

procedure TForm3.rbtfolhaClick(Sender: TObject);
begin
image1.picture.loadfromfile('imagens/fundo/jogo-da-velha.jpg');
if j1='x' then
i1.picture.loadfromfile('imagens/x/1.png');
if j2='x' then
i2.picture.loadfromfile('imagens/x/2.png');
if j3='x' then
i3.picture.loadfromfile('imagens/x/3.png');
if j4='x' then
i4.picture.loadfromfile('imagens/x/4.png');
if j5='x' then
i5.picture.loadfromfile('imagens/x/5.png');
if j6='x' then
i6.picture.loadfromfile('imagens/x/6.png');
if j7='x' then
i7.picture.loadfromfile('imagens/x/7.png');
if j8='x' then
i8.picture.loadfromfile('imagens/x/8.png');
if j9='x' then
i9.picture.loadfromfile('imagens/x/9.png');
if j1='o' then
i1.picture.loadfromfile('imagens/o/1.png');
if j2='o' then
i2.picture.loadfromfile('imagens/o/2.png');
if j3='o' then
i3.picture.loadfromfile('imagens/o/3.png');
if j4='o' then
i4.picture.loadfromfile('imagens/o/4.png');
if j5='o' then
i5.picture.loadfromfile('imagens/o/5.png');
if j6='o' then
i6.picture.loadfromfile('imagens/o/6.png');
if j7='o' then
i7.picture.loadfromfile('imagens/o/7.png');
if j8='o' then
i8.picture.loadfromfile('imagens/o/8.png');
if j9='o' then
i9.picture.loadfromfile('imagens/o/9.png');
end;

procedure TForm3.rbtlousaClick(Sender: TObject);
begin
image1.picture.loadfromfile('imagens/fundo/lousa.jpg');
if j1='x' then
i1.picture.loadfromfile('imagens/lousa/x/1.png');
if j2='x' then
i2.picture.loadfromfile('imagens/lousa/x/2.png');
if j3='x' then
i3.picture.loadfromfile('imagens/lousa/x/3.png');
if j4='x' then
i4.picture.loadfromfile('imagens/lousa/x/4.png');
if j5='x' then
i5.picture.loadfromfile('imagens/lousa/x/5.png');
if j6='x' then
i6.picture.loadfromfile('imagens/lousa/x/6.png');
if j7='x' then
i7.picture.loadfromfile('imagens/lousa/x/7.png');
if j8='x' then
i8.picture.loadfromfile('imagens/lousa/x/8.png');
if j9='x' then
i9.picture.loadfromfile('imagens/lousa/x/9.png');
if j1='o' then
i1.picture.loadfromfile('imagens/lousa/o/1.png');
if j2='o' then
i2.picture.loadfromfile('imagens/lousa/o/2.png');
if j3='o' then
i3.picture.loadfromfile('imagens/lousa/o/3.png');
if j4='o' then
i4.picture.loadfromfile('imagens/lousa/o/4.png');
if j5='o' then
i5.picture.loadfromfile('imagens/lousa/o/5.png');
if j6='o' then
i6.picture.loadfromfile('imagens/lousa/o/6.png');
if j7='o' then
i7.picture.loadfromfile('imagens/lousa/o/7.png');
if j8='o' then
i8.picture.loadfromfile('imagens/lousa/o/8.png');
if j9='o' then
i9.picture.loadfromfile('imagens/lousa/o/9.png');
end;

procedure TForm3.rbtraioClick(Sender: TObject);
begin
image1.picture.loadfromfile('imagens/fundo/raio.jpg');
if j1='x' then
i1.picture.loadfromfile('imagens/raio/x.png');
if j2='x' then
i2.picture.loadfromfile('imagens/raio/x.png');
if j3='x' then
i3.picture.loadfromfile('imagens/raio/x.png');
if j4='x' then
i4.picture.loadfromfile('imagens/raio/x.png');
if j5='x' then
i5.picture.loadfromfile('imagens/raio/x.png');
if j6='x' then
i6.picture.loadfromfile('imagens/raio/x.png');
if j7='x' then
i7.picture.loadfromfile('imagens/raio/x.png');
if j8='x' then
i8.picture.loadfromfile('imagens/raio/x.png');
if j9='x' then
i9.picture.loadfromfile('imagens/raio/x.png');
if j1='o' then
i1.picture.loadfromfile('imagens/raio/o.png');
if j2='o' then
i2.picture.loadfromfile('imagens/raio/o.png');
if j3='o' then
i3.picture.loadfromfile('imagens/raio/o.png');
if j4='o' then
i4.picture.loadfromfile('imagens/raio/o.png');
if j5='o' then
i5.picture.loadfromfile('imagens/raio/o.png');
if j6='o' then
i6.picture.loadfromfile('imagens/raio/o.png');
if j7='o' then
i7.picture.loadfromfile('imagens/raio/o.png');
if j8='o' then
i8.picture.loadfromfile('imagens/raio/o.png');
if j9='o' then
i9.picture.loadfromfile('imagens/raio/o.png');  
end;

procedure TForm3.rbtsombrioClick(Sender: TObject);
begin
image1.picture.loadfromfile('imagens/fundo/sombrio.jpg');
if j1='x' then
i1.picture.loadfromfile('imagens/sombrio/x.png');
if j2='x' then
i2.picture.loadfromfile('imagens/sombrio/x.png');
if j3='x' then
i3.picture.loadfromfile('imagens/sombrio/x.png');
if j4='x' then
i4.picture.loadfromfile('imagens/sombrio/x.png');
if j5='x' then
i5.picture.loadfromfile('imagens/sombrio/x.png');
if j6='x' then
i6.picture.loadfromfile('imagens/sombrio/x.png');
if j7='x' then
i7.picture.loadfromfile('imagens/sombrio/x.png');
if j8='x' then
i8.picture.loadfromfile('imagens/sombrio/x.png');
if j9='x' then
i9.picture.loadfromfile('imagens/sombrio/x.png');
if j1='o' then
i1.picture.loadfromfile('imagens/sombrio/o.png');
if j2='o' then
i2.picture.loadfromfile('imagens/sombrio/o.png');
if j3='o' then
i3.picture.loadfromfile('imagens/sombrio/o.png');
if j4='o' then
i4.picture.loadfromfile('imagens/sombrio/o.png');
if j5='o' then
i5.picture.loadfromfile('imagens/sombrio/o.png');
if j6='o' then
i6.picture.loadfromfile('imagens/sombrio/o.png');
if j7='o' then
i7.picture.loadfromfile('imagens/sombrio/o.png');
if j8='o' then
i8.picture.loadfromfile('imagens/sombrio/o.png');
if j9='o' then
i9.picture.loadfromfile('imagens/sombrio/o.png');
end;

procedure TForm3.rbtvampiClick(Sender: TObject);
begin
image1.picture.loadfromfile('imagens/fundo/vampi.jpg');
if j1='x' then
i1.picture.loadfromfile('imagens/vampi/x.png');
if j2='x' then
i2.picture.loadfromfile('imagens/vampi/x.png');
if j3='x' then
i3.picture.loadfromfile('imagens/vampi/x.png');
if j4='x' then
i4.picture.loadfromfile('imagens/vampi/x.png');
if j5='x' then
i5.picture.loadfromfile('imagens/vampi/x.png');
if j6='x' then
i6.picture.loadfromfile('imagens/vampi/x.png');
if j7='x' then
i7.picture.loadfromfile('imagens/vampi/x.png');
if j8='x' then
i8.picture.loadfromfile('imagens/vampi/x.png');
if j9='x' then
i9.picture.loadfromfile('imagens/vampi/x.png');
if j1='o' then
i1.picture.loadfromfile('imagens/vampi/o.png');
if j2='o' then
i2.picture.loadfromfile('imagens/vampi/o.png');
if j3='o' then
i3.picture.loadfromfile('imagens/vampi/o.png');
if j4='o' then
i4.picture.loadfromfile('imagens/vampi/o.png');
if j5='o' then
i5.picture.loadfromfile('imagens/vampi/o.png');
if j6='o' then
i6.picture.loadfromfile('imagens/vampi/o.png');
if j7='o' then
i7.picture.loadfromfile('imagens/vampi/o.png');
if j8='o' then
i8.picture.loadfromfile('imagens/vampi/o.png');
if j9='o' then
i9.picture.loadfromfile('imagens/vampi/o.png');
end;

procedure TForm3.Sair1Click(Sender: TObject);
begin
application.terminate;
end;

procedure TForm3.SinglePlayer1Click(Sender: TObject);
begin
btnsingle.click;
end;

procedure TForm3.Sobre1Click(Sender: TObject);
begin
btnsobre.click;
end;

procedure TForm3.ZerarPlacar1Click(Sender: TObject);
begin
btnzerar.click;
end;

end.
