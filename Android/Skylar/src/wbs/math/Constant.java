package wbs.math;

import java.util.ArrayList;
import skylar.data.Function;

public enum Constant implements INumber {
	UserConstants,
	PI, 
	E;
	
	private String mName;
	private Expression mExpression;
	
	public static ArrayList<Constant> getConstants()
	{
		ArrayList<Constant> constants = new ArrayList<Constant>();
		constants.add(PI);
		constants.add(E);
		
		ArrayList<Function> functions = Function.getAllConstants();
		
		for(Function function : functions)
		{
			constants.add(UserConstants);
			Constant c = constants.get(constants.size() - 1); 
			
			c.mExpression = new Expression();
			c.mExpression.setExpression(new StringBuilder(function.getExpression()));
			c.mName = function.getName();
		}
		
		
		return constants;
	}
	
	public String getConstant()
	{
		switch (this) {
		case UserConstants:
			return mName;
		case PI:
			return "pi";
		case E:
			return "e";
		default:
			return "";
		}
	}
	
	public double getValue()
	{
		switch (this) {
		case UserConstants:
			return mExpression.getValue();
		case PI:
			return 3.141592653589793238462643383279502;
		case E:
			return 2.718281828459045235360287471352662;
		default:
			return 0;
		}
	}
}
