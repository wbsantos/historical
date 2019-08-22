IF EXISTS (SELECT * FROM SYSOBJECTS WHERE TYPE IN ('FN', 'IF', 'TF') AND NAME = 'FN_SPLITTOTABLE')
	BEGIN
		PRINT 'DROPPING PROCFUNCTIONEDURE FN_SPLITTOTABLE'
		DROP  FUNCTION FN_SPLITTOTABLE
	END
GO

PRINT 'CREATING FUNCTION FN_SPLITTOTABLE'
GO

CREATE FUNCTION FN_SPLITTOTABLE(@input AS Varchar(4000), @delimiter char(1))
RETURNS
      @Result TABLE(Value VARCHAR(100))

AS

/******************************************************************************
**		NOME DO AQUIVO: FN_SPLITTOTABLE.SQL
**		NOME DA FUNCTION: FN_SPLITTOTABLE
**
**		DESCRIÇÃO: FUNCTION PARA REALIZAR SPLIT NUMA STRING E TRANSFORMA-LA EM TABLE.
**      
**
**		TEAMPLATE ELABORADO POR: WILLIAM BARBOSA
**              
**		PROGRAMADOR AUTOR: WILLIAM BARBOSA
**		DATA: 08/11/2015
*******************************************************************************
**		HISTÓRICO DE ALTERAÇÕES
*******************************************************************************
**		DATA:		AUTOR:				DESCRIÇÃO:
**
*******************************************************************************/
BEGIN
	DECLARE @str VARCHAR(20)
	DECLARE @ind Int
	IF(@input is not null)
	BEGIN
		SET @ind = CharIndex(@delimiter,@input)
		WHILE @ind > 0
		BEGIN
			SET @str = SUBSTRING(@input,1,@ind-1)
			SET @input = SUBSTRING(@input,@ind+1,LEN(@input)-@ind)
			INSERT INTO @Result values (@str)
			SET @ind = CharIndex(',',@input)
		END
		SET @str = @input
		INSERT INTO @Result values (@str)
	END
	RETURN
END

GO