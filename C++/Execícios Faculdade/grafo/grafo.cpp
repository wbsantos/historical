#include <iostream>
#include <vector>
#include <stdio.h>
using namespace std;

class TGrafo
{
  private:
    int tot,mini, ori, des, n;
    vector < vector < bool > > grafo;
    vector < int > camin;
    vector < int > menorcamin;
    vector < vector < int > > posscaminhos;

    void gerarcaminho(int ori, int des, int poss);

  public:
    int getMini(){return mini;}
    int getOri(){return ori;}
    int getDes(){return des;}
    int menor(int origem, int destino, int poss);

    void vermenorcamin();
    void verposs();
    void lergrafo();

    TGrafo();
};

    TGrafo::TGrafo()
    {
      int i;
      tot=0;
      mini=100;
      cout << "Informe a quantidade de vertices: ";
      cin >> n;
      for (i=0;i<n;i++)
        grafo.resize(n);
      for(i=0;i<n;i++)
        grafo[i].resize(n);
      lergrafo();
      camin.resize(n);
      menorcamin.resize(n);
      for (i=0;i<n;i++)
      {
        camin[i]=-1;
        menorcamin[i]=-1;
      }
      ori=0;
      des=0;
    }

    void TGrafo::gerarcaminho(int orig, int des, int poss)
    {
      int i,j,k;
      for(i=0;i<n;i++)
      {
        if(orig==des)
        {
          if(tot==poss)
          {
            posscaminhos.resize(posscaminhos.size()+1);
            k= ori;
            while(k!=des)
            {
               posscaminhos[posscaminhos.size()-1].push_back(k);
               k=camin[k];
            }
            posscaminhos[posscaminhos.size()-1].push_back(k);

          }
          if (tot<mini)
          {
            mini=tot;
            for(j=0;j<n;j++)
              menorcamin[j]=camin[j];
          }
          break;
        }
        if((grafo[orig][i]==1)&&(camin[i]==-1))
        {
          tot++;
          camin[orig]=i;
          gerarcaminho( i, des, poss);
        }
      }
      tot--;
      camin[orig]=-1;
    }

    int TGrafo::menor(int origem, int destino, int poss)
    {
      mini=100;
      tot=0;
      ori=origem;
      des=destino;
      posscaminhos.clear();
      gerarcaminho(ori, des, poss);
      return mini;
    }

    void TGrafo::lergrafo()
    {
      int op,i=0,j=0;
      char c, ler[n][n];
      FILE *arq;
      cout << "1- Ler Matriz Adjacente do Arquivo" << endl;
      cout << "2- Entrada manual (Arquivo sera gerado automaticamente)" << endl;
      cin >> op;
      if(op==1)
      {
          if ((op==1)&& (arq = fopen("grafo.txt","rt")))
          {
            for (i=0; i<n; i++)
            {
              fgets(ler[i], n+2, arq);
              cout << ("%s",ler[i]);
              for(j=0;j<n;j++)
                ler[i][j]=='0' ? grafo[i][j]=0 : grafo[i][j]=1;
            }
            fclose(arq);
            return;
          }
          else
            cout << endl << "Arquivo invalido ou inexistente, faca a entrada manual" << endl;
      }
      for(i=0;i<n;i++)
        for(j=0;j<n;j++)
          grafo[i][j]=0;
      cout << "\nEntre com as conexoes (separe por virgula)" << endl;
      cout << "Exemplo de entrada: 1,5     O vertice um tem conexao com o 5" << endl;
      cout << "Digite 0 para qualquer uma das conexoes para encerrar a entrada" << endl << endl;
      do
      {
        cout << "Digite as conexoes: ";
        scanf("%d,%d",&i,&j);
        i--;
        j--;
        if((i<0)||(j<0))
          break;
        if ((i<n)&&(j<n))
          grafo[i][j]=1;
        else
          cout << "Entrada invalida" << endl;
      }while(1);
      arq = fopen("grafo.txt","wt");
      for(i=0;i<n;i++)
      {
        for(j=0;j<n;j++)
          fprintf(arq,"%c",grafo[i][j]+48);
        fprintf(arq,"\n");
      }
      fclose(arq);
    }

    void TGrafo::verposs()
    {
      int i,j;
      for (i=0;i<posscaminhos.size();i++)
      {
        for(j=0;j<posscaminhos[i].size() ; j++)
        {
           j<posscaminhos[i].size()-1 ? cout << posscaminhos[i][j]+1 << "--> " :
                                        cout << posscaminhos[i][j]+1;
        }
        cout << endl;
      }
    }

    void TGrafo::vermenorcamin()
    {
      int i;
      int test=0, test2=0;
      for (i=0;i<n;i++)
        if(menorcamin[i]>=0)
          test++;
      i=ori;
      while(i!=des)
      {
        cout << i+1 << "--> ";
        i=menorcamin[i];
      }
      cout << i+1;

    }


int main()
{
  int i=0,j=0, pos;
  TGrafo ma;
  do
  {
    cout << "\n\nInforme o ponto de origem: ";
    cin >> i;
    cout << "Informe o ponto de destino: ";
    cin >> j;
    cout << "\nInforme o numero de arestas possiveis"
         << "\nSe voce digitar 2 por exemplo, aparecera \ntodos os caminhos possiveis com 2 arestas"
         << "\nDigite 0 caso isso nao importe: ";
    i--;
    j--;
    cin >> pos;
  }while(i==j);
  ma.menor(i,j,pos);
  cout << "\n\nPelo menor caminho voce passa por " << ma.getMini() << " arestas" << endl;
  cout << "E deve seguir o seguinte caminho: " << endl;
  ma.vermenorcamin();
  if (pos!=0)
  {
    cout << "\nPara passar por " << pos << " arestas existem os seguintes caminhos:" << endl;
    ma.verposs();
  }
  cin.get();
  cin.get();
  return 0;
}
