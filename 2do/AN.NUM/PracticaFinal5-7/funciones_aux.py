import sys

def rnewton(fun,x0,err,mit):
    (ap,apd) = fun(x0)  #es una funcion que te retorna tu f(x) y f'(x)
    hx = []
    hf = []

    if (abs(ap) < sys.float_info.epsilon):
        print("brake: la funcion on tiene raices en el intervalo")
        return (hx,hf)

    for i in range(mit):        
        (f0,f0p) = fun(x0)
        x1 = x0-(ap / f0p)
        (f1,f1p) = fun(x1)
        ap = f1

        hx.append(x1)
        hf.append(ap)

        if (abs(x1-x0)/abs(x0)<err or abs(f1)<err or abs(ap)<sys.float_info.epsilon):
            return (hx,hf)
        
        x0 = x1

    return (hx,hf)