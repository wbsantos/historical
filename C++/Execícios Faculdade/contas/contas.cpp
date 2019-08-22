#include<iostream>
#include<vector>
#include<cstdlib>
using namespace std;

int lercontas(vector<float> &conta);
int analisar(vector<float> &conta,vector<int> &pag,float &valp, int &qcont,float &total2);
int calc(vector<float> &conta,vector<int> &pag,float &valp, int &qcont, int &qvalt, int max, float total2);
int pot(int base, int expoente);
string dec_bin(int num,int base, int x) ;
void menu();

int main()
{
  menu();
  return 0;
}

void menu()
{
  int qcont,i, escolha=1; //quantidade de contas
  int qvalt;//quantidade de contas a serem utilizadas
  float valp, total; //valor a pagar e total de saldo
  vector<float> conta;
  vector<int> pag; //para saber quais contas utilizar
  while(escolha!=2)
  {
    cout << "1- Entrar no sistema" << endl;
    cout << "2- Sair" << endl;
    cin >> escolha;
    if(escolha==2)
      break;
    system("cls");
    qcont=lercontas(conta);
    cout << "\nQuanto voce deve pagar?  R$ ";
    cin >> valp;
    qvalt=analisar(conta,pag,valp,qcont,total);
    if(qvalt==0)
      cout << "Operacao nao pode ser efetuada" << endl;
    else
    {
      total=0;
      for(i=0;i<qvalt;i++)
      {
        cout << "Conta: " << pag[i]+1 << endl;
        total+=conta[pag[i]];
      }
      cout << "\nTotal pago: R$ " << total << "\nTotal perdido: R$ " << total-valp;
    }
    cin.get();
    cin.get();
    system("cls");
  }
}

int pot(int base, int expoente)
{
  if(expoente == 0)
    return 1;
  else
    return (base * pot(base, expoente - 1));
}

string dec_bin(int num,int base, int x) 
{
  int y; 
  string w, resul, conv="0123456789";
  do
  {
    y=num % base;
    num=num/base;
    w=conv[y];
    w=w+resul;
    resul=w;
  } while (num>=base);
  if(conv[num]!='0')
  {
    w=conv[num];
    w=w+resul;
    resul=w;
  }
  while (resul.size()<x)
    resul.insert(0,"0");
  return resul;
}

int analisar(vector<float> &conta,vector<int> &pag,float &valp, int &qcont, float &total2 )
{
  int i,j,p,qvalt=0;//p=possibilidade qvalt=numero de contas utilizadas
  string poss; //rescebe as possibilidades em binario
  float total=0;//total de saldo
  pag.clear();
  for(i=0;i<qcont;i++)
    total+=conta[i];  
  if(total<valp)
    return 0;
  else
  {
    p=pot(2,qcont);
    for(i=1;i<p;i++)
    {
      total2=0;
      poss=dec_bin(i,2,qcont);
      for(j=0;j<qcont;j++)
      {
        if(poss[j]=='1')
          total2+=conta[j];                     
      } 
      if(total2<=total && total2>=valp) 
      {
        pag.clear();
        qvalt=0;
        for(j=0;j<qcont;j++)
        {
          if(poss[j]=='1')
          {
            pag.push_back(j); 
            qvalt++;            
          }                
        }    
        if(total2==valp)
        {
          return qvalt;      
        }    
      }  
      if (total2>valp && total2<total)
        total=total2;   
    } 
  }
  return qvalt;
}


int lercontas(vector<float> &conta)
{
  int qcont,i; 
  float val; // valor das contas
  conta.clear();
  cout << "Quantas contas voce possui?  ";
  cin >> qcont;
  cout << "\nUtilize ponto ao inves de virgula" << endl;
  for(i=0;i<qcont;i++)
  {
    cout << "Digite o valor da conta " << i+1 << ": R$ ";
    cin >> val;
    conta.push_back(val);
  }
  return qcont;
}    
