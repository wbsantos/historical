#include "stdio.h"
#include "string"
using namespace std;

struct Saida
{
    unsigned int uiCode;
    string strBits;
    int iBitsUses;

    Saida *pAresta0;
    Saida *pAresta1;
};

class Huffman
{
public:
    Huffman();
	~Huffman();
    Saida* getSaida(unsigned int uiCode, unsigned int &uiQuantEncontrada);
	Saida* getSaida();
	unsigned int getLen();
    void criarArvore(unsigned int *puiEntrada, unsigned int uiLen);
	void ordenarSaidas(bool decrescente);
	void ordenarSaidas(unsigned int *puiEntrada);

private:
    void montarNos(Saida **sSaida, unsigned int uiLen);
	void deletarArvore(Saida *sSaida);
    void preencherArvore(Saida *sSaida, unsigned int noNumero, string strBits);

    Saida *m_Saida, *m_Raiz;
    unsigned int m_Len;
};
