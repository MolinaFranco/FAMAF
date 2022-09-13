#EJERCICIO 1

grep -m 1 'model name' /proc/cpuinfo
# cat /proc/cpuinfo | grep -m 1 'model name'

#EJERCICIO 2

grep 'model name' /proc/cpuinfo | wc -l

#EJERCICIO 3

wget -O Molina_in_wonderland.txt https://www.gutenberg.org/files/11/11-0.txt && sed -i 's/Alice/Molina/g' Molina_in_wonderland.txt 

# no entendi si tengo que eliminarlo o no
# wget -O Molina_in_wonderland.txt https://www.gutenberg.org/files/11/11-0.txt && sed -i 's/Alice/Molina/g' Molina_in_wonderland.txt && rm Molina_in_wonderland.txt

#EJERCICIO 4

sort -k5 -r --sort=g weather_cordoba.in | tail -n1 | awk '{printf "%s %s %s \n",$1,$2,$3}'

sort -k5 -r --sort=g weather_cordoba.in | head -n1 | awk '{printf "%s %s %s \n",$1,$2,$3}'

#EJERCICIO 5

sort -k3 --sort=g atpplayers.in

#EJERCICIO 6

awk '{printf "%s %s\n", $0, $7-$8}' superliga.in | sort -k2 -k9 -r --sort=g | awk '{--NF; print $0}'

#EJERCICIO 7

ip link | grep -h "ether ..:..:..:..:..:.." -o

# ip link | grep -h ether | awk '{printf "%s\n", $2}'

#EJERCICIO 8

mkdir -p fma && touch fma/fma_S01E{0..10}_es.srt

for f in fma/*_es.srt; do mv $f ${f%_es.srt}.srt; done
