CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    ciudad VARCHAR(100),
    fecha_registro DATE,
    acepta_promociones VARCHAR(10)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    id_categoria INT,
    fecha_registro DATE
);

CREATE TABLE productos_prueba (
    id_prueba INT PRIMARY KEY,
    nombre_prueba VARCHAR(50)
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    salario DECIMAL(10,2) CHECK (salario >= 0),
    id_departamento INT,
    fecha_contratacion DATE,
    CONSTRAINT fk_empleado_departamento 
        FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
        ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE productos_prueba;

ALTER TABLE clientes 
ADD COLUMN telefono VARCHAR(20);

ALTER TABLE empleados 
ADD COLUMN correo_corporativo VARCHAR(150);

UPDATE productos
SET precio = 549.00
WHERE id_producto = 310;

DELETE FROM productos
WHERE id_producto = 118;

SELECT nombre, fecha_registro
FROM clientes
WHERE ciudad = 'Bogotá'
ORDER BY fecha_registro DESC
LIMIT 5;

SELECT nombre, precio, categoria
FROM productos
WHERE categoria IN ('Electrodomésticos', 'Tecnología')
AND nombre LIKE '%Smart%';

SELECT 
    id_categoria,
    AVG(precio) AS precio_promedio
FROM productos
GROUP BY id_categoria
HAVING AVG(precio) > 300000;

