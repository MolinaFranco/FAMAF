eleccionar entrenobjetosde valores v1, . . . ,vn
y pesos w1, . . . ,wn, respectivamente, 
apacidad W. 
ah pero si tenes dos mochilas W1yW2,

mochilas(i,W1,W2)   
    | 0                                                                                     (i<=0)
    | -inf                                                                                  (i>0 and (W1<0 or W2<0))          >
    | max(mochilas(i-1,W1-w[i],W2)+v[i],mochilas(i-1,W1,W2-w[i])+v[i],mochilas(i-1,W1,W2)   (i>0 and (W1>=0 or W2>=0))