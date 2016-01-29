package com.isy;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

public class ConfigActivity extends Activity
{
	Spinner mSpnTolerance;
	Spinner mSpnVibration;
	Spinner mSpnTimer;
	final static String PREFERENCETIMER = "PREFERENCETIMER";
	final static String PREFERENCETOLERANCE = "PREFERENCETOLERANCE";
	final static String PREFERENCEDETECTOR = "PREFERENCEDETECTOR";
	final static String PREFERENCEVIBRATION = "PREFERENCEVIBRATION";
	
	/**
	 * @see android.app.Activity#onCreate(Bundle)
	 */
	@Override
	protected void onCreate(Bundle savedInstanceState) 
	{
		super.onCreate(savedInstanceState);
		// TODO Put your code here
        setContentView(R.layout.config);
        
        mSpnTolerance = (Spinner)findViewById(R.id.spnTolerance);
        mSpnVibration = (Spinner)findViewById(R.id.spnVibration);
        mSpnTimer = (Spinner)findViewById(R.id.spnTimer);
        preencherSpnTolerance();
        preencherSpnTimer();
        preencherSpnVibration();
        setSpnTolerance();
        setSpnTimer();
        setSpnVibration();
        
        mSpnVibration.setOnItemSelectedListener(
    	        new AdapterView.OnItemSelectedListener() 
    	        {
    				@Override
    				public void onItemSelected(AdapterView<?> arg0, View arg1,
    						int arg2, long arg3) 
    				{
    					setPreferenceVibration(getSpnVibration());
    				}
    	
    				@Override
    				public void onNothingSelected(AdapterView<?> arg0) 
    				{}
    			});
        
        mSpnTolerance.setOnItemSelectedListener(
	        new AdapterView.OnItemSelectedListener() 
	        {
				@Override
				public void onItemSelected(AdapterView<?> arg0, View arg1,
						int arg2, long arg3) 
				{
					setPreferenceTolerance(getSpnTolerance());
				}
	
				@Override
				public void onNothingSelected(AdapterView<?> arg0) 
				{}
			});
        
        mSpnTimer.setOnItemSelectedListener(
    	        new AdapterView.OnItemSelectedListener() 
    	        {
    				@Override
    				public void onItemSelected(AdapterView<?> arg0, View arg1,
    						int arg2, long arg3) 
    				{
    					setPreferenceTimer(getSpnTimer());
    				}
    	
    				@Override
    				public void onNothingSelected(AdapterView<?> arg0) 
    				{}
    			});
	}
	
