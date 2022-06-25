
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

fun Prim(G : Graph, k: Vertex) ret A: Set of Arista 
    
    var t: Arista
    var T: Set of Vertex
    
    V:= copy_set(G.vertices)
    elim(V,k)
    A:= empty_set()
    
    do (not is_empty_set(V)) →
        t := “selecciono arista de costo mínimo tal que c.v1 ∈ C y c.v2 !∈C, ó c.v2 ∈ C y c.v1 !∈ C”
        
        if member(t.v1,T)then 
            elim(T,t.v1)
        else 
            elim(V,t.v2)
            add(A,t)
        fi
    od
end fun

