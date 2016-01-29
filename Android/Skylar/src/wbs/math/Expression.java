package wbs.math;

import android.annotation.SuppressLint;

import java.util.ArrayList;

public class Expression implements INumber {
	
	private enum Direction
	{
		After,
		Before
	};
	
	private ArrayList<INumber> mOperations;	
	private StringBuilder mExpression;
	
	public Expression()
	{
		
	}
	
	private Expression(ArrayList<INumber> operations)
	{
		mOperations = operations;
	}
		
	@SuppressLint("DefaultLocale")
	public void setExpression(StringBuilder expression)
	{
		mExpression = new StringBuilder(expression.toString().toLowerCase());
		replaceString(mExpression, " ", "");
		replaceString(mExpression, "[", "(");
		replaceString(mExpression, "]", ")");
		replaceString(mExpression, "{", "(");
		replaceString(mExpression, "}", ")");
	}
	
	public StringBuilder getExpression()
	{
		return mExpression;
	}
	
	private void buildTree()
	{
		if(mOperations == null)
			mOperations = new ArrayList<INumber>();
		swapConstants();
		isolateFunctions();
		isolateSubExpression();
		buildOperation(Operator.PowerOf);
		buildOperation(Operator.MultipliedBy, Operator.DividedBy);
		buildOperation(Operator.Plus, Operator.Minus);
	}
	
	private int indexEndParameter(int iInit)
	{
		int parenteses = 1;
		for(int j = iInit; j < mExpression.length(); j++)
		{
			if(mExpression.charAt(j) == '(')
				parenteses++;
			else if(mExpression.charAt(j) == ')')
				parenteses--;
			if((mExpression.charAt(j) == ';' && parenteses == 1) || (parenteses == 0))
				return j;
		}
		
		return -1;
	}
	
	private boolean setParametersFunction(int iIntFunction, int iInitParameters, Operation operation)
	{
		while(true)
		{			
			int iEnd = indexEndParameter(iInitParameters);
			if(iEnd == -1)
				return false;
			
			Expression expression = new Expression(mOperations);
			expression.setExpression(new StringBuilder(mExpression.substring(iInitParameters, iEnd)));
			operation.addParameter(expression);
			iInitParameters = iEnd + 1;
			
			if(mExpression.charAt(iEnd) == ')')
			{
				mOperations.add(operation);
				String hashCode = "§" + String.valueOf(operation.hashCode()) + "§";
				mExpression.replace(iIntFunction, iEnd + 1, hashCode);

				return true;
			}
		}
	}
	
	private void swapConstants()
	{
		ArrayList<Constant> constants = Constant.getConstants();
		
		for(int o = 0; o < constants.size(); o++)
		{
			swapVariable(constants.get(o).getConstant(), constants.get(o));
		}
	}
	
	public void swapVariable(String name, INumber value)
	{
		int i = mExpression.indexOf(name);
		
		while(i != -1)
		{
			int iEnd = i + name.length();
			
			boolean chrBeforeIsLetter = i > 0;
			if(chrBeforeIsLetter)
				chrBeforeIsLetter = (mExpression.charAt(i - 1) >= 'a' && mExpression.charAt(i - 1) <= 'z');
			
			boolean chrAfterIsLetter = iEnd < mExpression.length()-1;
			if(chrAfterIsLetter)
				chrAfterIsLetter = (mExpression.charAt(iEnd) >= 'a' && mExpression.charAt(iEnd) <= 'z');
			
			if((!chrAfterIsLetter) && (!chrBeforeIsLetter))
			{
				mExpression.replace(i, iEnd, String.valueOf(value.getValue()));
				i = mExpression.indexOf(name);
			}
			else
				i = mExpression.indexOf(name, i+1);
		}
	}
	
	private void isolateFunctions()
	{
		ArrayList<Operator> operators = Operator.getFunctions();
		
		for(int o = 0; o < operators.size(); o++)
		{
			String function = operators.get(o).getFunction();
			int i = mExpression.indexOf(function);
			
			while(i != -1)
			{
				int iInit = i + function.length();
				boolean chrBeforeIsLetter = i > 0;
				if(chrBeforeIsLetter)
					chrBeforeIsLetter = (mExpression.charAt(i - 1) >= 'a' && mExpression.charAt(i - 1) <= 'z');
				if(mExpression.charAt(iInit) == '(' && (!chrBeforeIsLetter))
				{
					Operation operation = new Operation(operators.get(o));
					iInit++;
					
					if(setParametersFunction(i, iInit, operation))
						i = mExpression.indexOf(function);
					else
						i = mExpression.indexOf(function, i + 1);
				}
				else
					i = mExpression.indexOf(function, i + 1);
			}
		}
	}
	
