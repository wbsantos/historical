#include <iostream>
using namespace std;


void operacoesref(int &x, int &y, int &t) // Variaveis de referencia, qualquer valor mudado nelas é mudado na variavel a qual se referem
{
  t=x+y;
  cout << "Soma: " << t << endl;
  
  t=x-y;
  cout << "Subtracao: " << t << endl;
  
  t=x * y;
  cout << "Multiplicacao: " << t << endl;
  
  t=x / y;
  cout << "Divisao: " << t << endl;
  
  cout << "\n\nEndereco de X: " << &x << endl; //como o programa mostra, as variaveis de ref apontam diretamente
  cout << "\n\nEndereco de Y: " << &y << endl; //para a variavel a qual se refer, funciona como um apelido da variavel
  cout << "\n\nEndereco de T: " << &t << endl; //permitindo alteração de uma var local em outra função
}

void operacoespoin(int *x, int *y, int *t) // Variaveis apontadores, apontam para as variaveis da função main()
{
  *t=*x+*y;
  cout << "Soma: " << *t << endl;
  
  *t=*x-*y;
  cout << "Subtracao: " << *t << endl;
  
  *t=*x * *y;
  cout << "Multiplicacao: " << *t << endl;
  
  *t=*x / *y;
  cout << "Divisao: " << *t << endl;
  
  cout << "\n\nEndereco de X (armazenado no apontador): " << x << endl;
  cout << "Endereco de X (endereco do apontador): " << &x << endl;
  cout << "Valor de X: " << *x << endl;
  cout << "\n\nEndereco de Y (armazenado no apontador): " << y << endl;
  cout << "Endereco de Y (endereco do apontador): " << &y << endl;
  cout << "Valor de Y: " << *y << endl;
  cout << "\n\nEndereco de T (armazenado no apontador): " << t << endl;
  cout << "Endereco de T (endereco do apontador): " << &t << endl;
  cout << "Valor de T: " << *t << endl;
}

int main()
{
    int x,y,t;
    cout << "Digite o valor de x: ";
    cin >> x;
    cout << "Digite o valor de y: ";
    cin >> y;
  /*se eu usasse qualquer dessas variaveis depois de chamar as funções abaixo
  elas viriam com o ultimo valor que foi alterado dentro das funções respectivas
  pois a variaveis locais dessas funções apontam para as variaveis da função main*/
    operacoespoin(&x,&y,&t);
    operacoesref(x,y,t);
    cin.get();
    cin.get();
    return 0;
}
