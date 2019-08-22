#include <windows.h>
#include <iostream>

using namespace std;

int randomize(int de, int ate)
{
  ate-=de;
  return (rand()%(ate+1)+de);    
}

struct personagem
{
  int hp;       
  int mp;
  int maxhp;
  int maxmp;
  int forca;
};

struct monstro
{
  int hp;
  int maxhp;
  int forca;
  char *nome;
};

personagem player ={50,10,50,10,10};
monstro orc={40,40,15,"Orc"};
monstro troll={60,60,20,"Troll"};
monstro rino={80,80,25,"Rino"};
monstro zenus={100,100,30,"Zenus"};
monstro fodius={150,150,35,"Fodius"};

void menujogo();
void chamada(monstro monster);
void menubatle(monstro monster);
void ganhou();
void perdeu();
int monsterataque(int forca);

void perdeu()
{
  cout << "\nVoce morreu, agora voce cai um nivel :(\n\n\n\n" << endl;
  if (player.maxhp>50)
  {
    player.maxhp-=10;
    player.maxmp-=10;
    player.forca-=2;
  }
  player.hp=player.maxhp;
  player.mp=player.maxmp;
  menujogo();     
}

void ganhou()
{
  cout << "\nVoce venceu, agora voce sobe um nivel :)\n\n\n\n" << endl;
  player.maxhp+=10;
  player.maxmp+=10;
  player.forca+=2;
  player.hp=player.maxhp;
  player.mp=player.maxmp;
  menujogo(); 
}

void menujogo()
{
  int escolha;
  cout << "\nEscolha um adversario" << endl;
  cout << "\n1- Orc" << endl;
  cout << "2- Troll" << endl;
  cout << "3- Rino" << endl;
  cout << "4-Zenus" << endl;
  cout << "5-Fodius" << endl;
  cin >> escolha;
  switch (escolha)
  {
    case 1:
         chamada(orc);
         break;
    case 2:
         chamada(troll);
         break;
    case 3:
         chamada(rino);
         break;
    case 4:
         chamada(zenus);
         break;
    case 5:
         chamada(fodius);
         break;
    default:
         cout << "\nEscolha invalida." << endl;
         menujogo();
         break;
  }    
}

void chamada(monstro monster)
{
  cout << "\n\n\n\nApareceu um " << monster.nome << endl;
  menubatle(monster);
}

void menubatle(monstro monster)
{
  int escolha,random;
  cout << "\n\n\n\nPlayer: HP: " << player.hp << "/" << player.maxhp << ", MP: " << player.mp << "/" << player.maxmp << endl;
  cout << monster.nome << ": HP: " << monster.hp << "/" << monster.maxhp << endl;
  cout << "\nEscolha um ataque\n1- Bola de Energia" << endl;
  cout << "2- Raios Lasers" << endl;
  cout << "3- Terremoto" << endl;
  cin >> escolha;
  switch (escolha)
  {
    case 1:
         monster.hp-=2*player.forca;    
         cout << "\nBOLA DE ENERGIA!" << endl;
         break;   
    case 2:
         if (player.mp>=5)
         {
           monster.hp-=3*player.forca;    
           player.mp-=5;
           cout << "\nRAIOS LASERS!" << endl;
         }
         else
           menubatle(monster);
         break;  
    case 3:
         if (player.mp>0)
         {
           random=randomize(1,3);
           switch(random)
           {
             case 1:           
                  monster.hp-=5*player.forca;    
                  player.mp=0;
                  cout << "\nTTTEEERRREEEMMMOOOTTTOOO!!!" << endl;
                  break;
             case 2:
             case 3:
                  player.mp-=7;
                  cout <<"\nO ataque falhou." << endl;
                  break;
           }
         }
         else
           menubatle(monster);
         break; 
    default:
         cout << "\nEscolha Invalida" << endl;
         menubatle(monster);
         break; 
  }
  if (monster.hp>0)
  {
    player.hp-=monsterataque(monster.forca);
    if (player.hp<=0)
      perdeu();
    else
      menubatle(monster);
  }
  else
    ganhou(); 
}

int monsterataque(int forca)
{
  int random=randomize(1,6);
  switch(random)
  {
    case 1:
    case 2:
    case 3:
         cout << "\nVoce levou um golpe de raspao" << endl;
         return (forca);
         break;
    case 4:
    case 5:
         cout << "\nVoce levou um golpe forte" << endl;
         return (forca*2);
         break;
    case 6:
         cout << "\nVoce levou um golpe muito forte" << endl;
         return (forca*3);    
         break;                  
  }
}

int main()
{
    srand(GetTickCount());
    menujogo();    
    cin.get();
    return 0;
}
