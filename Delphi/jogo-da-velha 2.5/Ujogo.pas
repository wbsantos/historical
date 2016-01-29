unit Ujogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls,Menus, StdCtrls, JvExExtCtrls, JvSpecialImage, JvGIF,
  GIFImg,pngimage, JvMenus;

type
  TForm1 = class(TForm)
    Image1: TImage;
    i1: TImage;
    i2: TImage;
    i3: TImage;
    i4: TImage;
    i5: TImage;
    i6: TImage;
    i7: TImage;
    i8: TImage;
    i9: TImage;
    btnnovo: TButton;
    btnjogar: TButton;
    btnverificar: TButton;
    GroupBox1: TGroupBox;
    lbljogador: TLabel;
    lblcomputador: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblvelha: TLabel;
    Label3: TLabel;
    btnnovojog: TButton;
    btnzerar: TButton;
    btnjogar2: TButton;
    GroupBox2: TGroupBox;
    rbtfacil: TRadioButton;
    rbtnormal: TRadioButton;
    btnjogar3: TButton;
    rbtimpossivel: TRadioButton;
    invenciveis: TGroupBox;
    rbtninja: TRadioButton;
    rbtvampiro: TRadioButton;
    rbtlobisomem: TRadioButton;
    perso: TImage;
    btnjogar4: TButton;
    btnplacar: TButton;
    fala: TImage;
    btnmulti: TButton;
    btninstrucoes: TButton;
    btnsobre: TButton;
    JvPopupMenu1: TJvPopupMenu;
    NovoJogo1: TMenuItem;
    NovoJogador1: TMenuItem;
    ZerarPlacar1: TMenuItem;
    PlacarGeral1: TMenuItem;
    Multiplayer1: TMenuItem;
    Instrues1: TMenuItem;
    Sobre1: TMenuItem;
    Sair1: TMenuItem;
    procedure i1Click(Sender: TObject);
    procedure i2Click(Sender: TObject);
    procedure i3Click(Sender: TObject);
    procedure i4Click(Sender: TObject);
    procedure i5Click(Sender: TObject);
    procedure i6Click(Sender: TObject);
    procedure i7Click(Sender: TObject);
    procedure i8Click(Sender: TObject);
    procedure i9Click(Sender: TObject);
    procedure btnverificarClick(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnjogarClick(Sender: TObject);
    procedure btnnovojogClick(Sender: TObject);
    procedure btnzerarClick(Sender: TObject);
    procedure btnjogar2Click(Sender: TObject);
    procedure rbtnormalClick(Sender: TObject);
    procedure rbtfacilClick(Sender: TObject);
    procedure rbtimpossivelClick(Sender: TObject);
    procedure btnjogar3Click(Sender: TObject);
    procedure rbtninjaClick(Sender: TObject);
    procedure rbtvampiroClick(Sender: TObject);
    procedure rbtlobisomemClick(Sender: TObject);
    procedure btnjogar4Click(Sender: TObject);
    procedure btnplacarClick(Sender: TObject);
    procedure btnmultiClick(Sender: TObject);
    procedure btninstrucoesClick(Sender: TObject);
    procedure btnsobreClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NovoJogo1Click(Sender: TObject);
    procedure NovoJogador1Click(Sender: TObject);
    procedure ZerarPlacar1Click(Sender: TObject);
    procedure PlacarGeral1Click(Sender: TObject);
    procedure Multiplayer1Click(Sender: TObject);
    procedure Instrues1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);

     private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  j1,j2,j3,j4,j5,j6,j7,j8,j9:char;
  x,v,c,va,cv,vp,vd,vn,vv,vl,da,dd,dp,dv,dn,dl,controlimpos,inv:byte;
  jogador,vez,empate:integer;
  nome:string;


implementation

uses Uplacar, Umulti, Uinstru, sobre, Usplash;


{$R *.dfm}


procedure TForm1.btninstrucoesClick(Sender: TObject);
begin
form4:=tform4.create(application);
form4.show;
end;

procedure TForm1.btnjogar2Click(Sender: TObject);
var
ra:byte;
begin
ra:=0;
//condições para vitória
if (j1='o')and (j2='o')and(j3='n') then
 begin
    if rbtfacil.Checked=true then
     i3.picture.LoadFromFile('imagens/o/3.png');
    if rbtnormal.Checked=true then
     i3.picture.LoadFromFile('imagens/lousa/o/3.png');
    if rbtimpossivel.checked=true then
     i3.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i3.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i3.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i3.picture.LoadFromFile('imagens/sombrio/o.png');
    j3:='o';
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j1='o')and(j2='n')and(j3='o') then
   begin
    if rbtfacil.Checked=true then
     i2.picture.LoadFromFile('imagens/o/2.png');
    if rbtnormal.Checked=true then
     i2.picture.LoadFromFile('imagens/lousa/o/2.png');
    if rbtimpossivel.checked=true then
     i2.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i2.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i2.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i2.picture.LoadFromFile('imagens/sombrio/o.png');
     j2:='o';
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j1='n')and(j2='o')and(j3='o') then
      begin
        j1:='o';
        if rbtfacil.Checked=true then
         i1.picture.LoadFromFile('imagens/o/1.png');
        if rbtnormal.Checked=true then
         i1.picture.LoadFromFile('imagens/lousa/o/1.png');
        if rbtimpossivel.checked=true then
         i1.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i1.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i1.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i1.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
//separação 1
if ra=0 then
begin
if (j4='o')and (j5='o')and(j6='n') then
 begin
    j6:='o';
    if rbtfacil.Checked=true then
     i6.picture.LoadFromFile('imagens/o/6.png');
    if rbtnormal.Checked=true then
     i6.picture.LoadFromFile('imagens/lousa/o/6.png');
    if rbtimpossivel.checked=true then
     i6.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i6.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i6.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i6.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j4='o')and(j5='n')and(j6='o') then
   begin
     j5:='o';
    if rbtfacil.Checked=true then
     i5.picture.LoadFromFile('imagens/o/5.png');
    if rbtnormal.Checked=true then
     i5.picture.LoadFromFile('imagens/lousa/o/5.png');
    if rbtimpossivel.checked=true then
     i5.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i5.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i5.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i5.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j4='n')and(j5='o')and(j6='o') then
      begin
        j4:='o';
       if rbtfacil.Checked=true then
     i4.picture.LoadFromFile('imagens/o/4.png');
    if rbtnormal.Checked=true then
     i4.picture.LoadFromFile('imagens/lousa/o/4.png');
    if rbtimpossivel.checked=true then
     i4.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i4.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i4.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i4.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//separação 2
if ra=0 then
begin
  if (j7='o')and (j8='o')and(j9='n') then
 begin
    j9:='o';
    if rbtfacil.Checked=true then
     i9.picture.LoadFromFile('imagens/o/9.png');
    if rbtnormal.Checked=true then
     i9.picture.LoadFromFile('imagens/lousa/o/9.png');
    if rbtimpossivel.checked=true then
     i9.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i9.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i9.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i9.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j7='o')and(j8='n')and(j9='o') then
   begin
     j8:='o';
    if rbtfacil.Checked=true then
     i8.picture.LoadFromFile('imagens/o/8.png');
    if rbtnormal.Checked=true then
     i8.picture.LoadFromFile('imagens/lousa/o/8.png');
    if rbtimpossivel.checked=true then
     i8.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i8.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i8.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i8.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j7='n')and(j8='o')and(j9='o') then
      begin
        j7:='o';
        if rbtfacil.Checked=true then
         i7.picture.LoadFromFile('imagens/o/7.png');
        if rbtnormal.Checked=true then
         i7.picture.LoadFromFile('imagens/lousa/o/7.png');
        if rbtimpossivel.checked=true then
         i7.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i7.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i7.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i7.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//separação 3
if ra=0 then
begin
if (j1='o')and (j4='o')and(j7='n') then
 begin
    j7:='o';
    if rbtfacil.Checked=true then
     i7.picture.LoadFromFile('imagens/o/7.png');
    if rbtnormal.Checked=true then
     i7.picture.LoadFromFile('imagens/lousa/o/7.png');
    if rbtimpossivel.checked=true then
     i7.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i7.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i7.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i7.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j1='o')and(j4='n')and(j7='o') then
   begin
     j4:='o';
    if rbtfacil.Checked=true then
     i4.picture.LoadFromFile('imagens/o/4.png');
    if rbtnormal.Checked=true then
     i4.picture.LoadFromFile('imagens/lousa/o/4.png');
    if rbtimpossivel.checked=true then
     i4.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i4.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i4.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i4.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j1='n')and(j4='o')and(j7='o') then
      begin
        j1:='o';
        j1:='o';
        if rbtfacil.Checked=true then
         i1.picture.LoadFromFile('imagens/o/1.png');
        if rbtnormal.Checked=true then
         i1.picture.LoadFromFile('imagens/lousa/o/1.png');
        if rbtimpossivel.checked=true then
         i1.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i1.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i1.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i1.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//separação 4
if ra=0 then
begin
  if (j2='o')and (j5='o')and(j8='n') then
 begin
    j8:='o';
    if rbtfacil.Checked=true then
     i8.picture.LoadFromFile('imagens/o/8.png');
    if rbtnormal.Checked=true then
     i8.picture.LoadFromFile('imagens/lousa/o/8.png');
    if rbtimpossivel.checked=true then
     i8.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i8.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i8.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i8.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j2='o')and(j5='n')and(j8='o') then
   begin
     j5:='o';
    if rbtfacil.Checked=true then
     i5.picture.LoadFromFile('imagens/o/5.png');
    if rbtnormal.Checked=true then
     i5.picture.LoadFromFile('imagens/lousa/o/5.png');
    if rbtimpossivel.checked=true then
     i5.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i5.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i5.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i5.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j2='n')and(j5='o')and(j8='o') then
      begin
        j2:='o';
        if rbtfacil.Checked=true then
         i2.picture.LoadFromFile('imagens/o/2.png');
        if rbtnormal.Checked=true then
         i2.picture.LoadFromFile('imagens/lousa/o/2.png');
        if rbtimpossivel.checked=true then
         i2.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i2.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i2.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i2.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//separação 5
if ra=0 then
begin
  if (j3='o')and (j6='o')and(j9='n') then
 begin
    j9:='o';
    if rbtfacil.Checked=true then
     i9.picture.LoadFromFile('imagens/o/9.png');
    if rbtnormal.Checked=true then
     i9.picture.LoadFromFile('imagens/lousa/o/9.png');
    if rbtimpossivel.checked=true then
     i9.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i9.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i9.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i9.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j3='o')and(j6='n')and(j9='o') then
   begin
     j6:='o';
    if rbtfacil.Checked=true then
     i6.picture.LoadFromFile('imagens/o/6.png');
    if rbtnormal.Checked=true then
     i6.picture.LoadFromFile('imagens/lousa/o/6.png');
    if rbtimpossivel.checked=true then
     i6.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i6.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i6.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i6.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j3='n')and(j6='o')and(j9='o') then
      begin
        j3:='o';
        if rbtfacil.Checked=true then
         i3.picture.LoadFromFile('imagens/o/3.png');
        if rbtnormal.Checked=true then
         i3.picture.LoadFromFile('imagens/lousa/o/3.png');
        if rbtimpossivel.checked=true then
         i3.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i3.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i3.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i3.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//separação 6
if ra=0 then
begin
  if (j1='o')and (j5='o')and(j9='n') then
 begin
    j9:='o';
    if rbtfacil.Checked=true then
     i9.picture.LoadFromFile('imagens/o/9.png');
    if rbtnormal.Checked=true then
     i9.picture.LoadFromFile('imagens/lousa/o/9.png');
    if rbtimpossivel.checked=true then
     i9.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i9.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i9.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i9.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j1='o')and(j5='n')and(j9='o') then
   begin
     j5:='o';
    if rbtfacil.Checked=true then
     i5.picture.LoadFromFile('imagens/o/5.png');
    if rbtnormal.Checked=true then
     i5.picture.LoadFromFile('imagens/lousa/o/5.png');
    if rbtimpossivel.checked=true then
     i5.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i5.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i5.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i5.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j1='n')and(j5='o')and(j9='o') then
      begin
        j1:='o';
        j1:='o';
        if rbtfacil.Checked=true then
         i1.picture.LoadFromFile('imagens/o/1.png');
        if rbtnormal.Checked=true then
         i1.picture.LoadFromFile('imagens/lousa/o/1.png');
        if rbtimpossivel.checked=true then
         i1.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i1.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i1.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i1.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//separação 7
