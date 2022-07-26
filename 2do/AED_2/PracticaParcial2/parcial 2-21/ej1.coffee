n           matrerias cursadas
d[i]        dias de examenes
c[i]        dias previos de estudio

dia del examen solo eso
d y c soin Nat
dia inicial 1

mayor cnatidad de materias que podes rendir

A) criterio?

elegir la materia que se rinda antes posible de acuerdo al dia en el que estoy

B)

type materia: tuple
                examen : Nat
                estudio : Nat
              endtuple

yo generaria una copia con las materias en las cuales voy buscando la materia mas optima y posible,
luego a elegirla, actualizo el dia en el que estoy y la elimino de las posibles
y por ultimo al actualizar mi fecha, elimino las materias que tya no son posibles 

D)

fun estudio(materias : Set of materia)ret cant : Nat

    c_materias : Set of materia
    c_materias := copy_set(materias)

    dia : Nat
    dia := 1

    mejormateria : materia

    while (!is_empty(c_materias))do
        updatematerias(c_materias,dia)
        mejormateria := getmateria(c_materias)
        dia := mejormateria.examen
        cant++
        updatematerias(c_materias,dia)
    od
    destoy(c_materias)
endfun

fun getmateria(materias : Set of materia)ret mej : materia
    c_materias : Set of materia
    c_materias := copy_set(materias)

    mej := get(c_materias)
    eli(c_materias, mej)

    materiaux : materia

    while (!is_empty(c_materias))do
        materiaux := get(c_materias)
        if(materiaux.examen < mej.examen)tehn
            mej := materiaux
        fi
        elim(c_materias, materiaux)
    od
    destoy(c_materias)
endfun

proc updatematerias(in/out materias : Set of materi , in dia : Nat)
    c_materias : Set of materia
    c_materias := copy_set(materias)

    materiaux : materia

    while (!is_empty(c_materias))do
        materiaux := get(c_materias)
        if(materiaux.examen - materiaux.estudio <= dia)then
            elim(materias, materiaux)
        fi
        elim(c_materias, materiaux)
    od
    destoy(c_materias)
endfun




