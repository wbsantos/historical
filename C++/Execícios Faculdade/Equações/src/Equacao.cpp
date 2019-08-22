#include "..\include\Equacao.h"
#include <iostream>
#include <string>
#include <vector>
#include <conio.h>
#include<math.h>
using namespace std;

Equacao::Equacao()
{
    base=10;
}

Equacao::~Equacao()
{

}

void Equacao::ler()
{
    cout << "\n\t\tDigite a equacao:\n";
  //  char temp;
    conta.clear();
    cin >> conta;
    if (!validarChar())
      cout << "\nNumeros invalidos";
    if (!validarOperators())
      cout << "\nOperadores invalidos";
    if (!validarSpecialOperators())
      cout << "\nOperadores especiais invalidos";
    /* do
    {
        temp=getch();

        if(conta.empty())//Verifica o primeiro operador
        {
            if((temp!='+')&&(temp!='-'))
                conta='+';
            if(isOperator(temp))
                continue;
        }
        if (conta.size()==1)
          if (temp=='-' || temp=='+')
          if (isOperator(temp) && temp!='-')
            continue;

        if (conta[conta.size()-1]=='(')//verifica o primeiro operador depois do parenteses
        {
            if((temp!='+')&&(temp!='-'))
                conta=conta + '+';
        }
        if(temp==8)//backspace
        {
            cout << "\b \b";
            conta.erase(conta.size()-1,1);
            continue;
        }

        if (isOperator(conta[conta.size()-1]) && (isOperator(temp) && temp!='#'))//verifica se tem dois operadore seguidos
            continue;
        else if (temp=='!' && conta[conta.size()-1]=='!')
            continue;
        else if(isOperator(conta[conta.size()-1]) && temp=='!')
            continue;
        else if (temp=='#' && (!isOperator(conta[conta.size()-1])))
            continue;

        if(alfNum(temp)!=-1 || isOperator(temp) || isSpecialOperator(temp))//verifica se é um valor válido
        {
            conta=conta+temp;
            cout << temp;
        }
    }while(temp!=13);*/
}

bool Equacao::validarChar()
{
    int i;
    for(i=0;i<(int)conta.size();i++)
    {
        if(!isOperator(conta[i]) && alfNum(conta[i])==-1 && !isSpecialOperator(conta[i]))
            return false;
    }
    return true;
}

bool Equacao::validarOperators()
{
    int i;
    if(alfNum(conta[0])>=0)
        conta='+' + conta;
    else if(conta[0]!='+' && conta[0]!='-')
        return false;
    for(i=1;i<(int)conta.size();i++)
    {
        if(conta[i-1]=='(' && (isOperator(conta[i]) && ((conta[i]!='+')&&(conta[i]!='-'))))
            return false;
        if((isOperator(conta[i]) && conta[i]!='@') && isOperator(conta[i-1]))
            return false;
    }
    if(isOperator(conta[conta.size()-1]))
        return false;
    return true;
}

bool Equacao::validarSpecialOperators()
{
    int i,totA=0,totB=0;
    for(i=0;i<(int)conta.size();i++)
    {
        if(conta[i]=='(')
            totA++;
        if(conta[i]==')')
            totB++;
        if(i>0)
        {
            if(alfNum(conta[i])>=0 && conta[i-1]=='(')
                conta.insert(i,"+");
            if((conta[i]=='!') && (conta[i-1]=='!' || conta[i-1]=='(' || isOperator(conta[i-1])))
                return false;
            if(conta[i]=='#' && !isOperator(conta[i-1]) && conta[i]!='(')
                return false;
            if(conta[i]=='@' && (conta[i-1]==')'))
                return false;
            if(alfNum(conta[i])>=0 && (conta[i-1]=='#' || conta[i-1]==')' || conta[i]=='!'))
                return false;
            if((i+1)<(int)conta.size())
                if(conta[i]==',' && alfNum(conta[i+1])==-1)
                    return false;
        }
    }
    if(totA!=totB)
        return false;
    return true;
}

bool Equacao::isOperator(char test)
{
    if ((test=='+')||(test=='-')||(test=='*')||(test=='/')||(test=='^')||(test=='@')||(test=='%')||(test==','))
        return true;
    else
        return false;
}

