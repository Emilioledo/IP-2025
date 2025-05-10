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


-- Sopa de Números
-- tablero n x m donde n && m > 0. En cada celda hay un entero positivo. 
-- Cada posicion -> (i, j) -> (Fila, columna)
-- Camino se puede dar solamente -> de a 1 hacia derecha o hacia abajo.
-- Fila = seq (Z) -> [13, 12, 6, 4]
-- Tablero = seq (Fila) -> [[13, 12, 6, 4], [1, 1, 32, 25]] ...
-- Posicion = Z x Z (Fila columna)
-- Camino = seq (Posición)

-- type Tablero = [[Integer]]


-- ((13, 12, 6, 4), (1, 1, 32, 25))
-- x = (13, 12, 6, 4) : xs = (1, 1, 32, 25) 
-- x = 13 -> y = 12 -> xy= (6, 4)
-- 13 > 12 -> entonces 13 -> 13 > 6 -> entonces 13 -> 13 > 4 -> entonces 13

-- maximo :: Tablero -> Integer
-- maximo [] = 0
-- maximo ((x: y: xy): xs) | x > y = 
--                         | otherwise = maximo (xy:xs)  



-- Perfectos amigos
-- numeros perfectos -> suma de los divisores de n es igual a n -> ej 6 es -> 3 + 2 + 1 = 6
-- numeros amigos -> n distintos -> si la suma de los divisores de cada uno es igual al otro n 
-- 220 son 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 y 110 que sumados dan 284 y los divisores propios de 284 son 1, 2 , 4, 71, 142 que sumados dan 220. 


-- 220 
-- raiz cuadrada 220 = 14 
-- se empieza de 1 al 14 buscando los divisores. Si el resto es 0, se toma el resultado como divisor y el divisor propiamente dicho
-- por ejemplo 220 / 14 = 55 -> 55 y 4

-- Otra solucion
--  i=1 hasta n haciendo por cada mod n (i+1) sea rta 0.  
-- n = 6
-- mod 6 1 -> : 1 -> mod 6 2 -> : 2 [1] -> mod 6 : 3 -> 3 :  [1, 2] -> mod 6 4 != 0 -> 

encontrarDivisor :: Integer -> Integer -> [Integer]
encontrarDivisor n d 
  | d >= n = []
  | mod n d == 0 = d : encontrarDivisor n (d + 1)
  | otherwise = encontrarDivisor n (d + 1)

divisoresPropios :: Integer -> [Integer]
divisoresPropios n = encontrarDivisor n 1


-- Son amigos
-- n = 220 p = 284 
-- n -> divisores -> sumar divisores -> n es igual a la suma de los divisores? 
-- p -> divisores -> sumar divisores -> p es igual a la suma de los divisores?
-- n && p si cumplen las dos condiciones -> True
-- otherwise = False

sonAmigos :: Integer -> Integer -> Bool
sonAmigos n p | p == sumarDivisores ((divisoresPropios n)) && n == sumarDivisores ((divisoresPropios p)) = True
              | otherwise = False


-- [1, 2, 3]
-- 1 + [2, 3]
-- 1 + 2 + [3]
-- 1 + 2 + 3 = 6
sumarDivisores :: [Integer] -> Integer
sumarDivisores [] = 0
sumarDivisores (x: xs) = x + sumarDivisores xs 



-- 28


-- n = 2 xs = [1, 2, 3]
-- []
losPrimerosN :: Integer -> Integer -> [Integer] -> [Integer]
losPrimerosN n p [] = []
losPrimerosN n p (x:xs) 
  | p > n = [] 
  | otherwise = x : losPrimerosN n (p + 1) xs