#pragma once
#include "afxwin.h"
#include "Resource.h"
#include "Base.h"
#include <vector>
using std::vector;

// FrmPrincipal dialog

class FrmPrincipal : public CDialogEx
{
	DECLARE_DYNAMIC(FrmPrincipal)

private:
	Base base;

	void preenchePerfils();
	void preencheComandos();
	void desenharCoordenada();
	CString getPerfilSel();
	CString getComandoSel();

public:
	FrmPrincipal(CWnd* pParent = NULL);   // standard constructor
	virtual ~FrmPrincipal();

// Dialog Data
	enum { IDD = IDD_DLGPRINCIPAL };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual BOOL OnInitDialog();

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtnaddperfis();
	CEdit edtPerfil;
	CListBox lstPerfis;
	afx_msg void OnBnClickedBtndelperfis();
	afx_msg void OnBnClickedBtnaddcomandos();
	CListBox lstComandos;
	CEdit edtComando;
	afx_msg void OnBnClickedBtndelcomandos();
	afx_msg void OnLbnSelchangeLstperfis();
	afx_msg void OnLbnSelchangeLstcomandos();
	afx_msg void OnBnClickedOk();
	afx_msg void OnBnClickedBtnbackup();
	afx_msg void OnBnClickedBtnimportar();
};
