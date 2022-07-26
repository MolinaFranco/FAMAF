
1) mi criterio de seleccion voraz es siempre que se pueda subir al pasajeroque antes se baje

2)

    struct pasajero: tuple
                        s : nat,
                        b : bajada
                    end tuple


3)

el algoritmo ira eligiendo al pasajero que asntes se baje y que se pueda subir al colectivo,
lo subira y actualizara el estado del bondi y por ultimo actualizara la lista de posibles pasajeros


4)

fun bondi(in pasajeros : Set of pasajero) ret cant : nat
    var m_pasajero : pasajero
    var parada : nat
    var c_pasajeros : Set of pasajero

    c_pasajeros := copy_set(pasajeros)
    parada := 0
    cant := 0

    while(!is_empty(c_pasajeros))do
        m_pasajero := get_pasajero(c_pasajeros, parada)
        elim(c_pasajeros)
        parada := m_pasajero.b
        actualizar(c_pasajeros, parada)
        cant++
    od
end fun

fun get_pasajero(in pasajeros : Set of pasajero) ret min_pasajero : pasajero
    aux_pasajero : pasajero
    var c_pasajeros : Set of pasajero

    c_pasajeros := copy_set(pasajeros)

    min_pasajero := get(c_pasajeros)
    elim(c_pasajeros, min_pasajero)

    while(!is_empty(c_pasajeros))do
        aux_pasajero := get(c_pasajero)
        if( aux_pasajero.b < min_pasajero.b )then
            min_pasajero := aux_pasajero
        elim(c_pasajeros, aux_pasajero)
    od
end fun

proc actualizar(in/out pasajeros : Set of pasajero, in parada : nat) 
    aux_pasajero : pasajero
    var c_pasajeros : Set of pasajero

    c_pasajeros := copy_set(pasajeros)

    while(!is_empty(c_pasajeros))do
        aux_pasajero := get(c_pasajero)
        if( aux_pasajero.s < parada )then
            elim(pasajeros, aux_pasajero)
        fi
        elim(c_pasajeros, aux_pasajero)
    od
end fun