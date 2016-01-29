package com.isy;


public class Sounds 
{
	private int mComprimento;
	private int mAmplitude;
	private short[] mBuffer;
	private int[] mAmplitudes;
	private int mIndexMedia;
	
	Sounds(short[] buffer, int quantidadeMediaAmplitude)
	{
		mAmplitudes = new int[quantidadeMediaAmplitude];
		zerarMediaAmplitude();		
		setBuffer(buffer);		
	}
	
	Sounds(int quantidadeMediaAmplitude)
	{
		mAmplitudes = new int[quantidadeMediaAmplitude];
		zerarMediaAmplitude();		
	}
	
	public void setBuffer(short[] buffer)
	{
		mBuffer = buffer;
		process();
	}
	
	private void process()
	{
		int somaAmplitude, quantAmplitude, quantComprimento;
		boolean sobe = mBuffer[0] <= mBuffer[1];
		somaAmplitude = quantAmplitude = quantComprimento = 0;
		
		for(int i = 1; i < mBuffer.length - 1; i+=2)
		{
			if((mBuffer[i - 1] < 0 && mBuffer[i] > 0) || (mBuffer[i - 1] > 0 && mBuffer[i] < 0))
				quantComprimento++;
			
			if((mBuffer[i - 1] > mBuffer[i] && sobe) || (mBuffer[i - 1] < mBuffer[i] && !sobe))
			{
				somaAmplitude += (mBuffer[i - 1] * (mBuffer[i - 1] < 0 ? -1 : 1));
				quantAmplitude++;
				sobe = !sobe;
			}				
		}
		
		if(quantAmplitude == 0) 
			quantAmplitude = 1;
		
		mAmplitude = (somaAmplitude/quantAmplitude);
		mComprimento = quantComprimento/2;
		
		preencheAmplitudes();
	}
	
	public void zerarMediaAmplitude()
	{
		for(int i = 0; i < mAmplitudes.length; i++)
			mAmplitudes[i] = -1;
		mIndexMedia = -1;
	}
	
	public void preencheAmplitudes()
	{
		int i;
		if(mIndexMedia < 0)
		{
			for(i = 0; i < mAmplitudes.length; i++)
			{
				if(mAmplitudes[i] < 0)
				{
					mAmplitudes[i] = mAmplitude;
					return;
				}
			}
			mIndexMedia = 0;
		}
		
		mAmplitudes[mIndexMedia] = mAmplitude;
		mIndexMedia++;
		if(mIndexMedia >= mAmplitudes.length)
			mIndexMedia = 0;
	}
	
	public int getMediaAmplitude()
	{
		int total = 0;
		for(int i = 0; i < mAmplitudes.length; i++)
		{
			if(mAmplitudes[i] < 0)
				return total;
			if((total < mAmplitudes[i]) && (mAmplitudes[i] != mAmplitude))
				total = (total + mAmplitudes[i])/(total == 0 ? 1 : 2);
		}
		
		return total;
	}
	
	public int getComprimento()
	{
		return mComprimento;
	}
	
	public int getAmplitude()
	{
		return mAmplitude;
	}
}
