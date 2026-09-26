use CursoDotNet;

create or alter procedure usp_listarProductos as 
begin
	set nocount on; --Para evitar mensajes
	select p.IdProducto,p.Nombre Producto,
	p.Precio,p.Stock
	from Producto p inner join Categoria c on p.IdCategoria=c.IdCategoria
	order by p.Nombre;
end;
go

exec usp_listarProductos;

create or alter procedure usp_BuscarPorCategoria(@idCategoria int)as 
begin
	select p.IdProducto,p.Nombre Producto, p.Precio,p.Stock,c.Nombre Categoria
	from Producto p inner join Categoria c on p.IdCategoria=c.IdCategoria
	where p.IdCategoria=@idCategoria
	order by p.Nombre;
end;
go

exec usp_BuscarPorCategoria @idCategoria=1;

declare @id int;
set @id=1;
exec usp_BuscarPorCategoria @idCategoria=@id;

--Crear un procedimiento para filtrar productos que cuesten menos de 50.00

insert into Producto values 
				('Gorra',45.50,20,3),
				('Cartera',60.40,10,3),


create or alter procedure usp_RegistrarProductos(
@Nombre nvarchar(100),
@Precio Decimal(10,2),
@Stock int,
@IdCategoria int)as 
begin
	set nocount on; --Para evitar mensajes
	set nocount on; --Para evitar mensajes
	if @Nombre is null or @Nombre=''
	begin
		print 'Debe introducir un nombre válido';
		return;
	end
	if @Precio is null or @Precio<=0
	begin
		print 'Debe introducir un Precio válido';
		return;
	end
	--Validar Stock
	if @Stock is null or @Stock<=0
	begin
		print 'Debe introducir un Stock válido';
		return;
	end

	insert into Producto(Nombre,Precio,Stock,IdCategoria)values
				(@Nombre,@Precio,@Stock,@IdCategoria);
	print 'Producto registrado correctamente!';
end;

exec usp_RegistrarProductos
@Nombre='Paraguas',@Precio=-60.50,@Stock=30,@IdCategoria=3;
