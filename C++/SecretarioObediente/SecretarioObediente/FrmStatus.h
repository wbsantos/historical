#pragma once
#include "Resource.h"
#include "afxwin.h"
#include "afxcmn.h"
#include "Base.h"
#include <vector>
using std::vector;

// FrmStatus dialog

class FrmStatus : public CDialogEx
{
	DECLARE_DYNAMIC(FrmStatus)

public:
	FrmStatus(CString perfil, CString comando, vector<POINT> pontos, LPVOID base);   // standard constructor
	virtual ~FrmStatus();

// Dialog Data
	enum { IDD = IDD_DLGSTATUS };

private:
	CStatic lblDescricao;
	CProgressCtrl pgrBarra;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	int total;
	CString perfil;
	CString comando;
	vector<POINT> pontos;
	LPVOID base;
	virtual BOOL OnInitDialog();

	DECLARE_MESSAGE_MAP()
public:
	void setValueBarra(int value);
	void next();
	afx_msg void OnBnClickedBtniniciar();
	afx_msg void OnBnClickedBtncancelar();
	afx_msg void OnBnClickedBntrepetir();
};
