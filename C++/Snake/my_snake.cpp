/*É um jogo no estilo snake mas com algumas diferenças do estilo conhecido do
game*/

#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<windows.h>

int sx,sy,velo, reinicio, sair, controlvelo, fase; 
/* variaveis X de snake, Y de snake, velocidade de snake...
 reinicio do nivel, saida do game, controle de velocidade e controle de fases*/
int ver[80][23];  //variável de verificação para saber se snake bateu

void limparver();
void gotoxy(int x, int y);
void quadro();
void parede(int i1,int i2, int eixo, int loc);
void nivel(int niv);
void mover(int dir);
void comandos(int com);
void velocidade(int nv);

void limparver() //limpara variavel de verificação
{
  int ix,iy; //indices dos laços
  for (ix=0;ix<=80;++ix)
    for (iy=0;iy<=23;++iy)
      ver[ix][iy]=0;  
}

void gotoxy(int x, int y) //setar cursor
{
  COORD c; //variavel de coordenada (x,y)
  c.X = x - 1; //como c.x e c.y iniciam no 0, definir um número a menos...
  c.Y = y - 1; //... do informado para setar o cursor no lugar correto
  SetConsoleCursorPosition (GetStdHandle(STD_OUTPUT_HANDLE), c); 
  //setando cursor (comando da biblioteca windows.h)
}

void quadro() //desenhar quadro
{
  int i;  //variavel índice
  i=0;    //zerando váriavel
  for(i=0;i<=80;i++) //laço para desenhar linhas horizontais do quadro
  {
    gotoxy(i,1); //setando cursor
    printf("%c",177); //desenhando quadro
    ver[i][1]=1; //definindo quadro como ocupado
    gotoxy(i,23);
    printf("%c",177);
    ver[i][23]=1;
  }
  for(i=2;i<=22;i++)//laço para desenhar linhas verticais do quadro
  {
    gotoxy(1,i);
    printf("%c",177);
    ver[1][i]=1;
    gotoxy(80,i);
    printf("%c",177);
    ver[80][i]=1;
  }
  gotoxy(2,24);
  printf("Pressione ESC para encerrar         Pressione espaco para pausar");
  gotoxy(2,25);
  printf("Numeros de 0 ate 4 velocidade       Letras de a ate g niveis");
  gotoxy(70,24);
  printf("%c",177);
  gotoxy(70,25);
  printf("%c",177);
}

void parede(int i1,int i2, int eixo, int loc) //criando parades do labirinto
/*   i1=indice incial, 
     i2=indice final, 
     eixo= para definir se vai desenhar uma linha ou coluna
     loc=locação (para definir qual a linha/coluna de deseho da parede)
     
     exemplo1: parede(1,10,1,40);
     vai desenhar da linha 1 até a linha 10 na coluna 40 (cria uma coluna)
     
     exemplo2: parede(1,10,0,40);
     vai desenhar da coluna 1 até a coluna 10 na linha 40 (cria uma linha)
*/
{
  int i;
  if (eixo==0)
  {
    for (i=i1;i<=i2;++i)
    {
     gotoxy(i,loc);
     printf("%c",177);
     ver[i][loc]=1;    
    }
  }
  else
  {
    for (i=i1;i<=i2;++i)
    {
     gotoxy(loc,i);
     printf("%c",177);
     ver[loc][i]=1;    
    }  
  }  
}

void nivel(int niv) //desenhar níveis
{
  system("cls");
  quadro();
  switch (niv)
  {
    case 0:
      gotoxy(73,24);
      printf("Nivel A");
      gotoxy(75,5);
      printf("@");
      ver[75][5]=2;
      break;
    case 1:
      parede(2,6,1,40);
      parede(12,23,1,40);
      gotoxy(73,24);
      printf("Nivel B");
      gotoxy(75,20);
      printf("@");
      ver[75][20]=2;
      break;
    case 2:
      parede(9,23,1,20);
      parede(2,16,1,40);
      parede(40,65,0,10);
      gotoxy(73,24);
      printf("Nivel C");
      gotoxy(42,7);
      printf("@");
      ver[42][7]=2;
      break;
    case 3:
      parede(6,23,1,27);
      parede(27,70,0,6);
      parede(6,18,1,70);
      parede(35,70,0,18);
      parede(12,18,1,35);
      parede(6,14,1,50);
      gotoxy(73,24);
      printf("Nivel D");
      gotoxy(67,8);
      printf("@");
      ver[67][8]=2;
      break;  
    case 4:
      parede(2,30,0,14);
      parede(6,19,1,30);
      parede(30,50,0,6);
      parede(10,23,1,37);
      parede(6,19,1,45);
      parede(45,73,0,15);
      parede(60,80,0,6);
      gotoxy(73,24);
      printf("Nivel E");
      gotoxy(3,12);
      printf("@");
      ver[3][12]=2;
      break;     
    case 5:
      parede(5,23,1,10);  
      parede(2,19,1,15); 
      parede(10,23,1,20);
      parede(15,70,0,4);  
      parede(4,19,1,25);
      parede(25,45,0,19); 
      parede(8,23,1,50);
      parede(33,50,0,15);
      gotoxy(73,24);
      printf("Nivel F");
      gotoxy(19,3);
      printf("@");
      ver[19][3]=2;
      break;
    case 6:
      parede(5,23,1,10);  
      parede(2,19,1,15); 
      parede(10,23,1,20);
      parede(15,26,0,4);  
      parede(31,74,0,4); 
      parede(4,19,1,25);
      parede(25,45,0,19); 
      parede(5,23,1,50);
      parede(33,50,0,15);
      parede(25,43,0,10);
      parede(4,19,1,74);
      parede(9,23,1,68);
      parede(56,68,0,9);
      parede(9,19,1,56);
      parede(16,23,1,63);
      gotoxy(73,24);
      printf("Nivel G");
      gotoxy(66,21);
      printf("@");
      ver[66][21]=2;
      break;
  }
}

