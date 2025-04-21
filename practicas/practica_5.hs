-- 1) 
-- [1, 2, 3] 
-- 1 + [2, 3]
-- 1 + 1 + [3]
-- 1 + 1 + 1 + []

longitud :: [t] -> Integer
longitud [] = 0
longitud (_:xs) = 1 + longitud xs


-- ultimo :: [t] -> t


-- [1, 2, 3]
-- 1 

reverso :: [t] -> [t]
reverso [] = []
reverso xs =  reverso (tail xs) ++ (head xs : [])

-- 2)
-- 1 | [2, 1, 3]
-- 1 == head [2, 1, 3] ? = False
-- 1 == head [1, 3] ? = True


-- pertenece :: Eq t => t -> [t] -> Bool
-- pertenece _ [] = False
-- pertenece n (x: xs) | n == x = True
--                     | otherwise = pertenece (tail xs)


-- [1, 1, 1, 1]
-- 1, 1, [1, 1]
-- 1 == 1 = todosIguales (1:1)


todosIguales :: Eq t => [t] -> Bool
todosIguales [] = True
todosIguales [_] = True
todosIguales (x: y: xs) | x == y = todosIguales (y: xs)
                        | otherwise = False


-- []
hayRepetidos :: Eq t => [t] -> Bool
hayRepetidos [] = False
hayRepetidos [_] = False
hayRepetidos (x: y: xs) 
                | x /= y = hayRepetidos (y: xs)
                | otherwise = True


-- n = 1 xs = [2, 1, 2]
-- n == head xs |-> 1 == 2 |-> [1, 2]  
-- n == head xs |-> 1 = 1  |-> [2, 2]
quitar :: Eq t => t -> [t] -> [t]
quitar _ [] = []
quitar n (x: xs) | n == x = xs
                 | otherwise = x : quitar n xs

quitarTodos :: Eq t => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n (x: xs) | n == x = quitarTodos n xs
                      | otherwise = x : quitarTodos n xs
                

-- 3)
-- [1, 2, 3]
-- 1 + [2, 3] 
-- 1 + 2 + [3] 
-- 1 + 2 + 3 = 6

sumatoria :: [Integer] -> Integer
sumatoria xs | xs == [] = 0
             | otherwise = head xs + sumatoria (tail xs)


-- [1, 2, 3]
-- 1 * [2, 3]
-- 1 * 2 [3]
-- 1 * 2 * 3 [] == 6
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs


-- maximo :: [Integer] -> Integer
-- maximo [] = 0
-- maximo (x: xs) = x >= maximo xs


-- n = 1 xs = [1, 2, 3]
-- n + head xs == 1 + 1 == 2 : [2, 3]


sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (x: xs) = n + x : sumarN n xs


sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero xs@(x:_) = sumarN x xs



-- [2, 3, 5, 2]
-- head xs == 2 == es par? == 2 : [3, 5, 2]
-- head xs == 3 == es par? ! == 2: [5, 2]
pares :: [Integer] -> [Integer]
pares [] = []
pares (x: xs) | mod x 2 == 0 = x : pares xs
              | otherwise = pares xs


-- 2 []
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs)
  | mod x n == 0 = x : multiplosDeN n xs
  | otherwise    = multiplosDeN n xs
 

-- 4)
-- ["a", "", "", "a"]
-- x = "a" == "" = "a" == ""
-- sacarBlancosRepetidos :: [Char] -> [Char]
-- sacarBlancosRepetidos [] = []
-- sacarBlancosRepetidos (x: y: xs) | x == "" && y == "" = xs 
--                                  | otherwise = sacarBlancosRepetidos xs

