#include "StdAfx.h"
#include "Relacoes.h"


Relacoes::Relacoes(vector<int> conjuntoA, vector<int> conjuntoB, vector<vector<int>> conjuntoAB)
{
	this->conjuntoA = conjuntoA;
	this->conjuntoB = conjuntoB;
	this->conjuntoAB = conjuntoAB;
}


Relacoes::~Relacoes(void)
{
}

bool Relacoes::exists(int a, int b)
{
	for(int i = 0; i < conjuntoAB.size(); i++)
	{
		if(conjuntoAB[i][0] == a && conjuntoAB[i][1] == b)
			return true;
	}
	return false;
}

bool Relacoes::simetrica()
{
	for(int i = 0; i < conjuntoAB.size(); i++)
	{
		if(!exists(conjuntoAB[i][1], conjuntoAB[i][0]))
			return false;
	}
	return true;
}

bool Relacoes::assimetrica()
{
	for(int i = 0; i < conjuntoAB.size(); i++)
	{
		if(exists(conjuntoAB[i][1], conjuntoAB[i][0]) && conjuntoAB[i][1] != conjuntoAB[i][0])
			return false;
	}
	return true;
}

bool Relacoes::antisimetrica()
{
	return (!simetrica() && !assimetrica());
}

bool Relacoes::transitiva()
{
	for(int i = 0; i < conjuntoAB.size(); i++)
	{
		for(int j = 0; j < conjuntoAB.size(); j++)
		{
			if(i == j)
				continue;

			if(conjuntoAB[i][1] == conjuntoAB[j][0] && !exists(conjuntoAB[i][0], conjuntoAB[j][1]))
				return false;
		}
	}

	return true;
}

bool Relacoes::reflexiva()
{
	for(int i = 0; i < conjuntoA.size(); i++)
	{
		if(!exists(conjuntoA[i], conjuntoA[i]))
			return false;
	}

	return true;
}

bool Relacoes::irreflexiva()
{
	for(int i = 0; i < conjuntoA.size(); i++)
	{
		if(exists(conjuntoA[i], conjuntoA[i]))
			return false;
	}

	return true;
}

bool Relacoes::equivalente()
{
	return (transitiva() && reflexiva() && simetrica());
}

bool Relacoes::ordem()
{
	return(transitiva() && reflexiva() && assimetrica());
}

bool Relacoes::funcao()
{
	for(int i = 0; i < conjuntoAB.size(); i++)
	{
		for(int j = 0; j < conjuntoAB.size(); j++)
		{
			if(i == j)
				continue;

			if(conjuntoAB[i][0] == conjuntoAB[j][0] && conjuntoAB[i][1] != conjuntoAB[j][1])
				return false;
		}
	}

	return true;
}

bool Relacoes::funcaoTotal()
{
	for(int i = 0; i < conjuntoA.size(); i++)
	{
		bool aAB = false;
		for(int j = 0; j < conjuntoAB.size(); j++)
		{
			if(conjuntoA[i] == conjuntoAB[j][0])
			{
				aAB = true;
				break;
			}
		}
		if(!aAB)
			return false;
	}

	return (funcao());
}

bool Relacoes::funcaoInjetiva()
{
	for(int i = 0; i < conjuntoAB.size(); i++)
	{
		for(int j = 0; j < conjuntoAB.size(); j++)
		{
			if(i == j)
				continue;

			if(conjuntoAB[i][1] == conjuntoAB[j][1] && conjuntoAB[i][0] != conjuntoAB[j][0])
				return false;
		}
	}

	return (funcao());
}

bool Relacoes::funcaoSobrejetiva()
{
	for(int i = 0; i < conjuntoB.size(); i++)
	{
		bool bAB = false;
		for(int j = 0; j < conjuntoAB.size(); j++)
		{
			if(conjuntoB[i] == conjuntoAB[j][1])
			{
				bAB = true;
				break;
			}
		}
		if(!bAB)
			return false;
	}

	return (funcao());
}

bool Relacoes::funcaoBijetiva()
{
	return (funcaoInjetiva() && funcaoSobrejetiva() && funcao());
}

void Relacoes::reverterRelacao()
{
	for(int i = 0; i < conjuntoAB.size(); i++)
	{
		conjuntoAB[i][0] ^= conjuntoAB[i][1];
		conjuntoAB[i][1] ^= conjuntoAB[i][0];
		conjuntoAB[i][0] ^= conjuntoAB[i][1];
	}
}