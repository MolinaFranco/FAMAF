Es viernes a las 18 
nbares cerca
baritiene un precioPi
y un horario de happy hourHi
50% menos
fija de 2 pintas por hora
nose considera el tiempo de moverse de un bar a otro.
obtener el menor dinero posible que ustedpuede gastar para tomar limonada desde las 18 hasta las 02 am

type bar = tuple
            precio : int
            happy: int
           endtuple

{la lista viene ordenada por menor precio, al menos un bar}
fun birra(B: List of bar)ret R: int

    var b_copy : List of bar
    var reloj : int

    mejor_bar := head(b_copy)
    b_copy := copy_list(B)
    reloj := 0
    R := 1

    while(reloj <= (24-18+2))do
        if(!is_empty(b_copy))then
            while(head(b_copy).happy < reloj)do
                tail(b_copy)
            od
            if(is_empty(b_copy) or head(b_copy).precio > mejor_bar.precio*2)then
                drop(b_copy, length(b_copy))
                R += (mejor_bar.precio)*2
                reloj += 1
            else
                R += head(b_copy).precio
                reloj += 1
            fi
        else
            R += (mejor_bar.precio)*2
            reloj += 1
        fi
    od
endfun







    od
