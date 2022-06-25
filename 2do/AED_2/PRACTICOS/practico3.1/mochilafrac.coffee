
 #Typos


type Objeto = tuple
    id : Nat
    value: Float
    weight: Float
end tuple

type Obj_Mochila = tuple
    obj : Objeto
    fract : Float   #en cuantas partes podes fraccionar el objeto
end tuple


#Algoritmo



#esta mochila es pudiendo meter partes de objetos
#fract de obj_mochila es la fraccion de ese objeto que metes

fun mochila(W: Float, C: Set of Objeto) ret S : List of Obj_Mochila
    var o_m : Obj_Mochila 
    var resto : Float
    var C_aux : Set of Objeto
    
    S:= empty_list()    # lista donde guardare la solucion
    C_aux:= set_copy(C) # copio el array
    resto:= W           # el resto es el peso que acepta la mochila
    
    do (resto > 0) →    # mientras le entre algo a la mochila
        o_m.obj := select_obj(C_aux)    #trae el objeto con mejor valor/peso
        if o_m.obj.weight <= resto then     #si el objeto entra o no en la mochila
            o_m.fract := 1.0
            resto := resto - o_m.obj.weight
        else 
            o_m.fract := resto/o_m.obj.weight
            resto := 0
        fi
        addl(S,o_m)
        elim(C_aux,o_m.obj)
    od
    set_destroy(C_aux)
end fun


fun select_obj(C: Set of Objeto) ret r : Objeto     #te trae el objeto con mejor valor/peso
    var C_aux : Set of Objeto
    var o : Objeto  #objeto momentaneo
    var m : Float   #promedio valor peso

    m := -∞
    C_aux := set_copy(C)
    
    do (not is_empty_set(C_aux)) →
        o := get(C_aux)                     # saca un objeto de la lista
        if (o.value/o.weight > m)           # se fija si su promedio es mayor al mejor promedio
            then m := o.value/o.weight
            r := o
        fi
        elim(C_aux,o)
    od
    set_destroy(C_aux)
end fun

