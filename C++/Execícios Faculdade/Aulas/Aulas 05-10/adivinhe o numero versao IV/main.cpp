#include<iostream>
#include<stdlib.h>
#include<windows.h>
using namespace std;

int mini,maxi,tent=0,limit,x,y;


int randomize (int de, int ate);
bool reset();
void newgame();
void ingame();
void dica();


void ingame()
{
  tent++;
  cout << "\n***************************************************************************" << endl;
  cout << "\nTentativa "<< tent <<" de " << limit << "\nTente adivinhar o numero sorteado pelo sistema: ";
  cin >> y;
  if (x==y)
    cout << "\nParabens, voce ganhou na tentativa " << tent << endl;  
  else if(limit>tent)
    dica();
  else
    cout << "\nVoce perdeu, gastou todas as chances.\nComece um novo jogo e tente denovo" << endl;   
}

void dica()
{
  if(x>y)
    cout << "\n Aposte mais alto" << endl;
  else if (x<y)
    cout << "\nAposte mais baixo" << endl;   
  ingame();  
}


int randomize(int de, int ate)
{
  ate -= de;
  return (rand()%(ate+1)+de);   
}

bool reset()
{
  bool jogar;
  cout << "\n************************" << endl;
  cout << "**    0- Novo jogo    **" << endl;
  cout << "**    1- Sair         **" << endl;
  cout << "************************" << endl;
  cin >> jogar;
  if (!jogar)
    newgame();
  return jogar;
}

void newgame()
{
  int aux;
  cout <<"\nDigite o numero minimo e depois o maximo para o computador fazer o sorteio" << endl;  
  cin >> mini >> maxi;
  if (mini>maxi)
  {
    aux=maxi;
    maxi=mini;
    mini=aux;            
  }
  tent=0;
  limit=(((maxi-mini)/10) + 2); 
  x=randomize(mini,maxi);
  ingame();
}

int main()
{
  srand(GetTickCount());
  cout << "Seja BEM VINDO ao Adivinhe o Numero Versao IV, DIVIRTA-SE" << endl;
  while(!reset())
  {  }
  cin.get();
  return 0;
}
