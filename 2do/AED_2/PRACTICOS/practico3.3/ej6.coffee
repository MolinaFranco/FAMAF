materia prima de dos tipos:AyB.  Dispone de una cantidad MA y MB 
pedidos de fabricarnproductos   p1, . . . , pn (uno de cada uno)
valor  de  venta    v1, . . . , vn
elaboracion  cantidades a1, . . . ,an de materia prima de tipoA b1, . . . ,bn de materia prima de tipoB

pedidos(i,MA,MB)| 0                                                             (i<=0)
                | max(pedidos(i-1,MA-A[i],MB-B[i])+V[i],pedidos(i-1,MA,MB))     (i>0 and MA>=A[i] and MB>=B[i])
                | pedidos(i-1,MA,MB)                                            (i>0 and MA<A[i] or MB<B[i])