
j = monto de plata
i = moneda que estoy probando
q = cantidad de monedas de el valor que estoy probando

cambio(i, j) =  |0                                      (j = 0)
                |∞                                      (j > 0 ∧ i = 0)
                |min(q + cambio(i-1, j-(q*di)))         (j > 0 ∧ i > 0)

                    q∈{0,1,...,j÷di}


fun cambio(mon: Array[1..n] of int, P: int)ret C:int

    M : Array[0..n, 0..P] of int

    for i:=1 to n do
        M[1,i] = ♾️
    od
    for i:=0 to n do
        M[i,0] = 0
    od

    for i:=1 to n do
        for j:=1 to P do
            calc := ♾️
            for q:=0 to j÷mon[i] do
                calc = min( calc , q+M[i-1, j-(q*mon[i])] )
            od
            M[i,j] := calc
        od
    od

    C := M[n,P]

endfun






fun nocambio(mon: Array[1..n] of int, P: int)ret C:int

    M : Array[0..n, 0..P] of int

    for i:=1 to n do
        M[1,i] = ♾️
    od
    for i:=0 to n do
        M[i,0] = 0
    od

    for i:=1 to n do
        for j:=1 to n do
            if(mon[i]>P)then
                M[i,j] = M[i-1,j]
            else
                M[i,j] = min( M[i-1,j] , 1+M[i,j-mon[i]] )
        od
    od

    C := M[n,P]

endfun


