﻿IF EXISTS (SELECT * FROM SYSOBJECTS WHERE TYPE = 'P' AND NAME = 'ML_SP_GETPROPRIEDADES')
	BEGIN
		PRINT 'DROPPING PROCEDURE ML_SP_GETPROPRIEDADES'
		DROP  PROCEDURE ML_SP_GETPROPRIEDADES
	END
GO

PRINT 'CREATING PROCEDURE ML_SP_GETPROPRIEDADES'
GO

CREATE PROCEDURE ML_SP_GETPROPRIEDADES
	@ITEMID INT
AS

/******************************************************************************
**		NOME DO AQUIVO: ML_SP_GETPROPRIEDADES.SQL
**		NOME DA PROCEDURE: ML_SP_GETPROPRIEDADES
**
**		DESCRIÇÃO: PROCEDURE RESPONSÁVEL EM CONSULTAR PROPRIEDADES CADASTRADAS PARA UM ITEM.
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

SELECT PRID, PRITID, PRVALOR, PRTIPO FROM PROPRIEDADE WITH(NOLOCK)
WHERE 
	PRITID = @ITEMID


RETURN 0