if ra=0 then
begin
  if (j3='o')and (j5='o')and(j7='n') then
 begin
    j7:='o';
    if rbtfacil.Checked=true then
     i7.picture.LoadFromFile('imagens/o/7.png');
    if rbtnormal.Checked=true then
     i7.picture.LoadFromFile('imagens/lousa/o/7.png');
    if rbtimpossivel.checked=true then
     i7.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i7.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i7.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i7.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j3='o')and(j5='n')and(j7='o') then
   begin
     j5:='o';
    if rbtfacil.Checked=true then
     i5.picture.LoadFromFile('imagens/o/5.png');
    if rbtnormal.Checked=true then
     i5.picture.LoadFromFile('imagens/lousa/o/5.png');
    if rbtimpossivel.checked=true then
     i5.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i5.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i5.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i5.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j3='n')and(j5='o')and(j7='o') then
      begin
        j3:='o';
        if rbtfacil.Checked=true then
         i3.picture.LoadFromFile('imagens/o/3.png');
        if rbtnormal.Checked=true then
         i3.picture.LoadFromFile('imagens/lousa/o/3.png');
        if rbtimpossivel.checked=true then
         i3.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i3.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i3.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i3.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//condições para derrota
if ra=0 then
begin
  if (j1='x')and (j2='x')and(j3='n') then
 begin
    j3:='o';
    if rbtfacil.Checked=true then
     i3.picture.LoadFromFile('imagens/o/3.png');
    if rbtnormal.Checked=true then
     i3.picture.LoadFromFile('imagens/lousa/o/3.png');
    if rbtimpossivel.checked=true then
     i3.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i3.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i3.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i3.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j1='x')and(j2='n')and(j3='x') then
   begin
     j2:='o';
    if rbtfacil.Checked=true then
     i2.picture.LoadFromFile('imagens/o/2.png');
    if rbtnormal.Checked=true then
     i2.picture.LoadFromFile('imagens/lousa/o/2.png');
    if rbtimpossivel.checked=true then
     i2.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i2.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i2.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i2.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j1='n')and(j2='x')and(j3='x') then
      begin
        j1:='o';
        j1:='o';
        if rbtfacil.Checked=true then
         i1.picture.LoadFromFile('imagens/o/1.png');
        if rbtnormal.Checked=true then
         i1.picture.LoadFromFile('imagens/lousa/o/1.png');
        if rbtimpossivel.checked=true then
         i1.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i1.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i1.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i1.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
//separação 1
if ra=0 then
begin
if (j4='x')and (j5='x')and(j6='n') then
 begin
    j6:='o';
    if rbtfacil.Checked=true then
     i6.picture.LoadFromFile('imagens/o/6.png');
    if rbtnormal.Checked=true then
     i6.picture.LoadFromFile('imagens/lousa/o/6.png');
    if rbtimpossivel.checked=true then
     i6.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i6.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i6.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i6.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j4='x')and(j5='n')and(j6='x') then
   begin
     j5:='o';
    if rbtfacil.Checked=true then
     i5.picture.LoadFromFile('imagens/o/5.png');
    if rbtnormal.Checked=true then
     i5.picture.LoadFromFile('imagens/lousa/o/5.png');
    if rbtimpossivel.checked=true then
     i5.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i5.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i5.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i5.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j4='n')and(j5='x')and(j6='x') then
      begin
        j4:='o';
        if rbtfacil.Checked=true then
         i4.picture.LoadFromFile('imagens/o/4.png');
        if rbtnormal.Checked=true then
         i4.picture.LoadFromFile('imagens/lousa/o/4.png');
        if rbtimpossivel.checked=true then
         i4.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i4.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i4.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i4.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//separação 2
if ra=0 then
begin
  if (j7='x')and (j8='x')and(j9='n') then
 begin
    j9:='o';
    if rbtfacil.Checked=true then
     i9.picture.LoadFromFile('imagens/o/9.png');
    if rbtnormal.Checked=true then
     i9.picture.LoadFromFile('imagens/lousa/o/9.png');
    if rbtimpossivel.checked=true then
     i9.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i9.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i9.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i9.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j7='x')and(j8='n')and(j9='x') then
   begin
     j8:='o';
    if rbtfacil.Checked=true then
     i8.picture.LoadFromFile('imagens/o/8.png');
    if rbtnormal.Checked=true then
     i8.picture.LoadFromFile('imagens/lousa/o/8.png');
    if rbtimpossivel.checked=true then
     i8.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i8.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i8.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i8.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j7='n')and(j8='x')and(j9='x') then
      begin
        j7:='o';
       if rbtfacil.Checked=true then
        i7.picture.LoadFromFile('imagens/o/7.png');
       if rbtnormal.Checked=true then
        i7.picture.LoadFromFile('imagens/lousa/o/7.png');
       if rbtimpossivel.checked=true then
        i7.picture.LoadFromFile('imagens/raio/o.png');
       if rbtninja.Checked=true then
        i7.picture.LoadFromFile('imagens/asia/o.png');
       if rbtvampiro.Checked=true then
        i7.picture.LoadFromFile('imagens/vampi/o.png');
       if rbtlobisomem.Checked=true then
        i7.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//separação 3
if ra=0 then
begin
if (j1='x')and (j4='x')and(j7='n') then
 begin
    j7:='o';
    if rbtfacil.Checked=true then
     i7.picture.LoadFromFile('imagens/o/7.png');
    if rbtnormal.Checked=true then
     i7.picture.LoadFromFile('imagens/lousa/o/7.png');
    if rbtimpossivel.checked=true then
     i7.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i7.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i7.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i7.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j1='x')and(j4='n')and(j7='x') then
   begin
     j4:='o';
    if rbtfacil.Checked=true then
     i4.picture.LoadFromFile('imagens/o/4.png');
    if rbtnormal.Checked=true then
     i4.picture.LoadFromFile('imagens/lousa/o/4.png');
    if rbtimpossivel.checked=true then
     i4.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i4.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i4.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i4.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j1='n')and(j4='x')and(j7='x') then
      begin
        j1:='o';
        j1:='o';
        if rbtfacil.Checked=true then
         i1.picture.LoadFromFile('imagens/o/1.png');
        if rbtnormal.Checked=true then
         i1.picture.LoadFromFile('imagens/lousa/o/1.png');
        if rbtimpossivel.checked=true then
         i1.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i1.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i1.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i1.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//separação 4
if ra=0 then
begin
  if (j2='x')and (j5='x')and(j8='n') then
 begin
    j8:='o';
    if rbtfacil.Checked=true then
     i8.picture.LoadFromFile('imagens/o/8.png');
    if rbtnormal.Checked=true then
     i8.picture.LoadFromFile('imagens/lousa/o/8.png');
    if rbtimpossivel.checked=true then
     i8.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i8.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i8.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i8.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j2='x')and(j5='n')and(j8='x') then
   begin
     j5:='o';
    if rbtfacil.Checked=true then
     i5.picture.LoadFromFile('imagens/o/5.png');
    if rbtnormal.Checked=true then
     i5.picture.LoadFromFile('imagens/lousa/o/5.png');
    if rbtimpossivel.checked=true then
     i5.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i5.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i5.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i5.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j2='n')and(j5='x')and(j8='x') then
      begin
        j2:='o';
        if rbtfacil.Checked=true then
         i2.picture.LoadFromFile('imagens/o/2.png');
        if rbtnormal.Checked=true then
         i2.picture.LoadFromFile('imagens/lousa/o/2.png');
        if rbtimpossivel.checked=true then
         i2.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i2.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i2.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i2.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//separação 5
if ra=0 then
begin
  if (j3='x')and (j6='x')and(j9='n') then
 begin
    j9:='o';
    if rbtfacil.Checked=true then
     i9.picture.LoadFromFile('imagens/o/9.png');
    if rbtnormal.Checked=true then
     i9.picture.LoadFromFile('imagens/lousa/o/9.png');
    if rbtimpossivel.checked=true then
     i9.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i9.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i9.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i9.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j3='x')and(j6='n')and(j9='x') then
   begin
     j6:='o';
    if rbtfacil.Checked=true then
     i6.picture.LoadFromFile('imagens/o/6.png');
    if rbtnormal.Checked=true then
     i6.picture.LoadFromFile('imagens/lousa/o/6.png');
    if rbtimpossivel.checked=true then
     i6.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i6.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i6.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i6.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j3='n')and(j6='x')and(j9='x') then
      begin
        j3:='o';
        if rbtfacil.Checked=true then
         i3.picture.LoadFromFile('imagens/o/3.png');
        if rbtnormal.Checked=true then
         i3.picture.LoadFromFile('imagens/lousa/o/3.png');
        if rbtimpossivel.checked=true then
         i3.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i3.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i3.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i3.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//separação 6
if ra=0 then
begin
  if (j1='x')and (j5='x')and(j9='n') then
 begin
    j9:='o';
    if rbtfacil.Checked=true then
     i9.picture.LoadFromFile('imagens/o/9.png');
    if rbtnormal.Checked=true then
     i9.picture.LoadFromFile('imagens/lousa/o/9.png');
    if rbtimpossivel.checked=true then
     i9.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i9.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i9.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i9.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j1='x')and(j5='n')and(j9='x') then
   begin
     j5:='o';
    if rbtfacil.Checked=true then
     i5.picture.LoadFromFile('imagens/o/5.png');
    if rbtnormal.Checked=true then
     i5.picture.LoadFromFile('imagens/lousa/o/5.png');
    if rbtimpossivel.checked=true then
     i5.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i5.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i5.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i5.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j1='n')and(j5='x')and(j9='x') then
      begin
        j1:='o';
        j1:='o';
        if rbtfacil.Checked=true then
         i1.picture.LoadFromFile('imagens/o/1.png');
        if rbtnormal.Checked=true then
         i1.picture.LoadFromFile('imagens/lousa/o/1.png');
        if rbtimpossivel.checked=true then
         i1.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i1.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i1.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i1.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
//separação 7
if ra=0 then
begin
  if (j3='x')and (j5='x')and(j7='n') then
 begin
    j7:='o';
    if rbtfacil.Checked=true then
     i7.picture.LoadFromFile('imagens/o/7.png');
    if rbtnormal.Checked=true then
     i7.picture.LoadFromFile('imagens/lousa/o/7.png');
    if rbtimpossivel.checked=true then
     i7.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i7.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i7.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i7.picture.LoadFromFile('imagens/sombrio/o.png');
    btnverificar.click;
    ra:=1;
 end
else
 begin
   if (j3='x')and(j5='n')and(j7='x') then
   begin
     j5:='o';
    if rbtfacil.Checked=true then
     i5.picture.LoadFromFile('imagens/o/5.png');
    if rbtnormal.Checked=true then
     i5.picture.LoadFromFile('imagens/lousa/o/5.png');
    if rbtimpossivel.checked=true then
     i5.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i5.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i5.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i5.picture.LoadFromFile('imagens/sombrio/o.png');
     btnverificar.click;
     ra:=1;
   end
   else
   begin
     if (j3='n')and(j5='x')and(j7='x') then
      begin
        j3:='o';
        if rbtfacil.Checked=true then
         i3.picture.LoadFromFile('imagens/o/3.png');
        if rbtnormal.Checked=true then
         i3.picture.LoadFromFile('imagens/lousa/o/3.png');
        if rbtimpossivel.checked=true then
         i3.picture.LoadFromFile('imagens/raio/o.png');
        if rbtninja.Checked=true then
         i3.picture.LoadFromFile('imagens/asia/o.png');
        if rbtvampiro.Checked=true then
         i3.picture.LoadFromFile('imagens/vampi/o.png');
        if rbtlobisomem.Checked=true then
         i3.picture.LoadFromFile('imagens/sombrio/o.png');
        btnverificar.Click;
        ra:=1;
      end;
   end;
 end;
end;
end;
if ra=0 then
btnjogar.click;

end;

procedure TForm1.btnjogar3Click(Sender: TObject);
var ra:byte;
begin
 ra:=0;
