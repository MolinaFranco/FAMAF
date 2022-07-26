import numpy as np
from scipy.optimize import linprog

costo = - np.array([1,1,1], dtype = 'float') #Para maximizar ventas la funcion objetivo es x+y+z, para maximizar ganancias 7x+4y+2z
res_li = np.array([[1,2,2], [2,1,2]], dtype = 'float')
res_ld = np.array([30,45], dtype = 'float')

sol = linprog(costo, res_li, res_ld)
print(sol)