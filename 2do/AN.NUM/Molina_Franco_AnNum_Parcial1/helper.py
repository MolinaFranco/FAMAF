import sys

def fact(x):
    if(x <= 0):
        return 1
    else:
        return x * fact(x-1)

def rbisec(fun,I,err,mit):
    # I intervalo
    # err tolerancia error
    # mit maximo de iteraciones
    a = I[0]
    b = I[1]
    min = fun(a)
    max = fun(b)
    dist = b-a
    hx = []
    hf = []

    if((min*max)>0):
        print("brake: la funcion no tiene raices en el intervalo")
        return (hx,hf)
    
    for i in range(mit):
        dist = dist/2
        mid = a+dist
        hx.append(mid)
        val = fun(mid)
        hf.append(val)
        
        if((abs(dist)<err) or (abs(val)<sys.float_info.epsilon)):
            print("Se encontro solucion")
            break

        if ((val*min)<0):
            b = mid
            max = val

        else:
            a = mid
            min = val

    return (hx,hf)
      
    #hx = [x1, . . . , xN ] es una lista que representa el historial de puntos medios
    #hf = [f (x1), . . . , f (xN )] el historial de los respectivos valores funcionales
