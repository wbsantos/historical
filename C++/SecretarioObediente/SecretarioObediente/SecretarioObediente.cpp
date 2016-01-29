
// SecretarioObediente.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "SecretarioObediente.h"
#include "FrmPrincipal.h"
#include "Tlhelp32.h"
#include "winbase.h"
#include <vector>
using std::vector;

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CSecretarioObedienteApp

BEGIN_MESSAGE_MAP(CSecretarioObedienteApp, CWinApp)
	ON_COMMAND(ID_HELP, &CWinApp::OnHelp)
END_MESSAGE_MAP()

// Function to kill Process using Process ID
int Killprocess(int nProcessID)
{
	HANDLE hProcess = OpenProcess( PROCESS_TERMINATE, 0, nProcessID );
	if (hProcess == NULL)
		return -1;
	BOOL nReturnVal = TerminateProcess( hProcess, 9 );
	CloseHandle (hProcess);
	return nReturnVal;
}


// Function to get all Process Name and Process ID
void GetProcessByName()
{
	CString processName = AfxGetApp()->m_pszAppName;
	DWORD curId = GetCurrentProcessId();
	HANDLE hSnapShot = CreateToolhelp32Snapshot (TH32CS_SNAPALL,NULL);
	PROCESSENTRY32 pEntry;
	pEntry.dwSize = sizeof(pEntry);
	//Get first process
	Process32First(hSnapShot,&pEntry);
	//Get all processes
	BOOL hRes;
	do
	{		
		hRes = Process32Next(hSnapShot,&pEntry);
		if(hRes==FALSE)
			break;
		if(CString(processName + ".exe").MakeUpper() == CString(pEntry.szExeFile).MakeUpper() && curId != pEntry.th32ProcessID)
			Killprocess(pEntry.th32ProcessID);
	}while(hRes == TRUE);
} 

// CSecretarioObedienteApp construction

CSecretarioObedienteApp::CSecretarioObedienteApp()
{
	// support Restart Manager
	m_dwRestartManagerSupportFlags = AFX_RESTART_MANAGER_SUPPORT_RESTART;

	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}


// The one and only CSecretarioObedienteApp object

CSecretarioObedienteApp theApp;


// CSecretarioObedienteApp initialization

BOOL CSecretarioObedienteApp::InitInstance()
{
	GetProcessByName();

	// InitCommonControlsEx() is required on Windows XP if an application
	// manifest specifies use of ComCtl32.dll version 6 or later to enable
	// visual styles.  Otherwise, any window creation will fail.
	INITCOMMONCONTROLSEX InitCtrls;
	InitCtrls.dwSize = sizeof(InitCtrls);
	// Set this to include all the common control classes you want to use
	// in your application.
	InitCtrls.dwICC = ICC_WIN95_CLASSES;
	InitCommonControlsEx(&InitCtrls);

	CWinApp::InitInstance();


	AfxEnableControlContainer();

	// Create the shell manager, in case the dialog contains
	// any shell tree view or shell list view controls.
	CShellManager *pShellManager = new CShellManager;

	// Standard initialization
	// If you are not using these features and wish to reduce the size
	// of your final executable, you should remove from the following
	// the specific initialization routines you do not need
	// Change the registry key under which our settings are stored
	// TODO: You should modify this string to be something appropriate
	// such as the name of your company or organization
	SetRegistryKey(_T("Local AppWizard-Generated Applications"));

	FrmPrincipal dlg;
	m_pMainWnd = &dlg;
	INT_PTR nResponse = dlg.DoModal();
	if (nResponse == IDOK)
	{
		// TODO: Place code here to handle when the dialog is
		//  dismissed with OK
	}
	else if (nResponse == IDCANCEL)
	{
		// TODO: Place code here to handle when the dialog is
		//  dismissed with Cancel
	}

	// Delete the shell manager created above.
	if (pShellManager != NULL)
	{
		delete pShellManager;
	}

	// Since the dialog has been closed, return FALSE so that we exit the
	//  application, rather than start the application's message pump.
	return FALSE;
}