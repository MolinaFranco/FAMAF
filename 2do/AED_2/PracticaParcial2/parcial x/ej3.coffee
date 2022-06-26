(Programación Dinámica) Implementá un algoritmo que utilice Programación Dinámica 
para resolver el problema del inciso anterior.

medidas n
        i {1..n}
mejora  m[i] > 0
daño    d[i] > 0
puntaje = m[i]/d[i]

medidas(c,k,i) =    | 0                                                                 ((k=0 or c=0) and 1<=i<=n)          1     
                    | -♾️                                                               ((i=0 and k>0 and c>0)              2
                    |
                    | max(medidas(c-d[i], k-1, i-1)+m[i]/d[i] , medidas(c, k, i-1))     (k>0 and c>=d[i] and 1<=i<=n)       3 
                    | medidas(c, k, i-1)                                                (k>0 and c<d[i]  and 1<=i<=n)


                                                        <>

fun medidas(M: array[1..n]Nat, D: array[1..n]Nat, N:Nat) ret puntaje : Nat


    m : array[0..n] of Nat

    m[0] := 0

    for i:=1 to n do
        m[i] := max(    m[i]/d[i])


    
    for i:=0 to n do
