package wbs.math;

enum ExpressionError {
	OpenParenthesis;
	
	public String getMessage()
	{
		String code = String.valueOf(this.ordinal()) + ": ";
		
		switch (this) {
		case OpenParenthesis:
			return code + "Parenteses Aberto";
		default:
			return code + "Erro desconhecido";
		}
	}
}
