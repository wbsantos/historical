#include <iostream>

using namespace std;

int main()
{
    int x=55,y,t=0;
    bool sair=false;
    cout << "Seja Bem Vindo ao Adivinhe o numero versao 3" << endl;
    while(!sair)
    {
      cout << "\nDigite um numero de 0 a 100 e tente a sorte." << endl;
      cin >> y;
      t++;
      if (x==y)
      {
        cout << "\nParabens, voce acertou na tentativa " << t << endl;  
        cout << "Agora que voce ja sabe o numero tera que deixar o jogo." << endl;
        sair=1;
      }   
      else if (x>y)
        cout << "Numero muito baixo, tente de novo." << endl;
      else if (x<y)
        cout << "Numero muito alto, tente de novo." << endl;
    }
    cin.get();
    cin.get();
    return 0;
}
