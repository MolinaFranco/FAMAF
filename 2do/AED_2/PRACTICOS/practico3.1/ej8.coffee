n troncos de distintas clases de madera
en la estufaentra  solo  uno  por  vez
troncoies  capaz  de  irradiar  una  temperatura ki
cantidadtide minutos encendido

menor  cantidad  posible  de  troncos  a  quemar  entre  las  22  y  las  12  hs 
22 y las 6 la estufa irradie constantemente una temperatura no menor a K1
6 y las 12 am, una temperatura no menor a K2.

22*60

type tronco = tuple
                ind = int
                temp = int
                min = int
              endtuple

{P: asumo que los troncos estar odenados por mayor duracion y ademas tengo troncos como para pasar la noche}

fun estufaVoraz(T: List of tronco, K1: int, K2: int) ret R: list of tronco 
    
    t_aux : List of tronco
    t_sobras : List of tronco
    reloj : int
    k : int

    t_aux := copy_list(t)
    t_sobras := empty_list(t)
    reloj := 0
    k := K1

    while(reloj!=((8+6)*60) and !is_empty_list(t_aux))do

        if(reloj > (8*60))then
            t_aux := concat(t_sobras, t_aux)
            k = K2
        fi

        while(head(t_aux).tmp < k)do
            addr(t_sobras)
            tail(t_aux)
        od


        addr(R, head(t_aux))
        reloj += head(t_aux).min
        tail(t_aux)

    od
endfun