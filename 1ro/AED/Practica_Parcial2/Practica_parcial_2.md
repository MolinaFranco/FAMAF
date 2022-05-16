## 1)

Const N : Int;
Var r,s,i : Int;

    {P}
l1  r,s,i:= 0,0,0;
l2  do i!=N ->
l3      r,s,i:= r+s+1,i+i,i+ 1
l4  od
    {Q}

#### a)

Realiza la traza de ejecucion para N= 3

|--------|---------------|---------------------------|---------------------------------------|
| Linea  | nombre estado | estado/guardas            |   aclaracion                          |
|--------|---------------|---------------------------|---------------------------------------|
|        | σ0            | r->R, s->S, i->I, N = 3   | estado inicial                        |
| l1     | σ1            | r->0, s->0, i->0, N = 3   | despues de ejecutar la inisializacion |
| l2     |               | i!=N===True               | evaluamos la guarda del ciclo         |
| l3     | σ2            | r->1, s->0, i->1, N = 3   | despues de ejecutar la asignacion     |
| l2     |               | i!=N===True               | evaluamos la guarda del ciclo         |
| l3     | σ3            | r->2, s->2, i->2, N = 3   | despues de ejecutar la asignacion     |
| l2     |               | i!=N===True               | evaluamos la guarda del ciclo         |
| l3     | σ4            | r->5, s->4, i->3, N = 3   | despues de ejecutar la asignacion     |
| l2     |               | i!=N===False              | evaluamos la guarda del ciclo         |
| l3     | σ4            | r->5, s->4, i->3, N = 3   | estado final                          |
|--------|---------------|---------------------------|---------------------------------------|


#### b)

- propone la especificacion del programa dando la pre-condicion P y la post-condicion Q.



## 2)

## 3)