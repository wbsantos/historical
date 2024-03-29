package com.avatarbatterywallpaper;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.os.BatteryManager;
import android.os.Handler;
import android.service.wallpaper.WallpaperService;
import android.view.SurfaceHolder;
import android.content.Intent;

public abstract class AvatarWallpaperService extends WallpaperService 
{
	@Override
	public Engine onCreateEngine() {
		return new AvatarEngine();
	}
	
	public abstract int getWallpaperId(int i);

	private class AvatarEngine extends Engine
	{
		private Rect rectBackground;
		private Bitmap bmpBackground = null;
		private int backgroundResourceId = -1;
		private int batteryLevel = 0;
		private final Handler handler = new Handler();
		private final int BATTERY_STEP = 5;
		IntentFilter batteryLevelFilter;
		BroadcastReceiver batteryLevelReceiver;
		private boolean lastIsCentralized;
		
	    private final Runnable drawRunner = new Runnable() {
	      @Override
	      public void run() {
	        draw();
	      }

	    };
	    
	    @Override
	    public void onCreate(SurfaceHolder surfaceHolder)
	    {
	    	super.onCreate(surfaceHolder);
	    	lastIsCentralized = AvatarApplication.getAlwaysCentralized();
	    	try
	    	{
		    	batteryLevelFilter = new IntentFilter(Intent.ACTION_BATTERY_CHANGED);
			    batteryLevel = getBatteryLevel(registerReceiver(null, batteryLevelFilter));
			    handler.post(drawRunner);
	    	}
	    	catch (IllegalArgumentException e){

	        }
		    
			batteryLevelReceiver = new BroadcastReceiver() {
		         public void onReceive(Context context, Intent intent) {
		             batteryLevel = getBatteryLevel(intent);
		             handler.post(drawRunner);
		         }
		     };	
	    }
	    
	    @Override
	    public void onDestroy()
	    {
	    	try
	    	{
	    		if(bmpBackground != null && !bmpBackground.isRecycled())
	    			bmpBackground.recycle();
		    	unregisterReceiver(batteryLevelReceiver);
				handler.removeCallbacks(drawRunner);
	    	}
	    	catch (IllegalArgumentException e){

	        }
	    }
	    
	    @Override
		public void onVisibilityChanged(boolean visible)
		{
			if(visible)
			{
				try
				{
					registerReceiver(batteryLevelReceiver, batteryLevelFilter);
					batteryLevel = getBatteryLevel(registerReceiver(null, batteryLevelFilter));
					handler.post(drawRunner);
				}
				catch (IllegalArgumentException e){
					
		        }
			}
			else
			{
				try
				{
					unregisterReceiver(batteryLevelReceiver);
					handler.removeCallbacks(drawRunner);
				}
				catch (IllegalArgumentException e){

		        }
			}
		}
	    
		@Override
		public void onSurfaceDestroyed(SurfaceHolder holder)
		{
			super.onSurfaceDestroyed(holder);
			handler.removeCallbacks(drawRunner);
		}
		
		 @Override
		 public void onSurfaceChanged(SurfaceHolder holder, int format, int width, int height) 
		 {
			 super.onSurfaceChanged(holder, format, width, height);
			 handler.post(drawRunner);
		 }
		 
		private int getBatteryLevel(Intent intent)
		{
			int currentLevel = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
            int scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
            int level = 0;
            if (currentLevel >= 0 && scale > 0) {
                level = (currentLevel * 100) / scale;
            }
            return level;
		}
		
		private int getWallpaperIndex(int factor)
		{
			int x = batteryLevel % factor;
			if(x < factor/2.0)
				x = batteryLevel - x;
			else
				x = batteryLevel + (factor - x);
			x /= factor;
			return x;
		}
		
		private void draw()
		{
			handler.removeCallbacks(drawRunner);
			
			SurfaceHolder holder = getSurfaceHolder();			
			Canvas canvas = holder.lockCanvas();
			if(canvas == null)
				return;
			
			boolean isCentralized = AvatarApplication.getAlwaysCentralized();
			if(lastIsCentralized != isCentralized)
			{
				lastIsCentralized = isCentralized;
				if(isCentralized)
					rectBackground = null;
			}
							
			defineBackground(canvas);
			canvas.drawColor(Color.BLACK);					
			if(rectBackground == null)
			{
				int posLeftBackground = (int)(canvas.getWidth()/2.0 - bmpBackground.getWidth()/2.0);
				posLeftBackground *= -1;
				rectBackground = new Rect(posLeftBackground, 0, posLeftBackground +  canvas.getWidth(), canvas.getHeight());
			}
			
			canvas.drawBitmap(bmpBackground, -rectBackground.left, 0, null);
			if(isCentralized)
			{
				bmpBackground.recycle();
				bmpBackground = null;
			}
			holder.unlockCanvasAndPost(canvas);					
		}
		
		public void defineBackground(Canvas canvas) 
		{ 
			int resourceId = getWallpaperId(getWallpaperIndex(BATTERY_STEP));
			if(resourceId == backgroundResourceId && bmpBackground != null && !bmpBackground.isRecycled())
				return;
			else
				backgroundResourceId = resourceId;
			
			BitmapFactory.Options options = new BitmapFactory.Options();
			options.inJustDecodeBounds = false;
			options.inPurgeable = true;
			options.inInputShareable = true;
			options.inDither = false;
		    options.inScaled = false;
		    bmpBackground = BitmapFactory.decodeResource(getResources(), resourceId, options);
			float heightProportion = canvas.getHeight() / (float)bmpBackground.getHeight();
			
		    // Resize
		    Matrix matrix = new Matrix();
		    matrix.postScale(heightProportion, heightProportion);
		    Bitmap bmp = bmpBackground; 
		    bmpBackground = Bitmap.createBitmap(bmpBackground, 0, 0, bmpBackground.getWidth(), bmpBackground.getHeight(), matrix, true);
		    if(bmp != bmpBackground)
		    	bmp.recycle();
	    }
		
		@Override
		public void onOffsetsChanged(float xOffset, float yOffset, float xOffsetStep, float yOffsetStep, int xPixelOffset, int yPixelOffset)
		{
			if(xOffsetStep > 0 && !AvatarApplication.getAlwaysCentralized())
			{
				SurfaceHolder holder = getSurfaceHolder();
				Canvas canvas = null;
				canvas = holder.lockCanvas();
				
				defineBackground(canvas);
				
				float widthFactor = canvas.getWidth()/(float)bmpBackground.getWidth();
				int posLeftBackground = (int)(((float)bmpBackground.getWidth() * (1 - widthFactor)) * xOffset);
				
				rectBackground = new Rect(posLeftBackground, 0, posLeftBackground +  canvas.getWidth(), canvas.getHeight());
								
				if(canvas != null)
				{
					canvas.drawColor(Color.BLACK);
					canvas.drawBitmap(bmpBackground, -posLeftBackground, 0, null);
					holder.unlockCanvasAndPost(canvas);
				}
			}
		}
	}
}
