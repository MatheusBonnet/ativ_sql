create database db_alves1;

use db_alves1;

CREATE TABLE pedido (
    id_pedido int  PRIMARY KEY,
    data_pedido date,
    quant_pedido int,
    valor_pedido numeric(10,2) not null
);

CREATE TABLE nota (
    id_nota int  PRIMARY KEY,
    data_nota date,
    quant_nota int,
    valor_nota numeric(10,2) not null
);

CREATE TABLE gera (
    id int PRIMARY KEY,
    fk_nota_id_nota int FOREIGN KEY REFERENCES	nota (id_nota),
    fk_pedido_id_pedido int FOREIGN KEY REFERENCES pedido (id_pedido)
);

SELECT * FROM	gera

insert into pedido values (1, '20210902', 35, 2500.85); 
insert into pedido values (2, '20211025', 55, 5000.00);
insert into pedido values (3, '20200512', 12, 900.45);

insert into nota values (1, '20210902', 35, 2500.85);
insert into nota values (2, '20211025', 55, 5000.00);
insert into nota values (3, '20200512', 12, 900.45);

insert into gera values (1, 1, 1);
insert into gera values (2, 2, 2);
insert into gera values (3, 3, 3);

select pedido.data_pedido,pedido.quant_pedido, pedido.valor_pedido, quant_pedido * pedido.valor_pedido as 'Total Do Pedido',
nota.data_nota, nota.quant_nota, nota.valor_nota, nota.quant_nota * nota.valor_nota as 'Total Da Nota' 
from pedido pedido inner join gera gera on pedido.id_pedido = gera.fk_pedido_id_pedido
inner join nota nota on nota.id_nota = gera.fk_nota_id_nota
