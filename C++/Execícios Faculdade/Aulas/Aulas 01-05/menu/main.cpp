#include <iostream>

using namespace std;

int main()
{
    int escolha;
    cout << "Menu de jogo" << endl;
    cout << "\n\n1- Novo Jogo" << endl;
    cout << "2- Carregar jogo" << endl;
    cout << "3- Opcoes" << endl;
    cout << "4- Sair" << endl;
    cin >> escolha;
    if (escolha==1)
      cout << "Escolheu novo jogo" << endl;
    else if (escolha==2)
      cout << "Escolheu carregar um jogo" << endl;
    else if (escolha==3)
      cout << "Escolheu Opocoes" << endl;
    else if (escolha==4)
      cout << "Escolheu sair" << endl;
    else
      cout << "Escolha invalida";    
    cin.get();
    cin.get();
    return 0;
}
