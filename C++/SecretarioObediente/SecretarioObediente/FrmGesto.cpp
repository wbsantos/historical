
// SecretarioObedienteDlg.cpp : implementation file
//

#include "stdafx.h"
#include "SecretarioObediente.h"
#include "FrmGesto.h"
#include "afxdialogex.h"
#include "windows.h"
#include "Math.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

FrmGesto::FrmGesto(bool insert, CWnd* pParen)
	: CDialogEx(FrmGesto::IDD, pParen), shape(5)
{
	this->insert = insert;
}

FrmGesto::~FrmGesto()
{

}

void FrmGesto::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(FrmGesto, CDialogEx)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_CTLCOLOR()
END_MESSAGE_MAP()


// FrmGesto message handlers

BOOL FrmGesto::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO: Add extra initialization here
	transparecer();
	m_brush.CreateSolidBrush(0);

	ShowWindow(SW_HIDE);
	verificarMouse();
	return TRUE;  // return TRUE  unless you set the focus to a control
}

//*****************************TESTES************************************************************************************
#define WS_EX_LAYERED           0x00080000   

#define LWA_COLORKEY            0x00000001
#define LWA_ALPHA               0x00000002

void FrmGesto::transparecer()
{
	// Windows need to be layered to be made transparent. This is done
	// by modifying the extended style bits to contain WS_EX_LAYARED. 
	SetLastError(0);

	SetWindowLong(this->m_hWnd, GWL_EXSTYLE , GetWindowLong(this->m_hWnd, GWL_EXSTYLE) | WS_EX_LAYERED);

	if (GetLastError())
		return ;
	// Now, we need to set the 'layered window attributes'. This
	// is where the alpha values get set. 
	SetLayeredWindowAttributes(RGB(255,255,255), 127, LWA_COLORKEY|LWA_ALPHA);
}

HBRUSH FrmGesto::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor) 
{
//	HBRUSH hbr = CFormView::OnCtlColor(pDC, pWnd, nCtlColor);

	return m_brush;	
	// TODO: Return a different brush if the default is not desired
//	return hbr;
}

void FrmGesto::verificarMouse()
{
	POINT pt;	
	int capt = 0;

	while(1)
	{
		if((GetKeyState(VK_LBUTTON) & 0x80) && (GetKeyState(VK_RBUTTON) & 0x80))
		{
			if(capt == 0)
			{
				capt = 1;
				shape.setPontos(vector<POINT>());
				ShowWindow(SW_MAXIMIZE);
				shape.setCDC(new CClientDC(this));
			}
			else if(capt == 1)
			{
				if(GetCursorPos(&pt))
					shape.addPoint(pt);
			}
			Sleep(10);
		}
		else
		{
			if(capt == 1)
			{
				capt = 0;
				if(!insert)
				{
					executarComando();
					ShowWindow(SW_HIDE);
				}
				else
				{
					OnOK();		
					break;
				}
			}
			Sleep(100);
		}
	}
}

void FrmGesto::setPerfil(CString perfil)
{
	this->perfil = perfil;
}

void FrmGesto::executarComando()
{
	vector<CString> comandos;
	CString comando;
	double porcentagem = 101;
	Base base;

	base.getComandos(perfil, comandos);	
	
	for(int i = 0; i < (int)comandos.size(); i++)
	{
		double porcentagemAux;
		vector<POINT> pontos;
		base.getCoordenadas(perfil, comandos[i], pontos);

		Shape shapeB(5);
		shapeB.setPontos(pontos);
		porcentagemAux = shape.comparar(shapeB);

		if(porcentagemAux < porcentagem)
		{
			comando = comandos[i];
			porcentagem = porcentagemAux;
		}
	}

	//if(porcentagem < 70)
		ShellExecute(m_hWnd, "open", comando, "", "", SW_SHOWNORMAL);
	//else
	//	AfxMessageBox("Comando não identificado");
}