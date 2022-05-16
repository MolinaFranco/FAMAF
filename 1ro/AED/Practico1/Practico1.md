-  1
    ```
    a. No
    b. Si
    c. No
    d. No   
    e. No
    ```

-  2
    ```
    a. 〈 ∀ i : 0 ≤ i < #xs : xs ! i > 140 〉
        Todo elemento de la lista xs es mayor a 140
        Variables libres: xs
        Variables ligadas: i

    b. 〈 ∃ i : 0 ≤ i < #xs : xs ! i = x 〉
        Existe un elemento de la lista xs q es igual a x
        Variables libres: xs, x
        Variables ligadas: i
    c. 〈 ∀ i : 0 ≤ i < #xs : 〈 ∃ j : 0 ≤ j < #ys : xs ! i = ys ! j 〉 〉
        Para todo elemento de la lista xs, existe un elemento de la lista ys tal que son iguales
        Variables libres: xs, ys
        Variables ligadas: i, j
    d. 〈 ∀ i : 0 ≤ i < #xs − 1 : xs ! i ≤ xs ! (i + 1) 〉
        Para todo elemento de xs, el valor del siguiente elemento es mayor igual 
        Variables libres: xs
        Variables ligadas:i
    ```

-  3
    ```
    a.  xs= [141,134,137,87]
        〈 ∀ i : 0 ≤ i < #xs : xs ! i > 140 〉
        〈 ∀ i : 0 ≤ i < 4 : xs ! i > 140 〉
        (xs ! 0 > 140)∧(xs ! 1 > 140)∧(xs ! 2 > 140)∧(xs ! 3 > 140)
        (141 > 140)∧(134 > 140)∧(137 > 140)∧(87 > 140)
        (True)∧(False)∧(False)∧(False)
        False
    b. Ja
    c. Ja
    d. Ja
    ```
- 4
    ```
    a. 
        〈 ∏ i : 1 ≤ i ≤ n : i 〉
        El producto de todos los elementos entre 1 y n
        El factorial de n
        Variables libres: n
        Variables ligadas: i
    b. 〈 ∑ i : 0 ≤ i < #xs : xs!i 〉/ #xs
        La suma de todos los elementos pertenecientes a xs dividido la cantidad de elementos
        El promedio de los elementos de xs
        Variables libres: xs
        Variables ligadas: i
    c. 〈 Max i : 0 ≤ i < #xs : xs!i 〉<〈 Min i : 0≤i < #ys : ys!i 〉
        El maximo de los elementos de la lista xs, es menor al minimo de los elementos de la lista ys
        Variables libres: xs, ys
        Variables ligadas: i
    d. 〈 ∃i, j: (2 ≤ i < n) ∧ ( 2 ≤ j < n) : i∗j = n 〉
        Existe dos elementos elemento entre 2 y n tal que su producto es n
        Variables libres: n
        Variables ligadas: i, j
    ```
- 5
    ```
    a. n= 5
        〈 ∏ i : 1 ≤ i ≤ n : i 〉
        〈 ∏ i : 1 ≤ i ≤ 5 : i 〉
            1.2.3.4.5
            5!
    b. xs= [6,9,3,9,8]
        〈 ∑ i : 0 ≤ i < #xs : xs!i 〉/ #xs
        〈 ∑ i : 0 ≤ i < 5 : xs!i 〉/ 5
        ((xs!0)+(xs!1)+(xs!2)+(xs!3)+(xs!4)) / 5
        (6+9+3+9+8) / 5
    ```
- 6
    ```
    a. m es la cantidad de mas contagios diarios en el registrocasos.
        m : Nat
        casos : [Nat]
        m = <Max i : 0 <= i #xs : xs!i>
    b. La posicion de la lista xs donde esta su mayor elemento. (Para discutir en clase)
        posicion : Nat = i
        i = <Max i : 0 <= i < #xs : xs!i>
        i = <Min j : 0<=j<#xs & xs!j = <Max k : 0 <= k < #xs : x> : j>
    
    c. La suma de los elementos dexsentreiei+ 7.
    
    d. Los casos del d ́ıadson mayores al promedio m ́ovil (promedio de los siete d ́ıas anteriores ad).
    
    e. La suma de los elementos en posici ́on par dexs
    
    f. n es potencia de 2.
    
    ```
