import sys

# modificacion del metodo de newton
def rsteffensen(fun,x0,err,mit):
    #fun es una funcion 
    #x0 punto inicial
    #err tolerancia error 
    #mit max iteraciones

    hx = []
    hf = []
    xn = x0

    if (abs(fun(x0)) < sys.float_info.epsilon):
        print("brake: la funcion on tiene raices en el intervalo")
        return (hx,hf)

    for i in range(mit):        
        fx = fun(xn)
        x1 = xn-((fx**2)/(fun(xn+fx)-fx))

        hx.append(x1)
        hf.append(fun(x1))

        if (abs(x1-x0)/abs(x0)<err or abs(fun(x1))<err or abs(fun(x1))<sys.float_info.epsilon):
            return (hx,hf)
        
        xn = x1

    return (hx,hf)


#hx= [x1, . . . , xN ] es una lista que representa el historico de puntos generados 
#hf= [f (x1), . . . , f (xN )] el historico de los respectivos valores funcionales.
