#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "Huffman.h"
#define TESTE 1
#define MAX_ELEMENTOS 3
#define MIN 0
#define MAX 0xFFFF
unsigned int MAX_ENT;
using namespace std;

void lerEntradas(unsigned int *&piEntrada);
void apresentarSaida(unsigned int *&piEntrada);
int randomize(unsigned int semente);
char getchr();

int main()
{
	MAX_ENT = MAX_ELEMENTOS;
	unsigned int *uiEntrada = NULL;
    
	lerEntradas(uiEntrada);
	apresentarSaida(uiEntrada);

    system("pause");
	delete [] uiEntrada;
    return 0;
}

int randomize(unsigned int semente)
{
	int de = MIN, ate = MAX;
	srand(semente);
	ate-=de;
	return (rand()%(ate-1)+de);
}

char getchr()
{
	char cOp;
	fflush(stdin);
	cOp = getchar();
	fflush(stdin);
	return cOp;
}

void apresentarSaida(unsigned int *&puiEntrada)
{
	char cOp;
	Huffman saida;
	const char *cMensagem = "\nCodigo: %d\tQuantidade de Bits: %d\tBits: %s";
	unsigned int i, j;
	Saida *sSaida = NULL;

	saida.criarArvore(puiEntrada, MAX_ENT);
    printf("\n\nSaida:");

	sSaida = saida.getSaida();
    for(i = 0; i < saida.getLen(); i++)
        printf(cMensagem, sSaida[i].uiCode, sSaida[i].iBitsUses, sSaida[i].strBits.c_str());

	printf("\n\nDeseja ver a lista ordenada? (s/N)\n");
	cOp = tolower(getchr());
	if(cOp == 's')
	{
		printf("\nPrefere ordem crescente ou decrescente de codigo? (c/D)\n");
		cOp = tolower(getchr());	
		delete [] sSaida;
		saida.ordenarSaidas(!(cOp == 'c'));
		sSaida = saida.getSaida();
		system("cls");
		for(i = 0; i < saida.getLen(); i++)
			printf(cMensagem, sSaida[i].uiCode, sSaida[i].iBitsUses, sSaida[i].strBits.c_str());
	}
	delete [] sSaida;
	printf("\n\n");
}

void lerEntradas(unsigned int *&puiEntrada)
{
	char cOp;
	unsigned int i;
	if(TESTE)
	{
		printf("Pressione t para testar o software com numeros aleatorios\nou qualquer outra tecla para insercao manual\n");
		cOp = tolower(getchr());
		system("cls");
	}
	else
	{
		cOp = 't';
	}

	if(cOp == 't')
	{
		printf("\nDigite o numero maximo de entradas: ");
		scanf("%d", &MAX_ENT);
		puiEntrada = new unsigned int[MAX_ENT];
		for(i = 0; i < MAX_ENT; i++)
			puiEntrada[i] = randomize(((unsigned int)puiEntrada+i)*((MAX-i/2)*(MAX_ENT+i*3)*(MAX+i*5)));
	}
	else
	{
		puiEntrada = new unsigned int[MAX_ENT];

		printf("Insercao manual de valores (%d numeros): \n\n", MAX_ENT);
		for(unsigned int i = 0; i < MAX_ENT; i++)
		{
			printf ("Digite a entrada %d: ", i+1);
			scanf("%d", &puiEntrada[i]);
			while(puiEntrada[i] < MIN || puiEntrada[i] > MAX)
			{
				printf("Numero invalido, digite um valor entre %d e %d: ", MIN, MAX);
				scanf("%d", &puiEntrada[i]);
			}
		}
	}
	system("cls");
}



