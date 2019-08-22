IF EXISTS (SELECT * FROM SYSOBJECTS WHERE TYPE = 'P' AND NAME = 'ML_SP_GETCATEGORIA')
	BEGIN
		PRINT 'DROPPING PROCEDURE ML_SP_GETCATEGORIA'
		DROP  PROCEDURE ML_SP_GETCATEGORIA
	END
GO

PRINT 'CREATING PROCEDURE ML_SP_GETCATEGORIA'
GO

CREATE PROCEDURE ML_SP_GETCATEGORIA
	@CTID INT
AS

/******************************************************************************
**		NOME DO AQUIVO: ML_SP_GETCATEGORIA.SQL
**		NOME DA PROCEDURE: ML_SP_GETCATEGORIA
**
**		DESCRIÇÃO: PROCEDURE RESPONSÁVEL EM CONSULTAR CATEGORIA.
**      
**
**		TEAMPLATE ELABORADO POR: WILLIAM BARBOSA
**              
**		PROGRAMADOR AUTOR: WILLIAM BARBOSA
**		DATA: 07/11/2015
*******************************************************************************
**		HISTÓRICO DE ALTERAÇÕES
*******************************************************************************
**		DATA:		AUTOR:				DESCRIÇÃO:
**
*******************************************************************************/

SELECT CTID, CTCATEGORIA, CTPAI FROM CATEGORIA WITH(NOLOCK)
WHERE @CTID IN (CTID, CTPAI)
ORDER BY CTPAI, CTID


RETURN 0
