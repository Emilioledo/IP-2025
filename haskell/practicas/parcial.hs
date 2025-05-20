-- EJERCICIO 3

-- En Haskell se puede representar una matriz utilizando una secuencia de secuencias, es decir, una secuencia donde cada elemento es a su vez una secuencia de igual longitud, representando las filas de la matriz. Por tanto, las columnas están formadas por los elementos en la misma posición de cada una de las filas.

-- Por ejemplo, en la matriz [[1,2],[3,4],[5,6]], la columna 1 está compuesta por los elementos en la posición 0 de cada fila: (1,3,5).

-- Se pide implementar la siguiente función:

-- problema hayColumnaSumaCero (matriz: seq(seq(Z))): Bool {
--   requiere: (Todos los elementos de la secuencia matriz tienen la misma longitud)
--   requiere: |matriz| > 0
--   requiere: |matriz[0]| > 0
--   asegura: res = true <=> existe j tal que 0 ≤ j < |matriz[0]| y la suma de los elementos matriz[i][j] es 0 para todo i con 0 ≤ i < |matriz|
-- }

-- Aclaración: |matriz| es la longitud de la secuencia (representa la cantidad de filas) y |matriz[0]| es la longitud del primer elemento de la secuencia (representa la cantidad de columnas).

-- Ejemplo:

-- hayColumnaSumaCero ([[1,-2,1],[0,-2,1]]) debe devolver True

-- Ya que la columna 1 suma (−2+−2) = −4 y la columna 2 suma (1+1) = 2, y por tanto, existe al menos una columna cuya suma es cero.


hayColumnaSumaCero :: [[Integer]] -> Bool
hayColumnaSumaCero [[1]] = False 
hayColumnaSumaCero (xs: resto) = 


-- EJERCICIO 4
-- problema primerosKNumerosAritmeticos(k: Z): seq(Z) {
--   requiere: {k ≥ 1}
--   asegura: {res es la secuencia de los primeros k números aritméticos}
--   asegura: {|res| = k}
--   asegura: {Para cualquier i en el rango 0 ≤ i < k−1, se cumple que res[i] < res[i+1]}
-- }

-- Aclaración: Un número n se llama aritmético si el promedio de todos sus divisores es un número entero.
-- Por ejemplo, 6 es un número aritmético porque el promedio de todos sus divisores (1+2+3+6)/4 = 3, es un número entero.

-- Ejemplo:

-- primerosKNumerosAritmeticos 10
-- debe devolver [1,3,5,6,7,11,13,14,15,17]


