## Programación lineal 

linprog(c[, A_ub, b_ub, A_eq, b_eq, límites, ...])

Programación lineal: minimizar una función objetivo lineal sujeta a restricciones de igualdad y desigualdad lineal.

La linprogfunción admite los siguientes métodos:

linprog(método='simplex')
linprog(método='punto-interior')
linprog(método='simplex revisado')
linprog(método='altos-ipm')
linprog(método='highs-ds')
linprog(método='máximos')

Los métodos símplex, punto interior y símplex revisado admiten funciones de devolución de llamada, como:

linprog_verbose_callback(res)

Una función de devolución de llamada de muestra que demuestra la interfaz de devolución de llamada linprog.