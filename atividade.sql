create database matheus;

use matheus;

CREATE TABLE veiculo (
    codvei int PRIMARY KEY,
    nomevei varchar(50),
    corvei varchar(50),
    vlrvei numeric(12,2),
    qtdevei int
);

CREATE TABLE carga (
    codcar int PRIMARY KEY,
    nomecar varchar(50),
    tipocar varchar(50),
    pesocar numeric(10,2),
    vlrtotcar numeric(12,2)
);

CREATE TABLE transporta (
    codtra int PRIMARY KEY,
    nometra varchar(50),
    distanciatra numeric(10,2),
    vlrtottra numeric(12,2),
    fk_veiculo_codvei int FOREIGN KEY REFERENCES veiculo (codvei),
    fk_carga_codcar int FOREIGN KEY REFERENCES carga (codcar)
);

SELECT * FROM veiculo
SELECT * FROM carga
SELECT * FROM transporta 

insert into veiculo values (1, 'Mercedes', 'PRETO', 195000.00, 10)
insert into veiculo values (2, 'DAF', 'AZUL', 290000.00, 15)
insert into veiculo values (3, 'International', 'BRANCA', 250000.00, 35)

insert into carga values (111, 'Arroz', 'Graos', 1500.00, 3200.00)
insert into carga values (222, 'Milho', 'Graos', 10000.30, 5100.00)
insert into carga values (333, 'Verduras', 'Vegetais', 9000.00, 8500.00)

insert into transporta values (10, 'Matheus', 3200, 1200.00, 1, 222)
insert into transporta values (11, 'Marcos', 1210, 1350.00, 2, 333)
insert into transporta values (12, 'Luiz', 4090, 1890.00, 3, 111)

SELECT vei.nomevei, trans.nometra, carg.nomecar FROM veiculo vei 
inner join transporta trans
on trans.fk_veiculo_codvei = vei.codvei
inner join carga carg
on trans.fk_carga_codcar = carg.codcar;
-----------------------------------------------------------------

SELECT sum(carg.vlrtotcar) as 'soma total' FROM veiculo vei 
inner join transporta trans
on trans.fk_veiculo_codvei = vei.codvei
and trans.vlrtottra >= 597
inner join carga carg
on trans.fk_carga_codcar = carg.codcar
where vei.corvei in ('Branca' ,'Azul', 'Preto')

-----------------------------------------------------------------

UPDATE transporta
SET vlrtottra = qtdevei * vlrtotcar
FROM carga carg
inner join transporta trans
on trans.fk_carga_codcar = carg.codcar
inner join veiculo vei
on trans.fk_veiculo_codvei = vei.codvei
where vei.codvei > 18
and vei.codvei < 268
-----------------------------------------------------------------

DELETE transporta
FROM transporta trans
inner join carga carg
on trans.fk_carga_codcar = carg.codcar
and carg.nomecar like '%caixa%'
inner join veiculo vei
on trans.fk_veiculo_codvei = vei.codvei
and vei.vlrvei > 45600
where trans.distanciatra < 700

---------------------------------------------------------------------
