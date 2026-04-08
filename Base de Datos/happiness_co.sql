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
(1, '2026-01-01', 'Concierto de Año Nuevo', 'Teatro Principal', 'Música clásica para empezar el año.'),
(2, '2026-01-12', 'Exposición de Arte Moderno', 'Galería Central', 'Muestra de artistas locales contemporáneos.'),
(3, '2026-01-24', 'Obra de Teatro: El Sueño', 'Centro Cultural', 'Representación dramática en tres actos.');

INSERT INTO Eventos (id, fecha, titulo, ubicacion, descripcion) VALUES 
(4, '2026-06-05', 'Festival de Jazz', 'Parque de la Paz', 'Jazz al aire libre con artistas internacionales.'),
(5, '2026-06-15', 'Cine de Verano', 'Plaza Mayor', 'Proyección de clásicos del cine bajo las estrellas.'),
(6, '2026-06-25', 'Feria de Gastronomía', 'Recinto Ferial', 'Degustación de platos típicos regionales.');

-- Galerías para los 3 eventos del historial
INSERT INTO Galerias (id, titulo, id_evento) VALUES 
(1, 'Fotos Concierto Enero', 1),
(2, 'Fotos Exposición Enero', 2),
(3, 'Fotos Teatro Enero', 3);

-- Imágenes (3 por galería)
INSERT INTO Imagenes_Galerias (titulo, imagen, id_galeria) VALUES 
('Inicio Concierto', 'img1.jpg', 1), ('Solo de Piano', 'img2.jpg', 1), ('Aplausos Finales', 'img3.jpg', 1),
('Cuadro Principal', 'img4.jpg', 2), ('Escultura Bronce', 'img5.jpg', 2), ('Vista Sala', 'img6.jpg', 2),
('Escenario Vacío', 'img7.jpg', 3), ('Actor Principal', 'img8.jpg', 3), ('Salida Público', 'img9.jpg', 3);

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