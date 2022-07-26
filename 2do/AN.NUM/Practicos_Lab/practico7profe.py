# C = [10, 8]
# A_ub = - [3, 2], b_ub = - [3  ]
#          [1, 3]           [1.5]
#          [8, 2]           [4  ]


# buscar siempre
#       min c^T x


import matplotlib.pyplot as plt
import numpy as np
from scipy import optimize
from scipy.optimize import linprog

costo = np.array([10, 8], dtype="float")        #f(x,y) = 10x + 8y
mat_des = - np.array([
    [3, 2],                                     #izquiera de los requisitos
    [1, 3],                                     #requisitos del estilo ax+by >= c
    [8, 2],                                                     #            ^
                                                                #            |
], dtype="float")
vec_des = - np.array([3, 1.5, 4], dtype="float")    #derecha de requisitos

res = optimize.linprog(c=costo, A_ub=mat_des, b_ub=vec_des) 
# Programación lineal: minimizar una función objetivo lineal sujeta a 
# restricciones de igualdad y desigualdad lineal.
# scipy.optimize.linprog(c, A_ub=None, b_ub=None, A_eq=None, b_eq=None, bounds=None, method='interior-point', callback=None, options=None, x0=None)

solucion = res.x

print(f"Solucion: {solucion}")
print(f"Dinero por 10 m2: {res.fun}")
print(f"Encontro solucion? {res.success}")

# para graficar
# y = 1.5 - 1.5 x
# y = 0.5 - 1/3 x
# y = 2 - 4 x

x = np.linspace(0, 3, 100) #Devuelve números espaciados uniformemente en un intervalo específico.
y1 = 1.5 - 1.5 * x
y2 = 0.5 - 1/3 * x
y3 = 2 - 4 * x
curva_region = np.maximum(np.maximum(y1, y2), y3) #Máximo de elementos de matriz por elementos. Compara dos matrices y devuelve una nueva matriz que contiene los máximos por elementos.

plt.plot(x, y1)
plt.plot(x, y2)
plt.plot(x, y3)
plt.fill_between(x, curva_region, 3, alpha=0.2) #Rellena el área entre dos curvas horizontales.
# matplotlib.pyplot.fill_between(x, y1, y2=0, where=None, interpolate=False, step=None, *, data=None, **kwargs)
# alpha = tipo matriz o escalar o ninguno
plt.plot(solucion[0], solucion[1], '*')
plt.xlim([0, 3])                    #Obtenga o establezca los límites x de los ejes actuales.
plt.ylim([0, 3])
# plt.show()
plt.savefig("p7/ej1.png")