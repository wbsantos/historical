#include <iostream>

using namespace std;

int main()
{
  int x=6,y;
  cout << "*********************************" << endl;
  cout << "*  Adivinhe o numero versao II  *" << endl;
  cout << "*********************************" << endl;
  cout << "\nDigite um numero de 1 a 10: ";
  cin >> y;
  if (x==y)
    cout << "\nParabens, voce acertou" << endl;
  else if (x<y)
    cout << "\nVoce errou, o numero foi muito alto" << endl;
  else if (x>y)
    cout << "\nVoce errou, o numero foi muito baixo" << endl;  
  cin.get();
  cin.get();
  return 0;
}
