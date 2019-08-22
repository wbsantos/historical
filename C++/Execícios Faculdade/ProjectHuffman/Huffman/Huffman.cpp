#include "Huffman.h"

Huffman::Huffman()
{
    m_Len = 0;
    m_Saida = NULL;
	m_Raiz = NULL;
}

Huffman::~Huffman()
{
	delete [] m_Saida;
	deletarArvore(m_Raiz);
}

void Huffman::criarArvore(unsigned int *entrada, unsigned int uiLen)
{
    unsigned int i, j;
	unsigned int *puiEntrada = new unsigned int[uiLen];
    Saida **psSaida = new Saida*[uiLen];
    m_Len = uiLen;

	for(i = 0; i < uiLen; i++) //Criando um novo vetor para não mudar a ordem do recebido
	{
		puiEntrada[i] = entrada[i];
	}

    for(i = 0; i < m_Len-1; i++)//ordenar entrada
	{
        for(j = i+1; j < m_Len; j++)
		{
			if(puiEntrada[i] > puiEntrada[j])
            {
                puiEntrada[i] ^= puiEntrada[j];
                puiEntrada[j] ^= puiEntrada[i];
                puiEntrada[i] ^= puiEntrada[j];
            }
		}
	}

    for(i = 0; i < uiLen; i++) //preencher folhas
    {
        psSaida[i] = new Saida;
        psSaida[i]->uiCode = puiEntrada[i];
        psSaida[i]->iBitsUses = 0;
        psSaida[i]->strBits = "";
        psSaida[i]->pAresta0 = NULL;
        psSaida[i]->pAresta1 = NULL;
    }
    montarNos(psSaida, uiLen); //criar arestas e novos nós
	delete [] psSaida;
    m_Saida = new Saida[m_Len];
    preencherArvore(m_Raiz, -1, "");
	ordenarSaidas(entrada);
}

void Huffman::montarNos(Saida **sSaida, unsigned int uiLen)
{
    if(uiLen == 1)
    {
        m_Raiz = sSaida[0];
        return;
    }

    unsigned int i, j;

    Saida *psNovoNo = new Saida;
    psNovoNo->uiCode = sSaida[0]->uiCode + sSaida[1]->uiCode;
    psNovoNo->iBitsUses = 0;
    psNovoNo->strBits = "";
    psNovoNo->pAresta0 = sSaida[0];
    psNovoNo->pAresta1 = sSaida[1];

    Saida **sNovaSaida = new Saida*[uiLen-1];
    bool flagAdd = true;
    for(i = 2, j = 0; i < uiLen; i++, j++)
    {
        if(psNovoNo->uiCode <= sSaida[i]->uiCode && flagAdd)
        {
            sNovaSaida[j] = psNovoNo;
            flagAdd = false;
            j++;
            if(j >= uiLen - 1)
                break;
        }
        sNovaSaida[j] = sSaida[i];
    }
    if(flagAdd)
    {
        sNovaSaida[uiLen-2] = psNovoNo;
    }
    montarNos(sNovaSaida, uiLen -1);
	delete [] sNovaSaida;
}

void Huffman::preencherArvore(Saida *sSaida, unsigned int noNumero, string strBits)
{
    static unsigned int i = 0;
    noNumero++;
    sSaida->iBitsUses = noNumero;
    sSaida->strBits = strBits;
    if(sSaida->pAresta0 != NULL)
    {
        string strTemp = strBits + "0";
        preencherArvore(sSaida->pAresta0, noNumero, strTemp);
    }

    if(sSaida->pAresta1 != NULL)
    {
        string strTemp = strBits + "1";
        preencherArvore(sSaida->pAresta1, noNumero, strTemp);
    }

    if(sSaida->pAresta0 == NULL && sSaida->pAresta1 == NULL)
    {
        m_Saida[i] = *sSaida;
        i++;
    }
}

unsigned int Huffman::getLen()
{
	return m_Len;
}

Saida* Huffman::getSaida()
{
	if(m_Len == 0) return NULL;

	Saida *sResul = new Saida[m_Len];
	for (unsigned int i = 0; i < m_Len; i++)
		sResul[i] = m_Saida[i];
	return sResul;
}

Saida* Huffman::getSaida(unsigned int uiCode, unsigned int &uiQuantEncontrada)
{
	Saida *sResul = new Saida[1], *sTemp;
	unsigned int k = 0, j;
    for(unsigned int i = 0; i < m_Len; i++)
    {
        if(m_Saida[i].uiCode == uiCode)
		{
            sTemp = new Saida[++k];
			for(j = 0; j < k-1; j++)
				sTemp[j] = sResul[i];
			sTemp[j] = m_Saida[i];
			delete [] sResul;
			sResul = sTemp;
		}
    }
	
	uiQuantEncontrada = k;
	if(k == 0)
	{
		delete [] sResul;
		return NULL;
	}
	return sResul;
}

void Huffman::deletarArvore(Saida *sSaida)
{
    if(sSaida->pAresta0 != NULL)
        deletarArvore(sSaida->pAresta0);

    if(sSaida->pAresta1 != NULL)
        deletarArvore(sSaida->pAresta1);

	delete sSaida;
}

void Huffman::ordenarSaidas(unsigned int *puiEntrada)
{
	unsigned int i, j;
	for(i = 0; i < m_Len-1; i++)
	{
		if(m_Saida[i].uiCode != puiEntrada[i])
		{
			for(j = 0; j < m_Len; j++)
			{
				if(i != j)
				{
					if(m_Saida[j].uiCode == puiEntrada[i])
					{
						Saida sTemp;
						sTemp = m_Saida[j];
						m_Saida[j] = m_Saida[i];
						m_Saida[i] = sTemp;
						break;
					}
				}
			}
		}
	}
}

void Huffman::ordenarSaidas(bool decrescente)
{
	unsigned int i, j;
	for(i = 0; i < m_Len-1; i++)
	{
		for(j = i+1; j < m_Len; j++)
		{
			if((m_Saida[i].uiCode < m_Saida[j].uiCode && decrescente) || 
			   (m_Saida[i].uiCode > m_Saida[j].uiCode && !decrescente))
			{
				Saida sTemp;
				sTemp = m_Saida[j];
				m_Saida[j] = m_Saida[i];
				m_Saida[i] = sTemp;
			}
		}
	}
}