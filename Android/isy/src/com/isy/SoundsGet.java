package com.isy;

import android.content.Context;
import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.MediaRecorder.AudioSource;
import android.os.Vibrator;


public class SoundsGet extends Thread
{	
	private SoundsView mSoundsView;
	private boolean mStop;
	private short MILESECONDS = 500;
	private static AudioRecord mAudio = null;
	private static int mContadorThreads = 0;
	private static float TOLERANCE;
	private static int TIMER;
	private static int TIMERVIBRATION;
		
	public static void setTolerance(float tolerance)
	{
		TOLERANCE = tolerance;
	}
	
	public static void setTimer(int timer)
	{
		TIMER = timer;
	}
	
	public static void setTimerVibration(int timer)
	{
		TIMERVIBRATION = timer;
	}
	
	SoundsGet(SoundsView soundsView)
	{
		super();
		mSoundsView = soundsView;
		mStop = false;
		
		if(mSoundsView == null)
			MILESECONDS = 100;
		
		if(mAudio == null)
			mAudio = createAudioRecord();
		
		TIMERVIBRATION = ConfigActivity.getPreferenceVibration();
		TIMER = ConfigActivity.getPreferenceTimer();
		TOLERANCE = ConfigActivity.getPreferenceTolerance();
	}
	
	public void parar()
	{
		mStop = true;
		mContadorThreads--;
		if(mContadorThreads == 0)
		{
			mAudio.stop();
			mAudio.release();
			mAudio = null;
		}
	}
	
	@Override
	public void run()
	{			
		if(mAudio == null)
			return;
		
		mContadorThreads++;
		if(mContadorThreads == 1)
			mAudio.startRecording();		
		
		int bufferSize = MILESECONDS * mAudio.getSampleRate()/1000; //Definir tamanho do buffer necessário para o tempo configurado em MILESECONDS
		Sounds sound = new Sounds((1000/MILESECONDS) * TIMER); //Utilizar o pico de amplitude mais alto dos últimos X segundos como base
		/*
		 * Cada Hertz equivale a uma posição no vetor do áudio
		 * A frequência de Heartz (SampleRates) define quantos Hertz serão pegos por segundo
		 * ao dividir a frequência por mil pego a quantidade de Heartz (posições no vetor) equivalente a um segundo
		 * Multiplico esse valor pela constante MILESECONDS e assim defino que o tamanho do vetor será o suficiente
		 * para pegar a X milesegundos do audioRecord.
		 * O mesmo cálculo é usado na criação do audioRecord com uma verificação para garantir que 
		 * será maior que o minimo permitido
		 */
		while(!mStop)
		{
			try 
			{
				verifyCall();
				short[] buffer = new short[bufferSize];
				mAudio.read(buffer, 0, buffer.length);
				sound.setBuffer(buffer);
				if(mSoundsView != null)
					sendOrderDraw(sound);
				else if((sound.getAmplitude()) > (sound.getMediaAmplitude() * TOLERANCE))// && sound.getAmplitude() > 5000)
					vibrar();
				sleep(MILESECONDS);
			} 
			catch (InterruptedException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return;
	}
	
	private void verifyCall()
	{
		try 
		{
			 if(PhoneState.emLigacao())
			 {
				 mAudio.stop();
				 while(PhoneState.emLigacao())			
						sleep(MILESECONDS);
					
				 mAudio.startRecording();
			 }
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void vibrar()
	{
		Vibrator v = (Vibrator)IsyApplication.getAppContext().getSystemService(Context.VIBRATOR_SERVICE);
		v.vibrate(TIMERVIBRATION);
	}
	
	private void sendOrderDraw(Sounds sound)
	{
		if(sound.getAmplitude() < 50)
			return;
			
		int x = (sound.getComprimento()) % mSoundsView.getWidth();
		int raio = sound.getAmplitude();
		int y = (sound.getAmplitude() % mSoundsView.getHeight());
		int blue = (x % 256);
		int green = (y % 256);
		int red = (((blue + green)/2) % 256);
		green = green << 8;
		red = red << 16;
		
		mSoundsView.drawCircle(x, y, raio, red + green + blue, true);
	}
	
	private AudioRecord createAudioRecord()
	{
		int[] sampleRates = new int[] { 16000, 8000, 11025, 22050, 44100 };
		@SuppressWarnings("deprecation")
		int[] channels = new int[]{AudioFormat.CHANNEL_CONFIGURATION_MONO};//, AudioFormat.CHANNEL_CONFIGURATION_STEREO};
		int [] encondings = new int[] {AudioFormat.ENCODING_PCM_16BIT, AudioFormat.ENCODING_PCM_8BIT};
		
		for(int rate : sampleRates)
		{
			for(int channel : channels)
			{
				for(int enconding : encondings)
				{
					int bufferSize = AudioRecord.getMinBufferSize(rate, channel, enconding);

                    if (bufferSize != AudioRecord.ERROR_BAD_VALUE) 
                    {
                    	int bufferSizeAux = (500 * rate/1000);
                        AudioRecord recorder = new AudioRecord(AudioSource.MIC, 
                        									   rate, 
                        									   channel, 
                        									   enconding, 
                        									   bufferSizeAux > bufferSize ? bufferSizeAux : bufferSize);
                        
                        if (recorder.getState() == AudioRecord.STATE_INITIALIZED)
                        	return recorder;
                    }

				}
			}
		}
		
		return null;		
	}
}
