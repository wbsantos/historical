#include "StdAfx.h"
#include "Base.h"

Base::Base(void) : name("base.sco")
{
	abrirConexao();
}

Base::~Base(void)
{
	fecharConexao();
}

void Base::abrirConexao()
{
	if(sqlite3_open(name, &handle))
		handle = 0;
}

void Base::fecharConexao()
{
	sqlite3_close(handle);
}

void Base::addPerfil(CString perfil)
{
	if(!existePerfil(perfil))
	{	
		CString sql = "INSERT INTO PERFIL (PFPERFIL) VALUES ('" + perfil + "')";
		sqlite3_exec(handle, sql.GetString(), 0, 0, 0);
	}
}

void Base::addComando(CString perfil, CString comando)
{
	CString idPerfil;
	if(existePerfil(perfil, &idPerfil) && !(existeComando(perfil, comando)))
	{	
		CString sql = "INSERT INTO COMANDOS (CMPFID, CMCOMANDO) VALUES (" + idPerfil + ", '" + comando + "')";
		sqlite3_exec(handle, sql.GetString(), 0, 0, 0);
	}
}

void Base::addCoordenadas(CString perfil, CString comando, vector<POINT> pontos, LPVOID pfrmStatus)
{
	FrmStatus *frmStatus = (FrmStatus*)pfrmStatus;
	CString idComando;

	if(existeComando(perfil, comando, &idComando))
	{
		CString sql;
		
		for(int i = 0; i < (int)pontos.size(); i++)
		{
			if(frmStatus != 0)
				frmStatus->next();
			sql.Format("INSERT INTO COORDENADAS (COCMID, COX, COY) VALUES (%s, %d, %d); ", idComando, pontos[i].x, pontos[i].y);
			sqlite3_exec(handle, sql.GetString(), 0, 0, 0);
		}
	}
}

void Base::deletePerfil(CString perfil)
{
	CString id;
	if(existePerfil(perfil, &id))
	{
		execute("DELETE FROM COORDENADAS WHERE EXISTS(SELECT CMID FROM COMANDOS WHERE CMID = COCMID AND CMPFID = " + id + ") ");
		execute("DELETE FROM COMANDOS WHERE CMPFID = " + id);
		execute("DELETE FROM PERFIL WHERE PFID = " + id);
	}
}

void Base::deleteComando(CString perfil, CString comando)
{
	CString id;
	if(existeComando(perfil, comando, &id))
	{
		execute("DELETE FROM COORDENADAS WHERE COCMID = " + id);
		execute("DELETE FROM COMANDOS WHERE CMID = " + id);
	}
}

bool Base::getPerfis(vector<CString> &perfis)
{
	vector<vector<CString>> result;

	if(!select("SELECT PFPERFIL FROM PERFIL", result))
		return false;

	for(int i = 0; i < (int)result.size(); i++)
		perfis.push_back(result[i][0]);

	return true;
}

bool Base::getComandos(CString perfil, vector<CString> &comandos)
{
	CString idPerfil;
	vector<vector<CString>> result;

	if(!existePerfil(perfil, &idPerfil))
		return false;

	if(!select("SELECT CMCOMANDO FROM COMANDOS WHERE CMPFID = " + idPerfil, result))
		return false;

	for(int i = 0; i < (int)result.size(); i++)
		comandos.push_back(result[i][0]);

	return true;
}

bool Base::getCoordenadas(CString perfil, CString comando, vector<POINT> &pontos)
{
	CString idComando;
	vector<vector<CString>> result;
	if(existeComando(perfil, comando, &idComando))
	{
		if(select("SELECT COX, COY FROM COORDENADAS WHERE COCMID = " + idComando, result))
		{
			for(int i = 0; i < (int)result.size(); i++)
			{
				POINT pt;
				pt.x = atoi(result[i][0]);
				pt.y = atoi(result[i][1]);
				pontos.push_back(pt);
			}
			return true;
		}
	}

	return false;
}

bool Base::existePerfil(CString perfil, CString *id)
{
	vector<vector<CString>> result;
	CString sql = "SELECT PFPERFIL, PFID FROM PERFIL WHERE PFPERFIL = '" + perfil + "'";
	if(select(sql, result))
	{
		if(id !=0)
			*id = result[0][1];

		return true;
	}
	else
		return false;
}

bool Base::existeComando(CString perfil, CString comando, CString *id)
{
	vector<vector<CString>> result;
	CString idPerfil;

	if(existePerfil(perfil, &idPerfil))
	{
		CString sql = "SELECT CMCOMANDO, CMID FROM COMANDOS WHERE CMCOMANDO = '" + comando + "' AND CMPFID = " + idPerfil;
		if(select(sql, result))
		{
			if(id !=0)
				*id = result[0][1];

			return true;
		}
		else
			return false;
	}
	else
		return false;
}

bool Base::select(const char* comando, vector<vector<CString>> &result)
{
	sqlite3_stmt *stmt = 0;

	if(sqlite3_prepare_v2(handle, comando, -1, &stmt, 0))
		return false;

	int cols = sqlite3_column_count(stmt);

	if(!(sqlite3_step(stmt) == SQLITE_ROW))
		return false;

	do
	{
		vector<CString> row;

		for(int i = 0; i < cols; i++)
			row.push_back(CString(sqlite3_column_text(stmt, i)));

		result.push_back(row);
	}while(sqlite3_step(stmt) == SQLITE_ROW);

	return true;
}

bool Base::execute(const char *comando)
{
	return !(sqlite3_exec(handle, comando, 0, 0, 0));
}