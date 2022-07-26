n medias diferentes
n =2m

P[1..n,1..n] 
P[i,j] -> parecido ente media i y j
P[i,j] = P[J,i]
P[i,i] = 0

dar algoritmo

mejor forma de aparear n medias en m pares

la suma de los max(P[i,j])

medias(m,yu) =  | 0                                     (m=0)
                |max(m-1,i,j)
                    i,j e {1,n} !e yu | max(P[i,j])
                | -♾️                                   (i>n or j>n)


type par: tuple
            i : nat
            j : nat
            endtuple

fun bestpares(P: array[1..n,1..n]) ret Conjuntos: set of par
    
    cantidad: nat
    cantidad := n/2

    yausadas: set of nat
    yausadas := empty_set()

    mejorpar : par

    while(cantidad!=0)do
        mejorpar := getpar(P, yausadas)
        add( Conjuntos, mejorpar )
        add( yausadas, mejorpar.i )
        add( yausadas, mejorpar.j )
        cantidad--
    od
endfun


{cardinal(yausadas) < n}
fun getpar(P: array[1..n,1..n], yausadas: set of nat) ret Par : par
    mejor : nat
    major := -♾️

    for i:=1 to n do
        for j:=1 to n do
            if ( !member(yausadas, i) and !member(yausadas, j) and P[i,j]>major)then
                Par.i := i
                Par.j := j
                mejor := P[i,j]
            fi
        od
    od
endfun
















