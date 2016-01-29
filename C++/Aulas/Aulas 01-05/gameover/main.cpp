#include<iostream>
using namespace std;

int main()
{
  int min=0, max=100, valor;
  cout << "Game Over 1.0" << endl;
  cout << "\nDigite o valor de HP: ";
  cin >> valor;
  if (valor<min)
    cout << "Game Over";
  else
    cout << "Voce sobreviveu";
  cin.get();
  cin.get();
  return 0;   
}
