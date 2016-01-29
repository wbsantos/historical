package com.avatarbatterywallpaper;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Point;
import android.graphics.Rect;
import android.view.SurfaceHolder;

public class Shimeji extends Thread
{
	private Point currentPosition = null;
	private SurfaceHolder surfaceHolder;
	private Bitmap background;
	private Rect rectBackground;
	private Rect rectShimeji;
	private final int TIME_BW_FRAMES = 70;
	private final int STEPS_DISTANCE = 20;
	private final int[] WALK_LEFT_SEQUENCE = { R.drawable.shimeji_korra_walking_left_1,
											   R.drawable.shimeji_korra_walking_left_2,
											   R.drawable.shimeji_korra_walking_left_3}; 
	private final int[] WALK_RIGHT_SEQUENCE = { R.drawable.shimeji_korra_walking_right_1,
											    R.drawable.shimeji_korra_walking_right_2,
											    R.drawable.shimeji_korra_walking_right_3};
	private enum Direction
	{
		Left,
		Right,
		Up,
		Down
	}
	
	public Shimeji(SurfaceHolder holder, Bitmap background, Rect rectBackground)
	{
		this.surfaceHolder = holder;
		this.rectBackground = rectBackground;
		this.background = background;
		currentPosition = new Point(0, rectBackground.height());
	}
	
	@Override
	public void run() 
	{
		Direction direction = Direction.Left;
		do
		{
			direction = walk(0, direction);
		}while(true);
	}

	public Direction walk(int distancePercentage, Direction direction)
	{
		boolean untilTheBorder = distancePercentage <= 0;		
		int distanceOrdened = distancePercentage * rectBackground.width() / 100;
		int distanceWalked = 0;
		boolean toLeft = direction == Direction.Left;
		
		while(distanceWalked < distanceOrdened || untilTheBorder)
		{
			for(int i = 0; i < WALK_LEFT_SEQUENCE.length; i++)
			{
				boolean tempToLeft = toLeft;
				distanceWalked += STEPS_DISTANCE;
				currentPosition.x += (toLeft ? -STEPS_DISTANCE : STEPS_DISTANCE);

				int borderRight = (rectBackground.width() - (rectShimeji != null ? rectShimeji.width() : 200));
				if(currentPosition.x >= borderRight)
				{
					distanceWalked -= currentPosition.x - borderRight;
					currentPosition.x = borderRight;
					tempToLeft = !toLeft;
					untilTheBorder = false;
				}
				else if(currentPosition.x <= 0)
				{
					distanceWalked -= -currentPosition.x;
					currentPosition.x = 0;
					tempToLeft = !toLeft;
					untilTheBorder = false;
				}
				
				drawSprite(toLeft ? WALK_LEFT_SEQUENCE[i] : WALK_RIGHT_SEQUENCE[i]);
				toLeft = tempToLeft;
			}			
		}
		if(toLeft)
			direction = Direction.Left;
		else
			direction = Direction.Right;
		drawSprite(toLeft ? WALK_LEFT_SEQUENCE[0] : WALK_RIGHT_SEQUENCE[0]);
		return direction;
	}

	private void drawSprite(int shimejiId)
	{
		Canvas canvas = null;	
		final int BORDER = 5;
						
		Bitmap shimeji = BitmapFactory.decodeResource(
				AvatarApplication.getAppContext().getResources(), 
				shimejiId);

		//Área onde será desenhado o novo Shimeji
		Rect destRect = new Rect(currentPosition.x, 
								 currentPosition.y - shimeji.getHeight(), 
								 currentPosition.x + shimeji.getWidth(), 
								 currentPosition.y);
		Rect srcRect = new Rect(0, 0, shimeji.getWidth(), shimeji.getHeight());
			
		//Área onde estava desenhado o último Shimejo
		Rect oldsrcRect = null, olddestRect = null;
		if(rectShimeji != null)
		{
			olddestRect = new Rect(rectShimeji.left - BORDER, 
								   rectShimeji.top - BORDER, 
								   rectShimeji.right + BORDER, 
								   rectShimeji.bottom + BORDER);
		}
						
		//Ajustando diferenças de ajuste automático realizado pelo lockCanvas
		if(olddestRect != null)
		{
			olddestRect.left = destRect.left < olddestRect.left ? destRect.left : olddestRect.left;
			olddestRect.top = destRect.top < olddestRect.top ? destRect.top : olddestRect.top;
			olddestRect.right = destRect.right > olddestRect.right ? destRect.right : olddestRect.right;
			olddestRect.bottom = destRect.bottom > olddestRect.bottom ? destRect.bottom : olddestRect.bottom;
			
			canvas = surfaceHolder.lockCanvas(olddestRect);
			
			oldsrcRect = new Rect(olddestRect.left + rectBackground.left, 
								  olddestRect.top + rectBackground.top, 
								  olddestRect.right + rectBackground.left, 
								  olddestRect.bottom + rectBackground.top);
			//Zerar o último Shimeji
			canvas.drawBitmap(background, oldsrcRect, olddestRect, null);
		}
		else
			canvas = surfaceHolder.lockCanvas(destRect);
		
		//Desenhar novo Shimeji
		canvas.drawBitmap(shimeji, srcRect, destRect, null);
		surfaceHolder.unlockCanvasAndPost(canvas);

		rectShimeji = destRect;
		
		try {
			Thread.sleep(TIME_BW_FRAMES);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
