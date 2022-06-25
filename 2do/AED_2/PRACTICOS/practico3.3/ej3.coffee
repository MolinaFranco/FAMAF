n pedidos por importes m1, . . . ,mn, 
pero solo queda en deposito una cantidadHde harina 
los pedidos requieren una cantidad h1, . . . , hn

pan(n,H)    | 0                                         (n<=0)
            | max(pan(n-1,H-h[n])+m[n], pan(n-1,H))     (h[n]<=H and n>=1)
            | pan(n-1,H)                                (h[n] > H)