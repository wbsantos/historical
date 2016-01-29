// FrmStatus.cpp : implementation file
//
#include "stdafx.h"
#include "SecretarioObediente.h"
#include "FrmStatus.h"
#include "afxdialogex.h"


// FrmStatus dialog
IMPLEMENT_DYNAMIC(FrmStatus, CDialogEx)

BEGIN_MESSAGE_MAP(FrmStatus, CDialogEx)
	ON_BN_CLICKED(IDC_BTNINICIAR, &FrmStatus::OnBnClickedBtniniciar)
	ON_BN_CLICKED(IDC_BTNCANCELAR, &FrmStatus::OnBnClickedBtncancelar)
	ON_BN_CLICKED(IDC_BNTREPETIR, &FrmStatus::OnBnClickedBntrepetir)
END_MESSAGE_MAP()


// FrmStatus message handlers

FrmStatus::FrmStatus(CString perfil, CString comando, vector<POINT> pontos, LPVOID base)
	: CDialogEx(FrmStatus::IDD, NULL)
{
	this->perfil = perfil;
	this->comando = comando;
	this->pontos = pontos;
	this->base = base;
	this->total = (int)pontos.size();
}

FrmStatus::~FrmStatus()
{
}

void FrmStatus::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_LBLDESCRICAO, lblDescricao);
	DDX_Control(pDX, IDC_PRGBARRA, pgrBarra);
}

BOOL FrmStatus::OnInitDialog()
{
	CDialogEx::OnInitDialog();
	lblDescricao.SetWindowText("");
	SetWindowText("Armazenando Gesto");
	
	pgrBarra.SetStep(1);
	pgrBarra.SetRange(0, total);
	return TRUE;
}

void FrmStatus::setValueBarra(int value)
{
	pgrBarra.SetPos(value);
}

void FrmStatus::next()
{
	pgrBarra.StepIt();
	pgrBarra.Invalidate();
}

void FrmStatus::OnBnClickedBtniniciar()
{
	// TODO: Add your control notification handler code here
	lblDescricao.SetWindowText("Aguarde, calculando coordenadas...");
	BeginWaitCursor();
	if(base != 0)
	{
		((Base*)base)->addComando(perfil, comando);
		((Base*)base)->addCoordenadas(perfil, comando, pontos, this);
	}
	EndWaitCursor();
	OnOK();
}


void FrmStatus::OnBnClickedBtncancelar()
{
	// TODO: Add your control notification handler code here
	OnCancel();
}


void FrmStatus::OnBnClickedBntrepetir()
{
	// TODO: Add your control notification handler code here
	EndDialog(IDYES);
}