if (j1='n')and (j2='n')and (j3='n')and (j4='n')and (j5='n')and (j6='n')and (j7='n')and (j8='n')and (j9='n') then
begin
  if rbtfacil.Checked=true then
   i5.picture.LoadFromFile('imagens/o/5.png');
  if rbtnormal.Checked=true then
   i5.picture.LoadFromFile('imagens/lousa/o/5.png');
  if rbtimpossivel.checked=true then
   i5.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i5.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i5.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i5.picture.LoadFromFile('imagens/sombrio/o.png');
  j5:='o';
  btnverificar.click;
  ra:=1;
end;
if (j1='x')and (j2='n')and (j3='n')and (j4='n')and (j5='n')and (j6='n')and (j7='n')and (j8='n')and (j9='n') then
begin
  if rbtfacil.Checked=true then
   i5.picture.LoadFromFile('imagens/o/5.png');
  if rbtnormal.Checked=true then
   i5.picture.LoadFromFile('imagens/lousa/o/5.png');
  if rbtimpossivel.checked=true then
   i5.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i5.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i5.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i5.picture.LoadFromFile('imagens/sombrio/o.png');
  j5:='o';
  btnverificar.click;
  ra:=1;
end;
if (j1='n')and (j2='n')and (j3='x')and (j4='n')and (j5='n')and (j6='n')and (j7='n')and (j8='n')and (j9='n') then
begin
  if rbtfacil.Checked=true then
   i5.picture.LoadFromFile('imagens/o/5.png');
  if rbtnormal.Checked=true then
   i5.picture.LoadFromFile('imagens/lousa/o/5.png');
  if rbtimpossivel.checked=true then
   i5.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i5.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i5.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i5.picture.LoadFromFile('imagens/sombrio/o.png');
  j5:='o';
  btnverificar.click;
  ra:=1;
end;
if (j1='n')and (j2='n')and (j3='n')and (j4='n')and (j5='n')and (j6='n')and (j7='x')and (j8='n')and (j9='n') then
begin
  if rbtfacil.Checked=true then
   i5.picture.LoadFromFile('imagens/o/5.png');
  if rbtnormal.Checked=true then
   i5.picture.LoadFromFile('imagens/lousa/o/5.png');
  if rbtimpossivel.checked=true then
   i5.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i5.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i5.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i5.picture.LoadFromFile('imagens/sombrio/o.png');
  j5:='o';
  btnverificar.click;
  ra:=1;
end;
if (j1='n')and (j2='n')and (j3='n')and (j4='n')and (j5='n')and (j6='n')and (j7='n')and (j8='n')and (j9='x') then
begin
  if rbtfacil.Checked=true then
   i5.picture.LoadFromFile('imagens/o/5.png');
  if rbtnormal.Checked=true then
   i5.picture.LoadFromFile('imagens/lousa/o/5.png');
  if rbtimpossivel.checked=true then
   i5.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i5.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i5.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i5.picture.LoadFromFile('imagens/sombrio/o.png');
  j5:='o';
  btnverificar.click;
  ra:=1;
end;
if (j1='x')and (j2='n')and (j3='n')and (j4='n')and (j5='o')and (j6='x')and (j7='n')and (j8='n')and (j9='n') then
begin
  x:=random(2);
  ra:=1;
  if x=1 then
  begin
   if rbtfacil.Checked=true then
    i8.picture.LoadFromFile('imagens/o/8.png');
   if rbtnormal.Checked=true then
    i8.picture.LoadFromFile('imagens/lousa/o/8.png');
   if rbtimpossivel.checked=true then
    i8.picture.LoadFromFile('imagens/raio/o.png');
   if rbtninja.Checked=true then
    i8.picture.LoadFromFile('imagens/asia/o.png');
   if rbtvampiro.Checked=true then
    i8.picture.LoadFromFile('imagens/vampi/o.png');
   if rbtlobisomem.Checked=true then
    i8.picture.LoadFromFile('imagens/sombrio/o.png');
   j8:='o';
   btnverificar.click;
  end
  else
  begin
   if rbtfacil.Checked=true then
    i2.picture.LoadFromFile('imagens/o/2.png');
   if rbtnormal.Checked=true then
    i2.picture.LoadFromFile('imagens/lousa/o/2.png');
   if rbtimpossivel.checked=true then
    i2.picture.LoadFromFile('imagens/raio/o.png');
   if rbtninja.Checked=true then
    i2.picture.LoadFromFile('imagens/asia/o.png');
   if rbtvampiro.Checked=true then
    i2.picture.LoadFromFile('imagens/vampi/o.png');
   if rbtlobisomem.Checked=true then
    i2.picture.LoadFromFile('imagens/sombrio/o.png');
   j2:='o';
   btnverificar.click;
  end;
end;
if (j1='x')and (j2='n')and (j3='n')and (j4='n')and (j5='o')and (j6='n')and (j7='n')and (j8='n')and (j9='x') then
begin
  ra:=1;
  x:=random(2);
  if x=1 then
  begin
  if rbtfacil.Checked=true then
   i8.picture.LoadFromFile('imagens/o/8.png');
  if rbtnormal.Checked=true then
   i8.picture.LoadFromFile('imagens/lousa/o/8.png');
  if rbtimpossivel.checked=true then
   i8.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i8.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i8.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i8.picture.LoadFromFile('imagens/sombrio/o.png');
   j8:='o';
   btnverificar.click;
  end
  else
  begin
  if rbtfacil.Checked=true then
   i2.picture.LoadFromFile('imagens/o/2.png');
  if rbtnormal.Checked=true then
   i2.picture.LoadFromFile('imagens/lousa/o/2.png');
  if rbtimpossivel.checked=true then
   i2.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i2.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i2.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i2.picture.LoadFromFile('imagens/sombrio/o.png');
   j2:='o';
   btnverificar.click;
  end;
end;
if (j1='n')and (j2='n')and (j3='x')and (j4='n')and (j5='o')and (j6='n')and (j7='x')and (j8='n')and (j9='n') then
begin
  ra:=1;
  x:=random(2);
  if x=1 then
  begin
  if rbtfacil.Checked=true then
   i8.picture.LoadFromFile('imagens/o/8.png');
  if rbtnormal.Checked=true then
   i8.picture.LoadFromFile('imagens/lousa/o/8.png');
  if rbtimpossivel.checked=true then
   i8.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i8.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i8.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i8.picture.LoadFromFile('imagens/sombrio/o.png');
   j8:='o';
   btnverificar.click;
  end
  else
  begin
  if rbtfacil.Checked=true then
   i2.picture.LoadFromFile('imagens/o/2.png');
  if rbtnormal.Checked=true then
   i2.picture.LoadFromFile('imagens/lousa/o/2.png');
  if rbtimpossivel.checked=true then
   i2.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i2.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i2.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i2.picture.LoadFromFile('imagens/sombrio/o.png');
   j2:='o';
   btnverificar.click;
  end;
end;
if (j1='n')and (j2='n')and (j3='x')and (j4='x')and (j5='o')and (j6='n')and (j7='n')and (j8='n')and (j9='n') then
begin
  ra:=1;
  x:=random(2);
  if x=1 then
  begin
  if rbtfacil.Checked=true then
   i8.picture.LoadFromFile('imagens/o/8.png');
  if rbtnormal.Checked=true then
   i8.picture.LoadFromFile('imagens/lousa/o/8.png');
  if rbtimpossivel.checked=true then
   i8.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i8.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i8.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i8.picture.LoadFromFile('imagens/sombrio/o.png');
   j8:='o';
   btnverificar.click;
  end
  else
  begin
  if rbtfacil.Checked=true then
   i2.picture.LoadFromFile('imagens/o/2.png');
  if rbtnormal.Checked=true then
   i2.picture.LoadFromFile('imagens/lousa/o/2.png');
  if rbtimpossivel.checked=true then
   i2.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i2.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i2.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i2.picture.LoadFromFile('imagens/sombrio/o.png');
   j2:='o';
   btnverificar.click;
  end;
end;
if (j1='n')and (j2='n')and (j3='x')and (j4='n')and (j5='o')and (j6='n')and (j7='x')and (j8='n')and (j9='n') then
begin
  ra:=1;
  x:=random(2);
  if x=1 then
  begin
  if rbtfacil.Checked=true then
   i8.picture.LoadFromFile('imagens/o/8.png');
  if rbtnormal.Checked=true then
   i8.picture.LoadFromFile('imagens/lousa/o/8.png');
  if rbtimpossivel.checked=true then
   i8.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i8.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i8.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i8.picture.LoadFromFile('imagens/sombrio/o.png');
   j8:='o';
   btnverificar.click;
  end
  else
  begin
  if rbtfacil.Checked=true then
   i2.picture.LoadFromFile('imagens/o/2.png');
  if rbtnormal.Checked=true then
   i2.picture.LoadFromFile('imagens/lousa/o/2.png');
  if rbtimpossivel.checked=true then
   i2.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i2.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i2.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i2.picture.LoadFromFile('imagens/sombrio/o.png');
   j2:='o';
   btnverificar.click;
  end;
end;
if (j1='n')and (j2='n')and (j3='n')and (j4='n')and (j5='o')and (j6='x')and (j7='x')and (j8='n')and (j9='n') then
begin
  ra:=1;
  x:=random(2);
  if x=1 then
  begin
  if rbtfacil.Checked=true then
   i8.picture.LoadFromFile('imagens/o/8.png');
  if rbtnormal.Checked=true then
   i8.picture.LoadFromFile('imagens/lousa/o/8.png');
  if rbtimpossivel.checked=true then
   i8.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i8.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i8.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i8.picture.LoadFromFile('imagens/sombrio/o.png');
   j8:='o';
   btnverificar.click;
  end
  else
  begin
  if rbtfacil.Checked=true then
   i2.picture.LoadFromFile('imagens/o/2.png');
  if rbtnormal.Checked=true then
   i2.picture.LoadFromFile('imagens/lousa/o/2.png');
  if rbtimpossivel.checked=true then
   i2.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i2.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i2.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i2.picture.LoadFromFile('imagens/sombrio/o.png');
   j2:='o';
   btnverificar.click;
  end;
end;
if (j1='n')and (j2='n')and (j3='n')and (j4='x')and (j5='o')and (j6='n')and (j7='n')and (j8='n')and (j9='x') then
begin
  ra:=1;
  x:=random(2);
  if x=1 then
  begin
  if rbtfacil.Checked=true then
   i8.picture.LoadFromFile('imagens/o/8.png');
  if rbtnormal.Checked=true then
   i8.picture.LoadFromFile('imagens/lousa/o/8.png');
  if rbtimpossivel.checked=true then
   i8.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i8.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i8.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i8.picture.LoadFromFile('imagens/sombrio/o.png');
   j8:='o';
   btnverificar.click;
  end
  else
  begin
  if rbtfacil.Checked=true then
   i2.picture.LoadFromFile('imagens/o/2.png');
  if rbtnormal.Checked=true then
   i2.picture.LoadFromFile('imagens/lousa/o/2.png');
  if rbtimpossivel.checked=true then
   i2.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i2.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i2.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i2.picture.LoadFromFile('imagens/sombrio/o.png');
   j2:='o';
   btnverificar.click;
  end;
end;
if ra=0 then
btnjogar2.click;
end;

procedure TForm1.btnjogar4Click(Sender: TObject);
var ra:byte;
begin
ra:=0;
if (j3='n')and(j6='x')and(j7='n')and (j8='x')and(j9='n') then
begin
  if rbtfacil.Checked=true then
   i9.picture.LoadFromFile('imagens/o/7.png');
  if rbtnormal.Checked=true then
   i9.picture.LoadFromFile('imagens/lousa/o/7.png');
  if rbtimpossivel.checked=true then
   i9.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i9.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i9.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i9.picture.LoadFromFile('imagens/sombrio/o.png');
  j9:='o';
  ra:=1;
  btnverificar.click;
end;
if (j1='n')and(j4='x')and(j7='n')and (j8='x')and(j9='n') then
begin
  if rbtfacil.Checked=true then
   i7.picture.LoadFromFile('imagens/o/7.png');
  if rbtnormal.Checked=true then
   i7.picture.LoadFromFile('imagens/lousa/o/7.png');
  if rbtimpossivel.checked=true then
   i7.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i7.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i7.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i7.picture.LoadFromFile('imagens/sombrio/o.png');
  j7:='o';
  ra:=1;
  btnverificar.click;
