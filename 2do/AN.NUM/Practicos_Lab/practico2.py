from cmath import tan
from math import cos, fabs, inf, sqrt, tan, exp
import sys


def rbisec(fun,I,err,mit):
    # I intervalo
    # err tolerancia error
    # mit maximo de iteraciones
    a = I[0]
    b = I[1]
    min = fun(a)
    max = fun(b)
    dist = b-a
    hx = []
    hf = []

    if((min*max)>0):
        print("brake: la funcion on tiene raices en el intervalo")
        return (hx,hf)
    
    for i in range(mit):
        dist = dist/2
        mid = a+dist
        hx.append(mid)
        val = fun(mid)
        hf.append(val)
        
        if((abs(dist)<err) or (abs(val)<sys.float_info.epsilon)):
            print("Se encontro solucion")
            break

        if ((val*min)<0):
            b = mid
            max = val

        else:
            a = mid
            min = val

    return (hx,hf)
      
    #hx = [x1, . . . , xN ] es una lista que representa el historial de puntos medios
    #hf = [f (x1), . . . , f (xN )] el historial de los respectivos valores funcionales


def lab2ej2a(x):
    return (2*x)-math.tan(x)

def minPos(hx):
    return hx.index(min([i for i in hx if i>0]))


#(hx,hy) = rbisec(lab2ej2a, [0.8, 1.4], 1e-5, 100)
#print(hy[minPos(hy)])
#print(minPos(hy))


def fun_lab2ej2b(x):
    return ((x**2)-3) 

#(hx,hy) = rbisec(fun_lab2ej2b, [1, 2], 1e-5, 100)
#print("iterciones: " + str(minPos(hy)) + " x:" + str(hx[minPos(hy)]) + " f(x):" + str(hy[minPos(hy)]))


def rnewton(fun,x0,err,mit):
    (ap,apd) = fun(x0)  #es una funcion que te retorna tu f(x) y f'(x)
    hx = []
    hf = []

    if (abs(ap) < sys.float_info.epsilon):
        print("brake: la funcion on tiene raices en el intervalo")
        return (hx,hf)

    for i in range(mit):        
        (f0,f0p) = fun(x0)
        x1 = x0-(ap / f0p)
        (f1,f1p) = fun(x1)
        ap = f1

        hx.append(x1)
        hf.append(ap)

        if (abs(x1-x0)/abs(x0)<err or abs(f1)<err or abs(ap)<sys.float_info.epsilon):
            return (hx,hf)
        
        x0 = x1

    return (hx,hf)


#hx= [x1, . . . , xN ] es una lista que representa el hist ́orico de puntos generados 
#hf= [f (x1), . . . , f (xN )] el hist ́orico de los respectivos valores funcionales.

def aux4(a):
    def f(x):
        return (((x**3) - a),(3*(x**2)))
    return (f)

def ej4(a):
    (hx,hf) = rnewton(aux4(a),a,(10**(-6)),1000000)
    #return (minPos(hf), hx[minPos(hf)], hf[minPos(hf)])
    return hx[-1]

#print(ej4(2))

# "partiendo de un punto inicial x0. La funci ́on debe llamarse"
# "ripf”, y tener como entrada (fun,x0,err,mit) donde fun es una funci ́on que dado x
# "retorna φ(x), x0 es un punto en R, err es la tolerancia deseada del error y mit es el n ́umero
# "m ́aximo de iteraciones permitidas. El algoritmo debe finalizar en la k- ́esima iteraci ́on si"

def ripf(fun,x0,err,mit):
    hx = []
    i = 1
    while(i<=mit):
        p = fun(x0)
        hx.append(p)
        if abs(p - x0)<err:
            return hx
        ++i
        x0 = p
    return hx

def fun_lab2ej6(x): 
    return 2**(x-1)

# derivada 2**(x-1) * ln(2)
# Para cualquier x < 1, esta derivada es < 1
# tiende a 0(+) cuando x -> -Inf
# la funcion converge con cualquier x0 en (-Inf,1)

def ej6():
    hx = ripf(fun_lab2ej6, 0, 1e-5, 100)
    lst = hx[-1]
    hx2 = ripf(fun_lab2ej6, 1, 1e-5, 100)
    lst2 = hx2[-1]
    hx3 = ripf(fun_lab2ej6, -10, 1e-5, 100)
    lst3 = hx3[-1]
    print(
    f"aprox de pf de 2x=2**x con x0(0) es {lst}, f({lst})={fun_lab2ej6(lst)},  cantidad de it {len(hx)}")
    print(
    f"aprox de pf de 2x=2**x con x0(1) es {lst2}, f({lst2})={fun_lab2ej6(lst2)}, cantidad de it {len(hx2)}")
    print(
    f"aprox de pf de 2x=2**x con x0(-10) es {lst3}, f({lst3})={fun_lab2ej6(lst3)}, cantidad de it {len(hx3)}")

#ej6()

def lab2ej7bisec(x):
    def ec(y): 
        return y - exp(-((1-x*y)**2))
    hy, _ = rbisec(ec, [0, 1.5], 1e-5, 200)
    return hy[-1]

#print(f"u(0.7)={lab2ej7bisec(0.7)}, segun biseccion")
#u(0.7)=0.8475322723388672, segun biseccion

def lab2ej7newton(x):
    def ec(y): 
        return ((y - exp(-((1-x*y)**2))),())

    # Al despejar la ecuacion y = e**(-(1-xy)**2),
    # Obtenemos ln y = -((1-xy)**2), osea que ln y<0
    # Por lo tanto y esta entre 0 y 1.
    # Uso entonces y0 = 0.5

    hy, _ = rnewton(ec, 0.5, 1e-5, 200)
    return hy[-1]

#no calcule la derivada
#print(f"u(0.7)={lab2ej7newton(0.7)}, segun newton")


def lab2ej7ipf(x):
    def ec(y): 
        return y - exp(-((1-x*y)**2))

    hy = ripf(ec, 0.5, 1e-5, 200)
    return hy[-1]

#print(f"u(0.7)={lab2ej7ipf(0.7)}, es punto fijo")
# u(0.7)=-3.4186874203720286, es punto fijo

def ej8():
    def ec(x): return ((tan(x))/x**2)
    def ecprim(x): return ((x*sin(x)**(-2)-2*tan(x))/x**3)
    def ecprim2(x): return ()
    

