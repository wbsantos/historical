package com.isy;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class StartBeforeBoot extends BroadcastReceiver {

	@Override
	public void onReceive(Context context, Intent arg1) 
	{
		if(ConfigActivity.getPreferenceDetector())
			context.startService(new Intent(context, MainService.class));
	}

}
