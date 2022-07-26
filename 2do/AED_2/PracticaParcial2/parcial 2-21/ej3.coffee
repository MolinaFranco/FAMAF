(Programación Dinámica) Implementá un algoritmo que utilice Programación Dinámica 
para resolver el problema del inciso anterior.

medidas n
        i {1..n}
mejora  m[i] > 0
daño    d[i] > 0
puntaje = m[i]/d[i]
                                                                                                                            for     
medidas(c,k,i) =    | 0                                                                 ((k=0 or c=0) and 1<=i<=n)          1     
                    | -♾️                                                               ((i=0 and k>0 and c>0)              2
                    |
                    | max(medidas(c-d[i], k-1, i-1)+m[i]/d[i] , medidas(c, k, i-1))     (k>0 and c>=d[i] and 1<=i<=n)       3 
                    | medidas(c, k, i-1)                                                (k>0 and c<d[i]  and 1<=i<=n)


                                                        <>

fun medidas(m: array[1..n]Nat, d: array[1..n]Nat, C:Nat, K:Nat) ret puntaje : Nat

                k   c   i
    M : array[0..n,0..n,0..n] of Nat

    for i:=1 to n do
        m[0,0,i] := 0

    for k:=1 to n do
        for c:=1 to n do
            M[k,c,0] := -♾️
        od
    od

    for k:=1 to n do
        for c:=1 to n do
            for i:=1 to n do

                if(c>=d[i])then
                    M[k,c,i] := max(medidas(c-d[i], k-1, i-1)+m[i]/d[i] , medidas(c, k, i-1))
                else
                    M[k,c,i] := medidas(c, k, i-1)

                fi
    	    od
        od
    od

    puntaje := m[C,K,n]



