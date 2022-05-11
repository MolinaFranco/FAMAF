from helper import rbisec
from ej1 import serie_seno

#se ve graficamente que el primer corte es aproximado a 3,25
(hx1,hf1) = rbisec(serie_seno, [2,4], 1e-5, 100)
#se ve graficamente que el segundo corte es aproximado a 4,9 o 5
(hx2,hf2) = rbisec(serie_seno, [4,6], 1e-5, 100)

print(f"Primera raiz positiva de serie_seno {hx1[-1]}")
print(f"Segunda raiz positiva de serie_seno {hx2[-1]}")