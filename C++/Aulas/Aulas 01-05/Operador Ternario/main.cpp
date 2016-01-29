#include <iostream>

using namespace std;

int main()
{
    int x,y;
    cout << "Digite o valor de x: ";
    cin >> x;
    cout << "Digite o valor de y: ";
    cin >> y;
    
    
//    x>y? cout <<"X maior que y" : cout << "X nao e maior que Y";                      Exemplo simples
    x>y? cout <<"X maior que Y" : x<y? cout << "X menor que Y" : cout <<"X igual Y"; // Exemplo composto
    
    cin.get();
    cin.get();
    return 0;
}
