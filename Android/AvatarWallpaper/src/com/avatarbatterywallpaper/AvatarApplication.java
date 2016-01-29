package com.avatarbatterywallpaper;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

public class AvatarApplication extends Application {
	
	private static Context context;
	final static String PREFERENCES_NAME = "AvatarWallpaperPreferences";
	final static String ALWAYS_CENTRALIZED = "AlwaysCentralized";

    public void onCreate(){
        super.onCreate();
        AvatarApplication.context = getApplicationContext();
    }

    public static Context getAppContext() {
        return AvatarApplication.context;
    }
    
    public static boolean getAlwaysCentralized()
    {
    	SharedPreferences pref = getAppContext().getSharedPreferences(PREFERENCES_NAME, 0); 
    	return pref.getBoolean(ALWAYS_CENTRALIZED, false);
    }
    
    public static void setAlwaysCentralized(boolean alwaysCentralized)
    {
    	SharedPreferences pref = getAppContext().getSharedPreferences(PREFERENCES_NAME, 0); 
    	Editor editor = pref.edit();
    	editor.putBoolean(ALWAYS_CENTRALIZED, alwaysCentralized);
    	editor.apply();
    }
}
