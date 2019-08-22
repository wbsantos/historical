#include <iostream>

using namespace std;

int main()
{
    int x,y;
    bool z;
    cout << "Digite dois numeros para ser feita as comparacoes" << endl;
    cin >> x >> y;
    z= x==y;
    cout << endl << x << " = " << y << " ? -------" << z << endl;
    z= x<y;
    cout << x << " < " << y << " ? -------" << z << endl;
    z= x>y;
    cout << x << " > " << y << " ? -------" << z << endl;
    cout << "\n0=falso; 1=verdadeiro.";    
    cin.get();
    cin.get();
    return 0;
}
