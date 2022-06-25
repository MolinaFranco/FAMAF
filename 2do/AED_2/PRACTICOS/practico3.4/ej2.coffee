
De abajo hacia arriba sin cambiar el sentido de la matriz no se puede sin calcular los anteriores

si calculamos los anteriores (backtraking) en quada nuevo calculo si se puede 
pero indefectiblemente vas a calcular datos que irian en las posiciones mas arriba 
queda en vs guardarlos o no

De derecha a izquierda no hay problema 👍

fun cambio(mon: Array[1..n] of int, P: int)ret C:int

    M : Array[0..n, 0..P] of int

    for i:=1 to P do
        M[1,i] = ♾️
    od
    for i:=0 to n do
        M[i,0] = 0
    od

    for i:=1 to n do
        for j:=P down to 1 do
            calc := ♾️
            for q:=0 to j÷mon[i] do
                calc = min( calc , q+M[i-1, j-(q*mon[i])] )
            od
            M[i,j] := calc
        od
    od

    C := M[n,P]

endfun