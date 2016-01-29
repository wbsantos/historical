#pragma once
#include "vector"
using std::vector;

class Shape
{
public:
	Shape(long distancia);
	Shape(CClientDC *pcdc, long distancia);
	bool operator==(Shape other);

	~Shape(void);

	double comparar(Shape other);
	void addPoint(POINT pt);
	vector<POINT> escalonar(vector<POINT> pts, double proporcaoVertical, double proporcaoHorizontal);
	vector<POINT> quebrarForma(vector<POINT> pts, long distancia);
	RECT getRect();
	RECT getRect(vector<POINT> pontos);
	vector<POINT> getPontos();
	void setPontos(vector<POINT> pontos);
	void setCDC(CClientDC *pcdc);
	void reposicionar();

private:
	CClientDC *cdc;
	long distancia;
	vector<POINT> pontos;

	int ptsNaoAchados(vector<POINT> dessa, vector<POINT> nessa);
	double hipotenusa(POINT p1, POINT p2);
	double catetoOposto(POINT p1, POINT p2);
	double catetoAdjacente(POINT p1, POINT p2);
	long novoX(POINT p1, POINT p2);
	long novoY(POINT p1, POINT p2);
	POINT novoPonto(POINT p1, POINT p2);
	void desenharPixel(POINT ponto);
	double compararFormas(vector<POINT> forma1, vector<POINT> forma2);
};

