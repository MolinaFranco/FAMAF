
que monedas se utilizan
j = monto de plata
i = moneda

type res = tuple
            cant : int
            l : list of nat
            endtuple


{conviene llamar con R:=empty c:=0}
{i=n}

fun cambiorec(d:array[1..n] of nat, i,j: nat, r: list of nat, cant : int) ret R : list of nat
    if j=0 then 
        R := r

    if i=0 then
        R:= concat(cambio(d,i+1,j-d[i]),cambio(d,i+1,j-d[i]))
    
    else if d[i] > j then 
        R := concat(R, cambio(d,i-1,j,R))
    
    else 
        if length(cambio(d,i-1,j,r)) < length(cambio(d,i,j-d[i],addr(r,d[i]))) then
            R := cambio(d,i-1,j,r)
        else
            R := cambio(d,i,j-d[i],addr(r,d[i]))
        fi
    fi
end fun