end;
if (j1='n')and(j2='x')and (j3='n')and (j6='x')and(j9='n') then
begin
  if rbtfacil.Checked=true then
   i3.picture.LoadFromFile('imagens/o/3.png');
  if rbtnormal.Checked=true then
   i3.picture.LoadFromFile('imagens/lousa/o/3.png');
  if rbtimpossivel.checked=true then
   i3.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i3.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i3.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i3.picture.LoadFromFile('imagens/sombrio/o.png');
  j3:='o';
  ra:=1;
  btnverificar.click;
end;
if (j1='n')and(j2='x')and (j3='n')and (j4='x')and(j7='n') then
begin
  if rbtfacil.Checked=true then
   i1.picture.LoadFromFile('imagens/o/1.png');
  if rbtnormal.Checked=true then
   i1.picture.LoadFromFile('imagens/lousa/o/1.png');
  if rbtimpossivel.checked=true then
   i1.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i1.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i1.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i1.picture.LoadFromFile('imagens/sombrio/o.png');
  j1:='o';
  ra:=1;
  btnverificar.click;
end;
if controlimpos=1 then
begin
  if j5='n' then
  begin
   if rbtfacil.Checked=true then
    i5.picture.LoadFromFile('imagens/o/5.png');
   if rbtnormal.Checked=true then
    i5.picture.LoadFromFile('imagens/lousa/o/5.png');
   if rbtimpossivel.checked=true then
    i5.picture.LoadFromFile('imagens/raio/o.png');
   if rbtninja.Checked=true then
    i5.picture.LoadFromFile('imagens/asia/o.png');
   if rbtvampiro.Checked=true then
    i5.picture.LoadFromFile('imagens/vampi/o.png');
   if rbtlobisomem.Checked=true then
    i5.picture.LoadFromFile('imagens/sombrio/o.png');
  j5:='o';
  ra:=1;
  btnverificar.click;
  end;
end;
if (j1='n')and (j2='n')and (j3='n')and (j4='n')and (j5='o')and (j6='x')and (j7='n')and (j8='x')and (j9='n') then
begin
  if rbtfacil.Checked=true then
   i9.picture.LoadFromFile('imagens/o/9.png');
  if rbtnormal.Checked=true then
   i9.picture.LoadFromFile('imagens/lousa/o/9.png');
  if rbtimpossivel.checked=true then
   i9.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i9.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i9.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i9.picture.LoadFromFile('imagens/sombrio/o.png');
  j9:='o';
  ra:=1;
  btnverificar.click;
end;
if (j1='n')and (j2='n')and (j3='n')and (j4='x')and (j5='o')and (j6='n')and (j7='n')and (j8='x')and (j9='n') then
begin
  if rbtfacil.Checked=true then
   i7.picture.LoadFromFile('imagens/o/7.png');
  if rbtnormal.Checked=true then
   i7.picture.LoadFromFile('imagens/lousa/o/7.png');
  if rbtimpossivel.checked=true then
   i7.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i7.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i7.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i7.picture.LoadFromFile('imagens/sombrio/o.png');
  j7:='o';
  ra:=1;
  btnverificar.click;
end;
if (j1='n')and (j2='n')and (j3='n')and (j4='n')and (j5='o')and (j6='x')and (j7='n')and (j8='x')and (j9='n') then
begin
  if rbtfacil.Checked=true then
   i9.picture.LoadFromFile('imagens/o/9.png');
  if rbtnormal.Checked=true then
   i9.picture.LoadFromFile('imagens/lousa/o/9.png');
  if rbtimpossivel.checked=true then
   i9.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i9.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i9.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i9.picture.LoadFromFile('imagens/sombrio/o.png');
  j9:='o';
  ra:=1;
  btnverificar.click;
end;
if (j1='n')and (j2='x')and (j3='n')and (j4='n')and (j5='o')and (j6='x')and (j7='n')and (j8='n')and (j9='n') then
begin
  if rbtfacil.Checked=true then
   i3.picture.LoadFromFile('imagens/o/3.png');
  if rbtnormal.Checked=true then
   i3.picture.LoadFromFile('imagens/lousa/o/3.png');
  if rbtimpossivel.checked=true then
   i3.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i3.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i3.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i3.picture.LoadFromFile('imagens/sombrio/o.png');
  j3:='o';
  ra:=1;
  btnverificar.click;
end;
if (j1='n')and (j2='x')and (j3='n')and (j4='x')and (j5='o')and (j6='n')and (j7='n')and (j8='n')and (j9='n') then
begin
  if rbtfacil.Checked=true then
   i1.picture.LoadFromFile('imagens/o/1.png');
  if rbtnormal.Checked=true then
   i1.picture.LoadFromFile('imagens/lousa/o/1.png');
  if rbtimpossivel.checked=true then
   i1.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i1.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i1.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i1.picture.LoadFromFile('imagens/sombrio/o.png');
  j1:='o';
  ra:=1;
  btnverificar.click;
end;
if (j1='o')and (j2='n')and (j3='n')and (j4='n')and (j5='x')and (j6='n')and (j7='n')and (j8='n')and (j9='n') then
begin
x:=random(2);
if x=1 then
begin
  if rbtfacil.Checked=true then
   i9.picture.LoadFromFile('imagens/o/9.png');
  if rbtnormal.Checked=true then
   i9.picture.LoadFromFile('imagens/lousa/o/9.png');
  if rbtimpossivel.checked=true then
   i9.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i9.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i9.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i9.picture.LoadFromFile('imagens/sombrio/o.png');
  j9:='o';
end
else
begin
   if rbtfacil.Checked=true then
   i6.picture.LoadFromFile('imagens/o/6.png');
  if rbtnormal.Checked=true then
   i6.picture.LoadFromFile('imagens/lousa/o/6.png');
  if rbtimpossivel.checked=true then
   i6.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i6.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i6.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i6.picture.LoadFromFile('imagens/sombrio/o.png');
  j6:='o';
end;
  ra:=1;
  btnverificar.click;
end;
if (j1='n')and (j2='n')and (j3='o')and (j4='n')and (j5='x')and (j6='n')and (j7='n')and (j8='n')and (j9='n') then
begin
x:=random(2);
if x=1 then
begin
  if rbtfacil.Checked=true then
   i7.picture.LoadFromFile('imagens/o/7.png');
  if rbtnormal.Checked=true then
   i7.picture.LoadFromFile('imagens/lousa/o/7.png');
  if rbtimpossivel.checked=true then
   i7.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i7.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i7.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i7.picture.LoadFromFile('imagens/sombrio/o.png');
  j7:='o';
end
else
begin
   if rbtfacil.Checked=true then
   i4.picture.LoadFromFile('imagens/o/4.png');
  if rbtnormal.Checked=true then
   i4.picture.LoadFromFile('imagens/lousa/o/4.png');
  if rbtimpossivel.checked=true then
   i4.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i4.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i4.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i4.picture.LoadFromFile('imagens/sombrio/o.png');
  j4:='o';
end;
  ra:=1;
  btnverificar.click;
end;
if (j1='n')and (j2='n')and (j3='n')and (j4='n')and (j5='x')and (j6='n')and (j7='o')and (j8='n')and (j9='n') then
begin
x:=random(2);
if x=1 then
begin
  if rbtfacil.Checked=true then
   i3.picture.LoadFromFile('imagens/o/3.png');
  if rbtnormal.Checked=true then
   i3.picture.LoadFromFile('imagens/lousa/o/3.png');
  if rbtimpossivel.checked=true then
   i3.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i3.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i3.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i3.picture.LoadFromFile('imagens/sombrio/o.png');
  j3:='o';
end
else
begin
   if rbtfacil.Checked=true then
   i6.picture.LoadFromFile('imagens/o/6.png');
  if rbtnormal.Checked=true then
   i6.picture.LoadFromFile('imagens/lousa/o/6.png');
  if rbtimpossivel.checked=true then
   i6.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i6.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i6.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i6.picture.LoadFromFile('imagens/sombrio/o.png');
  j6:='o';
end;
  ra:=1;
  btnverificar.click;
end;
if (j1='n')and (j2='n')and (j3='n')and (j4='n')and (j5='x')and (j6='n')and (j7='n')and (j8='n')and (j9='o') then
begin
x:=random(2);
if x=1 then
begin
  if rbtfacil.Checked=true then
   i1.picture.LoadFromFile('imagens/o/1.png');
  if rbtnormal.Checked=true then
   i1.picture.LoadFromFile('imagens/lousa/o/1.png');
  if rbtimpossivel.checked=true then
   i1.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i1.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i1.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i1.picture.LoadFromFile('imagens/sombrio/o.png');
  j1:='o';
end
else
begin
  if rbtfacil.Checked=true then
   i4.picture.LoadFromFile('imagens/o/4.png');
  if rbtnormal.Checked=true then
   i4.picture.LoadFromFile('imagens/lousa/o/4.png');
  if rbtimpossivel.checked=true then
   i4.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i4.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i4.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i4.picture.LoadFromFile('imagens/sombrio/o.png');
  j4:='o';
end;
  ra:=1;
  btnverificar.click;
end;
if (j1='n')and (j2='n')and (j3='n')and (j4='n')and (j5='n')and (j6='n')and (j7='n')and (j8='n')and (j9='n') then
begin
x:=random(4);
if x=1 then
begin
  if rbtfacil.Checked=true then
   i1.picture.LoadFromFile('imagens/o/1.png');
  if rbtnormal.Checked=true then
   i1.picture.LoadFromFile('imagens/lousa/o/1.png');
  if rbtimpossivel.checked=true then
   i1.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i1.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i1.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i1.picture.LoadFromFile('imagens/sombrio/o.png');
  j1:='o';
end;
if x=2 then
begin
  if rbtfacil.Checked=true then
   i3.picture.LoadFromFile('imagens/o/3.png');
  if rbtnormal.Checked=true then
   i3.picture.LoadFromFile('imagens/lousa/o/3.png');
  if rbtimpossivel.checked=true then
   i3.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i3.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i3.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i3.picture.LoadFromFile('imagens/sombrio/o.png');
  j3:='o';
end;
if x=3 then
begin
  if rbtfacil.Checked=true then
   i7.picture.LoadFromFile('imagens/o/7.png');
  if rbtnormal.Checked=true then
   i7.picture.LoadFromFile('imagens/lousa/o/7.png');
  if rbtimpossivel.checked=true then
   i7.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i7.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i7.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i7.picture.LoadFromFile('imagens/sombrio/o.png');
  j7:='o';
end;
if x=0 then
begin
  if rbtfacil.Checked=true then
   i9.picture.LoadFromFile('imagens/o/9.png');
  if rbtnormal.Checked=true then
   i9.picture.LoadFromFile('imagens/lousa/o/9.png');
  if rbtimpossivel.checked=true then
   i9.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i9.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i9.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i9.picture.LoadFromFile('imagens/sombrio/o.png');
  j9:='o';
end;
  btnverificar.click;
  ra:=1;
end;
if (j1='n')and(j2='x')and(j3='n')and(j4='n')and(j5='o')and(j6='n')and(j7='n')and(j8='n')and(j9='x') then
begin
  x:=random(2);
  if x=1 then
  begin
  if rbtfacil.Checked=true then
   i6.picture.LoadFromFile('imagens/o/6.png');
  if rbtnormal.Checked=true then
   i6.picture.LoadFromFile('imagens/lousa/o/6.png');
  if rbtimpossivel.checked=true then
   i6.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i6.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i6.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i6.picture.LoadFromFile('imagens/sombrio/o.png');
  j6:='o';
  end
  else
  begin
  if rbtfacil.Checked=true then
   i4.picture.LoadFromFile('imagens/o/4.png');
  if rbtnormal.Checked=true then
   i4.picture.LoadFromFile('imagens/lousa/o/4.png');
  if rbtimpossivel.checked=true then
   i4.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i4.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i4.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i4.picture.LoadFromFile('imagens/sombrio/o.png');
  j4:='o';
  end;
  btnverificar.click;
  ra:=1;
