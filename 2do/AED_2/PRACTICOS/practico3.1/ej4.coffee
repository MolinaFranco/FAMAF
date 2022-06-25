n ballenas varadas
tiempos s1...sn #hasta q se mueren
llevar toma tiempo constante t,

unico equipo de rescate 
una ballena no muere mientras esta siendo regresada mar adentro.

type ballena tuple
                indice : int,
                tiempo : int
            end tuple


fun salva_ballenas(B: List of ballena, T: int) ret R: List of int

    var b_aux : List of ballena
    var m : int
    var reloj : int

    t_aux := copy_list(T)
    reloj := 0

    ordenarbytiempo(T) #funcion que ordena de mayor a menor

    while(!is_empty(b_aux))do

        m = head(b_aux)
        if(m.tiempo <= reloj)then
            reloj += T
            addr(R, m.indice)
        fi
        tail(b_aux)

    od