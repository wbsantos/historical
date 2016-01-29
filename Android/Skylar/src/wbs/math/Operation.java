package wbs.math;

import java.util.ArrayList;
import skylar.data.Function;
import skylar.data.Parameter;

class Operation implements INumber {
	private ArrayList<INumber> mParameter;
	private Operator mOperator;
	
	public Operation(Operator operator)
	{
		mParameter = new ArrayList<INumber>();
		mOperator = operator;
	}
	
	public Operation()
	{
		mParameter = new ArrayList<INumber>();
	}
	
	public void addParameter(INumber parameter)
	{
		mParameter.add(parameter);
	}
	
	public void setOperator(Operator operator)
	{
		mOperator = operator;
	}
	
	@Override
	public double getValue()
	{
		switch (mOperator) {
		case UserFunction:
			Expression ex = new Expression();
			Function function = mOperator.getUserFunction();
			ex.setExpression(new StringBuilder(function.getExpression()));
			
			if(mParameter.size() != function.getParameters().size())
				return 0;
			
			ArrayList<Parameter> paramsFunction = function.getParameters();
			for(int i = 0; i < mParameter.size(); i++)
			{
				ex.swapVariable(paramsFunction.get(i).getName(), mParameter.get(i));
			}
			
			return ex.getValue();
			
		case PowerOf:
			return Math.pow(mParameter.get(0).getValue(), mParameter.get(1).getValue());
		case MultipliedBy:
			return mParameter.get(0).getValue() * mParameter.get(1).getValue();
		case DividedBy:
			return mParameter.get(0).getValue() / mParameter.get(1).getValue();
		case Plus:
			return mParameter.get(0).getValue() + mParameter.get(1).getValue();
		case Minus:
			return mParameter.get(0).getValue() - mParameter.get(1).getValue();
		case Cos:
			return Math.cos(mParameter.get(0).getValue());
		case Sin:
			return Math.sin(mParameter.get(0).getValue());
		case Hypot:
			return Math.hypot(mParameter.get(0).getValue(), mParameter.get(1).getValue());
		default:
			return 0;
		}
	}
}
