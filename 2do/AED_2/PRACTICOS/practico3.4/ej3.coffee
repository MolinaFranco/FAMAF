
fun cambioA(mon: array[0..n], P: int)ret C: int

    M: array[0..P, 0..n] of int
    calc : int

    for i:=0 to n do
        M[i,0] = 0
    od

    for i:=0 to n do
        for j:= 0 to P do
            calc := ♾️
            for e:=1 to i do
                if(mon[e]<=j)then
                    calc := min(calc, M[i,j-mon[i]])
                fi
            od
            M[i,j] := 1 + calc
        od
    od 

    C = M[P,n]
endfun

fun cambioA(mon: array[1..n], P: int)ret C: int

    M: array[0..n, 0..P] of int
    calc : int

    for i:=0 to n do
        M[i,0] = 0
    od

    for i:=n down to 0 do
        for j:=0 down to P do

            if(i=n and j>0)then
                M[i,j] := ♾️
            else if (mon[i]>j>0 and i<n)then
                M[i,j] := M[i+1,j]
            else
                M[i,j] := min(M[i+1,j] , 1+M[i,j-mon[i]])
            fi

        od
    od 

    C = M[P,n]
endfun