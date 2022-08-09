import matplotlib.pyplot as plt
import numpy as np
import sys

# A)
def simpson(fun, a: float, b: float, N: int):
    # a -> primer punto
    # b -> segundo punto
    # Este algoritmo aplica la regla de simpson cada 2 subintervalos
    # por ende N aplicaciones => n subintervalos
    n = 2 * N
    # calculo h
    h = (b-a)/n
    sx0 = fun(a) + fun(b) 
    sx1 = 0
    sx2 = 0
    # inicializo x en el comienzo de la int
    x = a
    for j in range(1, n):
        # voy avanzando de a tamaños de intervalos
        x = x + h
        # veo si son puntos medios o esquinas
        if j%2==0:
            sx2 += fun(x)
        else:
            sx1 += fun(x)
    # retorno la funcion como tal
    return (sx0 + 2*sx2 + 4*sx1) * h / 3


# B
def graficarf(fun,i,f):
    x = np.linspace(i, f, 100)
    plt.plot(x, fun(x), label="integral")
    plt.legend()
    plt.greed(on)
    plt.savefig("integral_simpson.png")


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
        print("brake: la funcion on tiene raices en el intervalo")
        return (hx,hf)
    
    for i in range(mit):
        dist = dist/2
        mid = a+dist
        hx.append(mid)
        val = fun(mid)
        hf.append(val)
        
        if((abs(dist)<err) or (abs(val)<sys.float_info.epsilon)):
            # print("Se encontro solucion")
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


