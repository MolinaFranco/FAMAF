elegir  una  ciudad  entre  K  posibles  que  le  interesan
desea que el viaje de ida hacia la ciudad pueda realizarse con a lo sumo L litrosde nafta.

dado un grafo representado por una matriz E :array[1..n,1..n] of Nat
E[i,j] indica el costo en litros de nafta necesario para ir desde la ciudad i hasta la ciudadj;
conjunto C de vertices entre 1 y n,
v  representando la ciudad de origen del viaje
L indicando la cantidad de litros denafta total 

devuelva un conjunto D de aquellos v ́ertices de C que puede visitar conlos L litros.

# fun Dijkstra(L: array[1..n,1..n] of Nat, v: Nat)ret D: c

fun viaje(E :array[1..n,1..n] of Nat, C: Set of int, v: Nat, L: int)ret D: array of int
    
    moment: array[1..n] of Nat
    min: int
    l : int

    D := []
    l := L

    moment := Dijkstra(E, v)
    for i:=1 to n do
        if(moment[i]<=l and member(moment[i], C))then
            add(moment[i], D)
        fi
    do

endfun
    
B)

40 litros de nafta. 
C ={11,5,10,7,8}


  1  2  3  4  5  6  7  8  9  10 11
C[0 ,9 ,18,27,32,20,34,43,38,48,48]     V[1]  

D= [1,2,3,4,5,6,7,9]
