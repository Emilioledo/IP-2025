-- Mapeo (Char, Char)
-- (Original, sustitur)
-- c = n && xs = [(a, b), (c, a)]
-- c ->  (a, b) -> c != a -> hayQueCodificar c [(c, a)]
-- c -> (c, a) -> c == c -> True

-- Ejercicio 1 (2 puntos)

--problema hayQueCodificar (c: Char, mapeo: seq⟨Char x Char⟩ ) : Bool {
--  requiere: {No hay elementos repetidos entre las primeras componentes de mapeo}
--  requiere: {No hay elementos repetidos entre las segundas componentes de mapeo}
--  asegura: {res = true <=> c es igual a la primera componente de alguna tupla de mapeo}
-- }

type Mapeo = [(Char, Char)]


hayQueCodificar :: Char -> Mapeo -> Bool
hayQueCodificar _ [] = False
hayQueCodificar c ((x, s): xs) | c == x = True
                               | otherwise = hayQueCodificar c xs

-- Ejercicio 2 (2 puntos)

-- problema cuantasVecesHayQueCodificar (c: Char, frase: seq⟨Char⟩, mapeo: seq⟨Char x Char⟩ ) : Z {
--  requiere: {No hay elementos repetidos entre las primeras componentes de mapeo}
--  requiere: {No hay elementos repetidos entre las segundas componentes de mapeo}
--  requiere: {|frase| > 0 }
--  requiere: {c pertenece a frase}
--  asegura: {(res = 0 y hayQueCodificar (c, mapeo) = false) o (res = cantidad de veces que c aparece en frase y hayQueCodificar (c, mapeo) = true)}
-- }

-- c = c -> frase = ['b', 'c', 'c'] -> mapeo = [('c','k'),('d','b')]
-- si hayQueCodificar == False -> 0
-- si hayQueCodificar == True 
-- 'b' != c entonces cuantasVecesHayQueCodificar c frase mapeo
-- 'c' == c entonces + 1



cuantasVecesHayQueCodificar :: Char -> [Char] -> Mapeo -> Integer
cuantasVecesHayQueCodificar _ [] mapeo = 0
cuantasVecesHayQueCodificar c (pElemFrase: frase) mapeo  | hayQueCodificar c mapeo == False = 0
                                                         | hayQueCodificar c mapeo == True && pElemFrase == c = 1 + cuantasVecesHayQueCodificar c frase mapeo 
                                                         | otherwise = 0 + cuantasVecesHayQueCodificar c frase mapeo

-- Ejercicio 3 (2 puntos)

-- problema laQueMasHayQueCodificar (frase: seq⟨Char⟩, mapeo: seq⟨Char x Char⟩ ) : Char {
--  requiere: {No hay elementos repetidos entre las primeras componentes de mapeo}
--  requiere: {No hay elementos repetidos entre las segundas componentes de mapeo}
--  requiere: {|frase| > 0 }
--  requiere: {Existe al menos un c que pertenece a frase y hayQueCodificar(c, mapeo)=true}
--  asegura: {res = c donde c es el caracter tal que cuantasVecesHayQueCodificar(c, frase, mapeo) es mayor a cualquier otro caracter perteneciente a frase}
--  asegura: {Si existen más de un caracter c que cumple la condición anterior, devuelve el que aparece primero en frase }



-- Ejercicio 4 (3 puntos)

--problema codificarFrase (frase: seq⟨Char⟩, mapeo: seq⟨Char x Char⟩ ) : seq ⟨Char⟩ {
--  requiere: {No hay elementos repetidos entre las primeras componentes de mapeo}
--  requiere: {No hay elementos repetidos entre las segundas componentes de mapeo}
--  requiere: {|frase| > 0 }
--  asegura: {|res| = | frase|}
--  asegura: { Para todo 0 <= i < |frase| si hayQueCodificar(frase[i], mapeo) = true entonces res[i]= (mapeo[j])1, para un j tal que 0 <= j < |mapeo| y mapeo[j])0=frase[i]}
--  asegura: { Para todo 0 <= i < |frase| si hayQueCodificar(frase[i], mapeo) = false entonces res[i]= frase[i]}
-- } 