end;
if (j1='n')and(j2='x')and(j3='n')and(j4='n')and(j5='o')and(j6='n')and(j7='x')and(j8='n')and(j9='n') then
begin
  x:=random(2);
  if x=1 then
  begin
  if rbtfacil.Checked=true then
   i6.picture.LoadFromFile('imagens/o/6.png');
  if rbtnormal.Checked=true then
   i6.picture.LoadFromFile('imagens/lousa/o/6.png');
  if rbtimpossivel.checked=true then
   i6.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i6.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i6.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i6.picture.LoadFromFile('imagens/sombrio/o.png');
  j6:='o';
  end
  else
  begin
  if rbtfacil.Checked=true then
   i4.picture.LoadFromFile('imagens/o/4.png');
  if rbtnormal.Checked=true then
   i4.picture.LoadFromFile('imagens/lousa/o/4.png');
  if rbtimpossivel.checked=true then
   i4.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i4.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i4.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i4.picture.LoadFromFile('imagens/sombrio/o.png');
  j4:='o';
  end;
  btnverificar.click;
  ra:=1;
end;
if (j1='n')and(j2='n')and(j3='x')and(j4='n')and(j5='o')and(j6='n')and(j7='n')and(j8='x')and(j9='n') then
begin
  x:=random(2);
  if x=1 then
  begin
  if rbtfacil.Checked=true then
   i6.picture.LoadFromFile('imagens/o/6.png');
  if rbtnormal.Checked=true then
   i6.picture.LoadFromFile('imagens/lousa/o/6.png');
  if rbtimpossivel.checked=true then
   i6.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i6.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i6.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i6.picture.LoadFromFile('imagens/sombrio/o.png');
  j6:='o';
  end
  else
  begin
  if rbtfacil.Checked=true then
   i4.picture.LoadFromFile('imagens/o/4.png');
  if rbtnormal.Checked=true then
   i4.picture.LoadFromFile('imagens/lousa/o/4.png');
  if rbtimpossivel.checked=true then
   i4.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i4.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i4.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i4.picture.LoadFromFile('imagens/sombrio/o.png');
  j4:='o';
  end;
  btnverificar.click;
  ra:=1;
end;
if (j1='x')and(j2='n')and(j3='n')and(j4='n')and(j5='o')and(j6='n')and(j7='n')and(j8='x')and(j9='n') then
begin
  x:=random(2);
  if x=1 then
  begin
  if rbtfacil.Checked=true then
   i6.picture.LoadFromFile('imagens/o/6.png');
  if rbtnormal.Checked=true then
   i6.picture.LoadFromFile('imagens/lousa/o/6.png');
  if rbtimpossivel.checked=true then
   i6.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i6.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i6.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i6.picture.LoadFromFile('imagens/sombrio/o.png');
  j6:='o';
  end
  else
  begin
  if rbtfacil.Checked=true then
   i4.picture.LoadFromFile('imagens/o/4.png');
  if rbtnormal.Checked=true then
   i4.picture.LoadFromFile('imagens/lousa/o/4.png');
  if rbtimpossivel.checked=true then
   i4.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i4.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i4.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i4.picture.LoadFromFile('imagens/sombrio/o.png');
  j4:='o';
  end;
  btnverificar.click;
  ra:=1;
end;
if (j1='n')and(j2='x')and(j3='n')and(j4='n')and(j5='n')and(j6='n')and(j7='n')and(j8='n')and(j9='n') then
begin
  if rbtfacil.Checked=true then
   i5.picture.LoadFromFile('imagens/o/5.png');
  if rbtnormal.Checked=true then
   i5.picture.LoadFromFile('imagens/lousa/o/5.png');
  if rbtimpossivel.checked=true then
   i5.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i5.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i5.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i5.picture.LoadFromFile('imagens/sombrio/o.png');
  j5:='o';
  btnverificar.click;
  ra:=1;
end;
if (j1='n')and(j2='n')and(j3='n')and(j4='x')and(j5='n')and(j6='n')and(j7='n')and(j8='n')and(j9='n') then
begin
  if rbtfacil.Checked=true then
   i5.picture.LoadFromFile('imagens/o/5.png');
  if rbtnormal.Checked=true then
   i5.picture.LoadFromFile('imagens/lousa/o/5.png');
  if rbtimpossivel.checked=true then
   i5.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i5.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i5.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i5.picture.LoadFromFile('imagens/sombrio/o.png');
  j5:='o';
  btnverificar.click;
  ra:=1;
end;
if (j1='n')and(j2='n')and(j3='n')and(j4='n')and(j5='n')and(j6='x')and(j7='n')and(j8='n')and(j9='n') then
begin
  if rbtfacil.Checked=true then
   i5.picture.LoadFromFile('imagens/o/5.png');
  if rbtnormal.Checked=true then
   i5.picture.LoadFromFile('imagens/lousa/o/5.png');
  if rbtimpossivel.checked=true then
   i5.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i5.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i5.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i5.picture.LoadFromFile('imagens/sombrio/o.png');
  j5:='o';
  btnverificar.click;
  ra:=1;
end;
if (j1='n')and(j2='n')and(j3='n')and(j4='n')and(j5='n')and(j6='n')and(j7='n')and(j8='x')and(j9='n') then
begin
  if rbtfacil.Checked=true then
   i5.picture.LoadFromFile('imagens/o/5.png');
  if rbtnormal.Checked=true then
   i5.picture.LoadFromFile('imagens/lousa/o/5.png');
  if rbtimpossivel.checked=true then
   i5.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i5.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i5.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i5.picture.LoadFromFile('imagens/sombrio/o.png');
  j5:='o';
  btnverificar.click;
  ra:=1;
end;

if (j1='n')and(j2='n')and(j3='n')and(j4='n')and(j5='x')and(j6='n')and(j7='n')and(j8='n')and(j9='n') then
begin
  x:=random(4);
  if x=0 then
  begin
    if rbtfacil.Checked=true then
     i1.picture.LoadFromFile('imagens/o/1.png');
    if rbtnormal.Checked=true then
     i1.picture.LoadFromFile('imagens/lousa/o/1.png');
    if rbtimpossivel.checked=true then
     i1.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i1.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i1.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i1.picture.LoadFromFile('imagens/sombrio/o.png');
    j1:='o';
    ra:=1;
    btnverificar.click;
  end;
  if x=1 then
  begin
    if rbtfacil.Checked=true then
     i3.picture.LoadFromFile('imagens/o/3.png');
    if rbtnormal.Checked=true then
     i3.picture.LoadFromFile('imagens/lousa/o/3.png');
    if rbtimpossivel.checked=true then
     i3.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i3.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i3.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i3.picture.LoadFromFile('imagens/sombrio/o.png');
    j3:='o';
    ra:=1;
    btnverificar.click;
  end;
  if x=2 then
  begin
    if rbtfacil.Checked=true then
     i7.picture.LoadFromFile('imagens/o/7.png');
    if rbtnormal.Checked=true then
     i7.picture.LoadFromFile('imagens/lousa/o/7.png');
    if rbtimpossivel.checked=true then
     i7.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i7.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i7.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i7.picture.LoadFromFile('imagens/sombrio/o.png');
    j7:='o';
    ra:=1;
    btnverificar.click;
  end;
  if x=3 then
  begin
    if rbtfacil.Checked=true then
     i9.picture.LoadFromFile('imagens/o/9.png');
    if rbtnormal.Checked=true then
     i9.picture.LoadFromFile('imagens/lousa/o/9.png');
    if rbtimpossivel.checked=true then
     i9.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i9.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i9.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i9.picture.LoadFromFile('imagens/sombrio/o.png');
    j9:='o';
    ra:=1;
    btnverificar.click;
  end;
end;
if (j1='o')and(j2='n')and(j3='n')and(j4='n')and(j5='x')and(j6='n')and(j7='n')and(j8='n')and(j9='x') then
begin
  x:=random(2);
  if x=1 then
  begin
  if rbtfacil.Checked=true then
     i3.picture.LoadFromFile('imagens/o/3.png');
    if rbtnormal.Checked=true then
     i3.picture.LoadFromFile('imagens/lousa/o/3.png');
    if rbtimpossivel.checked=true then
     i3.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i3.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i3.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i3.picture.LoadFromFile('imagens/sombrio/o.png');
  j3:='o';
  ra:=1;
  btnverificar.click;
  end
  else
  begin
  if rbtfacil.Checked=true then
     i7.picture.LoadFromFile('imagens/o/7.png');
    if rbtnormal.Checked=true then
     i7.picture.LoadFromFile('imagens/lousa/o/7.png');
    if rbtimpossivel.checked=true then
     i7.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i7.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i7.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i7.picture.LoadFromFile('imagens/sombrio/o.png');
  j7:='o';
  ra:=1;
  btnverificar.click;
  end;
end;
if (j1='n')and(j2='n')and(j3='o')and(j4='n')and(j5='x')and(j6='n')and(j7='x')and(j8='n')and(j9='n') then
begin
  x:=random(2);
  if x=1 then
  begin
    if rbtfacil.Checked=true then
     i1.picture.LoadFromFile('imagens/o/1.png');
    if rbtnormal.Checked=true then
     i1.picture.LoadFromFile('imagens/lousa/o/1.png');
    if rbtimpossivel.checked=true then
     i1.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i1.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i1.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i1.picture.LoadFromFile('imagens/sombrio/o.png');
  j1:='o';
  ra:=1;
  btnverificar.click;
  end
  else
  begin
    if rbtfacil.Checked=true then
     i9.picture.LoadFromFile('imagens/o/9.png');
    if rbtnormal.Checked=true then
     i9.picture.LoadFromFile('imagens/lousa/o/9.png');
    if rbtimpossivel.checked=true then
     i9.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i9.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i9.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i9.picture.LoadFromFile('imagens/sombrio/o.png');
  j9:='o';
  ra:=1;
  btnverificar.click;
  end;
end;
if (j1='n')and(j2='n')and(j3='x')and(j4='n')and(j5='x')and(j6='n')and(j7='o')and(j8='n')and(j9='n') then
begin
  x:=random(2);
  if x=1 then
  begin
  if rbtfacil.Checked=true then
     i1.picture.LoadFromFile('imagens/o/1.png');
    if rbtnormal.Checked=true then
     i1.picture.LoadFromFile('imagens/lousa/o/1.png');
    if rbtimpossivel.checked=true then
     i1.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i1.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i1.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i1.picture.LoadFromFile('imagens/sombrio/o.png');
  j1:='o';
  ra:=1;
  btnverificar.click;
  end
  else
  begin
  if rbtfacil.Checked=true then
     i9.picture.LoadFromFile('imagens/o/9.png');
    if rbtnormal.Checked=true then
     i9.picture.LoadFromFile('imagens/lousa/o/9.png');
    if rbtimpossivel.checked=true then
     i9.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i9.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i9.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i9.picture.LoadFromFile('imagens/sombrio/o.png');
  j9:='o';
  ra:=1;
  btnverificar.click;
  end;
end;
if (j1='x')and(j2='n')and(j3='n')and(j4='n')and(j5='x')and(j6='n')and(j7='n')and(j8='n')and(j9='o') then
begin
  x:=random(2);
  if x=1 then
  begin
    if rbtfacil.Checked=true then
     i3.picture.LoadFromFile('imagens/o/3.png');
    if rbtnormal.Checked=true then
     i3.picture.LoadFromFile('imagens/lousa/o/3.png');
    if rbtimpossivel.checked=true then
     i3.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i3.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i3.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i3.picture.LoadFromFile('imagens/sombrio/o.png');
  j3:='o';
  ra:=1;
  btnverificar.click;
  end
  else
  begin
    if rbtfacil.Checked=true then
     i7.picture.LoadFromFile('imagens/o/1.png');
    if rbtnormal.Checked=true then
     i7.picture.LoadFromFile('imagens/lousa/o/1.png');
    if rbtimpossivel.checked=true then
     i7.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i7.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i7.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i7.picture.LoadFromFile('imagens/sombrio/o.png');
  j7:='o';
  ra:=1;
  btnverificar.click;
  end;
end;
if ra=0 then
btnjogar3.Click;

end;

procedure TForm1.btnjogarClick(Sender: TObject);
begin
repeat
x:=random(9);
c:=0;
if x=1 then
begin
  if j1='n' then
  begin
    if rbtfacil.Checked=true then
     i1.picture.LoadFromFile('imagens/o/1.png');
    if rbtnormal.Checked=true then
     i1.picture.LoadFromFile('imagens/lousa/o/1.png');
    if rbtimpossivel.checked=true then
     i1.picture.LoadFromFile('imagens/raio/o.png');
    if rbtninja.Checked=true then
     i1.picture.LoadFromFile('imagens/asia/o.png');
    if rbtvampiro.Checked=true then
     i1.picture.LoadFromFile('imagens/vampi/o.png');
    if rbtlobisomem.Checked=true then
     i1.picture.LoadFromFile('imagens/sombrio/o.png');
    j1:='o';
    c:=1;
    btnverificar.Click;
  end;
