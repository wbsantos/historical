package com.isy;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

public class MainService extends Service
{
	private SoundsGet mSoundsGet;
	
	@Override
	public IBinder onBind(Intent intent) 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void onCreate() 
	{
		  super.onCreate();
		  mSoundsGet = new SoundsGet(null);
		  mSoundsGet.start();
		  ConfigActivity.setPreferenceDetector(true);
	}
	
	@Override
	public void onDestroy() 
	{
		super.onDestroy();
		ConfigActivity.setPreferenceDetector(false);
		try 
		{
			mSoundsGet.parar();
			mSoundsGet.join();
		} 
		catch (InterruptedException e) 
		{
			
		}
	}
	
	public static boolean isRunning()
	{
		return ConfigActivity.getPreferenceDetector();
	}
}
