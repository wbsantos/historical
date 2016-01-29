package com.isy;

import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;

public class PhoneState extends PhoneStateListener 
{
	static private boolean mEmLigacao = false;

	public void onCallStateChanged(int state,String incomingNumber)
	{
		mEmLigacao = state != TelephonyManager.CALL_STATE_IDLE;
	}
	
	public static boolean emLigacao()
	{
		return mEmLigacao;
	}
}
