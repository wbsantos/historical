﻿IF EXISTS (SELECT * FROM SYSOBJECTS WHERE TYPE = 'P' AND NAME = 'SP_GETPROCEDUREPARAMETERS')
	BEGIN
		PRINT 'DROPPING PROCEDURE SP_GETPROCEDUREPARAMETERS'
		DROP  PROCEDURE SP_GETPROCEDUREPARAMETERS
	END
GO

PRINT 'CREATING PROCEDURE SP_GETPROCEDUREPARAMETERS'
GO

CREATE PROCEDURE SP_GETPROCEDUREPARAMETERS
	@PROCEDURENAME VARCHAR(50)
AS

/******************************************************************************
**		NOME DO AQUIVO: SP_CONSULTAR_DADOS_PROCEDURE.SQL
**		NOME DA PROCEDURE: SP_CONSULTAR_DADOS_PROCEDURE
**
**		DESCRIÇÃO: PROCEDURE RESPONSÁVEL EM CONSULTAR DADOS DE OUTRAS PROCEDURES NO BANCO DE DADOS.
**      
**
**		TEAMPLATE ELABORADO POR: EWERTON DE PAULA DINIZ
**              
**		PROGRAMADOR AUTOR: EWERTON DINIZ
**		DATA: 08/02/2014 
*******************************************************************************
**		HISTÓRICO DE ALTERAÇÕES
*******************************************************************************
**		DATA:		AUTOR:				DESCRIÇÃO:
**
*******************************************************************************/



SELECT 
	--SCHEMA_NAME(SCHEMA_ID)		AS [PROCSCHEMA], 
	--SO.NAME						AS [PROCNAME],
	--P.PARAMETER_ID				AS [PARAMORDER],
	P.NAME						AS [PARAMNAME],
	TYPE_NAME(P.USER_TYPE_ID)	AS [PARAMTYPE],
	--P.MAX_LENGTH				AS [PARAMLENGTH],
	P.IS_OUTPUT					AS [PARAMISOUTPUT]
FROM SYS.OBJECTS AS SO
INNER JOIN SYS.PARAMETERS AS P ON SO.OBJECT_ID = P.OBJECT_ID
WHERE 
	SO.NAME = @PROCEDURENAME
ORDER BY 
	--[PROCSCHEMA], 
	SO.NAME, 
	P.PARAMETER_ID

RETURN 0

GO