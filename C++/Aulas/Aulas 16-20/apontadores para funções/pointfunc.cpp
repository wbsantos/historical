#include <iostream>
using namespace std;

int somar(int a, int b)          {   return a+b; }
int subtrair(int a, int b)       {   return a-b; }
int multiplicar(int a, int b)    {   return a*b; }
int dividir(int a, int b)        {   return a/b; }

int calculadora(int a, int b, int (*operacao)(int, int));

int main()
{
    int x = calculadora(4, 6, &somar);
    int y = calculadora(4, 2, &multiplicar);

    cout << "X: " << x << ", Y: " << y << endl;
    cin.get();
    return 0;
}

int calculadora(int a, int b, int (*operacao)(int, int))
{
    int resultado = (*operacao)(a, b);

    return resultado;
}