end;
if x=2 then
begin
  if j2='n' then
  begin
  if rbtfacil.Checked=true then
   i2.picture.LoadFromFile('imagens/o/2.png');
  if rbtnormal.Checked=true then
   i2.picture.LoadFromFile('imagens/lousa/o/2.png');
  if rbtimpossivel.checked=true then
   i2.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i2.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i2.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i2.picture.LoadFromFile('imagens/sombrio/o.png');
    j2:='o';
    c:=1;
    btnverificar.Click;
  end;
end;
if x=3 then
begin
  if j3='n' then
  begin
  if rbtfacil.Checked=true then
   i3.picture.LoadFromFile('imagens/o/3.png');
  if rbtnormal.Checked=true then
   i3.picture.LoadFromFile('imagens/lousa/o/3.png');
  if rbtimpossivel.checked=true then
   i3.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i3.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i3.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i3.picture.LoadFromFile('imagens/sombrio/o.png');
    j3:='o';
    c:=1;
    btnverificar.Click;
  end;
end;
if x=4 then
begin
  if j4='n' then
  begin
  if rbtfacil.Checked=true then
   i4.picture.LoadFromFile('imagens/o/4.png');
  if rbtnormal.Checked=true then
   i4.picture.LoadFromFile('imagens/lousa/o/4.png');
  if rbtimpossivel.checked=true then
   i4.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i4.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i4.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i4.picture.LoadFromFile('imagens/sombrio/o.png');
    j4:='o';
    c:=1;
    btnverificar.Click;
  end;
end;
if x=5 then
begin
  if j5='n' then
  begin
  if rbtfacil.Checked=true then
   i5.picture.LoadFromFile('imagens/o/5.png');
  if rbtnormal.Checked=true then
   i5.picture.LoadFromFile('imagens/lousa/o/5.png');
  if rbtimpossivel.checked=true then
   i5.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i5.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i5.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i5.picture.LoadFromFile('imagens/sombrio/o.png');
    j5:='o';
    c:=1;
    btnverificar.Click;
  end;
end;
if x=6 then
begin
  if j6='n' then
  begin
  if rbtfacil.Checked=true then
   i6.picture.LoadFromFile('imagens/o/6.png');
  if rbtnormal.Checked=true then
   i6.picture.LoadFromFile('imagens/lousa/o/6.png');
  if rbtimpossivel.checked=true then
   i6.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i6.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i6.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i6.picture.LoadFromFile('imagens/sombrio/o.png');
    j6:='o';
    c:=1;
    btnverificar.Click;
  end;
end;
if x=7 then
begin
  if j7='n' then
  begin
  if rbtfacil.Checked=true then
   i7.picture.LoadFromFile('imagens/o/7.png');
  if rbtnormal.Checked=true then
   i7.picture.LoadFromFile('imagens/lousa/o/7.png');
  if rbtimpossivel.checked=true then
   i7.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i7.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i7.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i7.picture.LoadFromFile('imagens/sombrio/o.png');
    j7:='o';
    c:=1;
    btnverificar.Click;
  end;
end;
if x=8 then
begin
  if j8='n' then
  begin
  if rbtfacil.Checked=true then
   i8.picture.LoadFromFile('imagens/o/8.png');
  if rbtnormal.Checked=true then
   i8.picture.LoadFromFile('imagens/lousa/o/8.png');
  if rbtimpossivel.checked=true then
   i8.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i8.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i8.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i8.picture.LoadFromFile('imagens/sombrio/o.png');
    j8:='o';
    c:=1;
    btnverificar.Click;
  end;
end;
if x=0 then
begin
  if j9='n' then
  begin
  if rbtfacil.Checked=true then
   i9.picture.LoadFromFile('imagens/o/9.png');
  if rbtnormal.Checked=true then
   i9.picture.LoadFromFile('imagens/lousa/o/9.png');
  if rbtimpossivel.checked=true then
   i9.picture.LoadFromFile('imagens/raio/o.png');
  if rbtninja.Checked=true then
   i9.picture.LoadFromFile('imagens/asia/o.png');
  if rbtvampiro.Checked=true then
   i9.picture.LoadFromFile('imagens/vampi/o.png');
  if rbtlobisomem.Checked=true then
   i9.picture.LoadFromFile('imagens/sombrio/o.png');
    j9:='o';
    c:=1;
    btnverificar.Click;
  end;
end;
until c=1;
end;

procedure TForm1.btnmultiClick(Sender: TObject);
begin
form3:=tform3.create(application);
form3.show;
form1.free;
end;

procedure TForm1.btnnovoClick(Sender: TObject);
var contr:integer;
begin
controlimpos:=0;
rbtfacil.enabled:=true;
if va>=1 then
 rbtnormal.enabled:=true
else
 rbtnormal.enabled:=false;
if vp>=1 then
 rbtimpossivel.enabled:=true
else
 rbtimpossivel.enabled:=false;
rbtvampiro.Enabled:=true;
rbtninja.enabled:=true;
rbtlobisomem.enabled:=true;
if vd>=1 then
 begin
 invenciveis.visible:=true;
 inv:=1;
 end
else
begin
 invenciveis.Visible:=false;
 inv:=0;
end;
i1.picture.LoadFromFile('imagens/vazio.gif');
i2.picture.LoadFromFile('imagens/vazio.gif');
i3.picture.LoadFromFile('imagens/vazio.gif');
i4.picture.LoadFromFile('imagens/vazio.gif');
i5.picture.LoadFromFile('imagens/vazio.gif');
i6.picture.LoadFromFile('imagens/vazio.gif');
i7.picture.LoadFromFile('imagens/vazio.gif');
i8.picture.LoadFromFile('imagens/vazio.gif');
i9.picture.LoadFromFile('imagens/vazio.gif');
j1:='n';
j2:='n';
j3:='n';
j4:='n';
j5:='n';
j6:='n';
j7:='n';
j8:='n';
j9:='n';
contr:=vez mod 2;
if contr=1 then
begin
 if rbtfacil.checked=true then
  btnjogar.Click
 else
  if rbtnormal.checked=true then
   btnjogar2.click
  else
   if rbtimpossivel.checked=true then
    btnjogar3.click
    else
     btnjogar4.click;
end;
end;

procedure TForm1.btnnovojogClick(Sender: TObject);
var
nome2:string;
begin
nome2:=nome;
nome:=inputbox('Digite seu nome','Jogador','');
if length(nome)>10 then
begin
  showmessage('Máximo 10 caracteres');
  nome:='';
end;
if nome='' then
nome:=nome2;
if nome<>nome2 then
begin
lbljogador.caption:=nome+':';
btnzerar.click;
end;
end;

procedure TForm1.btnplacarClick(Sender: TObject);
begin
form2:=tform2.create(application);
form2.show;
end;

procedure TForm1.btnsobreClick(Sender: TObject);
begin
form5:=tform5.create(application);
form5.show;
end;

procedure TForm1.btnverificarClick(Sender: TObject);
begin
v:=0;
if (j1='x') and  (j2='x') and  (j3='x')then
begin
  if rbtfacil.Checked=true then
   va:=va+1;
  if rbtnormal.Checked=true then
   vp:=vp+1;
  if rbtimpossivel.Checked=true then
   vd:=vd+1;
  if rbtvampiro.Checked=true then
   vv:=vv+1;
  if rbtninja.Checked=true then
   vn:=vn+1;
  if rbtlobisomem.Checked=true then
   vl:=vl+1;
  showmessage('Você Ganhou');
  vez:=vez+1;
  jogador:=jogador+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador);
  v:=1;
end;
if (j4='x') and  (j5='x') and  (j6='x')then
begin
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-aluno.png');
   va:=va+1;
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-professora.png');
   vp:=vp+1;
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-diretor.png');
   vd:=vd+1;
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-vampiro.png');
   vv:=vv+1;
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-ninja.png');
   vn:=vn+1;
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-lobisomem.png');
   vl:=vl+1;
  end;
  showmessage('Você Ganhou');
  vez:=vez+1;
  jogador:=jogador+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador);
  v:=1;
end;
if (j7='x') and  (j8='x') and  (j9='x')then
begin
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-aluno.png');
   va:=va+1;
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-professora.png');
   vp:=vp+1;
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-diretor.png');
   vd:=vd+1;
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-vampiro.png');
   vv:=vv+1;
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-ninja.png');
   vn:=vn+1;
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-lobisomem.png');
   vl:=vl+1;
  end;
  showmessage('Você Ganhou');
  vez:=vez+1;
  jogador:=jogador+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador);
  v:=1;
end;
if (j1='x') and  (j4='x') and  (j7='x')then
begin
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-aluno.png');
   va:=va+1;
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-professora.png');
   vp:=vp+1;
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-diretor.png');
   vd:=vd+1;
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-vampiro.png');
   vv:=vv+1;
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-ninja.png');
   vn:=vn+1;
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-lobisomem.png');
   vl:=vl+1;
  end;
  showmessage('Você Ganhou');
  vez:=vez+1;
  jogador:=jogador+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador);
  v:=1;
end;
if (j2='x') and  (j5='x') and  (j8='x')then
begin
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-aluno.png');
   va:=va+1;
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-professora.png');
   vp:=vp+1;
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-diretor.png');
   vd:=vd+1;
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-vampiro.png');
   vv:=vv+1;
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-ninja.png');
   vn:=vn+1;
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-lobisomem.png');
   vl:=vl+1;
  end;
  showmessage('Você Ganhou');
  vez:=vez+1;
  jogador:=jogador+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador);
  v:=1;
end;
if (j3='x') and  (j6='x') and  (j9='x')then
begin
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-aluno.png');
   va:=va+1;
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-professora.png');
   vp:=vp+1;
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-diretor.png');
   vd:=vd+1;
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-vampiro.png');
   vv:=vv+1;
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-ninja.png');
   vn:=vn+1;
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-lobisomem.png');
   vl:=vl+1;
  end;
  showmessage('Você Ganhou');
  vez:=vez+1;
  jogador:=jogador+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador);
  v:=1;
end;
if (j1='x') and  (j5='x') and  (j9='x')then
begin
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-aluno.png');
   va:=va+1;
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-professora.png');
   vp:=vp+1;
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-diretor.png');
   vd:=vd+1;
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-vampiro.png');
   vv:=vv+1;
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-ninja.png');
   vn:=vn+1;
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-lobisomem.png');
   vl:=vl+1;
  end;
  showmessage('Você Ganhou');
  vez:=vez+1;
  jogador:=jogador+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador);
  v:=1;
end;
if (j3='x') and  (j5='x') and  (j7='x')then
begin
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-aluno.png');
   va:=va+1;
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-professora.png');
   vp:=vp+1;
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-diretor.png');
   vd:=vd+1;
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-vampiro.png');
   vv:=vv+1;
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-ninja.png');
   vn:=vn+1;
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/derrota-lobisomem.png');
   vl:=vl+1;
  end;
  showmessage('Você Ganhou');
  vez:=vez+1;
  jogador:=jogador+1;
  btnnovo.click;
  label1.Caption:=inttostr(jogador);
  v:=1;
end;

if (j1='o') and  (j2='o') and  (j3='o')then
begin
  vez:=vez+1;
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-aluno.png');
   da:=da+1;
   label2.Caption:=inttostr(da);
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-professora.png');
   dp:=dp+1;
   label2.Caption:=inttostr(dp);
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-diretor.png');
   dd:=dd+1;
   label2.Caption:=inttostr(dd);
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-vampiro.png');
   dv:=dv+1;
   label2.Caption:=inttostr(dv);
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-ninja.png');
   dn:=dn+1;
   label2.Caption:=inttostr(dn);
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-lobisomem.png');
   dl:=dl+1;
   label2.Caption:=inttostr(dl);
  end;
  showmessage('Você Perdeu');
  btnnovo.click;
  v:=1;
