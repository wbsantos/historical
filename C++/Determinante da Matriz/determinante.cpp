#include <iostream>
#include <vector>
#include <windows.h>
using namespace std;

void gotoxy(int x, int y)
{
  COORD c;
  c.X = x - 1; 
  c.Y = y - 1; 
  SetConsoleCursorPosition (GetStdHandle(STD_OUTPUT_HANDLE), c); 
}

void ler(vector < vector <double> > &matriz,int &x)
{
  int j,i, cx=4, cy=4;
  cout << "Em uma matriz de X colunas e X linhas digite o valor de X: ";
  cin >> x;
  matriz.resize(x);
  for(i=0;i<x;i++)
    matriz[i].resize(x);
  system("cls");
  cout << "Digite os valores";
  for(j=0;j<x;j++)
  {
    for(i=0;i<x;i++)
    {
      gotoxy(cx,cy);
      cin >> matriz[j][i];
      cx+=8;
    } 
    cy+=2;    
    cx=4;
  }
}

double gauss(vector < vector <double> > &matriz, int &x)
{
  int i,j,k;
  double aux,det=1;
  for(i=0;i<x-1;i++)
  {
    for(k=i+1;k<x;k++)
    {
      aux=matriz[k][i]/matriz[i][i];
      for(j=0;j<x;j++)
      {
        matriz[k][j]=matriz[k][j]-(aux)*matriz[i][j]; 
      }
    }
  }
  for(i=0;i<x;i++)
    det*=matriz[i][i];
  return det;  
}

int main ()
{
  vector < vector <double> > matriz;
  int x;
  ler(matriz, x);
  cout << "\nA determinante da matriz e: " << gauss(matriz,x);
  cin.get();
  cin.get();
  return 0;
}
