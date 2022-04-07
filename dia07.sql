CREATE DATABASE DB_BONNET
USE DB_BONNET

CREATE TABLE aluno(
	matricula int primary key,
	nome varchar(100),
	nota1 numeric(3,1),
	nota2 numeric(3,1),
	codDis int,
	mensalidade numeric(7,2),
	qtdeFalta int,
	fk_codigo_disciplina int FOREIGN KEY REFERENCES disciplina(codigo)
 )

 CREATE TABLE disciplina(
	codigo int primary key,
	nome varchar(100),
	cargHoraria int
 )

 drop table ALUNO

 drop table ALUNO
 drop table disciplina

INSERT INTO ALUNO VALUES(123, 'Alberto José ALves', 60.5, 85.3, 1, 950.51, 3,1);
INSERT INTO ALUNO VALUES(456, 'Maria Carla', 95.2, 72.7, 3, 950.00, 1,2);
INSERT INTO ALUNO VALUES(789, 'José Pedro', 55.6, 77, 2, 1000, 5,3);

INSERT INTO disciplina VALUES ( 1, 'Matemática', 108);
INSERT INTO disciplina VALUES ( 2, 'Banco de Dados', 110);
INSERT INTO disciplina VALUES (3, 'Programação', 124);

/*1) Desenvolva uma procedure em PL/SQL que faça a verificação na tabela aluno
se o mesmo está aprovado (maior igual a 7), recuperação (maior que 4 e menor
que 7) e reprovado (menor que 4). Crie a tabela com os seguintes campos
código, nome, nota1, nota2, coddis, mensalidade, qtdefalta) */
CREATE PROCEDURE Alunos_Aprovados
@matricula int
AS
DECLARE @media numeric(3,1)
SET @media = (SELECT (nota1 + nota2)/2 from ALUNO WHERE matricula = @matricula)
IF @media >= 7
	BEGIN 
		PRINT('APROVADO ' + CONVERT(CHAR(5), @media))
	END
ELSE IF @media >= 4 AND @media < 7
	BEGIN
		PRINT('RECUPERAÇÃO ' + CONVERT(CHAR(5), @media))
	END
ELSE IF @media < 4 
	BEGIN
		PRINT('REPROVADO ' + CONVERT(CHAR(5), @media))
	END
EXECUTE Alunos_Aprovados 789


/*2) Crie uma procedure em PL/SQL para inserir um aluno na tabela apenas se a
quantidade de alunos for menor que 10 senão apresentar a quantidade e
mensagem turma lotada. */
CREATE PROCEDURE Insere_Aluno
AS
DECLARE @qtdeCampos int
SET @qtdeCampos = (SELECT COUNT(*) FROM ALUNO)
IF @qtdeCampos < 6
	BEGIN
		INSERT INTO ALUNO VALUES (784, 'Maria De Lurdes', 66.2, 76.2, 2, 1000, 1);
	END
ELSE
	BEGIN
		PRINT('TURMA LOTADA, TOTAL DE ALUNOS DE ' + CONVERT(CHAR(5), @qtdeCampos))
	END
EXECUTE Insere_Aluno
DROP PROCEDURE Insere_Aluno
SELECT * FROM ALUNO

/*3) Faça uma procedure em PL/SQL que apresente a quantidade de alunos
aprovados, em recuperação e aprovados. */
CREATE PROCEDURE VerificaAprovados
AS
DECLARE @aprovados int
DECLARE @recuperacao int
DECLARE @reprovados int
SET @aprovados = (SELECT COUNT(*) FROM ALUNO WHERE (nota1 + nota2)/2 >= 7)
SET @recuperacao = (SELECT COUNT(*) FROM ALUNO WHERE (nota1 + nota2)/2 <= 4 AND (nota1 + nota2)/2 < 7)
SET @reprovados = (SELECT COUNT(*) FROM ALUNO WHERE (nota1 + nota2)/2 < 4)

PRINT('TOTAL DE ALUNOS APROVADOS: ' + CONVERT(CHAR(5), @aprovados))
PRINT('TOTAL DE ALUNOS EM RECUPERAÇÃO: ' + CONVERT(CHAR(5), @recuperacao))
PRINT('TOTAL DE ALUNOS REPROVADOS: ' + CONVERT(CHAR(5), @reprovados))

DROP PROCEDURE VerificaAprovados

EXECUTE VerificaAprovados

/*4) Crie a tabela disciplina (código, nome, cargaho) e relacione com a tabela aluno
e insira os dados na tabela disciplina e no campo da tabela aluno e elabore uma
procedure em PL/SQL que apresente os seguintes valores:
a) Para a disciplina Matemática mensalidade mais 10%
b) Para Banco de dados mensalidade menos 20 %
c) Para Programação mensalidade mais 15% */

CREATE PROCEDURE sp_adicionaValorNaMensalidade
@disc int
AS
IF @disc = 1
begin
   SELECT * FROM aluno a
   inner join disciplina d
   on a.fk_codigo_disciplina = d.codigo
   and a.fk_codigo_disciplina = @disc
END
ELSE IF @disc = 2
begin
   SELECT * FROM aluno a
   inner join disciplina d
   on a.fk_codigo_disciplina = d.codigo
   and a.fk_codigo_disciplina = @disc
END
ELSE IF @disc = 3
begin
   SELECT * FROM aluno a
   inner join disciplina d
   on a.fk_codigo_disciplina = d.codigo
   and a.fk_codigo_disciplina = @disc
END
execute sp_adicionaValorNaMensalidade 1


/*5) Desenvolva uma procedure em PL/SQL que passe por parâmetro o código do
aluno e se não encontrar mostrar a mensagem aluno não cadastrado, se
encontrar mostrar o nome a media e a disciplina cursada. */
CREATE PROCEDURE AlunoExiste
@matricula int
AS
DECLARE @media numeric(3,1)
DECLARE @disciplina varchar
DECLARE @nome varchar
SET @media = (SELECT (a.nota1 + a.nota2)/2  from aluno a
			 inner join disciplina d
			 on a.fk_codigo_disciplina = d.codigo
			 and a.matricula = @matricula)
SET @disciplina = (SELECT d.nome from aluno a
			      inner join disciplina d
			      on a.fk_codigo_disciplina = d.codigo
				  and a.matricula = @matricula)
SET @nome = (SELECT a.nome from aluno a
			      where a.matricula = @matricula)

IF @matricula > 0
	BEGIN
		PRINT @media
		PRINT @disciplina
		PRINT @nome
	END


execute AlunoExiste 123
drop procedure AlunoExiste 123
