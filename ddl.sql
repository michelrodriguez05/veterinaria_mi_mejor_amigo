-- Drop tables if they exist to ensure a clean slate
DROP TABLE IF EXISTS Tratamiento;
DROP TABLE IF EXISTS Visita;
DROP TABLE IF EXISTS Servicio;
DROP TABLE IF EXISTS Mascota;
DROP TABLE IF EXISTS Dueno;

-- Table: Dueno
CREATE TABLE Dueno (
    cedula VARCHAR(20) PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    direccion VARCHAR(200)
);

-- Table: Mascota
CREATE TABLE Mascota (
    id_mascota INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raza VARCHAR(50),
    edad INT,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    vacunada BOOLEAN NOT NULL DEFAULT FALSE,
    cedula_dueno VARCHAR(20) NOT NULL,
    CONSTRAINT fk_dueno
        FOREIGN KEY (cedula_dueno)
        REFERENCES Dueno(cedula)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Table: Servicio
CREATE TABLE Servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    precio_base DECIMAL(10, 2) NOT NULL
);

-- Table: Visita
CREATE TABLE Visita (
    id_visita INT AUTO_INCREMENT PRIMARY KEY,
    fecha_visita DATE NOT NULL,
    id_mascota INT NOT NULL,
    id_servicio INT NOT NULL,
    CONSTRAINT fk_mascota_visita
        FOREIGN KEY (id_mascota)
        REFERENCES Mascota(id_mascota)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_servicio_visita
        FOREIGN KEY (id_servicio)
        REFERENCES Servicio(id_servicio)
        ON UPDATE CASCADE
        ON DELETE RESTRICT -- Prevent deleting a service if it's tied to a visit
);

-- Table: Tratamiento
CREATE TABLE Tratamiento (
    id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tratamiento VARCHAR(100) NOT NULL,
    observaciones TEXT,
    id_visita INT NOT NULL,
    CONSTRAINT fk_visita_tratamiento
        FOREIGN KEY (id_visita)
        REFERENCES Visita(id_visita)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);