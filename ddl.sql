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
  nombre VARCHAR(100) NOT NULL,
  especie VARCHAR(50) NOT NULL,
  raza VARCHAR(100),
  edad INT,
  sexo ENUM('Macho', 'Hembra'),
  vacunada BOOLEAN,
  id_dueno INT,
  FOREIGN KEY (id_dueno) REFERENCES Dueno(id_dueno)
);

CREATE TABLE Servicio (
  id_servicio INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE Visita (
  id_visita INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE NOT NULL,
  id_mascota INT,
  id_servicio INT,
  FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota),
  FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

CREATE TABLE Tratamiento (
  id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  observaciones TEXT,
  id_visita INT,
  FOREIGN KEY (id_visita) REFERENCES Visita(id_visita)
);
