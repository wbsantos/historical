package com.isy;

public class SoundsThread extends Thread 
{
	SoundsView mSoundsView;
	long mTimerDraw;
	float mX, mY, mRaio;
	int mColor;
	final static int SLEEP = 10;
	
	private void init(SoundsView sv, long timerDraw)
	{
		android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_MORE_FAVORABLE);
		mSoundsView = sv;
		mTimerDraw = timerDraw;
	}
	SoundsThread(SoundsView sv, long timerDraw)
	{
		  super();
		  init(sv, timerDraw);
	}	
	SoundsThread(SoundsView sv)
	{
		  super();
		  init(sv, 100);
	}
	
	public void setParameterCircle(float x, float y, float raio, int color)
	{
		mX = x;
		mY = y;
		mRaio = raio;
		mColor = color;
	}
	
	@Override
	public void run()
	{
		float pass, controlTimer, controlHalfTimer;
		controlTimer = pass = mRaio/(mTimerDraw/SLEEP);		
		controlHalfTimer = controlTimer * 2;
		try 
		{
			while(controlTimer <= mRaio)
			{
				mSoundsView.drawCircle(mX, mY, controlTimer, controlHalfTimer,  mColor);
				controlTimer += pass;
				controlHalfTimer += (pass/2);
				sleep(SLEEP-5);
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}	
	
}
