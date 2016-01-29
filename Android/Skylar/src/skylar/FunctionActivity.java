package skylar;

import skylar.data.Function;
import wbs.math.Expression;

import com.skylar.R;

import android.os.Bundle;
import android.app.ActivityGroup;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TabHost;
import android.widget.TextView;
import android.widget.TabHost.OnTabChangeListener;

@SuppressWarnings("deprecation")
public class FunctionActivity extends ActivityGroup implements OnClickListener, OnTabChangeListener {

	Button mBtnResolve;
	Button mBtnLimpar;
	EditText mEdtFunction;
	TextView mTxtResult;
	TabHost mTabHost;
	LastFunctionsActivity mLastFunctions;
	ConstantsActivity mConstants;
		
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_function);
		
		mBtnResolve = (Button)findViewById(R.id.btnFunctionResolve);
		mBtnLimpar = (Button)findViewById(R.id.btnFunctionLimpar);
		mEdtFunction = (EditText)findViewById(R.id.edtFunctionFunction);
		mTxtResult = (TextView)findViewById(R.id.txtFunctionResult);
		
		mBtnResolve.setOnClickListener(this);
		mBtnLimpar.setOnClickListener(this);		
		
		mTabHost = (TabHost)findViewById(R.id.tbhFunctionLists);
		mTabHost.setup(this.getLocalActivityManager());
		TabHost.TabSpec spec;
		Intent intent;
		
		intent = new Intent().setClass(this, LastFunctionsActivity.class);
		spec = mTabHost.newTabSpec("0").setIndicator(getString(R.string.title_activity_last_functions)).setContent(intent);
		mTabHost.addTab(spec);
		
		intent = new Intent().setClass(this, ConstantsActivity.class);
		spec = mTabHost.newTabSpec("1").setIndicator(getString(R.string.constants)).setContent(intent);
		mTabHost.addTab(spec);
		
		mTabHost.setOnTabChangedListener(this);
		onTabChanged("0");
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.function, menu);
		return true;
	}

	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
		if(v.getId() == R.id.btnFunctionResolve)
		{
			Expression ex = new Expression();
			String expressionString = mEdtFunction.getText().toString();
		    ex.setExpression(new StringBuilder(expressionString));
		    double res = 0;
		    try
		    {
		    	res = ex.getValue();
		    	mTxtResult.setText(String.valueOf(res));
		    	 
		    	Function f = new Function();
		    	f.setExpression(expressionString);
		    	f.saveUserFunction();
		    	
		    	mLastFunctions.preencherLastFunctions();
		    }
		    catch(Exception e)
		    {
		    	mTxtResult.setText(R.string.function_invalid);
		    }
		}
		else if(v.getId() == R.id.btnFunctionLimpar)
		{
			mEdtFunction.setText("");
			mTxtResult.setText("");
		}
	}

	@Override
	public void onTabChanged(String tabId) {
		if(tabId == "0")
		{
			mLastFunctions = (LastFunctionsActivity)getLocalActivityManager().getActivity("0");
			mLastFunctions.setEdtFunction(mEdtFunction);
		}
		else if(tabId == "1")
		{
			mConstants = (ConstantsActivity)getLocalActivityManager().getActivity("1");
			mConstants.setEdtFunction(mEdtFunction);
		}
	}
}