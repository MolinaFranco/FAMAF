Cada casilla tiene asociado un numero entero cij (i, j = 1, . . . , n) 

fichas(x,y) |   -♾️                                                                 (1>x>n)
            |   max(fichas(x-1,y-1) , fichas(x,y-1) , fichas(x+1,y-1)) + C[x,y]     (1<=x<=n and y>0)
            |   C[x,y]     (1<=x<=n and y=0)