-- Ejercicio 18

-- a) entre0y9 : Int → Bool, que dado un entero devuelve True si el entero se encuentra entre 0 y 9.
entre0y9 :: Int -> Bool
entre0y9 numero | (numero > 0) && (numero < 9) = True
                | otherwise = False

-- b) rangoPrecio : Int → String, que dado un n´umero que representa el precio de una computadora,
-- retorne “muy barato” si el precio es menor a 2000, “demasiado caro” si el precio es mayor que 5000,
-- “hay que verlo bien” si el precio est´a entre 2000 y 5000, y “esto no puede ser!” si el precio es negativo
rangoPrecio :: Int -> String
rangoPrecio precio  | precio < 0 = "Esto no puede ser!"
                    | precio < 2000 = "Muy barato"
                    | (precio > 2000) && (precio < 5000) = "Hay que verlo bien"
                    | precio > 5000 = "Demasiado caro"

-- c) absoluto : Int → Int, que dado un entero retorne su valor absoluto
absoluto :: Int -> Int 
absoluto numero = abs numero

-- d) esMultiplo2 : Int → Bool, que dado un entero n devuelve True si n es m´ultiplo de 2.
esMultiplo2 :: Int -> Bool
esMultiplo2 n   | (mod n 2) == 0 = True
                | otherwise = False

-- Ejercicio 19: Definir la funci´on esMultiploDe : Num→ Num→ Bool, que devuelve True si el segundo es m´ultiplo del
-- primero. Ejemplo: esMultiploDe 3 12 = True.
esMultiploDe :: Int -> Int -> Bool
esMultiploDe a b | (mod a b) == 0 = True
                | otherwise = False

-- Ejercicio 25

-- a)segundo3 : (Num, Num, Num) → Num, que dada una terna de enteros devuelve su segundo elemento.
segundo :: (Int, Int, Int) -> Int
segundo (a, b, c) = b

-- (b) ordena : (Num, Num) → (Num, Num), que dados dos enteros los ordena de menor a mayor.
ordena :: (Int, Int) -> (Int, Int)
ordena (a, b)   | a >= b = (a, b)  
                | otherwise = (b,a)

-- (c) rangoPrecioParametrizado : Num → (Num, Num) → String que dado un numero x, que representa
-- el precio de un producto, y un par (menor, mayor) que represente el rango de precios que uno espera
-- encontrar, retorne “muy barato” si x est´a por debajo del rango, “demasiado caro” si est´a por arriba
-- del rango, “hay que verlo bien” si el precio est´a en el rango, y “esto no puede ser!” si x es negativo.

rangoPrecioParametrizado :: Int -> (Int, Int) -> [Char]
rangoPrecioParametrizado x (menor, mayor)   | x < 0 = "Esto no puede ser!"
                                            | x > mayor = "Demasiado caro"
                                            | (x >= menor) && (x <= mayor) = "Hay que verlo bien"
                                            | x < menor = "Muy barato"
 




-- (d) mayor3 : (Num, Num, Num) → (Bool, Bool, Bool), que dada una una terna de enteros devuelve una
-- terna de valores booleanos que indica si cada uno de los enteros es mayor que 3.
-- Por ejemplo: mayor3.(1, 4, 3) = (False, True, False) y mayor3.(5, 1984, 6) = (True, True, True)




-- (e) todosIguales : (Num, Num, Num) → Bool que dada una terna de enteros devuelva True si todos sus
-- elementos son iguales y False en caso contrario.
-- Por ejemplo: todosIguales.(1, 4, 3) = False y todosIguales.(1, 1, 1) = True