﻿IF EXISTS (SELECT * FROM SYSOBJECTS WHERE TYPE = 'P' AND NAME = 'CA_UPDATECORRECTANSWER')
	BEGIN
		PRINT 'DROPPING PROCEDURE CA_UPDATECORRECTANSWER'
		DROP  PROCEDURE CA_UPDATECORRECTANSWER
	END
GO

PRINT 'CREATING PROCEDURE CA_UPDATECORRECTANSWER'
GO

CREATE PROCEDURE CA_UPDATECORRECTANSWER
	@ID INT,
	@ANSWER INT
AS

/******************************************************************************
**		NOME DO AQUIVO: CA_GETCORRECTPENDENCIES.SQL
**		NOME DA PROCEDURE: CA_GETCORRECTPENDENCIES
**
**		DESCRIÇÃO: EXCLUI SAMPLES REPETIDOS
**				   RETORNA A QUANTIDADE DE SAMPLES EXCLUÍDOS
**
**		TEAMPLATE ELABORADO POR: EWERTON DE PAULA DINIZ
**              
**		PROGRAMADOR AUTOR: WILLIAM BARBOSA DOS SANTOS
**		DATA: 29/10/2016
*******************************************************************************
**		HISTÓRICO DE ALTERAÇÕES
*******************************************************************************
**		DATA:		AUTOR:				DESCRIÇÃO:
**
*******************************************************************************/

UPDATE SAMPLES SET CORRECTANSWER = @ANSWER WHERE ID = @ID

GO