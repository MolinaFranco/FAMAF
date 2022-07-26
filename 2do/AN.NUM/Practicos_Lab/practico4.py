import numpy as np
import matplotlib.pyplot as plt
import matplotlib.pyplot as plt


def ajuste_lineal(x,y):
    m = len(x)
    #hago las sumatorias
    sum_x = np.dot(x, np.ones(m))
    sum_x_cuadrado = sum(x**2)
    sum_xy = np.dot(x, y)
    sum_y = np.dot(y, np.ones(m))

    #calculo los dos a0 a1 con las ecu normales
    cociente = ((m*sum_x_cuadrado) - (sum_x**2))
    a0 = (sum_x_cuadrado*sum_y - sum_xy*sum_x)/cociente
    a1 = (m*sum_xy - sum_x * sum_y)/cociente
    #retorno la funcion armada con mis a y que sea valuable con un v
    return lambda v:(a1*v+a0)

def ej1a():

    # Datos 
    #datos = np.loadtxt("../datos/datos1a.dat")
    (x,y) = np.loadtxt("datos/datos1a.dat", unpack=True)

    # [ first_row:last_row , column_0 ]
    # x = datos[:,0]
    # y = datos[:,1]

    #elimino los nulos
    mask = ~np.isnan(y)
    x = x[mask]
    y = y[mask]

    ajuste = ajuste_lineal(x,y)

    def fun1c(x): return (3/4) * x - (1/2) 

    #x = np.linspace(0, 10)
    xs = np.linspace(0, 10, 20)

    ys = fun1c(xs)

    #randomizamos un poco los ys
    ys = ys + 0.5 * np.random.randn(len(ys))

    # ajuste = ajuste_lineal(x, yd)
    ajuste = np.poly1d(np.polyfit(xs, ys, 1)) 
    # polyfit devuelve los coeficientes del polinomio
    #con poly1d obtenemos un polinomio que podemos evaluar(callable)


    plt.plot(xs, ys, "o", label="Datos dispersados")
    plt.plot(x, ajuste(x), label="Ajuste")
    plt.plot(x, fun1c(x), label="Funcion")
    plt.legend()
    plt.savefig("p4ej1a.png")

#ej1a()

def ej2(ab):

    def fun2a(x):
        return np.arcsin(x)

    def fun2b(x):
        return np.cos(x)

    xs = np.linspace(0, 1, 50)
    
    ys = fun2a(xs)
    if(ab == "b"):
        ys = fun2b(xs)

    #ys = ys + randn(len(y))

    x_graph = np.linspace(0, 1, 200)

    for n in range(1,6):
        # polyfit returns the coefficients for a polynomial p(x) of degree n that is a best fit 
        # poly1d Construct the polynomial
        ajuste = np.poly1d(np.polyfit(xs, ys, n)) 
        # Imagen de x en ajuste
        ya = ajuste(xs)
        residuo = sum(np.abs(ys-ya))
        print(f"Residuo grado {n}: {residuo}")
        plt.plot(x_graph, ajuste(x_graph), label=f"Ajuste grado {n}")

    # plt.plot(x, ys, "o", label="Datos")
    # plt.plot(x_graph, func2b(x_graph), label="Cos")
    # plt.legend()
    # plt.savefig("mygraph.png")
    # plt.show() para ubuntu


def ej3a():

    # Datos 
    #datos = np.loadtxt("../datos/datos1a.dat")
    datos = np.loadtxt("datos/datos3a.dat")
    x = datos[0]
    y = datos[1]

    y = abs(y + 5 * np.random.randn(len(y)))

    x = x[~np.isnan(y)]
    y = y[~np.isnan(y)]

    
    # def f1(x): return C * x**A
    # ln(f(x)) = ln(C) + A*ln(x)
    # yn = a*xn + cn  

    # np.log hace el logaritmo
    xn = np.log(x)
    yn = np.log(y)
    #busco los mejores a y cn
    a, cn = np.polyfit(xn, yn, 1)
    c = np.exp(cn)

    def ajuste(x): return c*x**a

    plt.plot(x, y, "o", label="Datos")
    plt.plot(x, ajuste(x), label="Ajuste")
    plt.legend()
    plt.savefig("p4ej3a.png")
    # plt.show()

#ej3a()

def ej3b():

    # Datos 
    #datos = np.loadtxt("../datos/datos1a.dat")
    datos = np.loadtxt("datos/datos3a.dat")
    x = datos[0]
    y = datos[1]

    y = abs(y + 5 * np.random.randn(len(y)))

    x = x[~np.isnan(y)]
    y = y[~np.isnan(y)]

    
    # y   ~ x / A * x + B
    # x/y ~ A * x + B
    # xn ~ A * x + B
    
    #busco los mejores a y cn
    A, B = np.polyfit(x, x/y, 1)

    def ajuste(x): return x/(A*x+B)

    plt.plot(x, y, "o", label="Datos")
    plt.plot(x, ajuste(x), label="Ajuste")
    plt.legend()
    plt.savefig("ej3b.png")
    # plt.show()


def ej4():

    datos = np.loadtxt("datos/coviditalia.csv", delimiter=",", dtype=str)
    #si lo hago asi me permite sacarlos con tipos distintos
    dates = datos[:, 0]
    cases = datos[:, 1].astype(int)

    # posibilidad willi
    # No puedo operar sobre fechas, asi que para hacer el ajuste enumero los dias
    xs = np.array(range(1, len(dates)+1))

    # quedan numero demaciados grandes y se rompe
    # xs = []
    # for d in range(0,len(dates)):
    #     xs.append(int(dates[d].replace("-","")))
    
    # y(x) = ae ** bx
    # log(y) = log(ae ** bx)
    # ly = la + le * bx
    # ly = la + bx

    print(xs)

    yl = np.log(cases)
    b, la = np.polyfit(xs, yl, deg=1)
    a = int(np.exp(la))

    

    def ajuste(x): return a * np.exp(b*x)

    plt.plot(xs, cases, "o", label="Casos Covid")
    plt.plot(xs, ajuste(xs), label="Ajuste")
    plt.legend()
    plt.savefig("p4eJ4.png")

ej4()