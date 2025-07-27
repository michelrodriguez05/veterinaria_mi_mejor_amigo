DROP DATABASE IF EXISTS Veterinaria;
CREATE DATABASE Veterinaria;
USE Veterinaria;

CREATE TABLE Dueno (
    id_dueno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(150)
);


CREATE TABLE Mascota (
    id_mascota INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    especie VARCHAR(50),
    raza VARCHAR(50),
    edad INT,
    sexo ENUM('M', 'F'),
    vacunada BOOLEAN,
    cedula_dueno VARCHAR(20), 
    FOREIGN KEY (cedula_dueno) REFERENCES Dueno(cedula)
);


CREATE TABLE Servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL, 
    descripcion TEXT,
    precio_base DECIMAL(10,2) NOT NULL 
);


CREATE TABLE Visita (
    id_visita INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL, 
    id_mascota INT NOT NULL, 
    id_servicio INT NOT NULL, 
    FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio) ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE Tratamiento (
    id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL, 
    observaciones TEXT,
    id_visita INT NOT NULL, 
    FOREIGN KEY (id_visita) REFERENCES Visita(id_visita) ON UPDATE CASCADE ON DELETE CASCADE
);
