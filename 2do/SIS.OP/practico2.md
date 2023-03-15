## 1

define N -> remplazo automtico, no se guarda
int a[N] -> vss (variables globales y varibales estaticas de la funcion)
argc -> stack   (no estan en el codigo)
argvv -> stack (todo tanto puntero como lo que apunta)
int i -> stack/reg
register int i -> reg
int *b -> stack place / &b heap

## 2

1 todo mal con gets
2 pierde el caracter /n, no tiene espacio suficiente ->mallor(...+1)
3 pide memoria de nuevo y pierde la referencia, nunca se va a poder hacer free
4 pide 16bytes e intenta entrar al 15 (cada int ocupa 4 bytes)

## 3

F - es una funcion de una libreria
F - capaz no tiene que reservar memoria, ya tiene espacio en el heap tiene free list con bloques suficientes
V - si no tiene espacio suficiente en el heap, hace un brk para agrandarlo pidiendo espacio
V - igual que el malloc, puede decidir hacer un brk negativo
F - depende del manejo de espacio libre, el espacio libre del momento, etc

## 4

mem 0
    5 28
    8 
    10 256 (se va de borde por que >256)

## 5

externa por que pedis un limite muy grande al pedo
interna por que tenes huequitos

## 6
relocalizacion estatica: agarrar el binario y cortarlo fuerte
relocacion dinamica: tener un registro base

## 7

V - son privilegiadas por que podrias modificar codigo de otro programa
F - uno por el que esta corriendo (se guardan en el stack) no tengo registros infinitos

## 8

no entra por que tiene 16386 y se pasa de 16384 por ende necesita 3 pages y el heap necesita 2 por ende no entra en las 4 paginas

## 9 

una pelotudez

## 10

15,5ns no

0.95(10+120)+0.05(10+120+120) eso

## 11


