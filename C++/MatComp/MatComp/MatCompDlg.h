
// MatCompDlg.h : header file
//

#pragma once
#include "afxcmn.h"
#include "afxwin.h"
#include "Relacoes.h"

// CMatCompDlg dialog
class CMatCompDlg : public CDialogEx
{
// Construction
public:
	CMatCompDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	enum { IDD = IDD_MATCOMP_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

private:
	int editAtual;
	Relacoes criarRelacao();

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedBtna();
	CListBox lstA;
	CEdit txtA;
	afx_msg void OnBnClickedBtnb();
	CEdit txtB;
	CListBox lstB;
	CListBox lstAB;
	afx_msg void OnBnClickedBtnab();

	static int getSelIndex(CListBox &lst);
	CEdit txtAB;
	afx_msg void OnEnSetfocusEdta();
	afx_msg void OnEnSetfocusEdtb();
	afx_msg void OnEnSetfocusEdtab();
	afx_msg void OnLbnSetfocusLsta();
	afx_msg void OnLbnSetfocusLstb();
	afx_msg void OnBnClickedOk();
	void avaliar();
	CEdit edtAvaliacao;
	void addStringInList(CListBox &lst, CString str);
};
