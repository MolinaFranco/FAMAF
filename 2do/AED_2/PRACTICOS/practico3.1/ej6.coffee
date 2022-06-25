n piezas de panaderia 
Cada pieza i tiene tiempo minimo de coccion ti 
y un tiempo maximo admisible de coccion Ti

abrir el horno no insume tiempo
ti ≤ Ti

¿que criterio utilizaria un algoritmo voraz para extraer todas las piezas del horno en perfecto
estado (ni crudas ni quemadas), abriendo el horno el menor numero de veces posible?


fun (t: List of int, T: List of int)ret R: List of int

    ct: List of int
    cT: list of int
    moment: int

    R := empty_list()
    ct:= copy_list(t)
    cT:= copy_list(T)

    ordenarbyT(ct,cT)

    while(!is_empty(ct))do
        moment := head(cT)-1        
        while(head(ct)<=moment)do
            tail(ct)
            tail(cT)
        do
        addr(R,moment)
    od
endfun