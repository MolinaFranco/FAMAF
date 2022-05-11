from helper import rbisec
from ej1 import serie_seno
from ej4 import rsteffensen


(hx1,hf1) = rsteffensen(serie_seno, 3, 1e-5, 100)
(hx2,hf2) = rsteffensen(serie_seno, 6, 1e-5, 100)

print(f"Raiz con x0=3 de serie_seno {hx1[-1]}, con {len(hx1)} iteraciones")
print(f"Raiz con x0=6 de serie_seno {hx2[-1]}, con {len(hx2)} iteraciones")

#extras para poder dar una buena respuesta a las preguntas del punto 5 
(hxe,hfe) = rsteffensen(serie_seno, 4.5, 1e-5, 100)
print(f"Raiz con x0=4,5 de serie_seno {hxe[-1]}, con {len(hxe)} iteraciones")

# guardo los resultados de la serie_seno con x0=4,5 en el archivo help_ej5
# para poder comparar todos los puntos generados
f = open("help_ej5.txt", "w")
print(f"Lista que representa el historico de puntos generados \n {hxe} \n", file=f)
print(f"historico de los respectivos valores funcionales \n {hfe} \n", file=f)
f.close()

# Respuestas a las preguntas:

# Raiz con x0 en 3 de serie_seno 3.1486841042893765, con 1 iteraciones
# Raiz con x0 en 6 de serie_seno 4.963152976447652, con 69 iteraciones
# Raiz con x0 en 4,5 de serie_seno -8.671702092300173, con 100 iteraciones

# Al iniciar la busqueda en 4,5 llega a una aproximacion cercana a -8
# pero ya en la segunda iteracion se aproxima a este numero como vemos en help_ej5.txt
# ademas vemos que conlleva las 100 iteraciones que le damos ya que nuenca cierra en una raiz
