#include <iostream>
using namespace std;

int x,y; // Variaveis globais, iniciam com zero

void operacoes(int x, int y) // Variaveis locais, iniciam com valor aleatorio e sao diferentes das globais
{
  x+=y;  //operacao soma
  ::x=x; //:: se refere a variavel global, e ela ta recebendo o valor da variavel local
  cout << "Soma: " << ::x << endl;
  
  x-=(2*y);//operacao subtração, lembrando que ele foi somada antes, por isso o 2*y
  ::x=x;
  cout << "Subtracao: " << ::x << endl;
  
  x=(x+y)*y;//multiplicação
  ::x=x;
  cout << "Multiplicacao: " << ::x << endl;
  
  x/=(y*y);//Divisão
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
    //por enquanto o exemplo é de var global e local e seu alcance
    cout << "Digite o valor de x: ";
    cin >> x;
    cout << "Digite o valor de y: ";
    cin >> y;
    operacoes(x,y);
    cout << endl << endl << endl << "Contador: " << endl;
    /*agora o exemplo de variavel estática
    por padrão, as variaveis são montada na memória quando o programa é executado
    mas somente as globais são estáticas, ou seja, continuam na memória
    as variaveis locais só são montadas quando a função é chamada, e assim
    que a função acaba a var é descartada, 
    mas para evitar a criação de n vars globais só por isso, existe o comando static
    segue o exemplo*/
    for (i=0;i<10;i++)
      cout << contador() << endl;
    cin.get();
    cin.get();
    return 0;
}
