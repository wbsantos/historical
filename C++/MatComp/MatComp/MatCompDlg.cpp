
// MatCompDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Number.h"
#include "MatComp.h"
#include "MatCompDlg.h"
#include "afxdialogex.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CAboutDlg dialog used for App About

class CAboutDlg : public CDialogEx
{
public:
	CAboutDlg();

// Dialog Data
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

// Implementation
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialogEx(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialogEx)
END_MESSAGE_MAP()


// CMatCompDlg dialog




CMatCompDlg::CMatCompDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CMatCompDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
	editAtual = 0;
}

void CMatCompDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_LSTA, lstA);
	DDX_Control(pDX, IDC_EDTA, txtA);
	DDX_Control(pDX, IDC_EDTB, txtB);
	DDX_Control(pDX, IDC_LSTB, lstB);
	DDX_Control(pDX, IDC_LSTAB, lstAB);
	DDX_Control(pDX, IDC_EDTAB, txtAB);
	DDX_Control(pDX, IDC_EDTAVALIACAO, edtAvaliacao);
}

BEGIN_MESSAGE_MAP(CMatCompDlg, CDialogEx)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BTNA, &CMatCompDlg::OnBnClickedBtna)
	ON_BN_CLICKED(IDC_BTNB, &CMatCompDlg::OnBnClickedBtnb)
	ON_BN_CLICKED(IDC_BTNAB, &CMatCompDlg::OnBnClickedBtnab)
	ON_EN_SETFOCUS(IDC_EDTA, &CMatCompDlg::OnEnSetfocusEdta)
	ON_EN_SETFOCUS(IDC_EDTB, &CMatCompDlg::OnEnSetfocusEdtb)
	ON_EN_SETFOCUS(IDC_EDTAB, &CMatCompDlg::OnEnSetfocusEdtab)
	ON_LBN_SETFOCUS(IDC_LSTA, &CMatCompDlg::OnLbnSetfocusLsta)
	ON_LBN_SETFOCUS(IDC_LSTB, &CMatCompDlg::OnLbnSetfocusLstb)
	ON_BN_CLICKED(IDOK, &CMatCompDlg::OnBnClickedOk)
END_MESSAGE_MAP()


// CMatCompDlg message handlers

BOOL CMatCompDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		BOOL bNameValid;
		CString strAboutMenu;
		bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
		ASSERT(bNameValid);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

	// TODO: Add extra initialization here

	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CMatCompDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialogEx::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CMatCompDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialogEx::OnPaint();
	}
}

// The system calls this function to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CMatCompDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}



void CMatCompDlg::OnBnClickedBtna()
{
	// TODO: Add your control notification handler code here
	CString a;
	txtA.GetWindowTextW(a);
	
	if(!isNumber(a.Trim()))
	{
		MessageBox(L"Item A não é um número válido", L"Item inválido");
		txtA.SetFocus();
		return;
	}

	addStringInList(lstA, a.Trim());

	txtA.SetWindowTextW(L"");
	txtA.SetFocus();
}


void CMatCompDlg::OnBnClickedBtnb()
{
	// TODO: Add your control notification handler code here
	CString b;
	txtB.GetWindowTextW(b);

	if(!isNumber(b.Trim()))
	{
		MessageBox(L"Item B não é um número válido", L"Item inválido");
		txtB.SetFocus();
		return;
	}

	addStringInList(lstB, b.Trim());

	txtB.SetWindowTextW(L"");
	txtB.SetFocus();
}


void CMatCompDlg::OnBnClickedBtnab()
{
	// TODO: Add your control notification handler code 
	CString strAB;
	CString strA, strB;
	txtAB.GetWindowTextW(strAB);

	if(strAB == L"")
	{
		int iA = getSelIndex(lstA), iB = getSelIndex(lstB);
		if(iA < 0 || iB < 0)
		{
			MessageBox(L"Selecione um item na Lista A e outro na Lista B", L"Selecione os itens");
			return;
		}

		lstA.GetText(iA, strA);
		lstB.GetText(iB, strB);
	}
	else
	{
		bool primeiraParte = true;
		for(int i = 0; i < strAB.GetLength(); i++)
		{
			if(strAB[i] == L',')
			{
				primeiraParte = false;
				continue;
			}
			primeiraParte ? strA += strAB[i] : strB += strAB[i]; 
		}
	}

	strA = strA.Trim();
	strB = strB.Trim();

	if(!isNumber(strA))
	{
		MessageBox(L"Item A não é um número válido.\nDigite separado por vírgula no formato: a, b", L"Item inválido");
		txtAB.SetFocus();
		return;
	}
		
	if(!isNumber(strB))
	{
		MessageBox(L"Item B não é um número válido.\nDigite separado por vírgula no formato: a, b", L"Item inválido");
		txtAB.SetFocus();
		return;
	}

	addStringInList(lstAB, L"(" + strA + L", " + strB + L")");

	if(strAB != L"")
	{
		addStringInList(lstA, strA);
		addStringInList(lstB, strB);
		txtAB.SetWindowTextW(L"");
		txtAB.SetFocus();
	}

	avaliar();
}


int CMatCompDlg::getSelIndex(CListBox &lst)
{
	for(int i = 0; i < lst.GetCount(); i++)
		if(lst.GetSel(i) == 1)
			return i;
	return -1;
}



