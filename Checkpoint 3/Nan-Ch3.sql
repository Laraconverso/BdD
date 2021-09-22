-- Materia: BASE DE DATOS I
-- Camada N°: 5
-- Grupo N°: 6


-- 1.	Generar un reporte que indique la cantidad de usuarios por país, mostrando el nombre del país y su cantidad.
SELECT pais.nombre, COUNT(Pais_idPais) AS "cantidad de usuarios" 
FROM usuario 
RIGHT JOIN pais ON Pais_idPais=idPais 
GROUP BY pais.nombre;

-- 2.	Mostrar el Top 5 de avatars utilizados por los usuarios, listando el nombre del avatar y la cantidad de veces utilizado.
SELECT avatar.nombre, COUNT(idAvatar) AS cantidad 
FROM usuario 
INNER JOIN avatar ON idAvatar=Avatar_idAvatar 
GROUP BY avatar.nombre 
ORDER BY cantidad DESC 
LIMIT 5;

-- 3.	Emitir un listado de todas las playlists públicas, informando el nombre del usuario que la creó, 
-- el título de cada video que posee y el nombre y  año de creación de la playlist.
SELECT playlist.nombre "nombre playlist", usuario.nombre "nombre usuario", video.titulo "titulo del video", playlist.fechaCreacion "fecha de creacion de playlist" FROM usuario 
INNER JOIN playlist ON Usuario_idUsuario=idUsuario 
INNER JOIN playlist_video ON Playlist_idPlaylist=idPlaylist 
INNER JOIN video ON idVideo=Video_idVideo 
WHERE playlist.privado=0 
ORDER BY usuario.nombre;

-- 4.	Listar las 10 etiquetas menos usadas.
SELECT idEtiqueta, nombre, Count(Video_idVideo) "cantidad" FROM etiqueta 
LEFT JOIN video_etiqueta ON idEtiqueta=etiqueta_idEtiqueta 
GROUP BY idEtiqueta 
ORDER BY cantidad ASC
LIMIT 10;

-- 5.	Generar un reporte de las últimas 10 reacciones, listando la fecha, el nombre de la reacción, 
-- el id y nombre de usuario, y el título del video.
SELECT reaccion.fecha, tiporeaccion.nombre "nombre reaccion", usuario.idUsuario "id de usuario", usuario.nombre "nombre de usuario", video.titulo "Titulo del video" FROM reaccion 
INNER JOIN tiporeaccion ON Tiporeaccion_idtiporeaccion=idtiporeaccion 
INNER JOIN video ON idVideo=Video_idVideo
INNER JOIN usuario ON idUsuario=reaccion.Usuario_IdUsuario 
ORDER BY fecha DESC
LIMIT 10;

-- 6.	Mostrar por usuario la cantidad de playlists que posee, pero solo para aquellos que tengan más de 1 playlist
-- creada en el año 2021.
select usuario.idUsuario,usuario.nombre,playlist.idPlaylist,playlist.nombre,playlist.fechaCreacion,count(usuario.idUsuario) as 'cantidad_playlist'
from usuario
left join playlist
on usuario.idUsuario=playlist.Usuario_idUsuario 
where playlist.fechaCreacion like '2021%' 
group by usuario.idUsuario
having cantidad_playlist > 1;

-- 7.	Generar un reporte de las reacciones generadas en el 2021, con el siguiente formato: Nombre de Reacción,
-- Nombre de Usuario, Título de Video y la Fecha.
select tiporeaccion.nombre as 'Nombre reaccion',usuario.nombre as 'Nombre Usuario',video.titulo as 'titulo del video',reaccion.fecha
from reaccion
left join tiporeaccion on reaccion.TipoReaccion_idTipoReaccion=tiporeaccion.idTipoReaccion
left join usuario on reaccion.Usuario_idUsuario=usuario.idUsuario
left join video on reaccion.Video_idVideo=video.idVideo
where fecha like '2021%';

-- 8.	Listar la cantidad de videos según sean públicos o privados.
select count(privado) as 'cantidad',
	case 
	when privado=1 then 'privado'
	when privado=0 then 'publico'
	end as 'tipo'
from video
group by tipo;

-- 9.	Generar un reporte con los nombres de los usuario que no poseen ninguna Playlist.
select usuario.idUsuario,usuario.nombre as 'nombre usuario'
from usuario
left join playlist on usuario.idUsuario=Usuario_idUsuario 
where playlist.nombre is null;

-- 10.	Listar todos los videos hayan o no recibido reacciones en el último mes; indicar cuántas reacciones tuvieron y 
-- si han sido reproducidos o no. El listado debe estar ordenado alfabéticamente por título del vídeo.
select video.titulo,count(reaccion.Video_idVideo) as 'cantidad de reacciones',video.cantidadReproducciones
from video
left join reaccion on idVideo=reaccion.Video_idVideo
group by reaccion.Video_idVideo
order by video.titulo;

