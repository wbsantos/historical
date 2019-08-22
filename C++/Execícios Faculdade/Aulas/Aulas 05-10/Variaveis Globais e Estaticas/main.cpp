#include <iostream>
using namespace std;

int x,y; // Variaveis globais, iniciam com zero

void operacoes(int x, int y) // Variaveis locais, iniciam com valor aleatorio e sao diferentes das globais
{
  x+=y;  //operacao soma
  ::x=x; //:: se refere a variavel global, e ela ta recebendo o valor da variavel local
  cout << "Soma: " << ::x << endl;
  
  x-=(2*y);//operacao subtra��o, lembrando que ele foi somada antes, por isso o 2*y
  ::x=x;
  cout << "Subtracao: " << ::x << endl;
  
  x=(x+y)*y;//multiplica��o
  ::x=x;
  cout << "Multiplicacao: " << ::x << endl;
  
  x/=(y*y);//Divis�o
  ::x=x;
  cout << "Divisao: " << ::x << endl;
  
  
}

int contador()
{
   static int h=0;
   h++;   
   return h;
}

int main()
{
    int i; // para exemplificar a var estatica
    //por enquanto o exemplo � de var global e local e seu alcance
    cout << "Digite o valor de x: ";
    cin >> x;
    cout << "Digite o valor de y: ";
    cin >> y;
    operacoes(x,y);
    cout << endl << endl << endl << "Contador: " << endl;
    /*agora o exemplo de variavel est�tica
    por padr�o, as variaveis s�o montada na mem�ria quando o programa � executado
    mas somente as globais s�o est�ticas, ou seja, continuam na mem�ria
    as variaveis locais s� s�o montadas quando a fun��o � chamada, e assim
    que a fun��o acaba a var � descartada, 
    mas para evitar a cria��o de n vars globais s� por isso, existe o comando static
    segue o exemplo*/
    for (i=0;i<10;i++)
      cout << contador() << endl;
    cin.get();
    cin.get();
    return 0;
}
