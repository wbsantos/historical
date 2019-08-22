#include<iostream>
#include <vector>

using namespace std;
void criarlista(vector<float> &ii, vector<float> &jj, int &n);
void ordenarlista(vector<float> &ii, vector<float> &jj, int &k);
void apresentar(vector<float> &ii, vector<float> &jj, int &k);

void apresentar(vector<float> &ii, vector<float> &jj, int &k)
{
    unsigned int i;
    cout << "\n0/1" << " ";
    for(i=0;i<k;i++)      
      cout << jj[i] << "/" << ii[i] << " ";    
    cout << "1/1\n\n-------------------------------------------------------\n\n";  
}

void ordenarlista(vector<float> &ii, vector<float> &jj, int &k)
{
    int j,i;
    float aux;
    for (j=k;j>=0;j--)
    {
      for(i=0;i<k-1;i++)
      {
        if(jj[i+1]/ii[i+1]<jj[i]/ii[i])
        {
          aux=ii[i+1];
          ii[i+1]=ii[i];
          ii[i]=aux;
          aux=jj[i+1];
          jj[i+1]=jj[i];
          jj[i]=aux;
        }
      }
    }
}

void criarlista(vector<float> &ii, vector<float> &jj, int &n)
{
  unsigned int i=2, j=1;
  bool ver;
  for(j=1;j<=n;j++)
    {
      for(i=1;i<=n;i++)
      {
        if(j>i && j%i!=0)
          ver=true;
        else if(i%j!=0)
          ver=true;
        else
          ver=false;
        if(j==1 && j!=i)
          ver=true;
        if ((j>i)||(j%2==0 && i%2==0))
          ver=false;
        if(ver)
        {                                                
          ii.push_back(i);
          jj.push_back(j);
        }
      }
    }
}

int main()
{
    int n=1, i, j, k;
    float aux;
    vector  <float> ii,jj;
    while(n!=0)
    {
      cout << "Digite o numero maximo do denominador para\na sequencia de Farey (digite 0 para sair): ";
      cin >> n;
      if(n!=0)
      {
        criarlista(ii,jj,n);
        k=jj.size();
        ordenarlista(ii,jj,k);
        apresentar(ii,jj,k);
        ii.clear();
        jj.clear();
      }
    }
    return 0;
}
