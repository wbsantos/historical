#include <iostream>
#include <vector>
using namespace std;

int main()
{
    vector < vector <int> > matriz;
    int lim,tot,i,j;
    cout << "Informe o numero para o triangulo de pascal" << endl;
    cin >> lim;
    cout << endl << endl;
    tot=lim*2+1;
    matriz.resize(lim+1);
    for (i=0;i<lim+1;i++)
      matriz[i].resize(tot);
    for (i=0;i<tot;i++)
      matriz[0][i]=0;
    matriz[0][lim]=1;
//    for(i=0;i<lim+1;i++)
//      matriz[i][0]=0;
//    matriz[lim][0]=1;
    for(i=0;i<lim;i++)
      for(j=lim-1;j<tot-1;j++)
      {
        matriz[i+1][j+1]=matriz[i][j]+matriz[i][j+1];
      }
    for(i=0;i<lim;i++)
      for(j=lim;j>0;j--)
      {
        matriz[i+1][j-1]=matriz[i][j]+matriz[i][j-1];
      }
    for(i=0;i<lim+1;i++)
    {
      for (j=0;j<tot;j++)
        if (matriz[i][j]%2==0)
          cout << " ";
        else
          cout << "*";;
      cout << endl;
    }
    cin.get();
    cin.get();
    return 0;
}
