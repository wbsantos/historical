#include<iostream>
#include<vector>
using namespace std;
/*Dados dois naturais m e n determinar, entre todos os pares de números naturais 
(x,y) tais que x < m e y < n, um par para o qual o valor da expressão xy - x2 + y
 seja máximo e calcular também esse máximo. */
 
void checarpares(vector<int> &resul, vector<int> &xx, vector<int> &yy,int &m, int &n)
{
  int x,y;
  for(x=0;x<=m;x++)
  {
    if(x<m)
    {
      for(y=0;y<=n;y++)
      {
        if(y<n)
        {
          resul.push_back(x*y-x*x+y);
          xx.push_back(x);
          yy.push_back(y);
        }       
      }
    }                
  }     
}
void ordenar(vector<int> &ii, vector<int> &xx, vector<int> &yy, int &k)
{
    int j,i;
    for (j=k;j>=0;j--)
    {
      for(i=0;i<k-1;i++)
      {
        if(ii[i+1]>ii[i])
        {
          ii[i+1]^=ii[i];
          ii[i]^=ii[i+1];
          ii[i+1]^=ii[i];
          xx[i+1]^=xx[i];
          xx[i]^=xx[i+1];
          xx[i+1]^=xx[i];
          yy[i+1]^=yy[i];
          yy[i]^=yy[i+1];
          yy[i+1]^=yy[i];
        }
      }
    }
}
 
int main()
{  
  int  m=1,n=1,k;
  vector <int> resul, xx, yy;
  while(m!=0 && n!=0)
  {
    cout << "Digite os valores de M e N para que o programa determine o maximo da funcao: " << endl;
    cout << "XY-XX+Y, onde X e Y são numeros pares menores que M e N respectivamente." << endl;
    cout << "Para sair digite 0 para os dois valores." << endl;
    cin >> m >> n;
    if(m!=0 && n!=0)
    {
      checarpares(resul, xx,yy,m,n);
      k=resul.size();
      ordenar(resul, xx, yy, k);
      cout << "\nO valor maximo da funcao XY-XX+Y, para X%2=0, Y%2=0, X<M, Y<N: " << endl << "MAXIMO=" << resul[0];
      cout << endl << "Onde X=" << xx[0] << ", e Y=" << yy[0] << "\n-------------------------------------------------\n\n";
      resul.clear();
      xx.clear();
      yy.clear();
    }
  }
  return 0;
}
