Create database DB_ACCESO
create drop DB_ACCESO

use DB_ACCESO

create table USUARIO(
IdUsuario int primary key  identity (1,1),
Correo varchar(100),
Clave varchar(500)
)

Create proc sp_RegistrarUsuario(
@Correo varchar(100),
@Clave Varchar(500),
@Registrado bit output, 
@Mensaje varchar(100) output
)

as 
begin 
 

     if (not exists (select * from USUARIO where Correo = @Correo))
    begin
			insert into USUARIO(Correo, Clave) values (@Correo, @Clave)
			set @Registrado = 1 
			set @Mensaje = 'usuario registrado'
			end 
			else 
			begin 
			set @Registrado =0 
			set @Mensaje= 'correo ya existe'
			
			end 
			
end 

create proc sp_ValidarUsuario(
@correo varchar(100),
@Clave varchar(500)
)
as
begin 
	if (exists (select * from USUARIO where Correo = @correo and Clave = @Clave))
	select IdUsuario from USUARIO where Correo = @correo and Clave = @Clave
	else 
			select '0'
end 

declare @registrado bit, @mensaje varchar(100)
crear 
reportar defecto 
} 
informe de prueba 
documentaciones 
prevenir el defecto 
exec sp_RegistrarUsuario 'carlo@gmail.com','ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae',@registrado output, @mensaje output

select @registrado
select @mensaje

select * from   USUARIO
 exec sp_ValidarUsuario 'carlo@gmail.com', 'ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae'
