package wbs.math;

import skylar.data.Function;
import java.util.ArrayList;

enum Operator {
	UserFunction,
	PowerOf,
	MultipliedBy,
	DividedBy,
	Plus,
	Minus,
	Cos,
	Sin,
	Hypot;
	
	private Function mFunction;
	
	public char getChar()
	{
		switch (this) {
		case PowerOf:
			return '^';
		case MultipliedBy:
			return '*';
		case DividedBy:
			return '/';
		case Plus:
			return '+';
		case Minus:
			return '-';
		default:
			return '\0';
		}
	}
	
	public Function getUserFunction()
	{
		return mFunction;
	}
	
	public static ArrayList<Operator> getFunctions()
	{
		ArrayList<Operator> operators = new ArrayList<Operator>();
		operators.add(Cos);
		operators.add(Sin);
		operators.add(Hypot);
		
		ArrayList<Function> functions = Function.getAllFunctions();
		for(Function f : functions)
		{
			operators.add(UserFunction);
			operators.get(operators.size() - 1).mFunction = f;
		}
		
		return operators;
	}
	
	public String getFunction()
	{
		switch (this) {
		case UserFunction:
			return mFunction.getName();
		case Cos:
			return "cos";
		case Sin:
			return "sin";
		case Hypot:
			return "hypot";
		default:
			return "";
		}
	}
}
