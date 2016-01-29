package wbs.math;

class MathError extends Exception {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public MathError(ExpressionError error)
	{
		super(error.getMessage());
	}
}