	private void preencherSpnTolerance()
	{
		String [] string = new String[29];
		
		for(float v = 1, i = 0; v <= 15; i++, v += 0.5)
			string[(int)i] = Float.toString(v);
		
		ArrayAdapter<String> strAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, string);
		strAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		mSpnTolerance.setAdapter(strAdapter);
	}
	
	private float getSpnTolerance()
	{
		return Float.parseFloat((String)mSpnTolerance.getSelectedItem());
	}
	
	private float getSpnTolerance(int i)
	{
		return Float.parseFloat((String)mSpnTolerance.getItemAtPosition(i));
	}
	
	private void setSpnTolerance()
	{
		float val = getPreferenceTolerance();
		for(int i = 0; i < mSpnTolerance.getCount(); i++)
			if(getSpnTolerance(i) == val)
			{
				mSpnTolerance.setSelection(i);
				return;
			}
	}
	
	private void preencherSpnTimer()
	{
		String [] string = new String[19];
		
		for(int v = 2, i = 0; v <= 20; i++, v += 1)
			string[i] = Integer.toString(v);
		
		ArrayAdapter<String> strAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, string);
		strAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		mSpnTimer.setAdapter(strAdapter);		
	}
	
	private int getSpnTimer(int i)
	{
		return Integer.parseInt((String)mSpnTimer.getItemAtPosition(i));
	}
	
	private void setSpnTimer()
	{
		int val = getPreferenceTimer();
		for(int i = 0; i < mSpnTimer.getCount(); i++)
			if(getSpnTimer(i) == val)
			{
				mSpnTimer.setSelection(i);
				return;
			}
	}
	
	private int getSpnTimer()
	{
		return Integer.parseInt((String)mSpnTimer.getSelectedItem());
	}
	
	public static int getPreferenceTimer()
	{
		SharedPreferences pref = IsyApplication.getAppContext().getSharedPreferences(PREFERENCETIMER, MODE_PRIVATE);
		return pref.getInt(PREFERENCETIMER, 6);
	}
	
	public static int getPreferenceVibration()
	{
		SharedPreferences pref = IsyApplication.getAppContext().getSharedPreferences(PREFERENCEVIBRATION, MODE_PRIVATE);
		return pref.getInt(PREFERENCEVIBRATION, 500);
	}
	
	public static float getPreferenceTolerance()
	{
		SharedPreferences pref = IsyApplication.getAppContext().getSharedPreferences(PREFERENCETOLERANCE, MODE_PRIVATE);
		return pref.getFloat(PREFERENCETOLERANCE, (float) 2.5);
	}
	
	public static void setPreferenceTimer(int timer)
	{
		SharedPreferences pref = IsyApplication.getAppContext().getSharedPreferences(PREFERENCETIMER, MODE_PRIVATE);
		SharedPreferences.Editor edit = pref.edit();
		edit.putInt(PREFERENCETIMER, timer);
		edit.commit();
		SoundsGet.setTimer(timer);
	}
	
	public static void setPreferenceVibration(int timer)
	{
		SharedPreferences pref = IsyApplication.getAppContext().getSharedPreferences(PREFERENCEVIBRATION, MODE_PRIVATE);
		SharedPreferences.Editor edit = pref.edit();
		edit.putInt(PREFERENCEVIBRATION, timer);
		edit.commit();
		SoundsGet.setTimerVibration(timer);
	}
	
	public static void setPreferenceTolerance(float tolerance)
	{
		SharedPreferences pref = IsyApplication.getAppContext().getSharedPreferences(PREFERENCETOLERANCE, MODE_PRIVATE);
		SharedPreferences.Editor edit = pref.edit();
		edit.putFloat(PREFERENCETOLERANCE, tolerance);
		edit.commit();
		SoundsGet.setTolerance(tolerance);
	}
	
	public static void setPreferenceDetector(boolean active)
	{
		SharedPreferences pref = IsyApplication.getAppContext().getSharedPreferences(PREFERENCEDETECTOR, MODE_PRIVATE);
		SharedPreferences.Editor edit = pref.edit();
		edit.putBoolean(PREFERENCEDETECTOR, active);
		edit.commit();
	}
	
	public static boolean getPreferenceDetector()
	{
		SharedPreferences pref = IsyApplication.getAppContext().getSharedPreferences(PREFERENCEDETECTOR, MODE_PRIVATE);
		return pref.getBoolean(PREFERENCEDETECTOR, false);
	}

	private void preencherSpnVibration()
	{
		String [] string = new String[6];
		
		for(int v = 500, i = 0; i < 6; i++, v += 500)
			string[i] = Integer.toString(v);
		
		ArrayAdapter<String> strAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, string);
		strAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		mSpnVibration.setAdapter(strAdapter);		
	}
	
	private int getSpnVibration(int i)
	{
		return Integer.parseInt((String)mSpnVibration.getItemAtPosition(i));
	}
	
	private int getSpnVibration()
	{
		return Integer.parseInt((String)mSpnVibration.getSelectedItem());
	}
	
	private void setSpnVibration()
	{
		int val = getPreferenceVibration();
		for(int i = 0; i < mSpnVibration.getCount(); i++)
			if(getSpnVibration(i) == val)
			{
				mSpnVibration.setSelection(i);
				return;
			}
	}
}
