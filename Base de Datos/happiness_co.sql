create database if not exists happiness_co;
use happiness_co;

-- Tabla de Usuarios
create table Usuarios (
	id int auto_increment primary key,
    nombre varchar(100) not null,
    email varchar(150) unique not null,
    password varchar(255) not null
);

-- Tabla de Eventos
create table Eventos (
	id int auto_increment primary key,
    fecha date not null,
    titulo varchar(200) not null,
    ubicacion varchar(255),
    descripcion text
    );

-- Tabla de Galerías
create table Galerias (
	id int auto_increment primary key,
    titulo varchar(200) not null,
    id_evento int not null,
    foreign key (id_evento) references Eventos(id) on delete cascade
);

-- Tabla de Imágenes de las Galerías
create table Imagenes_Galerias(
	id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200),
    imagen VARCHAR(255),
    id_galeria INT NOT NULL,
    FOREIGN KEY (id_galeria) REFERENCES Galerias(id) ON DELETE CASCADE
);

-- Tabla de Favoritos
CREATE TABLE Favoritos (
    id_usuario INT NOT NULL,
    id_evento INT NOT NULL,
    PRIMARY KEY (id_usuario, id_evento),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (id_evento) REFERENCES Eventos(id) ON DELETE CASCADE
);

    
INSERT INTO Usuarios (nombre, email, password) VALUES 
('Juan Pérez', 'juan@example.com', 'pass123'),
('María García', 'maria@example.com', 'pass456'),
('Carlos López', 'carlos@example.com', 'pass789');
    
    
INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES 
(1, '2026-01-01', 'Concierto de Año Nuevo de Jazz en la costa', 'Costa Asturiana', 'El mayor evento musical del comienzo del año junto al mar. Disfrutamos inaugurando el año con asombrosos artistas locales de Jazz e internacionales.'),
(2, '2026-01-12', 'Festival IN-EDIT Gijón', 'Gijón', 'La nueva edición del prestigioso festival de cine documental musical IN-EDIT llega a Gijón. Se presentarán multitud de películas, cortos y documentales sobre los artistas que revolucionaron la historia universal de la música.'),
(3, '2026-01-06', 'Fiesta de El Guirria y del Aguinaldo', 'San Xuan de Beleño, Ponga (Asturias)', 'Una de las fiestas más singulares y ancestrales de Asturias, declarada de Interés Turístico Regional. El Guirria recorre el pueblo persiguiendo a los vecinos mientras se recolecta el aguinaldo para la celebración comunitaria.');

INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES 
(4, '2026-06-05', 'Desafío Lagos de Covadonga', 'Cangas de Onís, Lagos de Covadonga', 'La mítica prueba cicloturista asturiana rodeando los lagos glaciares del Parque Nacional Picos de Europa. Un reto deportivo inigualable.'),
(5, '2026-06-15', 'Film Symphony Orchestra - WANTED', 'Teatro de La Laboral, Gijón', 'Un espectacular concierto de la Film Symphony Orchestra en Gijón. Los míticos acordes del western cobran vida: silbidos al estilo Morricone, guitarras y duelos al amanecer en un show en vivo inolvidable.'),
(6, '2026-06-01', 'Programación: Museo del Jurásico de Asturias (MUJA)', 'Colunga, Asturias', 'Descubre la increíble programación especial de junio en el Museo del Jurásico de Asturias en Colunga. Talleres dinámicos, exposiciones fascinantes y reproducciones a tamaño real de dinosaurios. Ideal para toda la familia.');

-- Galerías para los 3 eventos del historial
INSERT INTO Galerias (id, titulo, id_evento) VALUES 
(1, 'Galería Jazz Año Nuevo', 1),
(2, 'Galería IN-EDIT Gijón', 2),
(3, 'Galería Fiesta El Guirria', 3);

-- Imágenes (4 por galería, según el HTML)
INSERT INTO Imagenes_Galerias (titulo, imagen, id_galeria) VALUES 
('Jazz Galería 1', 'img/jazz-galeria-1.png', 1),
('Jazz Galería 2', 'img/jazz-galeria-2.png', 1),
('Jazz Galería 3', 'img/jazz-galeria-3.jpg', 1),
('Jazz Galería 4', 'img/jazz-galeria-4.png', 1);

INSERT INTO Imagenes_Galerias (titulo, imagen, id_galeria) VALUES 
('IN-EDIT Galería 1', 'img/inedit-galeria-1.jpg', 2),
('IN-EDIT Galería 2', 'img/inedit-galeria-2.png', 2),
('IN-EDIT Galería 3', 'img/inedit-galeria-3.jpg', 2),
('IN-EDIT Galería 4', 'img/inedit-galeria-4.jpg', 2);

INSERT INTO Imagenes_Galerias (titulo, imagen, id_galeria) VALUES 
('Guirria Galería 1', 'img/guirria-galeria-1.png', 3),
('Guirria Galería 2', 'img/guirria-galeria-2.png', 3),
('Guirria Galería 3', 'img/guirria-galeria-3.png', 3),
('Guirria Galería 4', 'img/guirria-galeria-4.jpg', 3);

INSERT INTO Favoritos (id_usuario, id_evento) VALUES 
(1, 1), (1, 2), (1, 4), -- Usuario 1: 2 pasados, 1 futuro
(2, 2), (2, 3), (2, 5), -- Usuario 2: 2 pasados, 1 futuro
(3, 1), (3, 3), (3, 6); -- Usuario 3: 2 pasados, 1 futuro

-- Galerías anteriores al 28-02-2026:
CREATE VIEW Vista_Galerias_Antiguas AS
SELECT g.* FROM Galerias g
JOIN Eventos e ON g.id_evento = e.id
WHERE e.fecha < '2026-02-28';

-- Eventos favoritos del usuario 1:
CREATE VIEW Favoritos_Usuario_1 AS
SELECT e.* FROM Eventos e
JOIN Favoritos f ON e.id = f.id_evento
WHERE f.id_usuario = 1;

-- Imágenes de la galería del evento del 12-01-2026:
CREATE VIEW Imagenes_Evento_Enero AS
SELECT i.* FROM Imagenes_Galerias i
JOIN Galerias g ON i.id_galeria = g.id
WHERE g.id_evento = 2; -- Asumiendo que el ID del evento es 2

-- Eventos favoritos del usuario 2 posteriores al 28-02-2026:
CREATE VIEW Favoritos_Usuario_2_Futuros AS
SELECT e.* FROM Eventos e
JOIN Favoritos f ON e.id = f.id_evento
WHERE f.id_usuario = 2 AND e.fecha > '2026-02-28';