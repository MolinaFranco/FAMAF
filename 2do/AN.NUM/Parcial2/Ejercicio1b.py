import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d

datos = np.loadtxt("irma.csv", delimiter=",",dtype=float)
horas = datos[:, 0]
longitud = datos[:, 1]  
latitud = datos[:, 2] 

# traigo mi funcion de lagrange

def plagrange(xs, ys):

    cn = len(xs)

    def l(i, x):
        term = 1
        for j in range(0, cn):
            if(j != i):
                term *= (x-xs[j])/(xs[i]-xs[j])
        return term

    def p(x):
        sum = 0
        for i in range(0, cn):
            sum += ys[i]*l(i, x)
        return sum

    return p

def ilagrange(xs, ys, z): return plagrange(xs, ys)(z)


horasInter = np.array([x for x in range(1, 24) if x not in horas])

# Lagrange y Spline cubico

# Interpolando Longitud

# esp = np.linspace(0, 24, 100)           # genero números espaciados uniformemente entre 0-24
splLng = interp1d(horas, longitud, kind="cubic")      # spline 
lagLng = plagrange(horas, longitud)     # polinomio con lagrange

fig, ax = plt.subplots()                # figuras y ejes de un sub grafico para tener longitud y latitud en el mismo
fig.suptitle("Longitud")
ax.plot(horas, longitud, "o", label="Datos Longitud")
ax.plot(horasInter, splLng(horasInter), "o", label="Inter spline")
ax.plot(horasInter, lagLng(horasInter), "o", label="Inter Lagrange")

ax.legend()
ax.grid()
fig.savefig("graficos/DatosIrmaEj1bLongitud.png")

# Interpolando Latitud

splLng = interp1d(horas, latitud, kind="cubic")      # spline 
lagLng = plagrange(horas, latitud)     # polinomio con lagrange

fig2, ax2 = plt.subplots()                # figuras y ejes de un sub grafico para tener longitud y latitud en el mismo
fig2.suptitle("Latitud")
ax2.plot(horas, latitud, "o", label="Datos Latitud")
ax2.plot(horasInter, splLng(horasInter), "o", label="Inter spline")
ax2.plot(horasInter, lagLng(horasInter), "o", label="Inter Lagrange")

ax2.legend()

ax2.grid()
fig2.savefig("graficos/DatosIrmaEj1bLatitud.png")

