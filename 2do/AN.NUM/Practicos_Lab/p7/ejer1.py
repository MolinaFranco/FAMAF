import matplotlib.pyplot as plt
import numpy as np
from scipy import optimize
from scipy.optimize import linprog

costo = np.array([10, 8], dtype="float")

vec_des = - np.array([3, 1.5, 4], dtype="float")
mat_des = - np.array(
   [[3, 2],
    [1, 3],
    [8, 2],], 
    dtype="float")


res = optimize.linprog(c=costo, A_ub=mat_des, b_ub=vec_des)
solucion = res.x

print(f"Solucion: {solucion}")
print(f"Dinero por 10 m2: {res.fun}")
print(f"Encontro solucion? {res.success}")

# Para graficar

x = np.linspace(0, 3, 100)
y1 = 1.5 - 1.5 * x
y2 = 0.5 - 1/3 * x
y3 = 2 - 4 * x
curva_region = np.maximum(np.maximum(y1, y2), y3)


plt.plot(x, y1)
plt.plot(x, y2)
plt.plot(x, y3)

plt.fill_between(x, curva_region, 3, alpha=0.3)

plt.plot(solucion[0], solucion[1], 'o')
plt.xlim([0, 3])
plt.ylim([0, 3])
# plt.show()
plt.savefig("ej1.png")