void CMatCompDlg::OnEnSetfocusEdta()
{
	// TODO: Add your control notification handler code here
	editAtual = 1;
}


void CMatCompDlg::OnEnSetfocusEdtb()
{
	// TODO: Add your control notification handler code here
	editAtual = 2;
}


void CMatCompDlg::OnEnSetfocusEdtab()
{
	// TODO: Add your control notification handler code here
	editAtual = 3;
}


void CMatCompDlg::OnLbnSetfocusLsta()
{
	// TODO: Add your control notification handler code here
	editAtual = 3;
}


void CMatCompDlg::OnLbnSetfocusLstb()
{
	// TODO: Add your control notification handler code here
	editAtual = 3;
}


void CMatCompDlg::OnBnClickedOk()
{
	// TODO: Add your control notification handler code here
	switch(editAtual)
	{
	case 1:
		OnBnClickedBtna();
		break;
	case 2:
		OnBnClickedBtnb();
		break;
	case 3:
		OnBnClickedBtnab();
		break;
	}

	//CDialogEx::OnOK();
}

void CMatCompDlg::avaliar()
{
	if(lstAB.GetCount() == 0)
	{
		MessageBox(L"Não há nenhum item em R(A,B)", L"Dados insuficientes");
		txtAB.SetFocus();
		return;
	}

	Relacoes rel = criarRelacao();
	bool reverse = false;
	CString descricao;
	
	while(!reverse)
	{
		reverse = !(descricao == L"");
		CString relacao, funcao;

		if(rel.simetrica())
			relacao.Append((relacao == L"" ? L"(" : L", ") + CString(L"Simetrica"));
		else if(rel.assimetrica())
			relacao.Append((relacao == L"" ? L"(" : L", ") + CString(L"Assimetrica"));
		else if(rel.assimetrica())
			relacao.Append((relacao == L"" ? L"(" : L", ") + CString(L"Anti-simetrica"));

		if(rel.reflexiva())
			relacao.Append((relacao == L"" ? L"(" : L", ") + CString(L"Reflexiva"));
		else if(rel.irreflexiva())
			relacao.Append((relacao == L"" ? L"(" : L", ") + CString(L"Irreflexiva"));
		else
			relacao.Append((relacao == L"" ? L"(" : L", ") + CString(L"Não reflexiva"));

		if(rel.transitiva())
			relacao.Append((relacao == L"" ? L"(" : L", ") + CString(L"Transitiva"));
		if(rel.equivalente())
			relacao.Append((relacao == L"" ? L"(" : L", ") + CString(L"Equivalente"));
		if(rel.ordem())
			relacao.Append((relacao == L"" ? L"(" : L", ") + CString(L"Ordem"));
	
		if(relacao != L"")
		{
			relacao.Append(L")");
			descricao.Append(L"Relação: " + relacao);
		}

		if(rel.funcao())
		{
			if(rel.funcaoTotal())
				funcao.Append((funcao == L"" ? L"(" : L", ") + CString(L"Total"));
			if(rel.funcaoInjetiva())
				funcao.Append((funcao == L"" ? L"(" : L", ") + CString(L"Injetiva"));
			if(rel.funcaoSobrejetiva())
				funcao.Append((funcao == L"" ? L"(" : L", ") + CString(L"Sobrejetiva"));
			if(rel.funcaoBijetiva())
				funcao.Append((funcao == L"" ? L"(" : L", ") + CString(L"Bijetiva"));

			if(funcao != L"")
			{
				funcao.Append(L")");
				descricao.Append(L"\r\nFunção: " + funcao);
			}
		}		
		else
		{
			descricao.Append(L"\r\nNão é Função");
		}

		rel.reverterRelacao();
		if(!reverse)
			descricao += L"\r\n\r\n********************Inversa da Relação********************\r\n\r\n";
	}
	
	edtAvaliacao.SetWindowTextW(descricao);
}

Relacoes CMatCompDlg::criarRelacao()
{
	vector<int> a;
	vector<int> b;
	vector<vector<int>> ab;
	int i, j;

	for(i = 0; i < lstAB.GetCount(); i++)
	{
		vector<int> temp;
		CString str, strA, strB;
		lstAB.GetText(i, str);

		bool parteA = true;
		for(j = 1; j < str.GetLength() - 1; j++)
		{
			if(str[j] == L',')
			{
				parteA = false;
				continue;
			}
			parteA ? strA += str[j] : strB += str[j];
		}

		temp.push_back(_wtoi(strA.Trim()));
		temp.push_back(_wtoi(strB.Trim()));

		ab.push_back(temp);
	}

	for(i = 0; i < lstA.GetCount(); i++)
	{
		CString strA;
		lstA.GetText(i, strA);

		a.push_back(_wtoi(strA.Trim()));
	}

	for(i = 0; i < lstB.GetCount(); i++)
	{
		CString strB;
		lstB.GetText(i, strB);

		b.push_back(_wtoi(strB.Trim()));
	}

	return (Relacoes(a, b, ab));
}

void CMatCompDlg::addStringInList(CListBox &lst, CString str)
{
	for(int i = 0; i < lst.GetCount(); i++)
	{
		CString temp;
		lst.GetText(i, temp);
		if(temp == str)
			return;
	}
	lst.AddString(str);
}