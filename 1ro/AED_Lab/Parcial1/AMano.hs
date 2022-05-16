data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving (Show)

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Show)

Eq ==
Ord < > 
Show ()

data Medalla = Bronce | Plata | Oro deriving (Show, Eq, Ord)
type Medallero = [Medalla]

