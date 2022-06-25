import numpy as np
import matplotlib.pyplot as plt

# con rafagas de viento de hasta 285 km/h.
# en el archivo irma.csv se muestran las coordenadas del mismo cada 3 horas, durante 24 horas

# La primer columna denota la hora,
# la segunda la longitud 
# la tercera muestra la latitud.


# nota: la longitud indica el eje X y la latitud el eje Y)

datos = np.loadtxt("irma.csv", delimiter=",",dtype=float)
horas = datos[:, 0]
xs = datos[:, 1]  #longitud
ys = datos[:, 2]  #latitud


plt.plot(xs, ys, "o", label="Datos irma")
plt.legend()
plt.xlabel('longitud')
plt.ylabel('latitud')
plt.grid()
plt.savefig("graficos/DatosIrmaEj1a.png")