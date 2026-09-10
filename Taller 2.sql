CREATE DATABASE tienda_taller;

USE tienda_taller;

CREATE TABLE Producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50) NOT NULL
);

CREATE TABLE Venta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT fk_venta_producto FOREIGN KEY (id_producto) REFERENCES Producto(id)
);

INSERT INTO Producto (nombre, precio, categoria) VALUES 
('Laptop Gamer', 3500000.00, 'Tecnología'),
('Mouse', 45000.00, 'Tecnología'),
('Camisa', 80000.00, 'Ropa'),
('Cafetera', 120000.00, 'Hogar');

INSERT INTO Venta (id_producto, cantidad, fecha) VALUES 
(1, 1, '2026-09-01'),
(2, 3, '2026-09-02'),
(3, 2, '2026-09-03'),
(4, 1, '2026-09-04');

CREATE TABLE productos_caros AS 
SELECT * FROM Producto WHERE precio > 100000;

DESCRIBE productos_caros;

SELECT v.id, p.nombre, v.cantidad, v.fecha 
FROM Venta v 
JOIN Producto p ON v.id_producto = p.id;

SELECT UPPER(nombre), ROUND(precio, 2), CONCAT(categoria, ' - Activo') 
FROM Producto;

SELECT nombre, precio, IF(precio > 100000, 'Premium', 'Estándar') AS tipo 
FROM Producto;

SELECT v.id, UPPER(p.nombre) AS producto, v.cantidad, IF(p.precio > 100000, 'Premium', 'Estándar') AS tipo 
FROM Venta v 
JOIN Producto p ON v.id_producto = p.id;
