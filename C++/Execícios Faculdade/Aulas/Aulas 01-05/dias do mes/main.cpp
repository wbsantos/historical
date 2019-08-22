#include<iostream>
using namespace std;

int main()
{
  int mes;
  cout << "Quer saber a quantidade de dias de qual mes?" << endl;
  cin >> mes;
  switch (mes)
  {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
         cout << "\nEsse mes tem 31 dias" << endl;
         break;
         
    case 4:
    case 6:
    case 11:
         cout << "\nEsse mes tem 30 dias" << endl;
         break;
    
    case 2:
         cout << "\nEsse mes tem 28 ou 28 dias" << endl;
         break;
    
    default:
         cout << "\nMes invalido" << endl;
    
    
  }
  cin.get();
  cin.get();
  return 0;    
}
