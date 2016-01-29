package skylar.data;

import skylar.SkylarApplication;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class Base extends SQLiteOpenHelper
{
	enum Mode
	{
		Read,
		Write
	};
	
	private static final String NAME = "BASESKYLAR";
	private static final int VERSION = 1;
	private SQLiteDatabase mDb;
	
	public Base() 
	{
		super(SkylarApplication.getAppContext(), NAME, null, VERSION);
	}	
	
	@Override
	public void onOpen(SQLiteDatabase db)
	{
	    super.onOpen(db);
	    if (!db.isReadOnly())
	    {
	    	db.execSQL("PRAGMA foreign_keys=ON;");
	    }
	}
	
	@Override
	public void onCreate(SQLiteDatabase db) 
	{
		// TODO Auto-generated method stub
		db.execSQL(Function.SCRIPT);
		db.execSQL(Parameter.SCRIPT);
	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) 
	{
		// TODO Auto-generated method stub

	}
	
	public SQLiteDatabase openBase(Mode mode)
	{
		if(mode == Mode.Write)
			mDb = this.getWritableDatabase();
		else
			mDb = this.getReadableDatabase();
		return mDb;
	}
	
	public void closeBase()
	{
		this.close();
		mDb.close();
	}
}
