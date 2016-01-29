#pragma once
#include "vector"
using std::vector;

class Relacoes
{
private:
	vector<int> conjuntoA;
	vector<int> conjuntoB;
	vector<vector<int>> conjuntoAB;

public:
	Relacoes(vector<int> conjuntoA, vector<int> conjuntoB, vector<vector<int>> conjuntoAB);
	~Relacoes(void);

	bool simetrica();
	bool assimetrica();
	bool antisimetrica();
	bool transitiva();
	bool reflexiva();
	bool irreflexiva();

	bool equivalente();
	bool ordem();

	bool funcao();
	bool funcaoTotal();
	bool funcaoInjetiva();
	bool funcaoSobrejetiva();
	bool funcaoBijetiva();

//********************************
	bool exists(int a, int b);
	void reverterRelacao();
};

