#pragma once
#include "stdafx.h"
#include "sqlite3.h"
#include "FrmStatus.h"
#include <vector>
using std::vector;

class Base
{
public:
	const CString name;

	Base(void);
	~Base(void);

	void abrirConexao();
	void fecharConexao();
	void addPerfil(CString perfil);
	void deletePerfil(CString perfil);
	bool getPerfis(vector<CString> &perfis);
	bool existePerfil(CString perfil, CString *id = 0);

	void addComando(CString perfil, CString comando);
	void deleteComando(CString perfil, CString comando);
	bool getComandos(CString perfil, vector<CString> &comandos);
	bool existeComando(CString perfil, CString comando, CString *id = 0);

	void addCoordenadas(CString perfil, CString comando, vector<POINT> pontos, LPVOID frmStatus);
	bool getCoordenadas(CString perfil, CString comando, vector<POINT> &pontos);
private:
	sqlite3 *handle;

	bool select(const char* comando, vector<vector<CString>> &result);
	bool execute(const char* comando);
};

