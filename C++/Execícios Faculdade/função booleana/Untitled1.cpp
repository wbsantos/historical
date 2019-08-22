#include <iostream>
#include <string>
using namespace std;


int pot(int base, int expoente)
{
  if(expoente == 0)
    return 1;
  else
    return (base * pot(base, expoente - 1));
}

string dec_out(int num,int base, int x) 
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
  w=conv[num];
  w=w+resul;
  resul=w;
  while (resul.size()<x)
    resul.insert(0,"0");
  return resul;
}


int main()
{
    int x, i, j, k, l, p, m, test, cont=0, cont2=0;
    string resul;
    
    cout << "Digite quantas variaveis existem: ";
    cin >> x;
    cout << endl << endl;
    p=pot(2,x);
    bool a[p];
    string pos,func,vars[x][2];
    for(i=x-1;i>=0;i--)
    {
      vars[i][0].resize(2);
      vars[i][1].resize(2);
      vars[i][1][0]=65+i;
      vars[i][1][1]=32;
      vars[i][0][0]=65+i;
      vars[i][0][1]=39;
    } 
    
    cout << "As variaveis sao: " << endl;
    for(i=0;i<x;i++)
      cout << vars[i][0] << "  " << vars[i][1] << endl;
      
    cout << endl;
    
    cout << "Agora preencha a tabela verdade: " << endl;
    for(i=0;i<p;i++)
    {
      for(j=0; j<x; j++)
      {
        int ap;
        dec_out(i,2,x)[j]=='0' ? ap=0 : ap=1;
        cout << vars[j][ap] << "  ";
   //     ap==0 ? cout << " " : cout << "  ";
      }
      cout << "\t";
      cin >> a[i];
    }
    
    cout << "\nA funcao e:" << endl;      
    for(i=0;i<p;i++)
    {
      if(a[i])
      {
        bool ver;
        cont++;
        pos=dec_out(i,2,x);
        for(j=0;j<pos.size();j++)
        {
          dec_out(i,2,x)[j]=='0' ? ver=0 : ver=1;
          ver ? func=func+vars[j][1] : func=func+vars[j][0];
        }
      }
    }
    
    string prod[cont], aux1, aux2;
    
    for(i=0;i<cont;i++)
      for(j=i;j<((2*x)+i);j++)
        prod[i]=prod[i]+func[j-i+2*x*i];
    
        
    for(j=0;j<cont;j++)
    {
      for(m=0;m<cont;m++)
      {
        if(m!=j)
        for (i=0;i<x*2;i+=2)
        {
          if(i<x*2)
          {  
            test=0;
            if((prod[j][i]==prod[m][i])&&(prod[j][i+1]!=prod[m][i+1]))
            {
              for(k=0;k<x*2;k++)
              {
                if(prod[j][k]==prod[m][k])
                  test++;
              }
              if(test==x*2-1)
              {
                for(l=0;l<x*2;l+=2)
                  if((prod[j][l]==prod[m][l])&&(prod[j][l+1]==prod[m][l+1]))
                  {
                    resul=resul+prod[j][l];
                    resul=resul+prod[j][l+1];
                    cont2++;
                  }
              }
            }
          }
        }
      }
      resul=resul+"+";
    }
    
    
    string prod2[cont2];
    
    j=0;
    for(i=0;i<cont2;i++)
    {
      if(j<resul.size())
      {
        while(resul[j]!='+')
        {
          prod2[i]=prod2[i]+resul[j]; 
          j++;
        }  
      j++;
      }              
    }
    
    resul.erase(0,resul.size());
    for(i=0;i<cont2;i++)
      for(j=i;j<cont2;j++)
        if(j!=i)
          if(prod2[i]==prod2[j])
            prod2[i].erase(0,prod2[i].size());
            
    for(i=0;i<cont2;i++)
    {
      if(!prod2[i].empty())
        resul=resul+prod2[i]+"+";
    }
    
    

    cout << resul;
    cin.get();
    cin.get();
    return 0;
}


