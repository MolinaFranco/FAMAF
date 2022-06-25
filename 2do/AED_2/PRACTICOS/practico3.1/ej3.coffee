
autonomia A
localidades l0...ln
distancias di ≤ A entre li-1 y li para 1<=i<=n
una estacion en cada localidades

Escribir un algoritmo que compute el menor numero de veces que es necesario cargar combustible para
realizar el viaje, y las localidades donde se realizaria la carga

inicialmente el tanque de combustible se encuentra vacio 


type respuesta = tuple
                    menor_carga : int,
                    localidades_carga : List of string
                endtuple



fun planviaje(A: int, L: List of string, D: List of int) ret R : List of respuesta

    var nafta : int
    var D_aux : List of int
    var L_aux : List of string
    var p : int

    # var autonomia := A 
    var nafta := 0 
    var D_aux : copy_list(D)
    var L_aux : copy_list(L)

    while(!is_empty(D_aux))do
        if(nafta < head(D_aux)) then
            nafta = A
            addr(R.localidades_carga, head(L))
            R.menor_carga ++
        fi
            p++
            nafta -= head(D_aux)
        tail(D_aux)
        tail(L_aux)
    od

    destroy_list(D_aux)
    destroy_list(L_aux)

end fun

            

            

