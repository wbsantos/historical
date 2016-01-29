// FrmPrincipal.cpp : implementation file
//

#include "stdafx.h"
#include "FrmGesto.h"
#include "FrmPrincipal.h"
#include "afxdialogex.h"
#include "FrmStatus.h"

// FrmPrincipal dialog

IMPLEMENT_DYNAMIC(FrmPrincipal, CDialogEx)


BOOL FrmPrincipal::OnInitDialog()
{
	CDialogEx::OnInitDialog();
	preenchePerfils();
	return TRUE;
}

FrmPrincipal::FrmPrincipal(CWnd* pParent /*=NULL*/)
	: CDialogEx(FrmPrincipal::IDD, pParent)
{
	
}

FrmPrincipal::~FrmPrincipal()
{
}

void FrmPrincipal::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_EDTPERFIS, edtPerfil);
	DDX_Control(pDX, IDC_LSTPERFIS, lstPerfis);
	DDX_Control(pDX, IDC_LSTCOMANDOS, lstComandos);
	DDX_Control(pDX, IDC_EDTCOMANDOS, edtComando);
}


BEGIN_MESSAGE_MAP(FrmPrincipal, CDialogEx)
	ON_BN_CLICKED(IDC_BTNADDPERFIS, &FrmPrincipal::OnBnClickedBtnaddperfis)
	ON_BN_CLICKED(IDC_BTNDELPERFIS, &FrmPrincipal::OnBnClickedBtndelperfis)
	ON_BN_CLICKED(IDC_BTNADDCOMANDOS, &FrmPrincipal::OnBnClickedBtnaddcomandos)
	ON_BN_CLICKED(IDC_BTNDELCOMANDOS, &FrmPrincipal::OnBnClickedBtndelcomandos)
	ON_LBN_SELCHANGE(IDC_LSTPERFIS, &FrmPrincipal::OnLbnSelchangeLstperfis)
	ON_LBN_SELCHANGE(IDC_LSTCOMANDOS, &FrmPrincipal::OnLbnSelchangeLstcomandos)
	ON_BN_CLICKED(IDOK, &FrmPrincipal::OnBnClickedOk)
	ON_BN_CLICKED(IDC_BTNBACKUP, &FrmPrincipal::OnBnClickedBtnbackup)
	ON_BN_CLICKED(IDC_BTNIMPORTAR, &FrmPrincipal::OnBnClickedBtnimportar)
END_MESSAGE_MAP()


// FrmPrincipal message handlers


void FrmPrincipal::OnBnClickedBtnaddperfis()
{
	// TODO: Add your control notification handler code here
	CString perfil;
	edtPerfil.GetWindowText(perfil);
	perfil = perfil.Trim();
	if(perfil != "")
		base.addPerfil(perfil);
	else
		AfxMessageBox("Digite o nome do novo perfil", 0, 0);

	edtPerfil.SetWindowText("");

	preenchePerfils();
}

void FrmPrincipal::preenchePerfils()
{
	int i = 0;
	vector<CString> perfis;
	base.getPerfis(perfis);

	lstPerfis.ResetContent();

	for(i = 0; i < (int)perfis.size(); i++)
		lstPerfis.AddString(perfis[i].GetString());

	if(i > 0)
		lstPerfis.SetCurSel(0);

	preencheComandos();
}

void FrmPrincipal::OnBnClickedBtndelperfis()
{
	// TODO: Add your control notification handler code here
	CString perfil = getPerfilSel();

	if(perfil != "")
	{
		base.deletePerfil(perfil);
		preenchePerfils();
	}
}


void FrmPrincipal::OnBnClickedBtnaddcomandos()
{
	// TODO: Add your control notification handler code here
	CString comando = "", perfil = getPerfilSel();

	edtComando.GetWindowText(comando);
	comando = comando.Trim();
	
	if(comando != "" && perfil != "")
	{
		bool repetir = false;
		do
		{
			int ret = IDCANCEL;
			repetir = false;
			AfxMessageBox("Após clicar em Ok o software aguardará a entrada do gesto, pressione ao mesmo tempo os botões esquerdo e direito do mouse.", 0, 0);

			FrmGesto dlgGesto(true);
			ShowWindow(SW_HIDE);
			dlgGesto.DoModal();
			BeginWaitCursor();

			vector<POINT> pontos = dlgGesto.shape.getPontos();

			ShowWindow(SW_SHOWNORMAL);
			if((int)pontos.size() > 0)
			{
				FrmStatus frmStatus(perfil, comando, pontos, &base);
				ret = frmStatus.DoModal();
				edtComando.SetWindowText("");
				preencheComandos();
			}
		
			EndWaitCursor();

			if(ret == IDYES)
				repetir = true;
		}while(repetir);
	}
	else
		AfxMessageBox("Selecione um perfil correspondente e digite o comando", 0, 0);
}

