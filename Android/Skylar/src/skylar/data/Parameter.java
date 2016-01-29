package skylar.data;

import java.util.ArrayList;

import skylar.data.Base.Mode;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

public class Parameter 
{
	public static final String FID = "PAID";
	public static final String FNAME = "PANAME";
	public static final String FFUNCTIONID = "PAFTID";
	public static final String TABLENAME = "PARAMETER";
	
	private long mId;
	private long mFunctionId;
	private String mName;
	
	public static final String SCRIPT = 
			"CREATE TABLE " + TABLENAME + 
			"(" +
				FID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
				FNAME + " TEXT, " +
				FFUNCTIONID + "	INTEGER," +
				" FOREIGN KEY ( " + FFUNCTIONID + " )  REFERENCES " + 
								Function.TABLENAME + " (" + Function.FID +" ) ON DELETE CASCADE ON UPDATE CASCADE" + 
			");";
	
	public Parameter()
	{
		mId = -1;
		mFunctionId = -1;
	}
	
	public static ArrayList<Parameter> getParameters(int idFunction)
	{
		ArrayList<Parameter> parameters = new ArrayList<Parameter>();
		
		Base base = new Base();
		SQLiteDatabase db = base.openBase(Mode.Write);
		
		String filter = FFUNCTIONID + "=" + Integer.toString(idFunction);
    	String orderBy =  FID + " ASC";
    	
    	Cursor cursor = db.query(TABLENAME, new String[] { FID, FNAME, FFUNCTIONID }, filter, null, null, null, orderBy);
	    cursor.moveToFirst();
	    
	    while(!cursor.isAfterLast())
	    {	    	
	    	Parameter p = new Parameter();
	    	p.mId = cursor.getInt(cursor.getColumnIndex(FID));
	    	p.mName = cursor.getString(cursor.getColumnIndex(FNAME));
	    	p.mFunctionId = cursor.getInt(cursor.getColumnIndex(FFUNCTIONID));
	    	
	    	parameters.add(p);	    	
	    	cursor.moveToNext();
	    }
		
		base.closeBase();
		return parameters;
	}
	
	public String getName()
	{
		return mName;
	}
	
	public void setName(String name)
	{
		mName = name;
	}
	
	public long getId()
	{
		return mId;
	}
	
	public void setFunctionId(long functionId)
	{
		mFunctionId = functionId;
	}
	
	public boolean save()
	{
		ContentValues values = new ContentValues();
		values.put(FNAME, mName);
		values.put(FFUNCTIONID, mFunctionId);		
		
		Base base = new Base();
		SQLiteDatabase db = base.openBase(Mode.Write);
		long ret = db.insert(TABLENAME, null, values);
		base.closeBase();
		mId = ret;
		return ret != -1;		
	}
}
