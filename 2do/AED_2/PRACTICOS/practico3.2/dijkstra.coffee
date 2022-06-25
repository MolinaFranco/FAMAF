
type Vertex = Nat

type Arista = tuple
    v1 : Vertex
    v2 : Vertex
    cost : Nat
end tuple

type Graph = tuple
    vertices : Set of Vertex
    aristas : Set of Arista
end tuple

fun Dijkstra(L: array[1..n,1..n] of Nat, v: Nat)ret D: array[1..n] of Nat

    #L tiene los costos de ir con sus vecinos y sino infinito

    var c: Nat
    var C: Set of Nat   #vertices no visitados
    
    for i:=1 to n do 
        add(C,i) 
    od

    elim(C,v)
    
    for j:= 1 to n do 
        D[j]:= L[v,j] 
    od
    
    do (not is_empty_set(C))→
        c:= “elijo elemento c de C tal que D[c] sea mínimo”
        elim(C,c)
        for j in C do 
            D[j]:= min(D[j],D[c]+L[c,j]) 
        od
    od
end fun