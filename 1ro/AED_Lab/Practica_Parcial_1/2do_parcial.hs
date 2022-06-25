data Moneda = Uno | Dos | Cinco | Diez deriving (Show)
type Cantidad = Int

titulo :: Moneda -> String
titulo Uno = "un peso"
titulo Dos = "dos pesos"
titulo Cinco = "cinco pesos"
titulo Diez = "diez pesos"

data ContadoraMonedas = Agregar Moneda ContadoraMonedas | SinPlata

entregar_monedas :: ContadoraMonedas -> Moneda -> [Moneda]
entregar_monedas SinPlata m = []
entregar_monedas (Agregar x cm) m | titulo x == titulo m  = x : entregar_monedas cm m 
                                  | otherwise = entregar_monedas cm m

data ContadoraMonedas2 = Agregar2 Moneda Cantidad ContadoraMonedas2 | SinPlata2

mas_de_cinco :: ContadoraMonedas2 -> [Moneda]
mas_de_cinco SinPlata2 = []
mas_de_cinco (Agregar2 mon cant cm) | cant>=5 = mon : mas_de_cinco cm
                                    | otherwise = mas_de_cinco cm

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving Show

a_min :: Ord a => Arbol a -> a
a_min (Rama Hoja x Hoja) = x
a_min (Rama Hoja x a2) = min x (a_min a2)
a_min (Rama a1 x Hoja) = min x (a_min a1)
a_min (Rama a1 x a2) = min x ( min (a_min a1) (a_min a2) )

-- tema B

data Medalla = Bronce | Plata | Oro deriving (Show, Eq, Ord)
type Medallero = [Medalla]

value :: Medalla -> Int
value Bronce = 1
value Plata = 2
value Oro = 4

data Disciplina = Boxeo | Judo | Vela | Jokey | Tenis deriving Eq
data Resultado = Res Disciplina Medalla

medallero_vela :: [Resultado] -> Medallero
medallero_vela [] = []
medallero_vela ((Res dis med) : xs) | dis == Vela = med : medallero_vela xs
                                | otherwise = medallero_vela xs


data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b ) deriving Show

la_existe :: LisaAsoc a b -> a -> Bool

arbol_busca :: Arbol (Int,String) -> Int -> Maybe String
arbol_busca Hoja _ = Nothing
arbol_busca (Rama (a1) (x,s) (a2)) k | x == k = Just s 
                                     | otherwise = case arbol_busca a1 k of
                                            Nothing -> arbol_busca a2 k
                                            r -> r

