simulemos q comenzamos con el primer vertice

1) PRIM A)

A[(1,6)]
A[(1,6),(1,3)]
A[(1,6),(1,3),(2,3)]
A[(1,6),(1,3),(2,3),(2,4)]
A[(1,6),(1,3),(2,3),(2,4),(2,5)]
A[(1,6),(1,3),(2,3),(2,4),(2,5),(8,5)]
A[(1,6),(1,3),(2,3),(2,4),(2,5),(8,5),(8,7)]

2) Dijkstra A)

w((1,2)) = 7 -
w((1,6)) = 3 -      w((1,7)) = 5    -
w((1,3)) = 3 -      w((2,3)) = 4    -
w((2,4)) = 2 -      w((2,5)) = 1    -
w((3,4)) = 5 -      w((3,6)) = 4    -
w((3,8)) = 6 -      w((4,6)) = 8    -
w((5,4)) = 3        w((5,6)) = 6    -
w((6,7)) = 5 -      w((8,5)) = 2
w((8,7)) = 3 -

D: array[1..n] of Nat

  1 2 3 4 5 6 7 8
C[0,7,3,i,i,3,5,i]     V[1]    
C[0,7,3,8,i,3,5,9]     V[1,3]               +3
C[0,7,3,8,9,3,5,9]     V[1,3,6]             +3
C[0,7,3,8,9,3,5,8]     V[1,3,6,7]           +5
C[0,7,3,8,8,3,5,8]     V[1,3,6,7,2]         +7
C[0,7,3,8,8,3,5,8]     V[1,3,6,7,2,4]       +8
C[0,7,3,8,8,3,5,8]     V[1,3,6,7,2,4,5]     +8
C[0,7,3,8,8,3,5,8]     V[1,3,6,7,2,4,5,8]   +8
    