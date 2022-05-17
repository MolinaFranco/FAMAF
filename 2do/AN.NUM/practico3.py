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

    def q(x):
        sum = 0
        for i in range(0, cnodos):
            sum += ys[i]*l(i, x)
        return sum

    return q

def ilagrange(xs, ys, z):
    '''
    Recibe una lista de nodos, sus imagenes y una lista de valores a evaluar por el polinomio
    z tiene que ser un ndarray
    '''
    return plagrange(xs, ys)(z)