INSERT INTO Dueno (nombre, apellido, cedula, telefono, direccion) VALUES
('Ana María', 'Pérez García', '1010101010', '3001234567', 'Calle 10 # 20-30, Bucaramanga'),
('Juan Carlos', 'Ramírez Soto', '2020202020', '3109876543', 'Carrera 5 # 15-25, Floridablanca'),
('Sofía', 'Gómez López', '3030303030', '3205551122', 'Avenida Principal # 7-8, Piedecuesta'),
('Pedro Antonio', 'Martínez Ruiz', '4040404040', '3157773344', 'Diagonal 2 # 50-10, Girón'),
('Laura Valentina', 'Díaz Castro', '5050505050', '3012229988', 'Transversal 8 # 3-45, Bucaramanga');


INSERT INTO Mascota (nombre, especie, raza, edad, sexo, vacunada, cedula_dueno) VALUES
('Max', 'Perro', 'Labrador', 3, 'M', TRUE, '1010101010'),
('Luna', 'Gato', 'Siamés', 2, 'F', TRUE, '1010101010'),
('Rocky', 'Perro', 'Pastor Alemán', 5, 'M', FALSE, '2020202020'),
('Cleo', 'Gato', 'Persa', 1, 'F', TRUE, '2020202020'),
('Coco', 'Perro', 'Poodle', 4, 'F', TRUE, '3030303030'),
('Milo', 'Perro', 'Golden Retriever', 2, 'M', TRUE, '4040404040'),
('Nina', 'Gato', 'Maine Coon', 3, 'F', FALSE, '4040404040'),
('Toby', 'Perro', 'Chihuahua', 6, 'M', TRUE, '5050505050'),
('Princesa', 'Gato', 'Doméstico', 1, 'F', TRUE, '1010101010'),
('Balto', 'Perro', 'Husky', 4, 'M', FALSE, '3030303030');


INSERT INTO Servicio (nombre, descripcion, precio_base) VALUES
('Consulta Médica General', 'Revisión completa, diagnóstico y prescripción básica.', 45.00),
('Baño y Peluquería Canina', 'Baño, secado, cepillado, corte de pelo y limpieza de oídos.', 60.00),
('Vacunación Antirrábica', 'Aplicación de la vacuna contra la rabia.', 30.00),
('Desparasitación Interna', 'Administración de desparasitante oral.', 25.00),
('Corte de Uñas', 'Recorte y limado de uñas.', 15.00);


INSERT INTO Visita (fecha, id_mascota, id_servicio) VALUES
('2025-07-20', (SELECT id_mascota FROM Mascota WHERE nombre = 'Max' AND cedula_dueno = '1010101010'), (SELECT id_servicio FROM Servicio WHERE nombre = 'Consulta Médica General')),
('2025-07-21', (SELECT id_mascota FROM Mascota WHERE nombre = 'Luna' AND cedula_dueno = '1010101010'), (SELECT id_servicio FROM Servicio WHERE nombre = 'Vacunación Antirrábica')),
('2025-07-22', (SELECT id_mascota FROM Mascota WHERE nombre = 'Rocky' AND cedula_dueno = '2020202020'), (SELECT id_servicio FROM Servicio WHERE nombre = 'Baño y Peluquería Canina')),
('2025-07-23', (SELECT id_mascota FROM Mascota WHERE nombre = 'Cleo' AND cedula_dueno = '2020202020'), (SELECT id_servicio FROM Servicio WHERE nombre = 'Desparasitación Interna')),
('2025-07-24', (SELECT id_mascota FROM Mascota WHERE nombre = 'Coco' AND cedula_dueno = '3030303030'), (SELECT id_servicio FROM Servicio WHERE nombre = 'Consulta Médica General')),
('2025-07-24', (SELECT id_mascota FROM Mascota WHERE nombre = 'Milo' AND cedula_dueno = '4040404040'), (SELECT id_servicio FROM Servicio WHERE nombre = 'Corte de Uñas')),
('2025-07-25', (SELECT id_mascota FROM Mascota WHERE nombre = 'Nina' AND cedula_dueno = '4040404040'), (SELECT id_servicio FROM Servicio WHERE nombre = 'Consulta Médica General')),
('2025-07-25', (SELECT id_mascota FROM Mascota WHERE nombre = 'Toby' AND cedula_dueno = '5050505050'), (SELECT id_servicio FROM Servicio WHERE nombre = 'Baño y Peluquería Canina')),
('2025-07-26', (SELECT id_mascota FROM Mascota WHERE nombre = 'Princesa' AND cedula_dueno = '1010101010'), (SELECT id_servicio FROM Servicio WHERE nombre = 'Desparasitación Interna')),
('2025-07-26', (SELECT id_mascota FROM Mascota WHERE nombre = 'Balto' AND cedula_dueno = '3030303030'), (SELECT id_servicio FROM Servicio WHERE nombre = 'Vacunación Antirrábica'));

INSERT INTO Tratamiento (nombre, observaciones, id_visita) VALUES
('Antibiótico Amoxicilina', 'Recetado para infección respiratoria leve.', (SELECT id_visita FROM Visita WHERE id_mascota = (SELECT id_mascota FROM Mascota WHERE nombre = 'Max') AND fecha = '2025-07-20')),
('Vendas y Curación', 'Para herida superficial en pata delantera.', (SELECT id_visita FROM Visita WHERE id_mascota = (SELECT id_mascota FROM Mascota WHERE nombre = 'Coco') AND fecha = '2025-07-24')),
('Suplemento Vitamínico', 'Para fortalecer sistema inmunológico.', (SELECT id_visita FROM Visita WHERE id_mascota = (SELECT id_mascota FROM Mascota WHERE nombre = 'Nina') AND fecha = '2025-07-25')),
('Champú Dermatológico', 'Para tratamiento de dermatitis leve.', (SELECT id_visita FROM Visita WHERE id_mascota = (SELECT id_mascota FROM Mascota WHERE nombre = 'Toby') AND fecha = '2025-07-25')),
('Collar Antipulgas', 'Prevención de infestación de pulgas y garrapatas.', (SELECT id_visita FROM Visita WHERE id_mascota = (SELECT id_mascota FROM Mascota WHERE nombre = 'Milo') AND fecha = '2025-07-24'));
