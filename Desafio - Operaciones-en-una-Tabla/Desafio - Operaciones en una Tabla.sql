-- 1. Crear una base de datos con nombre “Posts”.
-- En la consola de PostgreSQL ejecutar comando:
-- CREATE DATABASE "Posts";


-- TABLA 1

-- 2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación, contenido y descripción
CREATE TABLE post(
	id SMALLINT,
	nombre_de_usuario VARCHAR(10),
	fecha_de_creacion DATE,
	contenido VARCHAR,
	descripcion VARCHAR,
	PRIMARY KEY (id)
);

-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".
INSERT INTO post (id,nombre_de_usuario,fecha_de_creacion,contenido,descripcion) 
VALUES 
(1,'Pamela','2021-07-05','Contenido del post 1 de Pamela','Descripcion 1'),
(2,'Pamela','2021-07-06','Contenido del post 2 de Pamela','Descripcion 2'),
(3,'Carlos','2021-07-07','Contenido del post 1 de Carlos','Descripcion 3')
;

-- 4. Modificar la tabla post, agregando la columna título.
ALTER TABLE post
ADD titulo VARCHAR;

-- 5. Agregar título a las publicaciones ya ingresadas.
UPDATE post SET titulo = 'Post 1' WHERE id = 1;
UPDATE post SET titulo = 'Post 2' WHERE id = 2;
UPDATE post SET titulo = 'Post 3' WHERE id = 3;

-- 6. Insertar 2 post para el usuario "Pedro".
INSERT INTO post (id,nombre_de_usuario,fecha_de_creacion,contenido,descripcion,titulo) 
VALUES 
(4,'Pedro','2021-07-08','Contenido del post 1 de Pedro','Descripcion 4','Post 4'),
(5,'Pedro','2021-07-09','Contenido del post 1 de Pedro','Descripcion 5','Post 5')
;

-- 7. Eliminar el post de Carlos
DELETE FROM post WHERE nombre_de_usuario = 'Carlos';

-- 8. Ingresar un nuevo post para el usuario "Carlos".
INSERT INTO post (id,nombre_de_usuario,fecha_de_creacion,contenido,descripcion,titulo) 
VALUES 
(6,'Carlos','2021-07-08','Contenido del post 2 de Carlos','Descripcion 6','Post 6')
;

-- Consultar tabla post
SELECT * FROM post;


-- TABLA 2

-- 1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts.
CREATE TABLE comentarios (
	id SMALLINT,
	fecha DATE,
	hora_de_creacion TIME,
	contenido VARCHAR,
	FOREIGN KEY (id) REFERENCES post(id)
);

-- 2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".
INSERT INTO comentarios (id,fecha,hora_de_creacion,contenido)
VALUES
(1,'2021-07-05','14:30:00','Contenido del comentario 1 para el post de Pamela'),
(1,'2021-07-05','14:45:00','Contenido del comentario 2 para el post de Pamela'),
(6,'2021-07-08','15:00:00','Contenido del comentario 1 para el post de Carlos'),
(6,'2021-07-08','15:10:00','Contenido del comentario 2 para el post de Carlos'),
(6,'2021-07-08','15:20:00','Contenido del comentario 3 para el post de Carlos'),
(6,'2021-07-08','15:30:00','Contenido del comentario 4 para el post de Carlos'),
(6,'2021-07-08','15:40:00','Contenido del comentario 5 para el post de Carlos')
;

-- 3. Crear un nuevo post para "Margarita".
INSERT INTO post (id,nombre_de_usuario,fecha_de_creacion,contenido,descripcion,titulo) 
VALUES 
(7,'Margarita','2021-07-09','Contenido del post 1 de Margarita','Descripcion 7','Post 7')
;

-- 4. Ingresar 5 comentarios para el post de Margarita.
INSERT INTO comentarios (id,fecha,hora_de_creacion,contenido)
VALUES
(7,'2021-07-08','16:00:00','Contenido del comentario 1 para el post de Margarita'),
(7,'2021-07-08','16:10:00','Contenido del comentario 2 para el post de Margarita'),
(7,'2021-07-08','16:20:00','Contenido del comentario 3 para el post de Margarita'),
(7,'2021-07-08','16:30:00','Contenido del comentario 4 para el post de Margarita'),
(7,'2021-07-08','16:40:00','Contenido del comentario 5 para el post de Margarita')
;

-- Consultar tabla comentarios
SELECT * FROM comentarios;
