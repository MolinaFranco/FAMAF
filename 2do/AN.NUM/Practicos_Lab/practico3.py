from math import cos, fabs, pi
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d
from numpy import arange, linspace, loadtxt, isnan, asarray, append
import numpy as np

def plagrange(xs, ys):
    '''
    A partir de una lista de nodos y otra de sus imagenes, 
    usa el polinomio interpolante de Lagrange para construir un polinomio
    '''
    cnodos = len(xs)

    # Primero armo los polinomios basicos de lagrange
    def l(i, x):
        term = 1
        for j in range(0, cnodos):
            if(j != i):
                term *= (x-xs[j])/(xs[i]-xs[j])
        return term

    # Despues armamos la funcion a evaluar usando xs e ys
    def p(x):
        sum = 0
        for i in range(0, cnodos):
            sum += ys[i]*l(i, x)
        return sum

    return p

def ilagrange(xs, ys, z):
    '''
    Recibe una lista de nodos xs, sus imagenes ys y una lista de valores a evaluar por el polinomio
    z tiene que ser un ndarray
    '''
    return plagrange(xs, ys)(z)

def difdiv(xs, ys, n):

    c = []

    for i in range(0,n):
        subarray = [ys[i]]
        for j in range(1,n):
            subarray.append(0)
        c.append(subarray)

    for j in range(1,n):
        for i in range(0, n-j):
            c[i][j]=(c[i+j][j-1]/c[i][j-1])/(xs[i+j]-xs[i])
    return c

def pnewton(xs,ys):
    
    n = len(xs)-1

    # para lagrange
    # def li(i, x):
    #     pro = 1
    #     for j in range(0,n):
    #         if(j!=i):
    #             pro = pro * (x-xs[j])/(xs[i]-xs[j])
    #     return pro

    # para las prod
    def li(i, x):
        pro = 1
        for j in range(0,i-1):
            pro = pro * (x-xs[j])
        return pro
    
    def p(x):
        sum = 0
        c = difdiv(xs,ys,n)
        for i in range(0,n):
            sum += c[0][i]*li(i, x)
        return sum    

    return p

def inewton(xs, ys, z):
    '''
    Recibe una lista de nodos, sus imagenes y una lista de valores a evaluar por el polinomio.
    z tiene que ser un ndarray
    '''
    return pnewton(xs, ys)(z)

print(inewton([1,2,3],[3,6,9],3))















de willi

def pnewton(xs, ys):
    cnodos = len(xs)

    def ddivididas(i, j):
        assert(i <= j)
        if(i == j):
            return ys[i]
        return (ddivididas(i+1, j)-ddivididas(i, j-1))/(xs[j]-xs[i])

    def prod_raro(i, x):
        r = 1
        for j in range(0, i):
            r *= (x-xs[j])
        return r

    def p(x):
        sum = 0
        for i in range(0, cnodos):
            c = ddivididas(0, i)
            sum += c*prod_raro(i, x)
        return sum

    return p



def pnewtonprim(xs, ys):
    cnodos = len(xs)

    def ddivididas(i, j):
        assert(i <= j)
        if(i == j):
            return ys[i]
        return (ddivididas(i+1, j)-ddivididas(i, j-1))/(xs[j]-xs[i])

    def prod_raro(i, x):
        r = 1
        for j in range(0, i):
            r *= (x-xs[j])
        return r

    def prod_raro_prim(i, x):
        r = 1
        if(i == 0):
            r = 0
        else:
            r = prod_raro_prim(i-1, x)*(x-xs[i-1]) + prod_raro(i-1, x)
        return r
        

    def p(x):
        sum = 0
        for i in range(0, cnodos):
            c = ddivididas(0, i)
            sum += c*prod_raro_prim(i, x)
        return sum

    return p