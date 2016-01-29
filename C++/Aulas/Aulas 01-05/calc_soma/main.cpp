#include <iostream>

using namespace std;

int main()
{
    int x,y,z;
    cout << "Digite dois numeros para saber o resultado da soma." << endl;
    cin >> x >> y;
    z=x+y;
    cout << x << " + " << y << " = " << z;
    cin.get();
    cin.get();
    return 0;
}
