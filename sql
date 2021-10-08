CREATE TABLE veiculo (
    codvei int PRIMARY KEY,
    nomevei varchar(100) not null,
    corvei varchar(100) not null,
    vlrvei numeric(10,2) not null,
    qtdvei int not null
);

CREATE TABLE carga (
    codcar int PRIMARY KEY,
    nomecar varchar(100) not null,
    tipocar varchar(100) not null,
    pesocar numeric(10,2) not null,
    valorcar numeric(10,2) not null
);
drop table transporta;
CREATE TABLE transporta (
    fk_carga_codcar int FOREIGN KEY REFERENCES carga (codcar),
    fk_veiculo_codvei int FOREIGN KEY REFERENCES veiculo (codvei),
    codtrans int PRIMARY KEY,
    nometrans varchar(50) not null,
    distanciatrans numeric(10,2) not null,
    valortotal numeric(10,2) not null
);

insert into veiculo values (1, 'Corolla','azul', 85000.00, '10');
insert into veiculo values (2, 'Cobalt','prata', 38000.00, '2');
insert into veiculo values (3, 'Porche','amarelo', 120000.00, '5');
insert into veiculo values (4, 'Gol','preto', 21000.00, '3');

insert into carga values (11, 'TransNovos', 'Carros', 1000.50, 152000.00);
insert into carga values (22, 'MatheusTRANS', 'Carros', 1000.50, 192000.00);  
insert into carga values (33, 'JaaoTransportes', 'Carros', 1000.50, 122000.00);  
insert into carga values (44, 'TransSQL', 'Carros', 1000.50, 153000.00);   

insert into transporta values (22, 2, 111, 'matheus', 5000.00, 200000.00); 
insert into transporta values (11, 1, 222, 'luiz', 5000.00, 200000.00); 
insert into transporta values (33, 3, 333, 'marcos', 5000.00, 200000.00); 
insert into transporta values (44, 4, 444, 'lucas', 5000.00, 200000.00); 

select vei.nomevei, trans.nometrans, carg.nomecar from veiculo vei inner join transporta trans on vei.codvei = trans.fk_veiculo_codvei
inner join carga carg on carg.codcar = trans.fk_carga_codcar;

select vei.nomevei, sum(carg.valorcar) from veiculo vei inner join transporta trans on vei.codvei = trans.fk_veiculo_codvei
inner join carga carg on carg.codcar = trans.fk_carga_codcar
and 
