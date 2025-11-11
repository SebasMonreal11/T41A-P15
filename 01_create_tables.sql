-- Tabla de departamentos
CREATE TABLE departamentos (
    id INT PRIMARY KEY,
    nombre TEXT NOT NULL
);

-- Tabla de empleados
CREATE TABLE empleados (
    id INT PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT,
    edad INT,
    departamento_id INT REFERENCES departamentos(id)
);

-- Tabla de productos
CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre TEXT NOT NULL,
    stock INT,
    precio NUMERIC
);


-- Función para calcular el IVA
CREATE OR REPLACE FUNCTION calcular_iva(monto NUMERIC, tasa NUMERIC DEFAULT 0.16)
RETURNS NUMERIC AS $$
BEGIN
    RETURN monto * tasa;
END;
$$ LANGUAGE plpgsql;

-- Función para obtener nombre completo
CREATE OR REPLACE FUNCTION nombre_completo(nombre TEXT, apellido TEXT)
RETURNS TEXT AS $$
BEGIN
    RETURN nombre || ' ' || apellido;
END;
$$ LANGUAGE plpgsql;

-- Función para verificar mayoría de edad
CREATE OR REPLACE FUNCTION es_mayor_de_edad(edad INT)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN edad >= 18;
END;
$$ LANGUAGE plpgsql;

-- Función de tabla: empleados por departamento
CREATE OR REPLACE FUNCTION empleados_por_departamento(dep_id INT)
RETURNS TABLE(id INT, nombre TEXT) AS $$
BEGIN
    RETURN QUERY SELECT id, nombre FROM empleados WHERE departamento_id = dep_id;
END;
$$ LANGUAGE plpgsql;
