
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_venta DATE NOT NULL,
    CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_venta_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

ALTER TABLE clientes 
ADD COLUMN telefono VARCHAR(20);

ALTER TABLE productos 
MODIFY COLUMN nombre VARCHAR(150) NOT NULL;

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Teclado Mecánico RGB', 'Perifericos', 250000.00, 15),
('Mouse Inalámbrico Ergonómico', 'Perifericos', 95000.00, 30),
('Monitor 24 Pulgadas Full HD', 'Monitores', 720000.00, 10),
('Monitor Curvo 27 Pulgadas', 'Monitores', 1250000.00, 5),
('Laptop Gamer 16GB RAM', 'Computadores', 3800000.00, 7),
('Disco Sólido SSD 1TB', 'Almacenamiento', 320000.00, 25),
('Memoria RAM 8GB DDR4', 'Componentes', 140000.00, 40),
('Audífonos Gamer con Micrófono', 'Audio', 180000.00, 18);

INSERT INTO clientes (nombre, email, ciudad, telefono) VALUES
('Carlos Pérez', 'carlos.perez@gmail.com', 'Cúcuta', '3101234567'),
('Ana Gómez', 'ana.gomez@yahoo.com', 'Bogotá', '3209876543'),
('Luis Rodríguez', 'luis.rod@hotmail.com', 'Medellín', '3154567890'),
('María Torres', 'maria.torres@gmail.com', 'Cali', '3116543210'),
('Jorge Díaz', 'jorge.diaz@outlook.com', 'Bucaramanga', '3187890123'),
('Sofía Castro', 'sofia.castro@gmail.com', 'Bogotá', '3143210987');

INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha_venta) VALUES
(1, 1, 2, '2026-08-01'),
(2, 3, 1, '2026-08-02'),
(3, 5, 1, '2026-08-03'),
(1, 2, 1, '2026-08-05'),
(4, 6, 2, '2026-08-06'),
(5, 7, 4, '2026-08-10'),
(6, 4, 1, '2026-08-12'),
(2, 1, 1, '2026-08-15'),
(3, 8, 2, '2026-08-18'),
(4, 2, 3, '2026-08-20'),
(1, 6, 1, '2026-08-22'),
(5, 3, 1, '2026-08-25');
