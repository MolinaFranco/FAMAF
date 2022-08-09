import funciones_auxiliares_Molina as fa
import numpy as np
import matplotlib.pyplot as plt
import math


# obtener una aprox de la const e

# a)

# e es la constante para la que 
# la integral de int(1/y)=1 en el intervalo [1,e]


def integral_simpson(x):
    
    def fun1(y):
        return (1/y)

    r = fa.simpson(fun1, 1, x, 100)
    return r



# modificar la funcion simpson para que cuando el resultado sea 1, me retorne 0
# asi puedo utilizar la busqueda de raices y encontrar el punto 1

def integral_simpsonb(x):
    def fun1(y):
        return (1/y)

    return (fa.simpson(fun1, 1, x, 100)-1)

# fa.graficarf(integral_simpsonb,-10,10)

# al ver la funcion me doy cuenta que en x>0 la funcion es mas bonita
# pero en la parte negativa la funcion de comporta de una manera muy incierta
# lo mejor va a ser mantenernos en una funcion que labure obligatoriamente dentro de este intervalo

def ejb():
    (ex,ey) = fa.rbisec(integral_simpsonb, [1, 8], 1e-6, 100)
    # planteo un intervalo aproximado segun la funcion graficada
    return ex[-1]


# C)
def ejc():

    (ex,ey) = fa.rbisec(integral_simpsonb, [1, 8], 1e-6, 100)

    x = np.linspace(1, 8, 100)
    plt.plot(x, integral_simpson(x), label="Integral")
    plt.plot(x, integral_simpsonb(x), label="Integral modificada")

    plt.plot(ex, ey, "o", label="Aproximaciones de e")
    # la agrego extra, para ver el resultado
    plt.plot(ex[-1], ey[-1], "*", label="Igualdad")
    plt.legend()
    
    plt.grid()
    plt.legend()
    plt.savefig("integral_simpson_ej3.png")

    const = math.e
    error_abs = (const - ex[-1]) / const
    print(f"Error absoluto de la aproximacion: {error_abs}")



def main():
    print("\n")
    print(f"La integral de la funcion 1/y, en el intervalo [1,10] es: {integral_simpson(10)}")
    print(f"El punto en el que la funcion se hace hace 1 es, e={ejb()}")
    ejc()
    print("\n")


main()