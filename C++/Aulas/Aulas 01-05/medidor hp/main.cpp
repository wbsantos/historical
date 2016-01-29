#include<iostream>
using namespace std;

int main()
{
  int min=0, max=100, valor;
  bool teste;
  cout << "Saiba se o seu HP esta no valor delimitado." << endl;
  cout << "\nDigite o valor de HP: ";
  cin >> valor;
  teste=(valor>=min)&&(valor<=max);
  cout << "\n........ " << teste << endl;
  cout << "0=falso; 1=verdadeiro";
  cin.get();
  cin.get();
  return 0;   
}
