# -*- coding: utf-8 -*-
# encoding: utf-8.
import random
import math
from math import isinf, sqrt

# ayuda

"""
def my_function(food):
  for x in food:
    print(x)

fruits = ["apple", "banana", "cherry"]

my_function(fruits)

username = input("Enter username:")
print("Username is: " + username)
"""

from operator import truediv


def val(v):
    print("Valor de " + v + ": ")
    return input()

def ej1():
    x = val("x")
    y = val("y")
    z = val("z")

    print("x/y+z = "+(x/y+z))
    print("x/(y+z) = "+(x/(y+z)))
    print("x/y*z = "+(x/y*z))
    print("x/(y*z) = "+(x/(y*z)))

    return 0

def ej2():
    a = 1 + 2**-53
    print(a-1)
    b = 1 + 2**-52; 
    print(b-1)

def ej3():
    # 3 Maxima y minima potencia de dos

    exp = 0
    acc = 1.0

    while True:
        if(isinf(acc)):
            break
        acc *= 2
        exp += 1

    print("Maxima potencia:", exp) # 1024

    exp = 0
    acc = 1.0

    while True:
        if(acc/2 == 0):
            break
        acc /= 2
        exp -= 1

    print("Minima potencia:", exp) # -1074

def ej6():
    x = val("x")
    y = val("y")

    if(x<y):
        r=y
    elif(x>y):
        r=x
    else:
        r="Son iguales"

    return r

def pot(x,n):
    return (x**n)

def ej7():
    x = val("x")
    print(pot(x,1))
    print(pot(x,2))
    print(pot(x,3))
    print(pot(x,4))
    print(pot(x,5))
    return (0)

def ej8(): 
    def mala(a,b,c):
    # usa bashkara
    discr = sqrt(b**2-4*a*c)
    x1 = (-b+discr)/(2*a)
    x2 = (-b-discr)/(2*a)

    return [x1, x2]

    [x1, x2] = mala(1,5,6)


    print(x1," ", x2)

    def buena(a, b, c):
    discr = sqrt(b**2-4*a*c)
    x1 = (-b+discr)/(2*a)
    x2 = c / (a*x1) 

    return (x1, x2)

    x1, x2 = buena(1,5,6)
    print(x1, x2)


def SonReciprocos(x,y):
    r = False
    if(x*y == 1):
        r = True
    return r


def horn(coef,x):
    r = coef[0]
    for c in range(1,len(coef)):
        r = coef[c]+x*r
    return r

def hornwillli(coefs, x):
    # out = [None]*(len(coefs))

    # Inicializamos en el coef mas grande        
    out = coefs[0]
    for i in range(1, len(coefs)):
        # Multiplicamos la cuenta actual con x si el coeficiente actual no es el de grado 0
        # Sino, solo hacemos la suma a0+...
        if i == len(coefs)-1:
            out = coefs[i]+out
        else:
            out = out*x+coefs[i]
    return out


print(horn([10,8,-6,2,-5,4,2],1)) # 15

def ej9():
    coefs = [3,2,1]
    x = 2
    h = horn(coefs, x)
    print(h)

ej9()

def ej10():
    for a in range(100):
        x = 1 + random.random()
        y = 1/x
        if not SonReciprocos(x,y):
            print(x)

def f(x):
    r = math.sqrt(x**2 + 1)-1
    return r
def g(x): 
    r = x**2/math.sqrt(x**2 + 1)+ 1
    return r

def ej11():
    for i in range(20):
        x = 8**-i
        print("f(x)= "+f(x)+ "\n g(x)= " + g(x))


def SonOrtogonales(v1, v2):
    r = False
    pv = (v1[0]*v2[0])+(v1[1]*v2[1])
    if (pv == 0):
        r = True
    return r

def ej12():
    x = [1, 1.1024074512658109]
    y = [-1, 1/x[1]]
    if not SonOrtogonales(x,y):
        print("Algo sali ́o mal...")