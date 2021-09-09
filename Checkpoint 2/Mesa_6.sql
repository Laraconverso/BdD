#MESA 6 
#1
SELECT * FROM usuario WHERE nombre like "a%";
#2
SELECT * FROM usuario WHERE email is null;
#3
SELECT * FROM canal WHERE fechaCreacion BETWEEN "2021-04-01 00:00:00" and "2021-06-01 00:00:00";
#4
SELECT * FROM usuario ORDER BY fechaNacimiento ASC LIMIT 10;
#5
SELECT * FROM playlist WHERE privado = 1;
#6
SELECT * FROM video ORDER BY cantidadLikes DESC LIMIT 5;
#7
INSERT INTO `DHtube`.`usuario` (`idUsuario`, `nombre`, `email`, `password`, `fechaNacimiento`, `codigoPostal`, `Pais_idPais`, `Avatar_idAvatar`) 
VALUES ('20', 'Juan Jose Batzal', 'jjbatzal@gmail.com', 'jj1597', '2000-04-01 00:00:00', '1429', '9', '85');
#8
SELECT * FROM usuario WHERE YEAR (fechaNacimiento)= 2000;
#9
SELECT UPPER(nombre) FROM pais ORDER BY nombre ASC;
#10
SELECT * FROM video WHERE cantidadReproducciones > 500000;
#11
SELECT * FROM video WHERE YEAR(fechaPublicacion) = 2020 AND cantidadDislikes > 100 AND Privado = 1;
#12
UPDATE Usuario SET FechaNacimiento = "2000-01-04 00:00:00" WHERE nombre = "Juan Jose Batzal";
#13
SELECT * FROM usuario WHERE LENGTH (password) < 5;
#14
SELECT idUsuario AS "ID", nombre AS "Nombre", email AS "E-mail", fechaNacimiento AS "Fecha de Nacimiento", substring(cast(now() as date) - cast(FECHANACIMIENTO as date),1, 2) AS "Edad", Pais_idPais AS "Codigo de Pais"  FROM usuario;
#15
SELECT * FROM video ORDER BY tamanio DESC LIMIT 1;
#16
SELECT fecha, idReaccion, Usuario_idUsuario, Video_idVideo FROM reaccion ORDER BY fecha DESC LIMIT 10;
#17
SELECT * FROM video WHERE cantidadReproducciones < 100000 AND cantidadLikes >= 100;
#18
SELECT * FROM video WHERE descripcion LIKE "%FAN%";
#19
SELECT * FROM USUARIO WHERE PASSWORD IN ("123", "1234", "12345", "abc", "CLAVE", "PASSWORD");
#20
DELETE FROM AVATAR WHERE NOMBRE = "avDhTube";