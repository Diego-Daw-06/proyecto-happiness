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

    
    