double Equacao::resul()
{
    separar();
    vector < double > numeros;
    vector < char > sinais;
    int i,j=0;
    numeros.resize(((int)num.size())/2);
    sinais.resize(((int)num.size())/2);
    for(i=1;i<(int)num.size();i+=2)
    {
        numeros[j]=outDec(num[i]);
        j++;
    }
    j=0;
    for(i=0;i<(int)num.size()-1;i+=2)
    {
        sinais[j]=num[i][0];
        j++;
    }
    if (sinais[0]=='-')
        numeros[0]*=-1;
    sinais.erase(sinais.begin()+0);
    for(i=0;i<(int)sinais.size();i++)
    {
        if(sinais[i]=='^')
        {
            numeros[i]=pow(numeros[i],numeros[i+1]);
            numeros.erase(numeros.begin()+i+1);
            sinais.erase(sinais.begin()+i);
        }
    }
    for(i=0;i<(int)sinais.size();i++)
    {
        if(sinais[i]=='*')
        {
            numeros[i]*=numeros[i+1];
            numeros.erase(numeros.begin()+i+1);
            sinais.erase(sinais.begin()+i);
        }
        if(sinais[i]=='/')
        {
            numeros[i]/=numeros[i+1];
            numeros.erase(numeros.begin()+i+1);
            sinais.erase(sinais.begin()+i);
        }
        if(sinais[i]=='%')
        {
            numeros[i]=(int)numeros[i] % (int)numeros[i+1];
            numeros.erase(numeros.begin()+i+1);
            sinais.erase(sinais.begin()+i);
        }
    }
    for(i=0;i<(int)sinais.size();i++)
    {
        if(sinais[i]=='+')
        {
            numeros[i]+=numeros[i+1];
            numeros.erase(numeros.begin()+i+1);
            sinais.erase(sinais.begin()+i);
        }
        if(sinais[i]=='-')
        {
            numeros[i]-=numeros[i+1];
            numeros.erase(numeros.begin()+i+1);
            sinais.erase(sinais.begin()+i);
        }
    }
    return numeros[0];
}

bool Equacao::isSpecialOperator(char test)
{
    if ((test=='(')||(test==')')||(test=='!'))
        return true;
    else
        return false;
}

double Equacao::outDec(string test)
{
  int i,exp=0;
  double resul;
  int posv=(int)test.size();
  for(i=0;i<(int)test.size();i++)
      if(test[i]==',')
      {
          posv=i;
          break;
      }
  i=posv-1;
  while(i>=0)
  {
    resul=pow(base,exp)*alfNum(test[i])+resul;
    exp++;
    i--;
  }
  if(posv==(int)test.size())
    return resul;
  i=posv+1;
  exp=-1;
  while(i!=(int)test.size())
  {
    resul=pow(base,exp)*alfNum(test[i])+resul;
    exp--;
    i++;
  }
  return resul;
}

void Equacao::separar()
{
    string temp;
    string test=conta;
    int i=0,pos=0,j=0,k=0,totA=0,totB=0;
    for(i=0;i<(int)test.size();i++)
    {
        /*
        if(test[i]=='(')
        {
            i++;
            j=i;
            totA++;
            for(;totA==totB;i++)
            {
                if (test[i]=='(')
                    totA++;
                if (test[i]==')')
                    totB++;
                if (totA!=totB)
                    num[pos]=num[pos]+test[i];
            }
            i++;
            temp.clear();
            for(k=0;k<i-1;k++)
                temp=temp+test[k];
            separar(temp);
            temp.clear();
            num.push_back(temp);
            pos++;
            continue;
        }
        */
        if(isOperator(test[i]) && test[i]!=',')
        {
            temp=test[i];
            num.push_back(temp);
            temp.clear();
            num.push_back(temp);
            pos=num.size()-1;
            continue;
        }
        num[pos]=num[pos]+test[i];
    }
//    cout << "\n------------------------";
//    for(i=0;i<=pos;i++)
//        cout << endl << i << " = " << num[i];

}


double Equacao::alfNum(char test)
{
   double num=test;
   if((num>=48)&&(num<=57))
    num-=48;
  else if ((num>=65)&&(num<=90))
    num-=55;
  else if ((num>=97)&&(num<=122))
    num-=87;
  else if (test=='#')
    num=3.14;
  else
    return -1;
  if (num>=base)
    return -1;
  else
    return num;
}
