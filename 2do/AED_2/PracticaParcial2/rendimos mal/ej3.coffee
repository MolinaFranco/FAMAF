3)

okey

fun gunstonacci(in n: nat) ret r: nat
    var M : array[0..n,0..n] of nat

    M[0,0]:=1

    if(n>=1)then

        M[0,1]:=1
        M[1,0]:=1

        for j:=2 to n do
            M[0,j]:= M[0,j-2] + M[0,j-1] 
        od

        for i:=2 to n do
            M[i,0]:= M[i-2,0] + M[i-1,0] 
        od

        for i:=1 to n do
            for j:=1 to n do
                M[i,j]:=M[i,j-1] + M[i-1,j]
            od
        od


fun volumen_de_mi_casa(in metros:int)
    ret 2

B)

las dimensines de la tabla son de nxn ya que el valor que me interesa es el valor de la posicion M[n,n]
y todos los anteriores son auxiliares que ayudan a calcular dicho numero

yo completo primero la fila y la columna de 0 y luego voy de izquierda a derecha cada fila

retorna el valor de la posicino M[n,n]

