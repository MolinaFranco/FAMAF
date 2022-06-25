demas del dıa de partida y de regreso (Pi y Ri) cada amigo ofrece unmontomipor dıa.
monto Mi por dıa

{ordenado por mayor fecha de regreso (el mayor i es el que primero vuelve) r1 >= rn  }
telefono(i,r)   |   0                                                          (i<=0)   
                |   telefono(i-1,R[i])+(M[i]*(R[i]-P[i])), telefono(i-1,r)     (i >= 1 and P[i] > r)
                |   telefono(i-1,r)                                            (P[i] <= r)