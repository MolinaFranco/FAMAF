#EJERCICIO 1

¿Qué modelo de procesador tiene tu equipo?

'''
grep -m 1 'model name' /proc/cpuinfo

cat /proc/cpuinfo | grep -m 1 'model name'
'''

#EJERCICIO 2

determinar cuántas unidades de ejecución tiene el procesador

'''
grep 'model name' /proc/cpuinfo | wc -l
'''

#EJERCICIO 3

determinar cuántas unidades de ejecución tiene el procesador

'''
wget -O Molina_in_wonderland.txt https://www.gutenberg.org/files/11/11-0.txt && sed -i 's/Alice/Molina/g' Molina_in_wonderland.txt && rm Molina_in_wonderland.txt
'''

#EJERCICIO 4

Ordenar los días según su temperatura máxima y calcular máximo y mínimo, mostrar en la pantalla sólo la fecha de dichos día

'''
sort -k5 -r --sort=g weather_cordoba.in | tail -n1 | awk '{printf "%s %s %s \n",$1,$2,$3}'

sort -k5 -r --sort=g weather_cordoba.in | head -n1 | awk '{printf "%s %s %s \n",$1,$2,$3}'
'''

#EJERCICIO 5

Ordenar el listado de jugadores según la posision en el ranking.

'''
sort -k3 --sort=g atpplayers.in
'''

#EJERCICIO 6

Ordenar
la tabla del campeonato de la Superliga según la cantidad de puntos, y desempatar por diferencia de goles

'''
awk '{printf "%s %s\n", $0, $7-$8}' superliga.in | sort -k2 -k9 -r --sort=g | awk '{--NF; print $0}
'''

#EJERCICIO 7

imprimir por consola la MAC address de su interfaz ethernet

'''
ip link | grep -h "ether ..:..:..:..:..:.." -o

ip link | grep -h ether | awk '{printf "%s\n", $2}'
'''

#EJERCICIO 8

a. Para emular la situación, crear una carpeta con el nombre de
la serie y dentro de ella crear 10 archivos con un nombre como
fma_S01EXX_es.srt, donde XX es el número de capítulo, desde 1
hasta 10.

'''
mkdir -p fma && touch fma/fma_S01E{0..10}_es.srt

for f in fma/*_es.srt; do mv $f ${f%_es.srt}.srt; done
'''
