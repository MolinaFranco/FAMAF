-- Molina Franco 44192153

-- Ejercicio 1

data Deporte = Futbol | Basket | Tenis | Valorant | Dota2 deriving Show
type MinJugadores = Int

minimaCantidad :: Deporte -> MinJugadores
minimaCantidad Futbol = 20
minimaCantidad Basket = 15
minimaCantidad Tenis = 2
minimaCantidad Valorant = 10
minimaCantidad Dota2 = 8

-- Ejemplo

ej = Futbol
-- minimaCantidad ej
-- 20

-- Ejercicio 2

type NombrePersona = String

data PracticoDeporte = Ninguna | AgregarDeporte Deporte NombrePersona PracticoDeporte

-- Auxiliar

valDep :: Deporte -> String 
valDep Futbol = "Futbol"
valDep Basket = "Basket"
valDep Tenis = "Tenis"
valDep Valorant = "Valorant"
valDep Dota2 = "Dota2"

deporte :: PracticoDeporte -> Deporte -> NombrePersona -> Bool
deporte Ninguna _ _ = False
deporte (AgregarDeporte d n p) d2 n2 | (valDep d == valDep d2) && (n == n2) = True
                                     | otherwise = deporte p d2 n2

ej2 = AgregarDeporte Basket "Franco" (AgregarDeporte Futbol "Federico" ((AgregarDeporte Dota2 "Alejo" (Ninguna))))

-- Ejemplo
-- deporte ej2 Basket "Franco"
-- True

-- Ejercicio 3

type EquipoFavorito = String

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving Show

agregarEquipoFavorito :: ListaAsoc Deporte EquipoFavorito -> Deporte ->EquipoFavorito -> ListaAsoc Deporte EquipoFavorito
agregarEquipoFavorito Vacia depnew eqnew = Nodo depnew eqnew (Vacia)
agregarEquipoFavorito li depnew eqnew = Nodo depnew eqnew li

ej3 = Nodo Futbol "Boca" (Nodo Basket "Lakers" (Vacia))

-- Ejemplo
-- agregarEquipoFavorito ej3 Dota2 "Fade"
-- Nodo Dota2 "Fade" (Nodo Futbol "Boca" (Nodo Basket "Lakers" (Vacia)))

-- Ejercicio 4

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving (Show)

aCuantos :: Arbol Int -> Int -> Int
aCuantos Hoja _ = 0
aCuantos (Rama (a1) x (a2)) n | x < n = 1 + (aCuantos a1 n) + (aCuantos a2 n)
                              | otherwise = (aCuantos a1 n) + (aCuantos a2 n)

ej4 :: Arbol Int
ej4 = Rama (Rama (Hoja) 3 (Hoja)) 1 (Rama (Hoja) 5 (Hoja))

-- Ejemplo 
-- aCuantos ej4 4
-- 2