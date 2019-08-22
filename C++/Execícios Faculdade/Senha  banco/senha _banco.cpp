#include<iostream>
#include<string>
#include<vector>
using namespace std;

void ler(int &n, vector<string> &teste, vector<string> &saida);
void analisar(int &n, vector<string> &teste, vector<string> &saida);
string dec_bin(int num,int base, int x);
int pot(int base, int expoente);

int main()
{
  int i,n;
  vector<string> teste;
  vector<string> saida;
  ler(n, teste, saida);
  n=saida.size();
  for(i=0;i<n;i++)
  {
    cout << endl << "Teste " << i+1 << endl;
    cout << saida[i] << endl;
  }
  cin.get();
  cin.get();
  return 0;    
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

void ler(int &n, vector<string> &teste, vector<string> &saida)
{
  int i;
  string temp;
  do{
    teste.clear();
    do{
      cout << "\nDigite o numero de associacoes (digite 0 para encerrar)\nn>1 e n<11: ";   
      cin >> n;
    }while(n!=0 && (n<2 || n>10));
    if(n==0)
      break;
    cout << "\nAgora digite as linhas testes (nao use espacos):" << endl;
    for(i=0;i<n;i++)
    {
      cin >> temp;
      teste.push_back(temp);                
    }
    analisar(n, teste, saida);
  }while(n!=0);
}

void analisar(int &n, vector<string> &teste, vector<string> &saida)
{
  int i,j,p,k;
  bool ver;    
  string temp,senha;
  vector<string>testep;
  vector<int>bin;
  senha.clear();
  p=pot(2,n);
  for(i=10;i<16;i++)
  {
    testep.clear();
    for(j=0;j<n;j++)
    {
      temp.resize(2);
      if(teste[j][i]<97)
      {
        temp[0]=teste[j][(teste[j][i]-65)*2];
        temp[1]=teste[j][(teste[j][i]-65)*2+1];
      }
      else
      {
        temp[0]=teste[j][(teste[j][i]-97)*2];
        temp[1]=teste[j][(teste[j][i]-97)*2+1];
      }
      testep.push_back(temp);
    } 
    for(j=0;j<=p;j++)
    {
      ver=true;
      temp=dec_bin(j,2,n);
      bin.clear();
      for(k=0;k<n;k++)
        temp[k]=='0' ? bin.push_back(0) : bin.push_back(1);  
      for(k=1;k<n;k++)
      {  
        if(testep[0][bin[0]]!=testep[k][bin[k]])
        {
          ver=false;   
          break;
        }
      }
      if(ver==true)
      {
        senha=senha+testep[0][bin[0]]+' '; 
        break;            
      }            
    }                 
  }
  saida.push_back(senha);
}

