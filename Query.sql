
-- a) Dado um número inteiro. Calcule e mostre o seu fatorial. (Não usar entrada superior a 12)
DECLARE @fat	INT, 
		@mult	INT
SET @fat = 1
SET @mult = 5
WHILE (@mult > 1)
BEGIN
	SET @fat = @fat * @mult
	SET @mult = @mult - 1
END
PRINT 'Fatorial: ' + CAST(@fat AS VARCHAR(10))


-- b) Dados A, B, e C de uma equação do 2o grau da fórmula AX2+BX+C=0. Verifique e mostre a
-- existência de raízes reais e se caso exista, calcule e mostre. Caso não existam, exibir mensagem.
DECLARE @varA		INT,
		@varB		INT,
		@varC		INT,
		@delta		FLOAT,
		@r1			FLOAT,
		@r2			FLOAT
SET @varA = 1
SET @varB = -1
SET @varC = -6
SET @delta = (@varB * @varB) - (4 * @varA * @varC)
IF (@delta < 0)
BEGIN
	PRINT 'Não existem raízes reais'
END
IF (@delta = 0)
BEGIN
	SET @r1 = ((-1 * @varB) + SQRT(@delta)) / (2 * @varA)
	PRINT 'Raíz: ' + CAST(@r1 AS VARCHAR(30))
END
IF (@delta > 0)
BEGIN
	SET @r1 = ((-1 * @varB) + SQRT(@delta)) / (2 * @varA)
	SET @r2 = ((-1 * @varB) - SQRT(@delta)) / (2 * @varA)
	PRINT 'Raízes: R1 = ' + CAST(@r1 AS VARCHAR(30)) + ' R2 = ' + CAST(@r2 AS VARCHAR(30))
END

-- c) Calcule e mostre quantos anos serão necessários para que Ana seja maior que Maria sabendo
-- que Ana tem 1,10 m e cresce 3 cm ao ano e Maria tem 1,5 m e cresce 2 cm ao ano.
DECLARE @ana	FLOAT,
		@maria	FLOAT,
		@anos	INT
SET @ana = 1.1
SET @maria = 1.5
SET @anos = 0
WHILE (@ana <= @maria)
BEGIN
	SET @ana = @ana + 0.03
	SET @maria = @maria + 0.02
	SET @anos = @anos + 1
END
PRINT 'Irá demorar ' + CAST(@anos AS VARCHAR(30)) + ' anos para que Ana se torne mais alta que Maria'


-- d) Seja a seguinte série: 1, 4, 4, 2, 5, 5, 3, 6, 6, 4, 7, 7, ...
-- Escreva uma aplicação que a escreva N termos
DECLARE @termos		INT,
		@num_menor	INT,
		@num_maior	INT,
		@cont		INT
SET @termos = 12
SET @num_menor = 1	
SET @num_maior = 3
SET @cont = 1
WHILE (@termos > 0)
BEGIN
	IF (@cont = 1)
	BEGIN
		PRINT @num_menor
		SET @num_menor = @num_menor + 1
		SET @cont = 3
		SET @num_maior = @num_maior + 1
	END
	ELSE
	BEGIN
		PRINT @num_maior
		SET @cont = @cont - 1
	END
	SET @termos = @termos - 1
END

-- e) Considerando a tabela abaixo, gere uma massa de dados, com 50 registros, para fins de teste
-- com as regras estabelecidas (Não usar constraints na criação da tabela)

-- • Código inicia em 50001 e incrementa de 1 em 1
-- • Nome segue padrão simples: Produto 1, Produto 2, Produto 3, etc.
-- • Valor, gerar um número aleatório* entre 10.00 e 100.00
-- • Vencimento, gerar um número aleatório* entre 3 e 7 e usando a função específica para
-- soma de datas no SQL Server, somar o valor gerado à data de hoje.

CREATE DATABASE exE
GO
USE exE
GO
CREATE TABLE produto (
codigo			INT				NOT NULL,
nome			VARCHAR(30)		NOT NULL,
valor			DECIMAL(7,2)	NOT NULL,
vencimento		DATE			NOT NULL
PRIMARY KEY (codigo)
)

DECLARE @cont	INT
SET @cont = 1
WHILE (@cont <= 50)
BEGIN
	INSERT INTO produto VALUES
	((50000 + @cont), ('Produto ' + CAST(@cont AS VARCHAR(03))), (1000 + RAND() * 9001), DATEADD(DAY, CAST(3 + RAND() * 5 AS INTEGER), GETDATE()))
	SET @cont = @cont + 1
END

SELECT * FROM produto
