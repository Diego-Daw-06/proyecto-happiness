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
-- 3 del historial (antes del 28-02-2026) y 3 proximos
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES (1, TO_DATE('2026-01-01','YYYY-MM-DD'), 'Concierto de Año Nuevo de Jazz en la costa', 'Costa Asturiana', 'El mayor evento musical del comienzo del año junto al mar. Disfrutamos inaugurando el año con asombrosos artistas locales de Jazz e internacionales.');
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES (2, TO_DATE('2026-01-12','YYYY-MM-DD'), 'Festival IN-EDIT Gijon', 'Gijon', 'La nueva edicion del prestigioso festival de cine documental musical IN-EDIT llega a Gijon. Se presentaran multitud de peliculas, cortos y documentales sobre los artistas que revolucionaron la historia universal de la musica.');
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES (3, TO_DATE('2026-01-06','YYYY-MM-DD'), 'Fiesta de El Guirria y del Aguinaldo', 'San Xuan de Beleno, Ponga (Asturias)', 'Una de las fiestas mas singulares y ancestrales de Asturias, declarada de Interes Turistico Regional. El Guirria recorre el pueblo persiguiendo a los vecinos mientras se recolecta el aguinaldo para la celebracion comunitaria.');
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES (4, TO_DATE('2026-06-05','YYYY-MM-DD'), 'Desafio Lagos de Covadonga', 'Cangas de Onis, Lagos de Covadonga', 'La mitica prueba cicloturista asturiana rodeando los lagos glaciares del Parque Nacional Picos de Europa. Un reto deportivo inigualable.');
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES (5, TO_DATE('2026-06-15','YYYY-MM-DD'), 'Film Symphony Orchestra - WANTED', 'Teatro de La Laboral, Gijon', 'Un espectacular concierto de la Film Symphony Orchestra en Gijon. Los miticos acordes del western cobran vida: silbidos al estilo Morricone, guitarras y duelos al amanecer en un show en vivo inolvidable.');
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES (6, TO_DATE('2026-06-01','YYYY-MM-DD'), 'Programacion: Museo del Jurasico de Asturias (MUJA)', 'Colunga, Asturias', 'Descubre la increible programacion especial de junio en el Museo del Jurasico de Asturias en Colunga. Talleres dinamicos, exposiciones fascinantes y reproducciones a tamaño real de dinosaurios. Ideal para toda la familia.');

-- Galerias (Una para cada evento del historial: 1, 2 y 3)
INSERT INTO Galerias (id, titulo, id_evento) VALUES (10, 'Galeria Jazz Año Nuevo', 1);
INSERT INTO Galerias (id, titulo, id_evento) VALUES (20, 'Galeria IN-EDIT Gijon', 2);
INSERT INTO Galerias (id, titulo, id_evento) VALUES (30, 'Galeria Fiesta El Guirria', 3);

-- Imagenes (Minimo 3 por galeria, 4 segun el HTML)
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (101, 'Jazz Galeria 1', 'img/jazz-galeria-1.png', 10);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (102, 'Jazz Galeria 2', 'img/jazz-galeria-2.png', 10);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (103, 'Jazz Galeria 3', 'img/jazz-galeria-3.jpg', 10);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (104, 'Jazz Galeria 4', 'img/jazz-galeria-4.png', 10);

INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (201, 'IN-EDIT Galeria 1', 'img/inedit-galeria-1.jpg', 20);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (202, 'IN-EDIT Galeria 2', 'img/inedit-galeria-2.png', 20);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (203, 'IN-EDIT Galeria 3', 'img/inedit-galeria-3.jpg', 20);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (204, 'IN-EDIT Galeria 4', 'img/inedit-galeria-4.jpg', 20);

INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (301, 'Guirria Galeria 1', 'img/guirria-galeria-1.png', 30);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (302, 'Guirria Galeria 2', 'img/guirria-galeria-2.png', 30);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (303, 'Guirria Galeria 3', 'img/guirria-galeria-3.png', 30);
INSERT INTO Imagenes (id, titulo, imagen, id_galeria) VALUES (304, 'Guirria Galeria 4', 'img/guirria-galeria-4.jpg', 30);

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