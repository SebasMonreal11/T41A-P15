-- Vista de empleados mayores de edad
CREATE OR REPLACE VIEW vista_empleados_mayores AS
SELECT id, nombre, edad, departamento_id
FROM empleados
WHERE edad >= 18;

-- Vista de productos con stock bajo (menos de 5 unidades)
CREATE OR REPLACE VIEW vista_productos_bajo_stock AS
SELECT id, nombre, stock, precio
FROM productos
WHERE stock < 5;

-- Vista de empleados con nombre completo
CREATE OR REPLACE VIEW vista_empleados_nombre_completo AS
SELECT id, nombre_completo(nombre, apellido) AS nombre_completo, edad, departamento_id
FROM empleados;

-- Vista de empleados agrupados por departamento
CREATE OR REPLACE VIEW vista_empleados_por_departamento AS
SELECT departamento_id, COUNT(*) AS total_empleados
FROM empleados
GROUP BY departamento_id;

-- Vista de empleados del departamento TI
CREATE OR REPLACE VIEW vista_ti AS
SELECT split_part(nombre, ' ', 1) AS nombre
FROM empleados
WHERE departamento_id = (
    SELECT id FROM departamentos WHERE nombre = 'TI'
);


