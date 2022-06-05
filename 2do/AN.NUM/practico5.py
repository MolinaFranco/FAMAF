import numpy as np
import matplotlib.pyplot as plt

# Datos 
#datos = np.loadtxt("../datos/datos1a.dat")
x,y = np.loadtxt("../datos/datos1a.dat")

# [ first_row:last_row , column_0 ]
# x = datos[:,0]
# y = datos[:,1]

#elimino los nulos
mask = ~np.isnan(y)
x = x[mask]
y = y[mask]

def ajuste_lineal(x,y):
    m = len(x)
    #hago las sumatorias
    sum_x = np.dot(x, np.ones(m))
    sum_x_cuadrado = sum(x**2)
    sum_xy = np.dot(x, y)
    sum_y = np.dot(y, np.ones(m))

    #calculo los dos a0 a1 con las ecu normales
    cociente = ((m*sum_x_cuadrado) - (sum_x**2))
    a0 = (sum_x_cuadrado*sum_y - sum_xy*sum_x)/cociente
    a1 = (m*sum_xy - sum_x * sum_y)/cociente
    #retorno la funcion armada con mis a y que sea valuable con un v
    return lambda v:(a1*v+a0)

def ej1a():
    ajuste = ajuste_lineal(x,y)

    def fun1c(x): return (3/4) * x - (1/2) 

    #x = np.linspace(0, 10)
    xs = np.linspace(0, 10, 20)

    ys = fun1c(xs)

    #randomizamos un poco los ys
    ys = ys + 3*randn(len(ys))

    # ajuste = ajuste_lineal(x, yd)
    ajuste = np.poly1d(np.polyfit(xs, ys, 1)) 
    # polyfit devuelve los coeficientes del polinomio
    #con poly1d obtenemos un polinomio que podemos evaluar(callable)


def ej2a(x):

    def fun2a():
        return np.arcsin(x)

    xs = np.linspace(0, 1, 50)
    ys = func2a(xs)
    #ys = ys + randn(len(y))

    for n in range(1,6):
        ajuste = np.poly1d(np.polyfit(xs, ys, n))
        # Imagen de x en ajuste
        ya = ajuste(x)
        residuo = sum(np.abs(y-ya))
        print(f"Residuo grado {n}: {residuo}")
        plt.plot(x_graph, ajuste(x_graph), label=f"Ajuste grado {n}")
