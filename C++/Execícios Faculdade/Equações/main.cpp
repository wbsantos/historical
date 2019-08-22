#include <iostream>
#include <string>
#include <vector>
#include "include\Equacao.h"
using namespace std;

int main()
{
    Equacao test;
    test.ler();
    cout << "X=" <<  test.resul();
    cin.get();
    cin.get();
    return 0;
}
