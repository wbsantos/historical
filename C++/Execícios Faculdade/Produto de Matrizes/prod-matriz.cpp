#include <iostream>
using namespace std;

int main () 
{
  int i,j,k,x,y,z;//I, J e K controlam os laços, demais controlam tamanho das matrizes
  
  //Recebendo ordem das matrizes
  cout << "Em uma Matriz A de ordem X por Y \ne matriz B de ordem Y por Z digite os valores: " << endl;
  cout << "X= ";
  cin >> x;
  cout << "Y= ";
  cin >> y;
  cout << "Z= ";
  cin >> z;
  
  int a[x][y],b[y][z],c[x][z];
  
  //Recebendo valor das matrizes A e B  
  for(i=0;i<x;i++)
    for(j=0;j<y;j++)
    {
      cout << "A[ " << i << " ] [ " << j << " ] = ";
      cin >> a[i][j];
    }
  for(i=0;i<y;i++)
    for(j=0;j<z;j++)
    {
      cout << "B[ " << i << " ] [ " << j << " ] = ";
      cin >> b[i][j];
    }

  //Zerando Matriz C
  for(i=0;i<x;i++)
    for(j=0;j<z;j++)
      c[i][j]=0;
  
  //Calculando o produto das matrizes
  for(i=0;i<x;i++)
    for(j=0;j<z;j++)
      for(k=0;k<y;k++)
        c[i][j]+=(a[i][k]*b[k][j]);  
  
  //Apresentando matriz C
  cout << endl << endl;
  for(i=0;i<x;i++)
    for(j=0;j<z;j++)
      cout << "C[ " << i << " ] [ " << j << " ] = " << c[i][j] << endl;
  
  cin.get();
  cin.get();
  return 0;
}
