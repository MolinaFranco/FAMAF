-- 1.

data Carrera = Matematica|Fisica|Computacion|Astronomia deriving Eq

titulo :: Carrera -> String
titulo Matematica = "Lic. en Matematica"
titulo Fisica = "Lic. en Fisica"
titulo Computacion = "Lic. en Ciencias de la Computacion"
titulo Astronomia = "Lic. en Astronomia"

-- 2.

-- data Carrera = Matematica|Fisica|Computacion|Astronomia deriving Ord

-- 3.

-- a)

type Ingreso = Int

data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar deriving Eq

data Area = Administrativa | Ensenanza | Economica | Postgrado deriving Eq

data Persona = Decano
    | Docente Cargo
    | NoDocente Area
    | Estudiante Carrera Ingreso
    deriving Eq

-- b)

-- Docente :: Cargo -> Persona

-- c)

cuantosDoc :: [Persona] -> Cargo -> Int
cuantosDoc [] y = 0
cuantosDoc ((Docente c):xs) y   | c == y = 1 + cuantosDoc xs y
                                | otherwise  = cuantosDoc xs y
cuantosDoc (x:xs) y = cuantosDoc xs y

-- d)
esCargo :: Cargo -> Persona -> Bool 
esCargo y (Docente c) = y == c
esCargo _ _ = False

cuantosDoc' :: [Persona] -> Cargo -> Int
--cuantosDoc' xs y = length (filter((== Docente y) xs))
cuantosDoc' xs y = length (filter((esCargo y) xs) 

