package com.isy;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

public class SoundsView extends SurfaceView 
{	
	private int mColorBackGround;
	private SurfaceHolder mSurfaceHolder;
	private Bitmap mBitmap;
	
	public void setColorBackGround(int color)
	{
		mColorBackGround = color;		
	}	
	private void init()
	{
		setFocusable(true);
		mColorBackGround = 0;
		mSurfaceHolder = getHolder();
	}	
	public SoundsView(Context context, AttributeSet attrs, int defStyle) 
	{
		super(context, attrs, defStyle); 
		init();
	}	
	public SoundsView(Context context, AttributeSet attrs) 
	{
		super(context, attrs);	
		init();
	}	
	public SoundsView(Context context) 
	{
		super(context); 
		init();
	}	

	public void drawCircle(float x, float y, float raio, float raioGradiente, int color)
	{
		Canvas canvas = new Canvas(mBitmap);
		
		RadialGradient gradient = new RadialGradient(x, y, raioGradiente, color, mColorBackGround, android.graphics.Shader.TileMode.MIRROR);
	    Paint paint = new Paint();
	    paint.setDither(true);
	    paint.setShader(gradient);

	    canvas.drawCircle(x, y, raio, paint);
	    
	    updateView();
	}
	
	public void drawCircle(float x, float y, float raio, int color, boolean animation)
	{
		if(animation)
		{
			SoundsThread mSoundsThread = new SoundsThread(this, 100);
			mSoundsThread.setParameterCircle(x, y, raio, color);
			mSoundsThread.start();
		}
		else
			drawCircle(x, y, raio, raio, color);
	}
	
	public void drawBackGround()
	{
		mBitmap = Bitmap.createBitmap(getWidth(), getHeight(), Bitmap.Config.RGB_565);
		Canvas canvas = new Canvas(mBitmap);

		Paint paint = new Paint();
		paint.setColor(mColorBackGround);
		canvas.drawRect(new Rect(0, 0, getWidth(), getHeight()), paint);

		updateView();
		
	}
	
	public void updateView()
	{
		Canvas canvas = mSurfaceHolder.lockCanvas();
		if(canvas == null)
			return;
		
		canvas.drawBitmap(mBitmap, 
                new Rect(0, 0, getWidth(), getHeight()), 
                new Rect(0, 0, getWidth(), getHeight()), 
                new Paint());
		mSurfaceHolder.unlockCanvasAndPost(canvas);
	}

	
}
