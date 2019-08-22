#include <windows.h>
#include <iostream>
#include <string>
using namespace std;

int randomize(int de, int ate);
int tamanho(string &str);
bool verstr(string &str, string &tent);
void verletra(string &str, string &letra, bool *teste);
void palavras(string &str);
void menu();
void novo_jogo();
void desco(string &desc, string &str, bool *teste);
void apresentar(string &desc, int &t);

void novo_jogo()
{
  short unsigned int i;
  int t=0;
  string str,tent,desc,erro;
  palavras(str);
  desc.resize(tamanho(str));  
  bool teste[tamanho(str)];
  for (i=0;i<=tamanho(str);i++)
    teste[i]=0;
  desco(desc,str,&teste[0]);
  cout << "Tente Adivinhar, Digite uma unica letra se nao quiser arriscar a palavra inteira" << endl;
  while(t<=8)
  {
    cout << endl << endl << "Erros: " << t << endl;
    apresentar(desc,t);       
    cout << "Digite seu chute: ";
    cin >> tent;
    if (tamanho(tent)>1)
    {
      if (verstr(str,tent))
        t=10;
      else
      {
        cout << "\nVoce tentou a palavra inteira e errou, isso vai te custar 2 pontos" << endl;
        t+=2;    
      }
    }
    else
    {
      erro=desc;
      verletra(str,tent,&teste[0]);
      desco(desc,str,&teste[0]);
      if (erro==desc)
      {
        cout << "\nNao ha essa letra, isso vai te custar um ponto" << endl;
        t++;
      }
      if (desc==str)
        t=10;
    } 
  }
  if((str!=tent)&&(str!=desc))
  {
    apresentar(desc,t);
    cout << "\nInfelizmente voce nao consegui acertar, tente jogar de novo" << endl << endl;
    menu();
  }
  else
  {
    desc=str;
    apresentar(desc,t);  
    cout << "\nParabens, voce acertou a palavra, tente jogar de novo" << endl << endl;
    menu();
  }
}

void apresentar(string &desc, int &t)
{
  char f1=201,f2[15],f3=187,f4=186,f5=179;
  short unsigned i;
  for(i=0;i<15;i++)
    f2[i]=205;
  cout << f1 << f2 << f3 << endl;
  
  t>=1 ? cout << f4 << "               O" << endl : cout << f4 << endl ;
  
  if(t==2)
    cout << f4 << "               " << f5 << endl;
  else if(t==3)
    cout << f4 << "              /" << f5 << endl;
  else if(t>3)
    cout << f4 << "              /" << f5 << "\\ " << endl;
  else
    cout << f4 << endl;
    
  if(t==5)
    cout << f4 << "              /" << endl;
  else if(t>5)
    cout << f4 << "              / \\ " << endl;
  else 
    cout << f4 << endl;
    
  if(t==7)
    cout << f4 << "              " << f5 << endl;
  else if(t>7)
    cout << f4 << "              " << f5 << " " << f5 << endl; 
  else
    cout << f4 << endl;
    
  cout << f4 << endl;
  cout << f4 << "   " << desc << "  " << tamanho(desc) << " letras" << endl << endl;
}

void desco(string &desc, string &str, bool *teste)
{
  short unsigned int i;
  for(i=0;i<=tamanho(str);i++)
    if (*(teste+i))
      desc[i]=str[i];
    else
      desc[i]='-';
}     

void menu()
{
  short unsigned int escolha;
  cout << "Jogo da forca 1.0" << endl << "Seja Bem Vindo!" << endl;
  cout << "\n1- Novo Jogo\n2-Sair" << endl;
  cin >> escolha;
  if(escolha==1)
    novo_jogo(); 
}

void palavras(string &str)
{
  switch(randomize(1,10))
  {
    case 1:
         str="casa";
         break;
    case 2:
         str="bola";
         break;
    case 3:
         str="escritorio";
         break;
    case 4:
         str="computador";
         break;
    case 5:
         str="forca";
         break;
    case 6:
         str="tempo";
         break;
    case 7:
         str="acidente";
         break;
    case 8:
         str="acertou";
         break;
    case 9:
         str="paralelepipedo";
         break;
    case 10:
         str="cozinha";
         break;
    default:
         str="casa";
         break;
  }     
}

int tamanho (string &str)
{
  return ((int)str.size());    
}

bool verstr(string &str, string &tent)
{
  if(str==tent)
    return 1;
  else
    return 0;     
}

void verletra(string &str, string &letra, bool *teste)
{
  short unsigned int i;
  for(i=0;i<=(tamanho(str));i++)
  {
    if(str[i]==letra[0])
      *(teste+i)=1;
    else if (!(*(teste+i)))
      *(teste+i)=0;             
  }         
}




int randomize(int de, int ate)
{
  srand(GetTickCount());
  ate-=de;
  return (rand()%(ate-1)+de);
}


int main()
{
    menu();
    cin.get();
    return 0;
}
