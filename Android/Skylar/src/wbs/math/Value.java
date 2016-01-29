package wbs.math;

class Value implements INumber {
	
	double mValue;
	
	public Value()
	{
		mValue = 0;
	}
	
	public Value(double value)
	{
		setValue(value);
	}
	
	public void setValue(double value)
	{
		mValue = value;
	}
	
	@Override
	public double getValue() {
		return mValue;
	}
	
}
