flamante duenio
n amigos
prestarselo al mayor numero de amigos posible
pi y ri respectivamente

type viaje = tuple
                prt: int
                ret: int
            end tuple

fun prestarfono(P: list of int, R: list of int)ret L: list of viajes

    p_aux:list of int 
    r_aux:list of int 
    fecha: int
    mp: int
    mr: int
    a: viaje

    r := empty_list()
    p_aux:= copy_list(P)
    r_aux:= copy_list(R)
    fecha:= 0 #supongamos que comienza en el dia 0

    Ordenarbyalgo(p_aux,r_aux,llegada)

    while(!is_empty(p_aux))do
        mp := head(p_aux)
        mr := head(r_aux)
        if (mp > fecha)then
            a.prt = mp
            a.ret = mr
            addr(L, a)
            fecha := mr
        fi
        tail(p_aux)
        tail(r_aux)
    od

endfun


{ordenados por retorno }
fun recutel(i,t)    |   n = recutel(i+1, t)                                         (si Ai.prt < t and i<=n)
                    |   n = max(recutel(i+1, Ai.ret) + 1    ,  recutel(A-1, t))     (si Ai.prt > t and i<=n)
                    |   n = 0                                                       (si i>n)