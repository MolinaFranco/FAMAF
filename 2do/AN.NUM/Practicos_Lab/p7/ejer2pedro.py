import numpy as np
from scipy.optimize import linprog
import matplotlib.pyplot as plt

# 50*x + 24*y <= 2400 (1)
# 30*x + 33*y <= 2100 (2)

costo = - np.array([1,1], dtype = 'float')
vec_des = np.array([2400,2100], dtype = 'float')
mat_des =  np.array([[50,24], [30,33]], dtype = 'float')

res = linprog(costo, mat_des, vec_des)
print(res)

fig, ax = plt.subplots(1,1)

x = np.linspace(0, 50, 300)
y1 = (2400 - 50*x) / 24
y2 = (2100 - 30*x) / 33
curva_region = np.minimum(y1,y2)

ax.plot(x, y1, label = '50*x + 24*y <= 2400')
ax.plot(x,y2, label = '30*x + 33*y <= 2100')
ax.plot(res.x[0], res.x[1], 'o', label = 'Maximizador', color = 'purple')
ax.plot(x,curva_region, color = 'green')

## CURVAS DE NIVEL ##

levels = np.linspace(40,80,5)

for level in levels:
	# x+y = level
	y = level - x
	ax.plot(x,y,label=f"nivel={int(level)}")

ax.fill_between(x,curva_region,alpha = 0.5)
plt.xlim([0, 50])
plt.ylim([0, 110])
ax.legend()
ax.grid()

plt.show()