void mover(int dir) //movimentar snake
{
  switch (dir)
  {
    case 75: //esquerda
      --sx;;
      break;
    case 77: //direita
      ++sx;
      break;
    case 72: //cima
      --sy;
      break;
    case 80: //baixo  
      ++sy;
      break;
  }    
}

void comandos(int com) //comandos do game
{
  int repetir; /*controle de repetição de comando,
                caso o usuário digite um comando no pause*/
  do //esse laço só vai repetir uma vez e somente se o usuário estiver no pause
  {
    repetir=0;
    switch (com)
    {
       case 32: //espaço (pausa o game)
         com=getch();
         if (com!=32) //caso o usuario não aperte o pause novamente
           repetir=1; //repetir para saber qual foi o comando inserido
         break; 
       case 13: //enter (reinicia o nível)
         reinicio=1;
         break;    
       case 27: //esc (encerra o game)
         sair=1;
         reinicio=1;
         break; 
       case 48: //0 (define velocidade como 0)
         controlvelo=0;
         velocidade(controlvelo);
         break;
       case 49: //1 (define velocidade como 1)
         controlvelo=1;
         velocidade(controlvelo);
         break;
       case 50: //2 (define velocidade como 2)
         controlvelo=2;
         velocidade(controlvelo);
         break;
       case 51: //3 (define velocidade como 3)
         controlvelo=3;
         velocidade(controlvelo);
         break;
       case 52: //4 (define velocidade como 4)
         controlvelo=4;
         velocidade(controlvelo);
         break;
       case 97: //a (fase 0)
         reinicio=1;
         fase=0;
         break;
       case 98: //b (fase 1)
         reinicio=1;
         fase=1;
         break;
       case 99: //c (fase 2)
         reinicio=1;
         fase=2;
         break;
       case 100:  //d (fase 3)
         reinicio=1;
         fase=3;
         break;
       case 101: //e (fase 4)
         reinicio=1;
         fase=4;
         break;
       case 102: //f (fase 5)
         reinicio=1;
         fase=5;
         break;
       case 103: //g (fase 6)
         reinicio=1;
         fase=6;
         break;
     }  
  }while(repetir==1);  
}

void velocidade(int nv) //define o numero da velocidade
{
  switch(nv)
  {
    case 0:
      velo=100;
      gotoxy(73,25);
      printf("Velo 0");
      break;
    case 1:
      velo=75;
      gotoxy(73,25);
      printf("Velo 1");
      break;
    case 2:
      velo=50;
      gotoxy(73,25);
      printf("Velo 2");
      break;
    case 3:
      velo=25;
      gotoxy(73,25);
      printf("Velo 3");
      break;  
    case 4:
      velo=15;
      gotoxy(73,25);
      printf("Velo 4");
      break;
  }    
}


main() //corpo principal do programa
{
   int dir,com;   //varaveis de direção, comando e controle de fases
   sair=0;
   fase=0;
   controlvelo=1;
   while (sair==0) //laço do game, quando sair do laço encerra o jogo
   {
     if (fase==7)                    //se já passou todas as fases...
     {
       fase=0;                  //...retornar à fase inicial...
       if (controlvelo<=4)     //... e se a velocidade não estiver no máximo...
         controlvelo=controlvelo+1;//...aumentar velocidade
     }
     limparver();
     nivel(fase);   //função para desenhar as paredes limitadoras de cada nível
     sx=5;          //X de snake
     sy=16;         //Y de snake
     dir=77;        //iniciando direção como direita
     velocidade(controlvelo);  //função para definir velocidade
     reinicio=0;               //zerando variavel de reinicio
     com=32;                   //iniciando jogo no pause
     gotoxy(sx,sy);            //setando cursor para o jogador saber onde está
     while(reinicio==0)        //laço de movimento
     {
       if(kbhit())     //se uma tecla for pressionada
         com=getch();  //armazenar código da tecla na variável de comando(com)
       //se não for uma tecla direcional (setas)
       if ((com!=75)&&(com!=77)&&(com!=72)&&(com!=80))
         comandos(com);//função para realizar comandos
       else            //se for uma tecla direcional (setas)
         dir=com;      //atribuir valor à váriavel de direção
       com=dir;       /*igualando valor de "com" com "dir" 
                       para não cair na condição acima descrita novamente*/
       mover(dir);    //função para movimento de snake
       if (ver[sx][sy]==0)  //verifica se o quadro não está ocupado
       {     
         gotoxy(sx,sy);     //definindo onde desenhar snake
         printf("%c",219);  //desenhando snake
         ver[sx][sy]=1;     //definindo quadro como ocupado
         _sleep(velo);      //esperar x milisegundos
       }
       else if (ver[sx][sy]==1)//se o quadro estiver ocupado por parede
         reinicio=1;           //reinicia nivel
       else if (ver[sx][sy]==2)//se o quadro estiver ocupado por @
       {
         reinicio=1;           //reinicia
         fase=fase+1;          //passa nivel
       }
       if(kbhit())    //repetição da verificação de tecla para não...
         com=getch(); //...ter atraso caso duas teclas sejam teclada rapidamente
     }
   } 
}