end;
if (j4='o') and  (j5='o') and  (j6='o')then
begin
  vez:=vez+1;
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-aluno.png');
   da:=da+1;
   label2.Caption:=inttostr(da);
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-professora.png');
   dp:=dp+1;
   label2.Caption:=inttostr(dp);
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-diretor.png');
   dd:=dd+1;
   label2.Caption:=inttostr(dd);
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-vampiro.png');
   dv:=dv+1;
   label2.Caption:=inttostr(dv);
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-ninja.png');
   dn:=dn+1;
   label2.Caption:=inttostr(dn);
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-lobisomem.png');
   dl:=dl+1;
   label2.Caption:=inttostr(dl);
  end;
  showmessage('Você Perdeu');
  btnnovo.click;
  v:=1;
end;
if (j7='o') and  (j8='o') and  (j9='o')then
begin
  vez:=vez+1;
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-aluno.png');
   da:=da+1;
   label2.Caption:=inttostr(da);
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-professora.png');
   dp:=dp+1;
   label2.Caption:=inttostr(dp);
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-diretor.png');
   dd:=dd+1;
   label2.Caption:=inttostr(dd);
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-vampiro.png');
   dv:=dv+1;
   label2.Caption:=inttostr(dv);
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-ninja.png');
   dn:=dn+1;
   label2.Caption:=inttostr(dn);
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-lobisomem.png');
   dl:=dl+1;
   label2.Caption:=inttostr(dl);
  end;
  showmessage('Você Perdeu');
  btnnovo.click;
  v:=1;
end;
if (j1='o') and  (j4='o') and  (j7='o')then
begin
  vez:=vez+1;
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-aluno.png');
   da:=da+1;
   label2.Caption:=inttostr(da);
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-professora.png');
   dp:=dp+1;
   label2.Caption:=inttostr(dp);
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-diretor.png');
   dd:=dd+1;
   label2.Caption:=inttostr(dd);
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-vampiro.png');
   dv:=dv+1;
   label2.Caption:=inttostr(dv);
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-ninja.png');
   dn:=dn+1;
   label2.Caption:=inttostr(dn);
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-lobisomem.png');
   dl:=dl+1;
   label2.Caption:=inttostr(dl);
  end;
  showmessage('Você Perdeu');
  btnnovo.click;
  v:=1;
end;
if (j2='o') and  (j5='o') and  (j8='o')then
begin
  vez:=vez+1;
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-aluno.png');
   da:=da+1;
   label2.Caption:=inttostr(da);
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-professora.png');
   dp:=dp+1;
   label2.Caption:=inttostr(dp);
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-diretor.png');
   dd:=dd+1;
   label2.Caption:=inttostr(dd);
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-vampiro.png');
   dv:=dv+1;
   label2.Caption:=inttostr(dv);
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-ninja.png');
   dn:=dn+1;
   label2.Caption:=inttostr(dn);
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-lobisomem.png');
   dl:=dl+1;
   label2.Caption:=inttostr(dl);
  end;
  showmessage('Você Perdeu');
  btnnovo.click;
  v:=1;
end;
if (j3='o') and  (j6='o') and  (j9='o')then
begin
  vez:=vez+1;
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-aluno.png');
   da:=da+1;
   label2.Caption:=inttostr(da);
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-professora.png');
   dp:=dp+1;
   label2.Caption:=inttostr(dp);
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-diretor.png');
   dd:=dd+1;
   label2.Caption:=inttostr(dd);
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-vampiro.png');
   dv:=dv+1;
   label2.Caption:=inttostr(dv);
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-ninja.png');
   dn:=dn+1;
   label2.Caption:=inttostr(dn);
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-lobisomem.png');
   dl:=dl+1;
   label2.Caption:=inttostr(dl);
  end;
  showmessage('Você Perdeu');
  btnnovo.click;
  v:=1;
end;
if (j1='o') and  (j5='o') and  (j9='o')then
begin
  vez:=vez+1;
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-aluno.png');
   da:=da+1;
   label2.Caption:=inttostr(da);
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-professora.png');
   dp:=dp+1;
   label2.Caption:=inttostr(dp);
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-diretor.png');
   dd:=dd+1;
   label2.Caption:=inttostr(dd);
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-vampiro.png');
   dv:=dv+1;
   label2.Caption:=inttostr(dv);
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-ninja.png');
   dn:=dn+1;
   label2.Caption:=inttostr(dn);
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-lobisomem.png');
   dl:=dl+1;
   label2.Caption:=inttostr(dl);
  end;
  showmessage('Você Perdeu');
  btnnovo.click;
  v:=1;
end;
if (j3='o') and  (j5='o') and  (j7='o')then
begin
  vez:=vez+1;
  if rbtfacil.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-aluno.png');
   da:=da+1;
   label2.Caption:=inttostr(da);
  end;
  if rbtnormal.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-professora.png');
   dp:=dp+1;
   label2.Caption:=inttostr(dp);
  end;
  if rbtimpossivel.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-diretor.png');
   dd:=dd+1;
   label2.Caption:=inttostr(dd);
  end;
  if rbtvampiro.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-vampiro.png');
   dv:=dv+1;
   label2.Caption:=inttostr(dv);
  end;
  if rbtninja.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-ninja.png');
   dn:=dn+1;
   label2.Caption:=inttostr(dn);
  end;
  if rbtlobisomem.Checked=true then
  begin
   fala.picture.loadfromfile('imagens/falas/vitoria-lobisomem.png');
   dl:=dl+1;
   label2.Caption:=inttostr(dl);
  end;
  showmessage('Você Perdeu');
  btnnovo.click;
  v:=1;
end;
if v=0 then
begin
  if (j1<>'n')and (j2<>'n')and(j3<>'n')and(j4<>'n')and(j5<>'n')and(j6<>'n')and(j7<>'n')and(j8<>'n')and(j9<>'n') then
   begin
   if rbtfacil.Checked=true then
   begin
     fala.picture.loadfromfile('imagens/falas/empate-aluno.png');
   end;
   if rbtnormal.Checked=true then
   begin
    fala.picture.loadfromfile('imagens/falas/empate-professora.png');
   end;
   if rbtimpossivel.Checked=true then
   begin
    fala.picture.loadfromfile('imagens/falas/empate-diretor.png');
   end;
   if rbtvampiro.Checked=true then
   begin
    fala.picture.loadfromfile('imagens/falas/empate-vampiro.png');
   end;;
   if rbtninja.Checked=true then
   begin
    fala.picture.loadfromfile('imagens/falas/empate-ninja.png');
   end;
   if rbtlobisomem.Checked=true then
   begin
    fala.picture.loadfromfile('imagens/falas/empate-lobisomem.png');
   end;
    showmessage('Deu Velha');
    vez:=vez+1;
    btnnovo.click;
    empate:=empate+1;
    label3.caption:=inttostr(empate);
    v:=1;
   end
end;
end;

procedure TForm1.btnzerarClick(Sender: TObject);
begin
va:=0;
vp:=0;
vd:=0;
vn:=0;
vv:=0;
vl:=0;
da:=0;
dp:=0;
dd:=0;
dn:=0;
dv:=0;
dl:=0;
inv:=0;
jogador:=0;
empate:=0;
label1.caption:=inttostr(jogador);
label3.caption:=inttostr(empate);
label2.caption:=inttostr(va);
rbtfacil.checked:=true;
invenciveis.visible:=false;
rbtvampiro.checked:=false;
rbtlobisomem.checked:=false;
rbtninja.Checked:=false;
image1.picture.loadfromfile('imagens/fundo/jogo-da-velha.jpg');
perso.Picture.loadfromfile('imagens/personagens/aluno.png');
btnnovo.click;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
controlimpos:=0;
repeat
nome:=inputbox('Jogador','Digite seu nome','');
if length(nome)>10 then
begin
  showmessage('Máximo 10 caracteres');
  nome:='';
end;
until nome<>'';
lbljogador.caption:=nome+':';
jogador:=0;
empate:=0;
perso.picture.loadfromfile('imagens/personagens/aluno.png');
fala.picture.loadfromfile('imagens/falas/ola-aluno.png');
j1:='n';
j2:='n';
j3:='n';
j4:='n';
j5:='n';
j6:='n';
j7:='n';
j8:='n';
j9:='n';
vez:=0;
btnnovo.click;
btnzerar.click;
randomize;
end;

procedure TForm1.i1Click(Sender: TObject);
begin
controlimpos:=controlimpos+1;
fala.picture.loadfromfile('imagens/vazio.gif');
rbtfacil.enabled:=false;
rbtnormal.enabled:=false;
rbtimpossivel.enabled:=false;
rbtvampiro.Enabled:=false;
rbtninja.enabled:=false;
rbtlobisomem.enabled:=false;
if j1='n' then
begin
 if rbtfacil.Checked=true then
  i1.picture.LoadFromFile('imagens/x/1.png');
 if rbtnormal.Checked=true then
  i1.picture.LoadFromFile('imagens/lousa/x/1.png');
 if rbtimpossivel.checked=true then
  i1.picture.LoadFromFile('imagens/raio/x.png');
 if rbtninja.Checked=true then
  i1.picture.LoadFromFile('imagens/asia/x.png');
 if rbtvampiro.Checked=true then
  i1.picture.LoadFromFile('imagens/vampi/x.png');
 if rbtlobisomem.Checked=true then
  i1.picture.LoadFromFile('imagens/sombrio/x.png');
 j1:='x';
 btnverificar.click;
 if v=0 then
 if rbtfacil.checked=true then
  btnjogar.Click
 else
  if rbtnormal.checked=true then
   btnjogar2.click
  else
   if rbtimpossivel.checked=true then
    btnjogar3.click
    else
     btnjogar4.click;
end;
end;

procedure TForm1.i2Click(Sender: TObject);
begin
controlimpos:=controlimpos+1;
fala.picture.loadfromfile('imagens/vazio.gif');
rbtfacil.enabled:=false;
rbtnormal.enabled:=false;
rbtimpossivel.enabled:=false;
rbtvampiro.Enabled:=false;
rbtninja.enabled:=false;
rbtlobisomem.enabled:=false;
if j2='n' then
begin
 if rbtfacil.Checked=true then 
  i2.picture.LoadFromFile('imagens/x/2.png');
 if rbtnormal.Checked=true then
  i2.picture.LoadFromFile('imagens/lousa/x/2.png');
 if rbtimpossivel.checked=true then
  i2.picture.LoadFromFile('imagens/raio/x.png');
 if rbtninja.Checked=true then
  i2.picture.LoadFromFile('imagens/asia/x.png');
 if rbtvampiro.Checked=true then
  i2.picture.LoadFromFile('imagens/vampi/x.png');
 if rbtlobisomem.Checked=true then
  i2.picture.LoadFromFile('imagens/sombrio/x.png');
 j2:='x';
 btnverificar.click;
 if v=0 then
 if rbtfacil.checked=true then  
  btnjogar.Click
 else
  if rbtnormal.checked=true then
   btnjogar2.click
  else
   if rbtimpossivel.checked=true then
    btnjogar3.click
    else
     btnjogar4.click;
end;
end;

procedure TForm1.i3Click(Sender: TObject);
begin
controlimpos:=controlimpos+1;
fala.picture.loadfromfile('imagens/vazio.gif');
rbtfacil.enabled:=false;
rbtnormal.enabled:=false;
rbtimpossivel.enabled:=false;
rbtvampiro.Enabled:=false;
rbtninja.enabled:=false;
rbtlobisomem.enabled:=false;
if j3='n' then
begin
 if rbtfacil.Checked=true then
  i3.picture.LoadFromFile('imagens/x/3.png');
 if rbtnormal.Checked=true then
  i3.picture.LoadFromFile('imagens/lousa/x/3.png');
 if rbtimpossivel.checked=true then
  i3.picture.LoadFromFile('imagens/raio/x.png');
 if rbtninja.Checked=true then
  i3.picture.LoadFromFile('imagens/asia/x.png');
 if rbtvampiro.Checked=true then
  i3.picture.LoadFromFile('imagens/vampi/x.png');
 if rbtlobisomem.Checked=true then
  i3.picture.LoadFromFile('imagens/sombrio/x.png');
 j3:='x';
 btnverificar.click;
 if v=0 then
 if rbtfacil.checked=true then
  btnjogar.Click
 else
  if rbtnormal.checked=true then
   btnjogar2.click
  else
   if rbtimpossivel.checked=true then
    btnjogar3.click
    else
     btnjogar4.click;
end;
end;

