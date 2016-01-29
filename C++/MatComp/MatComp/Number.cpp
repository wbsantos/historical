#include "stdafx.h"
#include "Number.h"

bool isNumber(CString str)
{
	if(str == L"")
		return false;

	for(int i = 0; i < str.GetLength(); i++)
	{
		if(str[i] < L'0' || str[i] > '9')
			return false;
	}

	return true;
}