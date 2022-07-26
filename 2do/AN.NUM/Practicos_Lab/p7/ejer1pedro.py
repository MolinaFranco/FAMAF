import numpy as np
from scipy.optimize import linprog
import matplotlib.pyplot as plt

costo = np.array([10, 8], dtype = 'float')

vec_des = - np.array([3, 1.5, 4], dtype = 'float')
mat_des = - np.array([[3, 2], [1, 3], [8, 2]], dtype = 'float')

res = linprog(costo,mat_des,vec_des)
print(res)

#Para graficar

x = np.linspace(0, 3, 200)
y1 = 1.5 - 1.5 * x  
y2 = 0.5 - 1/3 * x 
y3 = 2 - 4 * x 
curva_region = np.maximum(np.maximum(y1, y2), y3)
'''
plt.fill_between(x, y1, 3, alpha = 0.3)
plt.fill_between(x, y2, 3, alpha = 0.3)
plt.fill_between(x, y3, 3, alpha = 0.3)
'''
plt.plot(x, y1, 3, alpha = 0.3)
plt.plot(x, y2, 3, alpha = 0.3)
plt.plot(x, y3, 3, alpha = 0.3)
plt.plot(x, curva_region)

plt.fill_between(x, curva_region, 3, alpha = 0.3)

plt.plot(res.x[0], res.x[1], 'o')
plt.xlim([0, 3])
plt.ylim([0, 3])


plt.show()