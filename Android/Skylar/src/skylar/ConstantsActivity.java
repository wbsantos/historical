package skylar;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import wbs.math.Constant;

import com.skylar.R;

import android.os.Bundle;
import android.app.ActivityGroup;
import android.view.Menu;
import android.view.View;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemLongClickListener;

@SuppressWarnings("deprecation")
public class ConstantsActivity extends ActivityGroup implements OnItemClickListener, OnItemLongClickListener {

	ListView mLstLastFuntions;
	EditText mEdtFunction;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_constants);
		
		mLstLastFuntions = (ListView)findViewById(R.id.lstConstants);
		mLstLastFuntions.setOnItemClickListener(this);
		mLstLastFuntions.setOnItemLongClickListener(this);
		
		preencherLastFunctions();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.constants, menu);
		return true;
	}
	
	public void setEdtFunction(EditText edtFunction)
	{
		mEdtFunction = edtFunction;
	}
	
	public void preencherLastFunctions()
	{		
		ArrayList<Constant> constants = Constant.getConstants();		
		List<Map<String, String>> data = new ArrayList<Map<String, String>>();
		
		for(Constant c : constants)
		{			
			Map<String, String> datum = new HashMap<String, String>(2);
			datum.put("Expression", c.getConstant());
			
			datum.put("Result", "= " + String.valueOf(c.getValue()));
			data.add(datum);
		}
		
		SimpleAdapter adapter = new SimpleAdapter(this, data,
		                                          android.R.layout.simple_list_item_2,
		                                          new String[] {"Expression", "Result"},
		                                          new int[] {android.R.id.text1,
		                                                     android.R.id.text2});
		
		mLstLastFuntions.setAdapter(adapter);		
		
		mLstLastFuntions.setTextFilterEnabled(false);
	}
	
	@Override
	public void onItemClick(AdapterView<?> adapterView, View v, int position, long rowId) 
	{
		if(mEdtFunction == null)
			return;
		
		@SuppressWarnings("unchecked")
		Map<String, String> map = (Map<String, String>)mLstLastFuntions.getAdapter().getItem(position);
		String expression = map.get("Expression");
		
		int start = mEdtFunction.getSelectionStart();
		int end = mEdtFunction.getSelectionEnd();
		mEdtFunction.getText().replace(Math.min(start, end), Math.max(start, end), expression, 0, expression.length());		
	}

	@Override
	public boolean onItemLongClick(AdapterView<?> adapterView, View v, int position, long rowId) 
	{
		if(mEdtFunction == null)
			return false;
		
		@SuppressWarnings("unchecked")
		Map<String, String> map = (Map<String, String>)mLstLastFuntions.getAdapter().getItem(position);
		String expression = "( " + map.get("Expression") + " )";
		
		mEdtFunction.setText(expression);		
		return true;
	}

}
