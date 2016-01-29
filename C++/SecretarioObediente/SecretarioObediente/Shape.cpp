#include "StdAfx.h"
#include "Shape.h"
#include "Math.h"

Shape::Shape(long distancia)
{
	cdc = 0;
	this->distancia = distancia;
}

Shape::Shape(CClientDC *pcdc, long distancia)
{
	cdc = pcdc;
	this->distancia = distancia;
}

Shape::~Shape(void)
{

}

double Shape::hipotenusa(POINT p1, POINT p2)
{
	return pow(pow((double)(p1.x - p2.x), 2) + pow((double)(p1.y - p2.y), 2), (double)1/2);
}

double Shape::catetoOposto(POINT p1, POINT p2)
{
	return (p1.x - p2.x) < 0 ? (p1.x - p2.x) * - 1 : (p1.x - p2.x);
}

double Shape::catetoAdjacente(POINT p1, POINT p2)
{
	return (p1.y - p2.y) < 0 ? (p1.y - p2.y) * - 1 : (p1.y - p2.y);
}

long Shape::novoX(POINT p1, POINT p2)
{
	POINT pAux, pAux2;
	pAux.x = p1.x + (long)(catetoOposto(p1, p2) / hipotenusa(p1, p2) * distancia);
	pAux.y = p1.y;
	pAux2.x = p1.x + (long)((catetoOposto(p1, p2) / hipotenusa(p1, p2) * distancia) * - 1);
	pAux2.y = p1.y;
	return (hipotenusa(pAux, p2) < hipotenusa(pAux2, p2)) ? pAux.x : pAux2.x;
}

long Shape::novoY(POINT p1, POINT p2)
{
	POINT pAux, pAux2;
	pAux.x = p1.x;
	pAux2.x = p1.x;
	pAux.y = p1.y + (long)(catetoAdjacente(p1, p2)/ hipotenusa(p1, p2) * distancia);
	pAux2.y = p1.y + (long)((catetoAdjacente(p1, p2)/ hipotenusa(p1, p2) * distancia) * - 1);
	return (hipotenusa(pAux, p2) < hipotenusa(pAux2, p2)) ? pAux.y : pAux2.y;
}

POINT Shape::novoPonto(POINT p1, POINT p2)
{
	POINT pAux;
	pAux.x = novoX(p1, p2);
	pAux.y = novoY(p1, p2);
	return pAux;
}

void Shape::desenharPixel(POINT ponto)
{
	if(cdc == 0)
		return;

	for(int i = 0; i < distancia; i++)
		for(int j = 0; j < distancia; j++)
			cdc->SetPixel(ponto.x + i, ponto.y + j, RGB(255,0,0));
}

void Shape::addPoint(POINT pt)
{
	if(pontos.size() > 0)
	{
		if(hipotenusa(pontos[(int)pontos.size() - 1], pt) < distancia)
			return;
	}

	pontos.push_back(pt);

	desenharPixel(pt);

	if(pontos.size() > 1)
	{
		POINT p1 = pontos[pontos.size() - 2], p2 = pontos[pontos.size() - 1]; 

		while(hipotenusa(p1, p2) > distancia)
		{
			p1 = novoPonto(p1, p2);
			desenharPixel(p1);
		}
	}
}

RECT Shape::getRect()
{
	return getRect(pontos);
}

RECT Shape::getRect(vector<POINT> pontos)
{
	RECT ret;
	if((int)pontos.size() == 0)
	{
		ret.bottom = ret.bottom = ret.right = ret.top = 0;
		return ret;
	}

	long xMin = pontos[0].x, xMax = pontos[0].x, yMin = pontos[0].y, yMax = pontos[0].y;

	for(int i = 1; i < (int)pontos.size(); i++)
	{
		if(xMin > pontos[i].x)
			xMin = pontos[i].x;
		if(xMax < pontos[i].x)
			xMax = pontos[i].x;
		if(yMin > pontos[i].y)
			yMin = pontos[i].y;
		if(yMax < pontos[i].y)
			yMax = pontos[i].y;
	}

	ret.left = xMin;
	ret.top = yMin;
	ret.right = xMax;
	ret.bottom = yMax;
	return ret;
}

bool Shape::operator==(Shape other)
{
	return comparar(other) < 40;
}