procedure TForm1.i4Click(Sender: TObject);
begin
controlimpos:=controlimpos+1;
fala.picture.loadfromfile('imagens/vazio.gif');
rbtfacil.enabled:=false;
rbtnormal.enabled:=false;
rbtimpossivel.enabled:=false;
rbtvampiro.Enabled:=false;
rbtninja.enabled:=false;
rbtlobisomem.enabled:=false;
if j4='n' then
begin
 if rbtfacil.Checked=true then 
  i4.picture.LoadFromFile('imagens/x/4.png');
 if rbtnormal.Checked=true then
  i4.picture.LoadFromFile('imagens/lousa/x/4.png');
 if rbtimpossivel.checked=true then
  i4.picture.LoadFromFile('imagens/raio/x.png');
 if rbtninja.Checked=true then
  i4.picture.LoadFromFile('imagens/asia/x.png');
 if rbtvampiro.Checked=true then
  i4.picture.LoadFromFile('imagens/vampi/x.png');
 if rbtlobisomem.Checked=true then
  i4.picture.LoadFromFile('imagens/sombrio/x.png');
 j4:='x';
 btnverificar.click;
 if v=0 then
 if rbtfacil.checked=true then  
  btnjogar.Click
 else
  if rbtnormal.checked=true then
   btnjogar2.click
  else
   if rbtimpossivel.checked=true then
    btnjogar3.click
    else
     btnjogar4.click;
end;
end;

procedure TForm1.i5Click(Sender: TObject);
begin
controlimpos:=controlimpos+1;
fala.picture.loadfromfile('imagens/vazio.gif');
rbtfacil.enabled:=false;
rbtnormal.enabled:=false;
rbtimpossivel.enabled:=false;
rbtvampiro.Enabled:=false;
rbtninja.enabled:=false;
rbtlobisomem.enabled:=false;
if j5='n' then
begin
 if rbtfacil.Checked=true then 
  i5.picture.LoadFromFile('imagens/x/5.png');
 if rbtnormal.Checked=true then
  i5.picture.LoadFromFile('imagens/lousa/x/5.png');
 if rbtimpossivel.checked=true then
  i5.picture.LoadFromFile('imagens/raio/x.png');
 if rbtninja.Checked=true then
  i5.picture.LoadFromFile('imagens/asia/x.png');
 if rbtvampiro.Checked=true then
  i5.picture.LoadFromFile('imagens/vampi/x.png');
 if rbtlobisomem.Checked=true then
  i5.picture.LoadFromFile('imagens/sombrio/x.png');
 j5:='x';
 btnverificar.click;
 if v=0 then
 if rbtfacil.checked=true then  
  btnjogar.Click
 else
  if rbtnormal.checked=true then
   btnjogar2.click
  else
   if rbtimpossivel.checked=true then
    btnjogar3.click
    else
     btnjogar4.click;
end;
end;

procedure TForm1.i6Click(Sender: TObject);
begin
controlimpos:=controlimpos+1;
fala.picture.loadfromfile('imagens/vazio.gif');
rbtfacil.enabled:=false;
rbtnormal.enabled:=false;
rbtimpossivel.enabled:=false;
rbtvampiro.Enabled:=false;
rbtninja.enabled:=false;
rbtlobisomem.enabled:=false;
if j6='n' then
begin
 if rbtfacil.Checked=true then 
  i6.picture.LoadFromFile('imagens/x/6.png');
 if rbtnormal.Checked=true then
  i6.picture.LoadFromFile('imagens/lousa/x/6.png');
 if rbtimpossivel.checked=true then
  i6.picture.LoadFromFile('imagens/raio/x.png');
 if rbtninja.Checked=true then
  i6.picture.LoadFromFile('imagens/asia/x.png');
 if rbtvampiro.Checked=true then
  i6.picture.LoadFromFile('imagens/vampi/x.png');
 if rbtlobisomem.Checked=true then
  i6.picture.LoadFromFile('imagens/sombrio/x.png');
 j6:='x';
 btnverificar.click;
 if v=0 then
 if rbtfacil.checked=true then  
  btnjogar.Click
 else
  if rbtnormal.checked=true then
   btnjogar2.click
  else
   if rbtimpossivel.checked=true then
    btnjogar3.click
    else
     btnjogar4.click;
end;
end;

procedure TForm1.i7Click(Sender: TObject);
begin
controlimpos:=controlimpos+1;
fala.picture.loadfromfile('imagens/vazio.gif');
rbtfacil.enabled:=false;
rbtnormal.enabled:=false;
rbtimpossivel.enabled:=false;
rbtvampiro.Enabled:=false;
rbtninja.enabled:=false;
rbtlobisomem.enabled:=false;
if j7='n' then
begin
 if rbtfacil.Checked=true then
  i7.picture.LoadFromFile('imagens/x/7.png');
 if rbtnormal.Checked=true then
  i7.picture.LoadFromFile('imagens/lousa/x/7.png');
 if rbtimpossivel.checked=true then
  i7.picture.LoadFromFile('imagens/raio/x.png');
 if rbtninja.Checked=true then
  i7.picture.LoadFromFile('imagens/asia/x.png');
 if rbtvampiro.Checked=true then
  i7.picture.LoadFromFile('imagens/vampi/x.png');
 if rbtlobisomem.Checked=true then
  i7.picture.LoadFromFile('imagens/sombrio/x.png');
 j7:='x';
 btnverificar.click;
 if v=0 then
 if rbtfacil.checked=true then  
  btnjogar.Click
 else
  if rbtnormal.checked=true then
   btnjogar2.click
  else
   if rbtimpossivel.checked=true then
    btnjogar3.click
    else
     btnjogar4.click;
end;
end;

procedure TForm1.i8Click(Sender: TObject);
begin
controlimpos:=controlimpos+1;
fala.picture.loadfromfile('imagens/vazio.gif');
rbtfacil.enabled:=false;
rbtnormal.enabled:=false;
rbtimpossivel.enabled:=false;
rbtvampiro.Enabled:=false;
rbtninja.enabled:=false;
rbtlobisomem.enabled:=false;
if j8='n' then
begin
 if rbtfacil.Checked=true then 
  i8.picture.LoadFromFile('imagens/x/8.png');
 if rbtnormal.Checked=true then
  i8.picture.LoadFromFile('imagens/lousa/x/8.png');
 if rbtimpossivel.checked=true then
  i8.picture.LoadFromFile('imagens/raio/x.png');
 if rbtninja.Checked=true then
  i8.picture.LoadFromFile('imagens/asia/x.png');
 if rbtvampiro.Checked=true then
  i8.picture.LoadFromFile('imagens/vampi/x.png');
 if rbtlobisomem.Checked=true then
  i8.picture.LoadFromFile('imagens/sombrio/x.png');
 j8:='x';
 btnverificar.click;
 if v=0 then
 if rbtfacil.checked=true then  
  btnjogar.Click
 else
  if rbtnormal.checked=true then
   btnjogar2.click
  else
   if rbtimpossivel.checked=true then
    btnjogar3.click
    else
     btnjogar4.click;
end;
end;

procedure TForm1.i9Click(Sender: TObject);
begin
controlimpos:=controlimpos+1;
fala.picture.loadfromfile('imagens/vazio.gif');
rbtfacil.enabled:=false;
rbtnormal.enabled:=false;
rbtimpossivel.enabled:=false;
rbtvampiro.Enabled:=false;
rbtninja.enabled:=false;
rbtlobisomem.enabled:=false;
if j9='n' then
begin
 if rbtfacil.Checked=true then
  i9.picture.LoadFromFile('imagens/x/9.png');
 if rbtnormal.Checked=true then
  i9.picture.LoadFromFile('imagens/lousa/x/9.png');
 if rbtimpossivel.checked=true then
  i9.picture.LoadFromFile('imagens/raio/x.png');
 if rbtninja.Checked=true then
  i9.picture.LoadFromFile('imagens/asia/x.png');
 if rbtvampiro.Checked=true then
  i9.picture.LoadFromFile('imagens/vampi/x.png');
 if rbtlobisomem.Checked=true then
  i9.picture.LoadFromFile('imagens/sombrio/x.png');
 j9:='x';
 btnverificar.click;
 if v=0 then
 if rbtfacil.checked=true then
  btnjogar.Click
 else
  if rbtnormal.checked=true then
   btnjogar2.click
  else
   if rbtimpossivel.checked=true then
    btnjogar3.click
    else
     btnjogar4.click;
end;
end;

procedure TForm1.Instrues1Click(Sender: TObject);
begin
btninstrucoes.click;
end;

procedure TForm1.Multiplayer1Click(Sender: TObject);
begin
btnmulti.click;
end;

procedure TForm1.NovoJogador1Click(Sender: TObject);
begin
btnnovojog.click;
end;

procedure TForm1.NovoJogo1Click(Sender: TObject);
begin
btnnovo.click;
end;

procedure TForm1.PlacarGeral1Click(Sender: TObject);
begin
btnplacar.click;
end;

procedure TForm1.rbtfacilClick(Sender: TObject);
begin
vez:=0;
btnnovo.click;
fala.picture.loadfromfile('imagens/falas/ola-aluno.png');
image1.Picture.loadfromfile('imagens//fundo/jogo-da-velha.jpg');
perso.picture.loadfromfile('imagens/personagens/aluno.png');
lblcomputador.caption:='Aluno';
label2.caption:=inttostr (da);
rbtvampiro.checked:=false;
rbtninja.checked:=false;
rbtlobisomem.Checked:=false;
end;

procedure TForm1.rbtimpossivelClick(Sender: TObject);
begin
vez:=0;
btnnovo.click;
fala.picture.loadfromfile('imagens/falas/ola-diretor.png');
image1.Picture.loadfromfile('imagens//fundo/raio.jpg');
perso.picture.loadfromfile('imagens/personagens/diretor.png');
label2.caption:=inttostr(dd);
lblcomputador.caption:='Diretor';
rbtvampiro.checked:=false;
rbtninja.checked:=false;
rbtlobisomem.Checked:=false;
end;

procedure TForm1.rbtlobisomemClick(Sender: TObject);
begin
vez:=0;
btnnovo.click;
fala.picture.loadfromfile('imagens/falas/ola-lobisomem.png');
image1.Picture.loadfromfile('imagens//fundo/sombrio.jpg');
perso.picture.loadfromfile('imagens/personagens/lobisomem.png');
label2.caption:=inttostr(dl);
lblcomputador.caption:='Lobisomem';
rbtfacil.checked:=false;
rbtnormal.checked:=false;
rbtimpossivel.Checked:=false;
end;

procedure TForm1.rbtninjaClick(Sender: TObject);
begin
vez:=0;
btnnovo.click;
fala.picture.loadfromfile('imagens/falas/ola-ninja.png');
image1.Picture.loadfromfile('imagens//fundo/asia.jpg');
perso.picture.loadfromfile('imagens/personagens/ninja.png');
label2.caption:=inttostr(dn);
lblcomputador.caption:='Ninja';
rbtfacil.checked:=false;
rbtnormal.checked:=false;
rbtimpossivel.Checked:=false;
end;

procedure TForm1.rbtnormalClick(Sender: TObject);
begin
vez:=0;
btnnovo.click;
fala.picture.loadfromfile('imagens/falas/ola-professora.png');
image1.Picture.loadfromfile('imagens//fundo/lousa.jpg');
perso.picture.loadfromfile('imagens/personagens/professora.png');
label2.caption:=inttostr(dp);
lblcomputador.caption:='Professora';
rbtvampiro.checked:=false;
rbtninja.checked:=false;
rbtlobisomem.Checked:=false;
end;

procedure TForm1.rbtvampiroClick(Sender: TObject);
begin
vez:=0;
btnnovo.click;
fala.picture.loadfromfile('imagens/falas/ola-vampiro.png');
image1.Picture.loadfromfile('imagens//fundo/vampi.jpg');
perso.picture.loadfromfile('imagens/personagens/vampiro.png');
label2.caption:=inttostr(dv);
lblcomputador.caption:='Vampiro';
rbtfacil.checked:=false;
rbtnormal.checked:=false;
rbtimpossivel.Checked:=false;
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
application.terminate;
end;

procedure TForm1.Sobre1Click(Sender: TObject);
begin
btnsobre.click;
end;

procedure TForm1.ZerarPlacar1Click(Sender: TObject);
begin
btnzerar.Click;
end;

end.
