package skylar;

import com.skylar.R;
import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageButton;

public class MainActivity extends Activity implements OnClickListener {

	ImageButton mFunction;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        mFunction = (ImageButton)findViewById(R.id.btnMainFunction);
        mFunction.setOnClickListener(this);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        
        return true;
    }
    
    @Override
	public void onClick(View v) 
	{		
		// TODO Auto-generated method stub
		if(v.getId() == R.id.btnMainFunction)
		{
			startActivity(new Intent(this, FunctionActivity.class));
		}	
	}   
}
