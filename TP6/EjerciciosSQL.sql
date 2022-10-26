--Listar las 100 primeras personas de la tabla personas
1- SELECT * FROM personas LIMIT 100;

--Listar las personas que tengan como apellido AVILA
2- SELECT * FROM personas WHERE personas.apellido_persona = "AVILA";

--Listar las personas cuyo genero seas femenino y tengan mas de 50 años
3- SELECT * FROM personas WHERE personas.genero_persona = "FEMENINO" AND personas.edad_persona > 50;

--Contar cuantas personas del genero masculino hay
4- SELECT COUNT(*) FROM personas WHERE personas.genero_persona = "MASCULINO";

--Calcular la edad promedio de la tabla personas
5- SELECT AVG(personas.edad_persona) AS promedio_edad FROM personas;

--Contar cuantas personas estan por debajo de la edad media
6- SELECT COUNT(*) FROM personas WHERE personas.edad_persona < (SELECT AVG(personas.edad_persona) FROM personas);

--Listar las personas que nacieron en la decada de los 60
7- SELECT * FROM personas WHERE personas.fechanaci_persona > '1960-01-01' AND personas.fechanaci_persona < '1969-12-31';

--Listar las personas que son de la provincia de RIO NEGRO
8- SELECT * FROM personas INNER JOIN provincias ON personas.id_persona_provincia = provincias.id_provincia WHERE personas.id_persona_provincia = (SELECT provincias.id_provincia FROM provincias WHERE provincias.nombre_provincia = "RIO NEGRO");

--Contar cuantas personas son de la provincia de SAN LUIS
9- SELECT COUNT(*) FROM personas INNER JOIN provincias ON personas.id_persona_provincia = provincias.id_provincia WHERE personas.id_persona_provincia = (SELECT provincias.id_provincia FROM provincias WHERE provincias.nombre_provincia = "SAN LUIS");

--Listar cuantas personas son de la localidad de ANIMANA
10- SELECT COUNT(*) FROM personas INNER JOIN localidades ON personas.id_persona_localidad = localidades.id_localidad WHERE personas.id_persona_localidad = (SELECT localidades.id_localidad FROM localidades WHERE localidades.nombre_localidad = "ANIMANA");

--Crear un acopia de la tabla productos y agregarle un campo llamado precio el cual guardará el precio del producto
11- ALTER TABLE productos ADD (precio double NULL);

--Listar todos los productos del rubro ropa
12- SELECT * FROM productos INNER JOIN rubros ON productos.id_producto_rubro = rubros.id_rubro WHERE productos.id_producto_rubro = (SELECT rubros.id_rubro FROM rubros WHERE rubros.nombre_rubro = "ROPA");

--Listar los productos del rubro panaderia y fiambreria
13- SELECT * FROM productos INNER JOIN rubros ON productos.id_producto_rubro = rubros.id_rubro WHERE productos.id_producto_rubro = (SELECT rubros.id_rubro FROM rubros WHERE rubros.nombre_rubro = "PANADERIA") OR productos.id_producto_rubro = (SELECT rubros.id_rubro FROM rubros WHERE rubros.nombre_rubro = "FIAMBRERIA");