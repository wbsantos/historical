#ifndef EQUACAO_H
#define EQUACAO_H
#include <string>
#include <vector>
using namespace std;

class Equacao
{
    public:
        Equacao();
        ~Equacao();
        void separar();
        void ler();
        bool validarChar();
        bool validarOperators();
        bool validarSpecialOperators();
        double resul();
    private:
        string conta;
        double outDec(string);
        int base;
        bool isOperator(char);
        bool isSpecialOperator(char);
        double alfNum(char);
        vector < string > num;

};

#endif // EQUACAO_H
