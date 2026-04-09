-- Borrar tablas si ya existen para evitar errores al reintentar
DROP TABLE Favoritos CASCADE CONSTRAINTS;
DROP TABLE Imagenes CASCADE CONSTRAINTS;
DROP TABLE Galerias CASCADE CONSTRAINTS;
DROP TABLE Eventos CASCADE CONSTRAINTS;
DROP TABLE Usuarios CASCADE CONSTRAINTS;

-- Tabla Usuarios
CREATE TABLE Usuarios (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    email VARCHAR2(150) UNIQUE NOT NULL,
    password VARCHAR2(255) NOT NULL
);

-- Tabla Eventos
CREATE TABLE Eventos (
    id NUMBER PRIMARY KEY,
    fecha DATE NOT NULL,
    titulo VARCHAR2(150) NOT NULL,
    ubicacion VARCHAR2(150) NOT NULL,
    descripcion VARCHAR2(500)
);

-- Tabla Galerias
CREATE TABLE Galerias (
    id NUMBER PRIMARY KEY,
    titulo VARCHAR2(150) NOT NULL,
    id_evento NUMBER NOT NULL,
    CONSTRAINT fk_galeria_evento FOREIGN KEY (id_evento) REFERENCES Eventos(id) ON DELETE CASCADE
);

-- Tabla Imagenes
CREATE TABLE Imagenes (
    id NUMBER PRIMARY KEY,
    titulo VARCHAR2(150) NOT NULL,
    imagen VARCHAR2(255) NOT NULL,
    id_galeria NUMBER NOT NULL,
    CONSTRAINT fk_img_galeria FOREIGN KEY (id_galeria) REFERENCES Galerias(id) ON DELETE CASCADE
);

-- Tabla Favoritos
CREATE TABLE Favoritos (
    id_usuario NUMBER NOT NULL,
    id_evento NUMBER NOT NULL,
    PRIMARY KEY (id_usuario, id_evento),
    CONSTRAINT fk_fav_u FOREIGN KEY (id_usuario) REFERENCES Usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_fav_e FOREIGN KEY (id_evento) REFERENCES Eventos(id) ON DELETE CASCADE
);

-- Usuarios (M�nimo 3)
INSERT INTO Usuarios (id, nombre, email, password) VALUES (1, 'Ana Garcia', 'ana@email.com', '1234');
INSERT INTO Usuarios (id, nombre, email, password) VALUES (2, 'Carlos Lopez', 'carlos@email.com', '1234');
INSERT INTO Usuarios (id, nombre, email, password) VALUES (3, 'Bea Martin', 'bea@email.com', '1234');

-- Eventos (Los 6 obligatorios con sus fechas exactas)
-- 3 del historial (antes del 28-02-2026) y 3 pr�ximos
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES (1, TO_DATE('2026-01-01','YYYY-MM-DD'), 'Concierto Año Nuevo de Jazz en la Costa', 'Playa San Lorenzo', 'Musica en vivo');
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES (2, TO_DATE('2026-01-12','YYYY-MM-DD'), 'Exposicion Foto', 'Centro Cultural', 'Arte moderno');
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES (3, TO_DATE('2026-01-24','YYYY-MM-DD'), 'Representación de la Celestina', 'Teatro Palacio Valdes', 'Teatro clasico');
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES (4, TO_DATE('2026-06-05','YYYY-MM-DD'), 'Festival Indie', 'Parque de los Pericones', 'Musica alternativa');
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES (5, TO_DATE('2026-06-15','YYYY-MM-DD'), 'Feria del Libro', 'Plaza Mayor', 'Literatura');
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES (6, TO_DATE('2026-06-25','YYYY-MM-DD'), 'Cine de Verano', 'Playa de Poniente', 'Peliculas');

-- Galerias (Una para cada evento del historial: 1, 2 y 3)
INSERT INTO Galerias (id, titulo, id_evento) VALUES (10, 'Fotos Concierto', 1);
INSERT INTO Galerias (id, titulo, id_evento) VALUES (20, 'Fotos Expo', 2);
INSERT INTO Galerias (id, titulo, id_evento) VALUES (30, 'Fotos Teatro', 3);

-- Imagenes (M�nimo 3 por galeria)
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (101, 'Orquesta', 'img1.jpg', 10);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (102, 'Director', 'img2.jpg', 10);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (103, 'Publico', 'img3.jpg', 10);

INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (201, 'Cuadro 1', 'img4.jpg', 20);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (202, 'Cuadro 2', 'img5.jpg', 20);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (203, 'Autor', 'img6.jpg', 20);

INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (301, 'Escenario', 'img7.jpg', 30);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (302, 'Actores', 'img8.jpg', 30);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (303, 'Aplausos', 'img9.jpg', 30);

-- Favoritos (3 por usuario, 2 deben ser del historial)
INSERT INTO Favoritos (id_usuario, id_evento) VALUES (1, 1); -- Historial
INSERT INTO Favoritos (id_usuario, id_evento) VALUES (1, 2); -- Historial
INSERT INTO Favoritos (id_usuario, id_evento) VALUES (1, 4); -- Proximo

INSERT INTO Favoritos (id_usuario, id_evento) VALUES (2, 2); -- Historial
INSERT INTO Favoritos (id_usuario, id_evento) VALUES (2, 3); -- Historial
INSERT INTO Favoritos (id_usuario, id_evento) VALUES (2, 5); -- Proximo

INSERT INTO Favoritos (id_usuario, id_evento) VALUES (3, 1); -- Historial
INSERT INTO Favoritos (id_usuario, id_evento) VALUES (3, 3); -- Historial
INSERT INTO Favoritos (id_usuario, id_evento) VALUES (3, 6); -- Proximo

COMMIT;

-- 1. Galerias anteriores al 28-02-2026
SELECT g.id, g.titulo, e.fecha FROM Galerias g 
JOIN Eventos e ON g.id_evento = e.id 
WHERE e.fecha < TO_DATE('2026-02-28', 'YYYY-MM-DD');

-- 2. Eventos favoritos del usuario 1
SELECT e.* FROM Eventos e 
JOIN Favoritos f ON e.id = f.id_evento 
WHERE f.id_usuario = 1;

-- 3. Imagenes de la galeria del evento 12-01-2026 (ID es 2)
SELECT i.* FROM Imagenes i 
WHERE i.id_galeria = 20; -- Usamos el ID de la galer�a que creamos para el evento 2

-- 4. Favoritos usuario 2 posteriores al 28-02-2026
SELECT e.* FROM Eventos e 
JOIN Favoritos f ON e.id = f.id_evento 
WHERE f.id_usuario = 2 AND e.fecha > TO_DATE('2026-02-28', 'YYYY-MM-DD');