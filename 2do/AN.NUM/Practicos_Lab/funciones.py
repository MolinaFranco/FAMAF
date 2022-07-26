

-- practico 1 --------------------------------------------------------------------------

mayor y menor numero positivo en punto flotante
=> "ej3"

resolucion de ecuaciones de segundo grado
=> "ej8"

algoritmo de Horner
=> "horn"

-- practico 2 --------------------------------------------------------------------------

metodo de biseccion para hallar una raiz
=> "rbisec"

Newton
=> "rnewton"

metodo de iteraci ́on de punto fijo para hallar un punto fijo
=> "ripf"

-- practico 3 --------------------------------------------------------------------------

formula de Lagrange tener como entrada (x,y,z) 
=> "ilagrange"

Newton del polinomio interpolante diferencias divididas.
=> "pnewton" o "pnewtonprim" de willi 

Funcion interpolante que usa splines cubicos
=> "cubic_inter"

-- practico 4 --------------------------------------------------------------------------

leer los datos almacenados en el archivo
=> "ej1a" mirar

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

ajuste lineal 
=> "ajuste_lineal"

ajuste polinomial 
=> "ej2"

-- practico 5 --------------------------------------------------------------------------

integre numericamente usando las reglas compuestas
=> "simpson" "trapecio" "pm" => "intenumcomp"

errores absolutos de integrar numericamente np.exp(-x)
=> "ej2"

aproximacion num ́erica
=> "senint"

# scipy.integrate.quad
# Integre func de a a b (posiblemente intervalo infinito) 

-- practico 6 --------------------------------------------------------------------------

sistema lineal Ax=b   
=>  "soltrsup" y "soltrinf"

eliminación Gaussiana   
=>  "egauss" que implemente el método de 

sistemas lineales Ax=b usando eliminación Gaussiana   
=> "soleg" que resuelva 


-- pdf ---------------------------------------------------------------------------------

plt.plot(x, np.sin(x), label="Seno")
plt.plot(x, senint(x), "o", label="Integral numérica desde 0 a ese punto")
plt.savefig("p5ej3.png")