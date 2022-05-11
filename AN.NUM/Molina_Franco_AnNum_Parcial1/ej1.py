from helper import fact

def serie_seno(x):
    s = 0
    for n in range(0,5):
        s = s + ((((-1)**n)*(x**(2*n+1)/fact(2*n+1))))
    return s