	private void isolateSubExpression() //throws MathError 
	{
		int i = mExpression.indexOf("(");
		
		while(i != -1)
		{
			int indexOf = mExpression.indexOf("(", i + 1);
			
			if(indexOf != -1)
			{
				i = indexOf;
				continue;
			}
			else
			{
				indexOf = mExpression.indexOf(")", i + 1);
				//if(indexOf == -1)
				//	throw new MathError(ExpressionError.OpenParenthesis);
				
				Expression expression = new Expression(mOperations);
				expression.setExpression(new StringBuilder(mExpression.substring(i + 1, indexOf)));
				mOperations.add(expression);
				
				String hashCode = "§" + String.valueOf(expression.hashCode()) + "§";
				mExpression.replace(i, indexOf + 1, hashCode);
				
				i = mExpression.indexOf("(");
			}
			
		}		
	}
	
	private void buildOperation(Operator... operators)
	{
		for(int i = 1; i < mExpression.length(); i++)
		{
			for(int j = 0; j < operators.length; j++)
			{
				if(mExpression.charAt(i) == operators[j].getChar())
				{
					INumber value1, value2;
					
					value1 = getNumber(i, Direction.Before);
					value2 = getNumber(i, Direction.After);
									
					Operation operation = new Operation(operators[j]);
					operation.addParameter(value1);
					operation.addParameter(value2);
					
					mOperations.add(operation);
					
					String hashCode = "§" + String.valueOf(operation.hashCode()) + "§";
					int initialIndex = mExpression.indexOf("@");
					int endIndex = mExpression.indexOf("@", initialIndex + 1);
					mExpression.replace(initialIndex, endIndex + 1, hashCode);
					i = 0;
				}
			}
		}
	}
	
	public int getIndexNumber(int chrIndexInit, int pass, boolean findOperation)
	{
		boolean isNumber;
		
		if(findOperation)
			chrIndexInit += pass;
		do
		{
			chrIndexInit += pass;
			if(chrIndexInit < 0 || chrIndexInit >= mExpression.length())
				break;
			
			char chr = mExpression.charAt(chrIndexInit);			
			isNumber = ((chr >= '0' && chr <= '9') || (chr == '.' || chr == ','));
		}while(isNumber);
		
		chrIndexInit -= pass;
		return chrIndexInit;
	}
	
	private INumber getNumber(int chrIndexOperator, Direction direction)
	{
		int pass = 1, initialIndex = chrIndexOperator;
		if(direction == Direction.Before)
			pass = -1;
		
		boolean findOperation = mExpression.charAt(chrIndexOperator + pass) == '§';
		
		chrIndexOperator = getIndexNumber(chrIndexOperator, pass, findOperation);
		
		if(direction == Direction.Before)
		{
			initialIndex -= (1 + (findOperation ? 1 : 0));
			initialIndex ^= chrIndexOperator;
			chrIndexOperator ^= initialIndex;
			initialIndex ^= chrIndexOperator;
		}
		else
			initialIndex += (1 + (findOperation ? 1 : 0));
		
		INumber number = getNumber(initialIndex, chrIndexOperator, findOperation);
		
		if(direction == Direction.Before && findOperation)
			initialIndex--;
		else if(direction == Direction.After)
			initialIndex = chrIndexOperator + (findOperation ? 1 : 0);
		
		mExpression.replace(initialIndex, initialIndex + 1, "@");
		return number;
	}
	
	public INumber getNumber(int init, int end, boolean findOperation)
	{
		if(!findOperation)
		{
			return new Value(Double.parseDouble(mExpression.substring(init, end + 1)));
		}
		else
		{
			int hashCode = Integer.parseInt(mExpression.substring(init, end + 1));
			
			for(int i = 0; i < mOperations.size(); i++)
			{
				if(mOperations.get(i).hashCode() == hashCode)
					return mOperations.get(i);
			}
			
			return new Value(0);
		}
	}
	
	public static void replaceString(StringBuilder builder, String from, String to)
	{
	    int index = builder.indexOf(from);
	    while (index != -1)
	    {
	        builder.replace(index, index + from.length(), to);
	        index += to.length(); // Move to the end of the replacement
	        index = builder.indexOf(from, index);
	    }
	}

	@Override
	public double getValue() {
		buildTree();
		INumber number;
		if(mExpression.charAt(0) == '§')
		{
			number = getNumber(1, mExpression.length() - 2, true);
			return number.getValue();
		}
		else
		{
			return Double.parseDouble(mExpression.toString());
		}
	}
}

