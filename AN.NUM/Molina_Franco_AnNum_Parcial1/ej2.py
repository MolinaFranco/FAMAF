import matplotlib.pyplot as plt
import math
from helper import *
from ej1 import serie_seno

def maker_list(min,max,dist):
    xs = []
    c_min = min
    while(c_min<=max):
        xs.append(c_min)
        c_min = round(c_min + dist,2)
    return xs

xs = maker_list(0, 6, 0.1)
ys = list(map(serie_seno, xs))

# Grafico pyplot
plt.plot(xs,ys)
plt.xlabel('x')
plt.ylabel('y')
plt.grid()
plt.title('Tylor_seno,5,0')
# Como laburo con wsl es mas facil guardarlo en un png (nunca se especifico como mostrar el grafico)
plt.savefig("mygraph.png")
# Si estamos en Ubuntu o corriendo por la powershell, simplemente podemos habilitar el show 
#plt.show()