double Shape::comparar(Shape other)
{
	vector<POINT> ptThis, ptOther;

	this->reposicionar();
	other.reposicionar();
	
	RECT recThis = this->getRect(), recOther = other.getRect();
	//*******************
	double propH = 1, propV = 1;

	if(recThis.bottom > 0 && recOther.bottom > 0)
	{
		propV = (recThis.bottom < recOther.bottom) ? 
					(double)(recOther.bottom) / (recThis.bottom) : 
					(double)(recThis.bottom) / (recOther.bottom);
	}
	if(recThis.right > 0 && recOther.right > 0)
	{
		propH = (recThis.right < recOther.right) ? 
					(double)(recOther.right) / (recThis.right) : 
					(double)(recThis.right) / (recOther.right);
	}
	ptOther = escalonar(other.getPontos(), propV, propH);
	ptThis = escalonar(pontos, propV, propH);
	//*******************

	ptThis = quebrarForma(ptThis, distancia);
	ptOther = quebrarForma(ptOther, distancia);
	
	return compararFormas(ptThis, ptOther);
}

void Shape::reposicionar()
{
	RECT rec = getRect();

	for(int i = 0; i < (int)pontos.size(); i++)
	{
		pontos[i].x -= (rec.left);
		pontos[i].y -= (rec.top);
	}
}

vector<POINT> Shape::escalonar(vector<POINT> pts, double proporcaoVertical, double proporcaoHorizontal)
{
	for(int i = 0; i < (int)pts.size(); i++)
	{
		pts[i].x = (long)(pts[i].x * proporcaoHorizontal);
		pts[i].y = (long)(pts[i].y * proporcaoVertical);
	}

	return pts;
}

vector<POINT> Shape::quebrarForma(vector<POINT> pts, long distancia)
{
	vector<POINT> ptsret;
	int i;

	for(i = 0; i < ((int)pts.size() - 1); i++)
	{
		POINT p1 = pts[i], p2 = pts[i + 1]; 
		ptsret.push_back(p1);

		while(hipotenusa(p1, p2) > distancia)
		{
			p1 = novoPonto(p1, p2);
			ptsret.push_back(p1);
		}
	}

	if((int)pts.size() > 0)
		ptsret.push_back(pts[i]);

	return ptsret;
}

int Shape::ptsNaoAchados(vector<POINT> dessa, vector<POINT> nessa)
{
	RECT rec = getRect(dessa);
	int ptsNaoAchados = 0;
	double altura = (rec.bottom - rec.top) > 0 ? (rec.bottom - rec.top) : 1, 
		   base = (rec.right - rec.left) > 0 ? (rec.right - rec.left) : 1;
	rec = getRect(nessa);
	altura = altura < (rec.bottom - rec.top) ? altura : (rec.bottom - rec.top);
	base = base < (rec.right - rec.left) ? base : (rec.right - rec.left);

	//double toleranciaH = distancia, toleranciaV = distancia;
	double toleranciaH = base / 8, toleranciaV = altura / 8;
	toleranciaH = toleranciaH < (distancia * 2) ? (distancia * 2) : toleranciaH;
	toleranciaV = toleranciaV < (distancia * 2) ? (distancia * 2) : toleranciaV;

	for(int i = 0; i < (int)dessa.size(); i++)
	{
		bool achou = false;
		for(int j = 0; j < (int)nessa.size(); j++)
		{
			int xDifer = dessa[i].x - nessa[j].x;
			int yDifer = dessa[i].y - nessa[j].y;
			xDifer = xDifer < 0 ? xDifer * -1 : xDifer;
			yDifer = yDifer < 0 ? yDifer * -1 : yDifer;
			if(xDifer < toleranciaH && yDifer < toleranciaV)
			{
				achou = true;
				break;
			}
		}

		if(!achou)
			ptsNaoAchados++;
	}

	return ptsNaoAchados;
}

double Shape::compararFormas(vector<POINT> forma1, vector<POINT> forma2)
{
	int ptsN1 = ptsNaoAchados(forma1, forma2);
	int ptsN2 = ptsNaoAchados(forma2, forma1);
	double porcentagem1 =  ptsN1/((double)forma1.size()/100);
	double porcentagem2 = ptsN2/((double)forma2.size()/100);
	double controle = porcentagem1 > porcentagem2 ? porcentagem1 * 10 : porcentagem2 * 10;
	return ((porcentagem1 + porcentagem2 + controle) / 11 );
}

vector<POINT> Shape::getPontos()
{
	return pontos;
}

void Shape::setPontos(vector<POINT> pontos)
{
	this->pontos = pontos;
}

void Shape::setCDC(CClientDC *pcdc)
{
	if(cdc != 0)
		delete cdc;
	cdc = pcdc;
}