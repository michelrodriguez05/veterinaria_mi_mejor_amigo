-- datos.sql

INSERT INTO Dueno (cedula, nombre_completo, telefono, direccion) VALUES
('1010101010', 'Ana María Pérez García', '3001234567', 'Calle 10 # 20-30, Bucaramanga'),
('2020202020', 'Juan Carlos Ramírez Soto', '3109876543', 'Carrera 5 # 15-25, Floridablanca'),
('3030303030', 'Sofía Gómez López', '3205551122', 'Avenida Principal # 7-8, Piedecuesta'),
('4040404040', 'Pedro Antonio Martínez Ruiz', '3157773344', 'Diagonal 2 # 50-10, Girón'),
('5050505050', 'Laura Valentina Díaz Castro', '3012229988', 'Transversal 8 # 3-45, Bucaramanga');

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

INSERT INTO Servicio (nombre_servicio, descripcion, precio_base) VALUES
('Consulta Médica General', 'Revisión completa, diagnóstico y prescripción básica.', 45.00),
('Baño y Peluquería Canina', 'Baño, secado, cepillado, corte de pelo y limpieza de oídos.', 60.00),
('Vacunación Antirrábica', 'Aplicación de la vacuna contra la rabia.', 30.00),
('Desparasitación Interna', 'Administración de desparasitante oral.', 25.00),
('Corte de Uñas', 'Recorte y limado de uñas.', 15.00);

INSERT INTO Visita (fecha_visita, id_mascota, id_servicio) VALUES
('2025-07-20', (SELECT id_mascota FROM Mascota WHERE nombre = 'Max' AND cedula_dueno = '1010101010'), (SELECT id_servicio FROM Servicio WHERE nombre_servicio = 'Consulta Médica General')),
('2025-07-21', (SELECT id_mascota FROM Mascota WHERE nombre = 'Luna' AND cedula_dueno = '1010101010'), (SELECT id_servicio FROM Servicio WHERE nombre_servicio = 'Vacunación Antirrábica')),
('2025-07-22', (SELECT id_mascota FROM Mascota WHERE nombre = 'Rocky' AND cedula_dueno = '2020202020'), (SELECT id_servicio FROM Servicio WHERE nombre_servicio = 'Baño y Peluquería Canina')),
('2025-07-23', (SELECT id_mascota FROM Mascota WHERE nombre = 'Cleo' AND cedula_dueno = '2020202020'), (SELECT id_servicio FROM Servicio WHERE nombre_servicio = 'Desparasitación Interna')),
('2025-07-24', (SELECT id_mascota FROM Mascota WHERE nombre = 'Coco' AND cedula_dueno = '3030303030'), (SELECT id_servicio FROM Servicio WHERE nombre_servicio = 'Consulta Médica General')),
('2025-07-24', (SELECT id_mascota FROM Mascota WHERE nombre = 'Milo' AND cedula_dueno = '4040404040'), (SELECT id_servicio FROM Servicio WHERE nombre_servicio = 'Corte de Uñas')),
('2025-07-25', (SELECT id_mascota FROM Mascota WHERE nombre = 'Nina' AND cedula_dueno = '4040404040'), (SELECT id_servicio FROM Servicio WHERE nombre_servicio = 'Consulta Médica General')),
('2025-07-25', (SELECT id_mascota FROM Mascota WHERE nombre = 'Toby' AND cedula_dueno = '5050505050'), (SELECT id_servicio FROM Servicio WHERE nombre_servicio = 'Baño y Peluquería Canina')),
('2025-07-26', (SELECT id_mascota FROM Mascota WHERE nombre = 'Princesa' AND cedula_dueno = '1010101010'), (SELECT id_servicio FROM Servicio WHERE nombre_servicio = 'Desparasitación Interna')),
('2025-07-26', (SELECT id_mascota FROM Mascota WHERE nombre = 'Balto' AND cedula_dueno = '3030303030'), (SELECT id_servicio FROM Servicio WHERE nombre_servicio = 'Vacunación Antirrábica'));

INSERT INTO Tratamiento (nombre_tratamiento, observaciones, id_visita) VALUES
('Antibiótico Amoxicilina', 'Recetado para infección respiratoria leve.', (SELECT id_visita FROM Visita WHERE id_mascota = (SELECT id_mascota FROM Mascota WHERE nombre = 'Max') AND fecha_visita = '2025-07-20')),
('Vendas y Curación', 'Para herida superficial en pata delantera.', (SELECT id_visita FROM Visita WHERE id_mascota = (SELECT id_mascota FROM Mascota WHERE nombre = 'Coco') AND fecha_visita = '2025-07-24')),
('Suplemento Vitamínico', 'Para fortalecer sistema inmunológico.', (SELECT id_visita FROM Visita WHERE id_mascota = (SELECT id_mascota FROM Mascota WHERE nombre = 'Nina') AND fecha_visita = '2025-07-25')),
('Champú Dermatológico', 'Para tratamiento de dermatitis leve.', (SELECT id_visita FROM Visita WHERE id_mascota = (SELECT id_mascota FROM Mascota WHERE nombre = 'Toby') AND fecha_visita = '2025-07-25')),
('Collar Antipulgas', 'Prevención de infestación de pulgas y garrapatas.', (SELECT id_visita FROM Visita WHERE id_mascota = (SELECT id_mascota FROM Mascota WHERE nombre = 'Milo') AND fecha_visita = '2025-07-24'));