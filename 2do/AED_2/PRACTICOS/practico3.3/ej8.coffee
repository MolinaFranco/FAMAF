n estaciones  de trabajo, S[1,1], . . . , S[1,n]para la primera yS[2,1], . . . , S[2,n] para la segunda
Dos estaciones S[1,i] y S[2,i] (parai= 1, . . . , n), 
    hacen el mismo trabajo, pero lo hacen con costos a[1,i] y a[2,i] respectivamente,
    que  pueden  ser  diferentes
Debemos  pasar  por n estaciones  de  trabajo S[i1,1], S[i2,2]. . . , S[in,n] no  necesariamente
    todas  de  la  misma  lınea  de  montaje  (ik=  1,2).

Si,j,  transferirlo a la otra lınea de montaje 
(es decir continuar en S[i'',j+1] con i''!=i) cuesta t[i,j].  

Encontrar el costo minimo de fabricar un automovil usando ambas lineas

S[i,j] = S[1,n] ó S[2,n]

         a[1,n] ó a[2,n]

pasar por todas las estaciones de trabajo 
    
    i=estacion j=linea actual

auto(i,j)   |   0                                                   (i<n)               >
            |   Min(auto(i,j+1) , auto(2,j+1)+t[i,j])+a[i,j]        (j=1 and i<=n)
            |   Min(auto(i,j+1) , auto(1,j+1)+t[i,j])+a[i,j]        (j=2 and i<=n)


