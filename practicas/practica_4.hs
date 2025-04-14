-- 1)
fibonacci :: Integer -> Integer
fibonacci x | x == 0 = 0
            | x == 1 = 1
            | otherwise = fibonacci (x-1) + fibonacci (x-2)

--2)
-- parteEntera :: Float -> Integer
-- parteEntera x | 

--3)
esDivisible :: Integer -> Integer -> Bool
esDivisible x y | x == 1 = False
                | x == 0 = True
                | otherwise = esDivisible (x - y) y

--4)
-- sumaImpares :: Integer -> Integer 

--5)
medioFact :: Integer -> Integer
medioFact x | x <= 2 = x
            | otherwise = x * medioFact (x - 2)

--6)
todosDigitosIguales :: Integer -> Bool
-- 10 false
-- 11 true
todosDigitosIguales x | x <= 9 = True