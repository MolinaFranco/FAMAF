from typing import Iterable
import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import quad

# 1)

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

def trapecio(fun, a: float, b: float, N: int): 
    # defino h como todas las formulas
    h = (b-a)/N
    # sumo las puntas, casos base
    # sx0 = fun(a) + fun(b)
    # inicio la sumatoria en 0 y los puntos en el comienzo de la int
    sx = 0
    x = a
    for _ in range(1, N):
        x = x+h
        sx += fun(x)
    # return (sx0 + 2*sx) * h / 2
    return (fun(a) + 2*sx + fun(b)) * h / 2


def pm(fun, a: float, b: float, N: int):
    h = (b-a)/N
    sx = 0
    x = a
    for _ in range(0, N+1, 2):
        x += 2*h
        sx += fun(x)
    return 2*h*sx

def intenumcomp (fun, a:float, b:float, N:int, regla:str): 
    reglas = {
       "trapecio": trapecio,
       "pm": pm,
       "simpson": simpson
    }
    return regla(fun, a, b, N)

# 2)

def fun2():
    # f = lambda x : np.exp(-x)
    def f(x): return np.exp(-x)
    for n in [4, 10, 20]:
        print(f"\n\nCon {n} subintervalos")
        print(f"Trapecio: {intenumcomp(f, 0, 1, n, 'trapecio')}")
        print(f"Simpson: {intenumcomp(f, 0, 1, n, 'simpson')}")
        print(f"Punto medio: {intenumcomp(f, 0, 1, n, 'pm')}")

# 3) ma o me

def senintaux(x): 
    # Cantidad de subintervalos tal que sean <= 0.1
    return intenumcomp(np.cos, 0, x, int(np.ceil(x*10)), "trapecio") 
    # La función ceil() devuelve el techo de cada elemento (uno solo) de la matriz con un 
    # tipo de datos flotante.

def senint(x: Iterable[float]): 
    return list(map(senintaux, x))

def ej3():
    # np.arange
    # genera un conjunto de números entre un valor de inicio y uno final,
    #  pudiendo especificar un incremento entre los valores,
    x = np.arange(0, 2*np.pi, 0.5) 
    plt.plot(x, np.sin(x), label="Seno")
    plt.plot(x, senint(x), "o", label="Integral numérica desde 0 a ese punto")
    plt.savefig("p5ej3.png")

#  5)

def ej5():
    # scipy.integrate.quad
    # Integre func de a a b (posiblemente intervalo infinito) 
    # usando una técnica de la biblioteca Fortran
    # con lambda
    print(f"a: {quad(lambda x:np.exp(-x**2), -np.inf, np.inf)}")
    # con fun def
    # sqrt raiz cuadrada
    def f(x): x**2*np.log(x+np.sqrt(x**2+1))
    print(f"b: {quad(f, 0, 2)}")

# 6
def pendulo(l, angDeg):
    angRad = angDeg*np.pi/180
    def aux(x):
        return 1/(1 - np.sin(angRad/2)**2 * np.sin(x)**2)
    
    integral, _ = quad(aux, 0, np.pi/2)
    return 4*np.sqrt(l/9.8)*integral

def S(f, a, b):
    return (b-a)/6 * (f(a) + 4*f((a+b)/2) + f(b))

# 7
def quadadapt(f, I, tol):
    a, b = I
    c = (a+b)/2
    q = S(f, a,b)
    q1 = S(f, a,c)
    q2 = S(f, c,b)
    if q-q1-q2 < 15*tol:
        return q1 + q2
    else:
        return quadadapt(f, (a,c), tol/2) + quadadapt(f, (c, b), tol/2)

def f(x): return x * np.e**(-x**2)
print(quadadapt(f, (0, 1), 1e-5))
print(intenumcomp(f, 0, 1, 8, "simpson"))
# print()

plt.show()
