package skylar.data;

import java.util.ArrayList;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

import skylar.data.Base.Mode;

public class Function
{
	public static final String FID = "FTID";
	public static final String FNAME = "FTNAME";
	public static final String FEXPRESSION = "FTEXPRESSION";
	public static final String FTIMESTAMP = "FTTIMESTAMP";
	public static final String FUSERCALC = "FTUSERCALC";
	public static final String TABLENAME = "FUNCTION";
	
	private long mId;
	private String mName;
	private String mExpression;
	
	public static final String SCRIPT = 
			"CREATE TABLE " + TABLENAME + 
			"(" +
				FID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
				FNAME + " TEXT, " +
				FEXPRESSION + "	TEXT," +
				FUSERCALC + " INTEGER DEFAULT 0," +
				FTIMESTAMP + " DATETIME DEFAULT CURRENT_TIMESTAMP" +
			");";
	
	
	private ArrayList<Parameter> mParameters;
	
	@Override
	public String toString()
	{
		return mExpression;
	}
	
	public Function()
	{
		mId = -1;
		mParameters = new ArrayList<Parameter>();
	}
	
	private Function(int id)
	{
		mParameters = Parameter.getParameters(id);
		mId = id;
	}
	
	public void addParameter(Parameter parameter)
	{
		mParameters.add(parameter);
	}
	
	public ArrayList<Parameter> getParameters()
	{
		return mParameters;
	}
	
	public static ArrayList<Function> getAllFunctions()
	{
		return getAll(true, -1);
	}
	
	public static ArrayList<Function> getAllConstants()
	{
		return getAll(false, -1);
	}
	
	public static ArrayList<Function> getSomeUserFunctions(int quantFunctions)
	{
		return getAll(false, quantFunctions);
	}
	
	private static ArrayList<Function> getAll(boolean withParameters, int quantUserFunctions)
	{
		ArrayList<Function> functions = new ArrayList<Function>();
		
		Base base = new Base();
		SQLiteDatabase db = base.openBase(Mode.Read);
		
		String filter = null, orderBy = null, limit = null;
		if(quantUserFunctions >= 0)
		{
			filter = FUSERCALC + " > 0";
			orderBy = FTIMESTAMP + " DESC";
			if(quantUserFunctions > 0)
				limit = String.valueOf(quantUserFunctions);
		}
		else
		{
			filter = FUSERCALC + " == 0";	
		}
		
	    Cursor cursor;
	    if(limit != null)
	    	cursor = db.query(TABLENAME, new String[] { FID, FNAME, FEXPRESSION }, filter, null, null, null, orderBy, limit);
	    else
	    	cursor = db.query(TABLENAME, new String[] { FID, FNAME, FEXPRESSION }, filter, null, null, null, orderBy);
	    
	    cursor.moveToFirst();
	    
	    while(!cursor.isAfterLast())
	    {
	    	Function f = new Function(cursor.getColumnIndex(FID));
	    	f.mName = cursor.getString(cursor.getColumnIndex(FNAME));
	    	f.mExpression = cursor.getString(cursor.getColumnIndex(FEXPRESSION));
	    	
	    	if((withParameters && f.mParameters.size() > 0) || (!withParameters && f.mParameters.size() == 0))
	    		functions.add(f);	    	
	    	cursor.moveToNext();
	    }
		
		base.closeBase();
		return functions;
	}
	
	public String getName()
	{
		return mName;
	}
	
	public String getExpression()
	{
		return mExpression;
	}
	
	public void setName(String name)
	{
		mName = name;
	}
	
	public void setExpression(String expression)
	{
		mExpression = expression;
	}
	
	public boolean saveFunction()
	{
		return save(false);
	}
	
	public boolean saveUserFunction()
	{
		return save(true);
	}
	
	private boolean save(boolean userFunction)
	{
		ContentValues values = new ContentValues();
		values.put(FNAME, mName);
		values.put(FEXPRESSION, mExpression);
		if(userFunction)
			values.put(FUSERCALC, 1);
		
		Base base = new Base();
		SQLiteDatabase db = base.openBase(Mode.Write);
		long ret = db.insert(TABLENAME, null, values);

		if(ret == -1)
		{
			base.closeBase();
			return false;
		}
		
	    mId = ret;
	    
	    for(Parameter parameter : mParameters)
	    {
	    	parameter.setFunctionId(mId);
	    	parameter.save();
	    }
	    	
		base.closeBase();
		
		return true;
	}
	
	public boolean delete()
	{
		Base base = new Base();
		SQLiteDatabase db = base.openBase(Mode.Write);
		
		boolean ret = db.delete(TABLENAME, FID + "=?", new String[] { String.valueOf(mId) }) > 0;
		
		base.closeBase();
		return ret;
	}
}
