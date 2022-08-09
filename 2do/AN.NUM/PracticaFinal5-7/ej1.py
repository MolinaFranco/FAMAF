import funciones_aux as fa
import matplotlib.pyplot as plt
import numpy as np
import sys

# rnewtondelta(fun,x0,err,mit,delta)
# fun es una funcion que dado x retorna f(x), 
# x0 es un punto inicial en R, 
# err es la tolerancia deseada del error
# mit es el numero maximo de iteraciones permitidas 
# delta representa el parametro ∆x

# La salida debe ser (hx,hf) donde 
# hx= [x1, . . . , xN ] es una lista que representa el historico de puntos generados y 
# hf= [f(x1), . . . , f(xN )] el historico de los respectivos valores funcionales.

def rnewtondelta(fun,x0,err,mit,delta):

    def der(x):
        return (fun(x0 + delta)-fun(x0))/delta

    ap = fun(x0)
    apd = der(x0)
    hx = []
    hf = []

    if (abs(ap) < sys.float_info.epsilon):
        print("brake: la funcion on tiene raices en el intervalo")
        return (hx,hf)

    for i in range(mit):        
        
        f0 = fun(x0)
        f0p = der(x0)

        x1 = x0-(ap / f0p)
        
        f1 = fun(x1)
        f1p= der(x1)
        
        ap = f1

        hx.append(x1)
        hf.append(ap)

        if (abs(x1-x0)/abs(x0)<err or abs(f1)<err or abs(ap)<sys.float_info.epsilon):
            return (hx,hf)
        
        x0 = x1

    return (hx,hf)

# b)  Graficar la funcion f(x) = (e**x)−x−2 en el intervalo [0, 10].

def f1(x):
    return ((np.e**x)-x-2)

def f1d(x):
    return (((np.e**x)-x-2),((np.e**x)-1))

x = np.linspace(0, 10, 100)
plt.plot(x, f1(x), label="NewtonDelta")
plt.legend()
plt.savefig("ej1b.png")

# Encontrar la raız de la funcion f(x) con el metodo de Newton tradicional

(nDx,nDy) = rnewtondelta(f1,1,(1e-6),100,(1e-5))
(nD2x,nD2y) = rnewtondelta(f1,1,(1e-6),100,0.001)
(nDvx,nDvy) = fa.rnewton(f1d,1,(1e-6),100)

print(f"Las raiz con delta (1e-5) es: {nDx[-1]}")
print(f"Las raiz con delta (0.001) es: {nD2x[-1]}")
print(f"Las raiz con el anterior newton es: {nDvx[-1]}")


