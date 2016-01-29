
// SecretarioObedienteDlg.h : header file
//

#pragma once
#include "afxwin.h"
#include "Resource.h"
#include "vector"
#include "Shape.h"
#include "Base.h"
using std::vector;

// FrmGesto dialog
class FrmGesto : public CDialogEx
{

// Construction
public:
	FrmGesto(bool insert = false, CWnd* pParen = NULL);	// standard constructor
	~FrmGesto();
// Dialog Data
	enum { IDD = IDD_DLGGESTO };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	virtual BOOL OnInitDialog();

	void verificarMouse();
// Implementation
protected:
	CBrush m_brush;
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);
	DECLARE_MESSAGE_MAP()
public:
	void transparecer();

	Shape shape;
	bool insert;
	void setPerfil(CString perfil);

private:
	CString perfil;
	void executarComando();
};
