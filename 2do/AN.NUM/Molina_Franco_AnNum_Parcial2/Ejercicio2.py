import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d

# encontrar la cantidad aproximada de metros cubicos de tierra que deben ser removidos
# para nivelar a 0 metros un terreno de 12m×10m

xs = [0,1.5,2,2.9,4,5.6,6,7.1,8.05,9.2,10,11.3,12]
ys = [0.1,0.2,1,0.56,1.5,2.0,2.3,1.3,0.8,0.6,0.4,0.3,0.2]

# A)
# Realice un grafico de los datos utilizando puntos discretos

plt.rcParams["figure.figsize"] = (16,5)
plt.plot(xs, ys, "o", label="Datos Perfil")
plt.xlabel('xs')
plt.ylabel('ys')
plt.grid()

# Quiero interpolar la funcion del problema A) para ver si me queda parecido al grafico dado
# Simplemente para probar los puntos visualmente (es extra personal)

#------ todo esto se puede comentar ------
x_graph = np.linspace(0, 12, 300)
ajuste = np.poly1d(np.polyfit(xs, ys, 7))

plt.plot(x_graph, ajuste(x_graph), label="Ajuste grado 7")
# ------  ------  ------  ------  ------

plt.legend()
plt.savefig("graficos/DatosTerrenoEj2a.png")

# B)

# funciones auxiliares

def get_xy_inorder(xs,ys,i,j):
    if(ys[i]<=ys[j]):
        r = (xs[i],xs[j],ys[i],ys[j])
    else:
        r = (xs[i],xs[j],ys[j],ys[i])
    return r

def ord(xs):
    r = True
    for i in range(0, len(xs)-2):
        r = r and (xs[i]<xs[i+1]) 
    return r

# funcion

def trapecio_adaptativo(xs, ys): 
    
    ordenados = ord(xs)

    if(not(len(ys)>=2 and len(xs)>=2)):
        r = "Error, se necesitan al menos dos puntos"
    elif(not(len(ys) == len(xs))):
        r = "Error, distinta cantidad de valores"
    elif(not(ordenados)):
        r = "Error, x no ordenados de forma creciente"
    else:

        sx = 0

        # primera idea trapecio
        for i in range(0, len(ys)-1):
            (x1,x2,y1,y2) = get_xy_inorder(xs,ys,i,(i+1))
            sx += (x2-x1)*y1 + ((x2-x1)*(y2-y1))/2

        # segunda idea trapecio en base a la formula sin necesidad de ordenar el trapecio
        # for i in range(0, len(xs)-1):
        #     sx += (xs[i+1] - xs[i])/2 * (ys[i] + ys[i+1])

        r = sx

    return r

# C)

ta = trapecio_adaptativo(xs, ys)
print(f"Hay que remover: {ta * 10}m**2") 
