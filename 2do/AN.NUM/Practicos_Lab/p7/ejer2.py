import matplotlib.pyplot as plt
import numpy as np
from scipy import optimize
from scipy.optimize import linprog

costo = np.array([-1, -1], dtype="float")
mat_des = - np.array(
   [[-50, -24],
    [-30, -33],], 
    dtype="float")
vec_des = - np.array([-2400, -2100], dtype="float")
res = optimize.linprog(c=costo, A_ub=mat_des, b_ub=vec_des)
solucion = res.x
x = np.linspace(0, 3, 100)
y1 = (2400 - 50 * x) / 24
y2 = (2100 - 30 * x) / 33
curva_region = np.maximum(y1, y2)
for z in range(0, 5):
    nivel = z - x
    plt.plot(x, nivel)
plt.plot(x, y1)
plt.plot(x, y2)
plt.fill_between(x, curva_region, 3, alpha=0.2)
plt.plot(solucion[0], solucion[1], '*')
# plt.xlim([0, 3])    
# plt.ylim([0, 3])
# plt.show()
plt.savefig("ej2.png")