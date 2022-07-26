import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import linprog

#a

#x es cantidad de medicina 1, y es cantidad de medicina 2
#Funcion objetivo: 25x + 20y
#Restricciones: 3x + 4y <= 25
#               2x + y <= 10

#b

fig, ax = plt.subplots(1,1)
x = np.linspace(0, 10, 100)
y1 = (25 - 3*x) / 4
y2 = 10 - 2*x

frontera_rf = np.minimum(y1,y2)
ax.plot(x, y1, label = '3x + 4y <= 25')
ax.plot(x,y2, label = '2x + y <= 10')
ax.plot(x, frontera_rf, color = 'green')
ax.fill_between(x, frontera_rf, alpha = 0.5, color = 'green', label = 'Region factible')
plt.xlim([0,5])
plt.ylim([0,10])

#c
costo = - np.array([25,20], dtype = 'float')
res_ld = np.array([25,10], dtype = 'float')
res_li = np.array([[3,4], [2,1]])
sol = linprog(costo, res_li, res_ld)

ax.plot(sol.x[0], sol.x[1], 'o', label = 'Maximizador', color = 'Yellow')

ax.legend()
ax.grid()
plt.show()

print(sol)