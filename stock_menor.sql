CREATE OR REPLACE FUNCTION productos_bajo_stock(minimo INT)
RETURNS TABLE(id INT, nombre TEXT, stock INT) AS $$
BEGIN
    RETURN QUERY SELECT id, nombre, stock FROM productos WHERE stock < minimo;
END;
$$ LANGUAGE plpgsql;
