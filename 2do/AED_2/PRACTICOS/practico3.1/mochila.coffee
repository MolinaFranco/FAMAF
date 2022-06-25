
 #Typos


type Objeto = tuple
    id : Nat
    value: Float
    weight: Float
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
    
    do (resto > 0 && !is_empty_set(C_aux)) →    # mientras le entre algo a la mochila
        o_m.obj := select_obj(C_aux)    #trae el objeto con mejor valor
        if o_m.weight <= resto then     #si el objeto entra o no en la mochila
            resto := resto - o_m.weight
        fi
        addl(S,o_m)
        elim(C_aux,o_m.obj)
    od
    set_destroy(C_aux)
end fun


fun select_obj(C: Set of Objeto) ret r : Objeto     #te trae el objeto con mejor valor/peso
    var C_aux : Set of Objeto
    var o : Objeto  #objeto momentaneo
    var m : Float   #mejor valor 

    m := -∞
    C_aux := set_copy(C)
    
    do (not is_empty_set(C_aux)) →
        o := get(C_aux)                     # saca un objeto de la lista
        if (o.value > m) then        # se fija si su valor es mayor al mejor valor
            m := o.value
            r := o
        fi
        elim(C_aux,o)
    od
    set_destroy(C_aux)
end fun

