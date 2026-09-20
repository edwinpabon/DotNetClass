select * from Categoria


select * from Producto

select p.Nombre,p.Precio,c.Nombre as categoria_nombre from Producto p
Inner join Categoria c on p.IdCategoria = c.IdCategoria


select * from Producto p
where stock>=10 and nombre='Camiseta';
select * from Producto p
where stock>=10 or nombre='Tenis';

--Order by
select * from Producto p
order by Precio desc, nombre;

select * from Producto p
where Precio>50 order by precio desc;

--Like

select * from Producto p
where Nombre like '%eta';

--Between
select * from Producto p
--where precio between 50 and 60;
where precio >=50 and precio <=70;

--update
update producto set precio=60.50,stock=20
where nombre='Camiseta';

select * from producto where nombre='Camiseta';

update producto set IdCategoria=2 where nombre='zapatilla';

update producto set Nombre='Gafas de Sol',IdCategoria=3,Stock=Stock-3 
where IdProducto=4--nombre='lentes de sol';

select p.IdProducto,p.Nombre,p.Precio,p.Stock,c.Nombre as categoria_nombre from Producto p
Inner join Categoria c on p.IdCategoria = c.IdCategoria;

--delete
delete from producto where nombre='Pantalon';


--1. Registrar un producto Mochila
insert into Producto (Nombre,Precio,Stock,IdCategoria) values ('Mochila',50.40,50,1);
--2. Buscar por like chila
select * from producto where nombre like '%chila';
--3 Aumentar 5 unidades a su stock
update producto set Stock=Stock+5 where nombre like '%chila';
--4 Mostrar nombre de categoria solo mochila con inner join
select p.IdProducto,p.Nombre,p.Precio,p.Stock,c.Nombre as categoria_nombre from Producto p
Inner join Categoria c on p.IdCategoria = c.IdCategoria
where p.nombre like '%chila';
--5 subir a repositorio
--6 mandar link