-- 11.	Generar un reporte con el nombre del usuario  y el título de videos del usuario que no pertenecen a ninguna playlist.
SELECT u.nombre AS Nombre, v.titulo AS Titulo
FROM video v
INNER JOIN usuario u ON u.idUsuario = v.Usuario_idUsuario
LEFT JOIN playlist p ON p.Usuario_idUsuario = u.idUsuario
WHERE p.idPlaylist is null;

-- 12.	Listar a todos los usuarios que no poseen ningún video.
SELECT u.nombre,v.titulo
FROM usuario u
LEFT JOIN video v ON u.idUsuario=v.Usuario_idUsuario
where v.idVideo is null;

-- 13.	Listar la cantidad total de reacciones por cada tipo de reacción, en el período del 01-01-2021 al 01-04-2021.
SELECT tr.idTipoReaccion, tr.nombre Reaccion, count(r.idReaccion) TotalReacciones
FROM reaccion r
INNER JOIN tiporeaccion tr ON r.TipoReaccion_idTipoReaccion = tr.idTipoReaccion
where r.fecha between "2021-01-01 00:00:00" and "2021-04-01 00:00:00"
group by tr.nombre;

-- 14.	Listar los videos que tienen los usuarios cuyo nombre contiene la letra “a” y son del país Argentina.
select v.titulo as Titulo , u.nombre as Usuario, p.nombre as Pais
FROM video v
INNER JOIN usuario u ON u.idUsuario = v.Usuario_idUsuario
INNER JOIN pais p ON u.Pais_idPais = p.idPais
where p.nombre="Argentina" and u.nombre like "%a%";

-- 15.	Generar un informe estilo ranking de avatars utilizados por país.
SELECT count(a.idAvatar) as Cantidad, a.nombre as Avatar, p.nombre as Pais
FROM avatar a
INNER JOIN usuario u ON a.idAvatar = u.Avatar_idAvatar
INNER JOIN pais p ON u.Pais_idPais = p.idPais
GROUP BY a.idAvatar, p.nombre
ORDER BY p.nombre,count(a.idAvatar)desc;

-- 16.	Generar un reporte de todos los videos, indicando si poseen reacciones y cuántas veces han sido reproducidos.
SELECT v.titulo Titulo, tr.nombre Reaccion, v.cantidadReproducciones Reproducciones FROM video v
LEFT JOIN reaccion r ON v.idVideo = r.Video_idVideo
LEFT JOIN tiporeaccion tr ON r.TipoReaccion_idTipoReaccion = tr.idTipoReaccion;

-- 17.	Mostrar los 5 videos de menor duración, listando el título del vídeo y el nombre de usuario y país al que corresponde.
SELECT v.titulo Titulo, u.nombre Usuario, p.nombre Pais FROM video v
INNER JOIN usuario u ON v.Usuario_idUsuario = u.idUsuario
INNER JOIN pais p ON p.idPais = u.Pais_idPais
ORDER BY duracion ASC
LIMIT 5;

-- 18.	 Listar el usuario brasilero con más reacciones durante el 2021.
SELECT u.nombre Nombre, COUNT(r.idReaccion) CantidadReacciones, year(r.fecha) Año FROM usuario u
INNER JOIN reaccion r ON u.idUsuario = r.Usuario_idUsuario
WHERE year(r.fecha) = "2021"
GROUP BY u.idUsuario
ORDER BY CantidadReacciones DESC
LIMIT 1;

-- 19.	 Generar un reporte listando los usuarios, sus canales, playlists y los videos que integran esas playlists.
SELECT u.nombre Usuario, c.nombre Canal, p.nombre Playlist, v.titulo Video FROM usuario u
LEFT JOIN canal c ON u.idUsuario = c.Usuario_idUsuario
LEFT JOIN playlist p ON u.idUsuario = p.Usuario_idUsuario
LEFT JOIN playlist_video pv ON p.idPlaylist = pv.Playlist_idPlaylist
LEFT JOIN video v ON pv.Video_idVideo = v.idVideo
ORDER BY u.nombre;

-- 20.	 Listar todas las playlists que posean menos de 3 videos, mostrando el nombre de usuario y el avatar que posee.
SELECT p.nombre Playlist, p.nombre Usuario, a.nombre Avatar FROM playlist p
LEFT JOIN playlist_video pv ON p.idPlaylist = pv.Playlist_idPlaylist
LEFT JOIN usuario u ON p.Usuario_idUsuario = u.idUsuario
LEFT JOIN avatar a ON u.Avatar_idAvatar = a.idAvatar
GROUP BY p.idPlaylist
HAVING COUNT(pv.Video_idVideo) < 3;







