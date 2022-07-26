medidas n
        i {1..n}
mejora  m[i] > 0
daño    d[i] > 0
puntaje = m[i]/d[i]

 K medidas
 C daño


A)  la funcion medidas(c,k,i)= 

calcula el maximo puntaje dentro de la cantidad de daño ecologico aceptable con las medidas posibles

con "c" la cantida de daño maximo aceptable 
    "k" la cantidad de medidas que podemos seleccinoar
    "i" las opciones de medidas que podemos probar

B)  	medidas(C,K,n)

medidas(c,k,i) =    | 0                                                                 (k=0 or c=0)      
                    | max(medidas(c-d[i], k-1, i-1)+m[i]/d[i] , medidas(c, k, i-1))     (k>0 and c>0 and 1<=i<=n)
                    | -♾️                                                               (c<0 or i=0)
