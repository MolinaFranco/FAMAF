n sobrevivientes en su interior
cantidades c1...cn de oxigeno que cada uno per min
rescate de sobrevivientes
se puede realizar de a uno por vez, y cada operacion de rescate lleva t minutos
total C de oxigeno

type pasajero = tuple
                g_ox : int,
                ind : int
                end tuple

fun rescate(P : List of pasajero, C : int, t : int)ret R: List of int

    P_aux: List of pasajero
    C_aux: int
    reloj: int

    P_aux:= copy_list(P)
    C_aux:= C 
    ordenarbyMaxConsumo(P_aux)  #ordena de maximo g_ox a menor

    while(!is_empty(P_aux) and C_aux>=0) do
        addr(R, head(P_aux))

        for i:=0, i<length(P_aux), i++ do                                    >
            C_aux -= (index(P_aux,i).g_ox)*t                   P_aux[i]
        do

        tail(P_aux)
        
    od
endfun


fun rescatePRO(P : List of pasajero, C : int, t : int, m : int)ret R: List of int

    P_aux: List of pasajero
    C_aux: int
    reloj: int
    cant: int

    P_aux:= copy_list(P)
    C_aux:= C 
    cant:= m
    ordenarbyMaxConsumo(P_aux)  #ordena de maximo g_ox a menor

    while(!is_empty(P_aux) and C_aux>=0) do
        
        for i:=0, i<length(P_aux), i++ do                                    >
            C_aux -= (index(P_aux,i).g_ox)*t                   P_aux[i]
        do

        if(cant > length(P_aux))then
            cant:= length(P_aux)
        fi

        for i:=1 to cant do
            addr(R, head(P_aux))
            tail(P_aux)
        do
        
    od
endfun