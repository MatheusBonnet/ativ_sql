create database DB_alves3
use DB_alves3

CREATE TABLE aluno (
    id_aluno int PRIMARY KEY,
    nome_aluno varchar(50) not null,
    sexo_aluno char(1) not null,
    bairro_aluno varchar(40) not null,
    data_nasc_aluno date 
);

CREATE TABLE disciplina (
    id_disc int PRIMARY KEY,
    nome_disc varchar(50) not null,
    carga_hor_disc int not null,
    prof_disc varchar(50) not null,
    curso_disc varchar(50) not null
);

CREATE TABLE professor (
    id_prof int PRIMARY KEY,
    nome_prof varchar(50) not null,
    sexo_prof char(1) not null,
    bairro_prof varchar(40) not null,
	fk_disciplina_id_disc int FOREIGN KEY REFERENCES disciplina  (id_disc)
);

CREATE TABLE possui (
    fk_aluno_id_aluno int FOREIGN KEY REFERENCES aluno (id_aluno), 
    fk_disciplina_id_disc int FOREIGN KEY REFERENCES disciplina  (id_disc)
);

select *from professor
select * from aluno
select * from disciplina
select * from possui

insert into aluno values('3', 'Maria', 'F', 'Centro', '19850221')
insert into disciplina values('3', 'Exatas', '200', 'Maycon', 'Algoritmos e Logica de programacao')
insert into professor values('3', 'Joao Nore', 'M', 'Bairro Novo', '1') 

insert into possui values(1,2)
insert into possui values(2,1)
insert into possui values(3,3)
