INSERT INTO Dueno (nombre, apellido, cedula, telefono, direccion) VALUES
('Laura', 'Pérez', '1234567890', '3011234567', 'Calle 10 #12-34'),
('Carlos', 'Ramírez', '2345678901', '3022345678', 'Carrera 45 #67-89'),
('Ana', 'Martínez', '3456789012', '3033456789', 'Calle 23 #45-67'),
('Julián', 'Torres', '4567890123', '3044567890', 'Av. 1 #2-3'),
('Marcela', 'Gómez', '5678901234', '3055678901', 'Calle 100 #50-20');


INSERT INTO Mascota (nombre, especie, raza, edad, sexo, vacunada, id_dueno) VALUES
('Max', 'Perro', 'Labrador', 5, 'Macho', TRUE, 1),
('Luna', 'Gato', 'Persa', 3, 'Hembra', TRUE, 2),
('Rocky', 'Perro', 'Bulldog', 4, 'Macho', FALSE, 3),
('Mía', 'Gato', 'Siamés', 2, 'Hembra', TRUE, 4),
('Toby', 'Perro', 'Beagle', 6, 'Macho', TRUE, 1),
('Nina', 'Gato', 'Criolla', 1, 'Hembra', FALSE, 5),
('Zeus', 'Perro', 'Pastor Alemán', 7, 'Macho', TRUE, 2),
('Lola', 'Gato', 'Bengala', 3, 'Hembra', TRUE, 3),
('Simba', 'Perro', 'Golden Retriever', 2, 'Macho', FALSE, 4),
('Kira', 'Gato', 'Maine Coon', 4, 'Hembra', TRUE, 5);


INSERT INTO Servicio (nombre, descripcion, precio) VALUES
('Baño', 'Baño completo con shampoo especial para mascotas.', 20000.00),
('Consulta médica', 'Revisión general por el veterinario.', 35000.00),
('Corte de uñas', 'Corte y limado de uñas.', 10000.00),
('Vacunación', 'Aplicación de vacuna según especie.', 30000.00),
('Desparasitación', 'Tratamiento antiparasitario.', 25000.00);


INSERT INTO Visita (fecha, id_mascota, id_servicio) VALUES
('2025-07-01', 1, 1),
('2025-07-02', 2, 2),
('2025-07-03', 3, 5),
('2025-07-04', 4, 4),
('2025-07-05', 5, 3),
('2025-07-06', 6, 1),
('2025-07-07', 7, 2),
('2025-07-08', 8, 4),
('2025-07-09', 9, 3),
('2025-07-10', 10, 5);


INSERT INTO Tratamiento (nombre, observaciones, id_visita) VALUES
('Antibiótico', 'Administrado por 7 días.', 2),
('Vitaminas', '1 tableta diaria por 1 mes.', 3),
('Pomada antiséptica', 'Aplicar en herida durante 5 días.', 4),
('Desparasitario oral', 'Dosis única administrada.', 10),
('Inyección antiinflamatoria', 'Aplicada durante la consulta.', 7);
