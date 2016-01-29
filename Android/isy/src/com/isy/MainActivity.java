package com.isy;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MainActivity extends Activity implements OnClickListener
{
    /** Called when the activity is first created. */

	SoundsView mSoundsView;
	SoundsGet mSoungsGet;
	Button mBtnConfiguration;
	Button mBtnDetector;
	boolean mDrawBackGround = true;
	
	 @Override
    public void onWindowFocusChanged(boolean hasFocus) 
    {
		 super.onWindowFocusChanged(hasFocus);
		 if(hasFocus)
		 {
			 if(mDrawBackGround)
			 {
				 mSoundsView.drawBackGround();
				 mDrawBackGround = false;
			 }
			 
			 mSoungsGet = new SoundsGet(mSoundsView);
			 mSoungsGet.start();
			 
			 mBtnConfiguration.setWidth(mSoundsView.getWidth()/2);
			 mBtnConfiguration.setText(R.string.configuration);
			 mBtnDetector.setWidth(mSoundsView.getWidth()/2);
			 mBtnDetector.setText(MainService.isRunning() ? R.string.desactiveService : R.string.activeService);
		 }
		 else
		 {
			 mSoungsGet.parar();
		 }
    }
	 
	@Override
	public void onStart()
	{
		super.onStart();
		mDrawBackGround = true;
	}
	
	@Override
	public void onStop()
	{
		super.onStop();
		mDrawBackGround = false;
	}
	
    @Override
    public void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main); 
        
        mSoundsView = (SoundsView)findViewById(R.id.soundsView);
        mSoundsView.setColorBackGround(Color.WHITE);
        
        mBtnConfiguration = (Button)findViewById(R.id.btnConfiguration);
        mBtnDetector = (Button)findViewById(R.id.btnDetector);        

        mBtnConfiguration.setOnClickListener(this);
        mBtnDetector.setOnClickListener(this);
    }

	@Override
	public void onClick(View v) 
	{		
		// TODO Auto-generated method stub
		if(v.getId() == R.id.btnConfiguration)
		{
			startActivity(new Intent(this, ConfigActivity.class));
		}
		else if(v.getId() == R.id.btnDetector)
		{
			if(MainService.isRunning())
			{
				stopService(new Intent(this, MainService.class));
				mBtnDetector.setText(R.string.activeService);
				ConfigActivity.setPreferenceDetector(false);
			}
			else
			{
				startService(new Intent(this, MainService.class));
				mBtnDetector.setText(R.string.desactiveService);
				ConfigActivity.setPreferenceDetector(true);
			}
		}	
	}    
}