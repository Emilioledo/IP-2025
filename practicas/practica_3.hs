-- f :: Integer -> Integer
-- f 1 = 8
-- f 4 = 131
-- f 16 = 16

-- b) problema g(x: Z): Z {
--     require: {x = 8 ||  x = 16 || x = 131}
--     asegura: {(x = 8 -> result = 16) || (x = 16 -> result = 4) || (x = 131 -> result = 1)}
-- }

-- g :: Integer -> Integer
-- g 8 = 16
-- g 16 = 4
-- g 131 = 1

-- 2. a) problema absoluto(x: Z): Z {
--     require: {True}
--     asegura: {result = x}
-- }
absoluto :: Integer -> Integer
absoluto x | x >= 0 = x
           | x < 0 = -x

-- b) problema maximoAbsoluto(x: Z, y: Z): Z {
--     require: {True}
--     asegura: {result = (x > y) = x || (y > y) = y}
-- }

maximoAbsoluto ::  Integer -> Integer -> Integer
maximoAbsoluto x y | x > y = absoluto(x)
                   | y > x = absoluto(y)


-- c) problema maximo3(x: Z, y: Z, p: Z): Z {
--     requiere: {True}
--     asegura: {result = (x > y) = x || (y > y) = y || ()}
-- }

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z | x >= y && x >= z = x
              | y >= x && y >= z = y
              | z >= x && z >= y = z


--d)
algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y | x == 0 || y == 0 = True
              | otherwise = False

--d) pattern
-- algunoEs0 :: Float -> Float -> Bool
-- algunoEs0 (0, _) = True
-- algunoEs0 (_, 0) = True
-- algunoEs0 (x, y) = False

--e) problema ambosSon0(x: Z, y: Z): Boolean {
--     requiere: {True}
--     asegura: {que el resultado es un Boolean si y solo si x e y != 0}
-- }
-- ambosSon0 :: Float -> Float -> Bool
-- ambosSon0 x y | x == 0 && y == 0 = True
--               | otherwise = False

--e) patter matching
ambosSon0 :: Float -> Float -> Bool
ambosSon0 0 0 = True
ambosSon0 _ _ = False

--f) problema enMismoIntervalo (x: R, y: R) : Boolean {
--     requiere: {True}
--     asegura: {Devuelve un Boolean si x e y pertenecen al conjunto (-infinito, 3], (3, 7] y (7, infinito)}
-- }

enMismoIntervalo :: Float -> Float -> Bool
enMismoIntervalo _ _ = True

-- g) problema sumaDistintos (x: Z, y: Z, q: Z) : Z {
--     requiere: {True}
--     asegura: {Devuelve la suma de todos los numeros x, y, z siempre y cuando ninguno de los parametros se repita. En ese caso, se suma los que son distintos. }
-- }

-- x es distinto a Z
-- x es distinto a q
-- z es distinto a q

sumaDistintos :: Integer -> Integer -> Integer -> Integer  
sumaDistintos x z q | x /= z && x /= q && z /= q  = x + z + q


-- h) problema esMultiploDe(x: N, y: N): Bool {
--     requiere: {x && y > 0}
--     asegura: {Devuelve un Bool que asegura si x es multiplo de y}
-- }

esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y | mod x y == 0 = True
                 | otherwise = False


-- Ejercicio 4
-- a)
productInterno :: (Float, Float) -> Float
productInterno (x, y) = x * y

-- b) esParMenor
esParMenor :: (Float, Float) -> (Float, Float) -> Bool
esParMenor (a, b) (x, y) | a < x && b < y = True
                         | otherwise = False

--d) sumaTerna
sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (a, b, c)  = a + b + c

--e) sumarSoloMultiplos
-- sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer

--f) posPrimerPar
posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (n1, n2, n3) | mod n1 2 == 0 = n1
                          | mod n2 2 == 0 = n2
                          | mod n3 2 == 0 = n3
                          | otherwise = 4

--g) crearPar
crearPar :: a -> b -> (a, b)
crearPar a b = (a, b)

--h) invertir
invertir :: (a, b) -> (b, a)
invertir (a, b) = (b, a)


-- Ejercicio 5
todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (n1, n2, n3) | (f n1 > g n1) && (f n2 > g n2 ) && (f n3 > g n3) = True
                          | otherwise = False


f :: Integer -> Integer
f n | n <= 7 = n * n
    | otherwise = 2*n - 1

g :: Integer -> Integer
g n | mod n 2 == 0 = n `div` 2
    | otherwise = 3*n + 1


-- Ejercicio 6
bisiesto :: Integer -> Bool
bisiesto n | mod n 4 /= 0 || (mod n 100 == 0 && mod n 400 /= 0) = False
           | otherwise = True

-- Ejercicio 7
distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (x1, y1, z1) (x2, y2, z2) = abs (x1 - x2) + abs (y1 - y2) + abs (z1 - z2)


