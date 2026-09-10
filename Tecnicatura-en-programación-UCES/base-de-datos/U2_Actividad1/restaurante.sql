CREATE DATABASE IF NOT EXISTS restaurante;
USE restaurante;

DROP VIEW IF EXISTS vista_platos_ingredientes;
DROP TABLE IF EXISTS plato_ingrediente;
DROP TABLE IF EXISTS ingrediente;
DROP TABLE IF EXISTS plato;
DROP TABLE IF EXISTS unidad_medida;
DROP TABLE IF EXISTS categoria;

CREATE TABLE categoria (
    id_categoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE unidad_medida (
    id_unidad_medida INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    abreviatura VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE plato (
    id_plato INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT UNSIGNED NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    precio_final DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_plato_precio CHECK (precio_final >= 0),
    CONSTRAINT fk_plato_categoria
        FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE ingrediente (
    id_ingrediente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_unidad_medida INT UNSIGNED NOT NULL,
    nombre VARCHAR(120) NOT NULL UNIQUE,
    cantidad_actual_almacen DECIMAL(10, 3) NOT NULL DEFAULT 0,
    CONSTRAINT chk_ingrediente_stock CHECK (cantidad_actual_almacen >= 0),
    CONSTRAINT fk_ingrediente_unidad
        FOREIGN KEY (id_unidad_medida) REFERENCES unidad_medida (id_unidad_medida)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE plato_ingrediente (
    id_plato INT UNSIGNED NOT NULL,
    id_ingrediente INT UNSIGNED NOT NULL,
    cantidad_necesaria DECIMAL(10, 3) NOT NULL,
    PRIMARY KEY (id_plato, id_ingrediente),
    CONSTRAINT chk_plato_ingrediente_cantidad CHECK (cantidad_necesaria > 0),
    CONSTRAINT fk_plato_ingrediente_plato
        FOREIGN KEY (id_plato) REFERENCES plato (id_plato)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_plato_ingrediente_ingrediente
        FOREIGN KEY (id_ingrediente) REFERENCES ingrediente (id_ingrediente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE INDEX idx_plato_categoria ON plato (id_categoria);
CREATE INDEX idx_ingrediente_unidad ON ingrediente (id_unidad_medida);

CREATE VIEW vista_platos_ingredientes AS
SELECT
    p.nombre AS plato,
    p.descripcion AS descripcion_plato,
    c.nombre AS categoria,
    p.precio_final,
    i.nombre AS ingrediente,
    pi.cantidad_necesaria,
    um.nombre AS unidad_medida,
    um.abreviatura,
    i.cantidad_actual_almacen
FROM plato AS p
INNER JOIN categoria AS c ON c.id_categoria = p.id_categoria
INNER JOIN plato_ingrediente AS pi ON pi.id_plato = p.id_plato
INNER JOIN ingrediente AS i ON i.id_ingrediente = pi.id_ingrediente
INNER JOIN unidad_medida AS um ON um.id_unidad_medida = i.id_unidad_medida;

SELECT *
FROM vista_platos_ingredientes
ORDER BY plato, ingrediente;