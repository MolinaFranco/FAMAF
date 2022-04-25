from helper import rbisec
from ej1 import serie_seno
from ej4 import rsteffensen


(hx1,hf1) = rsteffensen(serie_seno, 3, 1e-5, 100)
(hx2,hf2) = rsteffensen(serie_seno, 6, 1e-5, 100)

print(f"Raiz con x0=3 de serie_seno {hx1[-1]}, con {len(hx1)} iteraciones")
print(f"Raiz con x0=6 de serie_seno {hx2[-1]}, con {len(hx2)} iteraciones")

#extra para responder el punto 5
(hxe,hfe) = rsteffensen(serie_seno, 4.5, 1e-5, 100)
print(f"Raiz con x0=4,5 de serie_seno {hxe[-1]}, con {len(hxe)} iteraciones")


# Respuestas a las preguntas:

# Raiz con x0 en 3 de serie_seno 3.1486841042893765, con 1 iteraciones
# Raiz con x0 en 6 de serie_seno 4.963152976447652, con 69 iteraciones
# Raiz con x0 en 4,5 de serie_seno -8.671702092300173, con 100 iteraciones

