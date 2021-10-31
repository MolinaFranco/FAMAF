-- Agregué deriving Show para poder probar las funciones 

-- 1. 2.

data Carrera = Matematica|Fisica|Computacion|Astronomia deriving (Eq, Ord, Show)

titulo :: Carrera -> String
titulo Matematica = "Lic. en Matematica"
titulo Fisica = "Lic. en Fisica"
titulo Computacion = "Lic. en Ciencias de la Computacion"
titulo Astronomia = "Lic. en Astronomia"

-- 3.

-- a)

type Ingreso = Int

data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar deriving Show

data Area = Administrativa | Ensenanza | Economica | Postgrado deriving Show

data Persona = Decano | Docente Cargo | NoDocente Area | Estudiante Carrera Ingreso deriving Show

-- b)

-- Docente :: Cargo -> Persona

-- c)

valueC :: Cargo -> String
valueC Titular = "Titular"
valueC Asociado = "Asociado"
valueC Adjunto = "Adjunto"
valueC Asistente = "Asistente"
valueC Auxiliar = "Auxiliar"

cuantosDoc :: [Persona] -> Cargo -> Int
cuantosDoc [] y = 0
cuantosDoc ((Docente c):xs) y   | valueC c == valueC y = 1 + cuantosDoc xs y
                                | otherwise  = cuantosDoc xs y
cuantosDoc (x:xs) y = cuantosDoc xs y

-- d)

esCargo :: Cargo -> Persona -> Bool 
esCargo y (Docente c) = valueC y == valueC c
esCargo _ _ = False

cuantosDoc' :: [Persona] -> Cargo -> Int
cuantosDoc' xs y = length (filter (esCargo y) xs)

-- 4.

-- data  Maybe a = Nothing | Just a

-- a) 

primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

-- 5.

data Cola = VaciaC | Encolada  Persona  Cola deriving Show

-- a)

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada persona cola) = Just cola

encolar :: Persona -> Cola -> Cola         ---------
encolar persona VaciaC = Encolada persona VaciaC
encolar persona (Encolada persona2 cola) = Encolada persona2 (encolar persona cola)

busca :: Cola -> Cargo -> Maybe Persona
busca VaciaC _ = Nothing
busca (Encolada persona cola) cargo | (esCargo cargo persona) = Just persona
                                    | otherwise = busca cola cargo

-- b)  cola se parece a el tipo lista de Personas que tiene una persona destras de otra y la lista vacia es VaciaV.

type Cola' = [Persona]

-- 6.

data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b ) deriving Show
type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String

-- a)

type GuiaTelefonica = ListaAsoc String Int

-- b)

la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo a b la) = 1 + la_long la 


la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia Vacia = Vacia
la_concat Vacia (Nodo a b la) = Nodo a b (la_concat Vacia la)
la_concat (Nodo a b la) x = Nodo a b (la_concat la x)


la_pares :: ListaAsoc a b -> [(a,b)]
la_pares Vacia = []
la_pares (Nodo a b la) = (a,b) : la_pares la


la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b 
la_busca Vacia _ = Nothing
la_busca (Nodo a b la) x | a==x = Just b
                        | otherwise = la_busca la x


la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia = Vacia
la_borrar x (Nodo a b la)| x == a = la_borrar x la
                        | otherwise =  Nodo a b (la_borrar x la)

-- para testear 
test = Nodo 1 2 (Nodo 3 4 (Nodo 5 6 (Nodo 7 8 ( Nodo 9 0(Vacia)))))

-- 7.

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving Show

testA = Rama (Rama (Hoja) 1 (Hoja)) 2 (Rama (Hoja) 3 (Rama (Hoja) 4 (Hoja) ) )

-- a)

a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama a1 x a2) = 1 + a_long a1 + a_long a2

-- b)

a_hojas :: Arbol a -> Int
a_hojas Hoja = 1
a_hojas (Rama a1 _ a2) = a_hojas a1 + a_hojas a2

-- c)

a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama a1 x a2) = Rama (a_inc a1) (x+1) (a_inc a2)

-- d)

a_map :: (a -> b) -> Arbol a -> Arbol b
a_map _ Hoja = Hoja
a_map f (Rama a1 x a2) = Rama (a_map f a1) (f x) (a_map f a2)