CString FrmPrincipal::getPerfilSel()
{
	CString perfil = "";
	int index = lstPerfis.GetCurSel();

	if(index >= 0)
		lstPerfis.GetText(index, perfil);

	return perfil;
}

CString FrmPrincipal::getComandoSel()
{
	CString comando = "";
	int index = lstComandos.GetCurSel();

	if(index >= 0)
		lstComandos.GetText(index, comando);

	return comando;
}

void FrmPrincipal::OnBnClickedBtndelcomandos()
{
	// TODO: Add your control notification handler code here
	CString perfil = getPerfilSel(), comando = getComandoSel();
	
	if(comando != "" && perfil != "")
	{
		base.deleteComando(perfil, comando);
		preencheComandos();
		if(lstComandos.GetCount() > 0)
			lstComandos.SetCurSel(0);
	}
}


void FrmPrincipal::preencheComandos()
{
	vector<CString> comandos;
	CString perfil = getPerfilSel();
	
	lstComandos.ResetContent();

	if(perfil != "")
	{
		int i = 0;
		
		base.getComandos(perfil, comandos);
		for(i = 0; i < (int)comandos.size(); i++)
			lstComandos.AddString(comandos[i]);

		lstComandos.SetCurSel(-1);

		desenharCoordenada();
	}
}

void FrmPrincipal::OnLbnSelchangeLstperfis()
{
	// TODO: Add your control notification handler code here
	preencheComandos();
}

void FrmPrincipal::desenharCoordenada()
{
	int l = 70, h = 70, x = 220, y = 205;
	int k, w, i, j;
	vector<POINT> pontos;
	CClientDC cdc(this);
	CString perfil = getPerfilSel(), comando = getComandoSel();
	
	if(comando != "" && perfil != "")
		base.getCoordenadas(perfil, comando, pontos);

	{
		int xl = x + l;
		int yh = y + h;
		for(k = x; k <= xl; k++)
			for(w = y; w <= yh; w++)
				cdc.SetPixel(k, w, RGB(0,0,0));
	}

	if((int)pontos.size() > 0)
	{
		Shape temp(2);
		vector<POINT> esc;

		temp.setPontos(pontos);
		temp.reposicionar();
		pontos = temp.getPontos();
		
		RECT rec = temp.getRect();
		double propH = 1, propV = 1;

		propV = (rec.bottom > (h - 20)) ? 
					(double)(h - 20) / (rec.bottom) : 
					(double)(rec.bottom) / (h - 20);

		propH = (rec.right > (l - 20)) ? 
					(double)(l - 20) / (rec.right) : 
					(double)(rec.right) / (l - 20);

		esc = temp.escalonar(pontos, propV, propH);
		esc = temp.quebrarForma(esc, 2);
		temp.setPontos(esc);
		temp.reposicionar();
		esc = temp.getPontos();

		
		for(k = 0; k < (int)esc.size(); k++)
			for(i = 0; i < 2; i++)
				for(j = 0; j < 2; j++)
					cdc.SetPixel(esc[k].x + i + (x + 10), esc[k].y + j + (y + 10), RGB(255,0,0));
	}
}

void FrmPrincipal::OnLbnSelchangeLstcomandos()
{
	// TODO: Add your control notification handler code here
	desenharCoordenada();
}

void FrmPrincipal::OnBnClickedOk()
{
	// TODO: Add your control notification handler code here
	FrmGesto dlgGesto(false);
	dlgGesto.setPerfil(getPerfilSel());
	ShowWindow(SW_HIDE);
	dlgGesto.DoModal();
}


void FrmPrincipal::OnBnClickedBtnbackup()
{
	CFileDialog fOpenDlg(FALSE, "sco", "Gestos", OFN_HIDEREADONLY|OFN_FILEMUSTEXIST, "Base (*.sco)|*.sco||", this);
  
	fOpenDlg.m_pOFN->lpstrTitle="Selecione o diretório";
  
	fOpenDlg.m_pOFN->lpstrInitialDir="c:";
  
	if(fOpenDlg.DoModal()==IDOK)
		CopyFile(base.name, fOpenDlg.GetPathName(), false);
}


void FrmPrincipal::OnBnClickedBtnimportar()
{
	// TODO: Add your control notification handler code here
	CFileDialog fOpenDlg(TRUE, "sco", "Gestos", OFN_HIDEREADONLY|OFN_FILEMUSTEXIST, "Base (*.sco)|*.sco||", this);
  
	fOpenDlg.m_pOFN->lpstrTitle="Selecione o diretório";
  
	fOpenDlg.m_pOFN->lpstrInitialDir="c:";
  
	if(fOpenDlg.DoModal()==IDOK)
	{
		base.fecharConexao();
		CopyFile(fOpenDlg.GetPathName(), base.name, false);
		base.abrirConexao();
		preenchePerfils();
	}
}
