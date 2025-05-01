-- Sistema de stock de mercadería
-- Mercadería -> Seq de nombres de productos que pueden estar repetidos -> ["Remera", "Pantalon", "Medias", "Remera"]
-- Stock -> Seq de tuplas donde el primero = Nombre del producto y el segundo = cantidad. No hay productos repetidos -> [("Remera", 20), ("Pantalon", 10), ("Medias", 5)]
-- Lista de precios -> Seq de tuplas donde el primero = Nombre del producto y el segundo = precio -> [("Remera", 20000), ("Pantalon", 25000), ("Medias", 5000)]

-- 1)
-- Devuelve solamente el stock de los productos sin repetir
-- ["Remera", "Pantalon", "Remera", "Zapatilla"]


-- crear funcion axuliar contarMercaderia
-- x = "Remera" -> xs = ["Pantalon", "Remera", "Zapatilla"]

contarMercaderia :: String -> [String] -> Integer
contarMercaderia _ [] = 0
contarMercaderia n (x: xs) | n == x = 1 + contarMercaderia n xs
                           | otherwise = contarMercaderia n xs


-- x = "Remera" -> xs = ["Pantalon", "Remera", "Zapatilla"]
-- contarMercaderia = 2 -> (Remera, 2) : generarStock eliminarDuplicado xs -> ["Pantalon", "Zapatilla"]
-- x = "Pantalon" -> xs = ["Zapatilla"]
-- contarMercaderia = 1 -> ("Pantalon", 1) : generarStock ["Remera", "Zapatilla"]


eliminarDuplicado :: String -> [String] -> [String]
eliminarDuplicado _ [] = []
eliminarDuplicado n (x: xs) | n == x = eliminarDuplicado n xs
                            | otherwise = x : eliminarDuplicado n xs

generarStock :: [String] -> [(String, Integer)]
generarStock [] = []
generarStock (x: xs) = (x, contarMercaderia x (x:xs)) : generarStock (eliminarDuplicado x xs)

--2)

-- Stock = [("Remera",2),("Pantalon",1),("Zapatilla",2)]
-- Producto = Remera
-- rta = 2
-- [("Remera",2),("Pantalon",1),("Zapatilla",2)]


stockProducto :: [(String, Integer)] -> String -> Integer
stockProducto [] _ = 0
stockProducto ((x, y): xs) n | n == x = y
                             | otherwise = stockProducto xs n

-- 3)
-- Stock = [("Remera",2),("Pantalon",1),("Zapatilla",2)] -> (ns, q)
-- Precios = [("Remera", 20000), ("Pantalon", 25000), ("Zapatilla", 30000)] -> (np, p)
-- ("Remera",2) -> busco en lista precios -> si ns = np entonces q * p + dineroEnStock 

buscarPrecio :: String -> [(String, Float)] -> Float
buscarPrecio _ [] = 0
buscarPrecio n ((x, s): xs) | n == x = s
                            | otherwise = buscarPrecio n xs


dineroEnStock :: [(String, Integer)] -> [(String, Float)] -> Float
dineroEnStock [] _ = 0
dineroEnStock ((ns, q): xs) xy = ((buscarPrecio ns xy) * fromIntegral q) + dineroEnStock xs xy

-- 4)
-- < 10 -> * 0.80 sino queda igual el p
-- [("Remera",2),("Pantalon",1),("Zapatilla",12)] -- [("Remera",15000),("Pantalon",12000),("Zapatilla",21000)]
-- 

-- aplicarOferta :: [(String, Integer)] -> [(String, Float)] -> [(String, Float)]
-- aplicarOferta [] [] = []
-- aplicarOferta ((ns, q): xs) xy | q < 10 = (ns, ((buscarPrecio ns xy) * 0.80)): aplicarOferta xs xy
--                                | otherwise = aplicarOferta xs xy
