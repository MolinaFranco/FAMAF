c[i]
d[i]

1<=i<=n
1<=j<=k

m(i,j)  |c[i]                       j=k 
        |d[j]                       i=n and j<k
        |m(i,j+1) + m(i+1,j)        j<k and i<n

                            <>

fun m(c : array[1..n] of nat, d : array[1..k] on nat) ret R : nat
w1
    M : array[1..n,1..k]

    for i:=1 to n do
        M[i,k]:=c[i]
    od

    for j:=1 to k do
        M[j,n]:=d[j]
    od

    for i:=n-1 downto 1 do
        for j:=k-1 downto 1 do
            M[i,j]:= M[i,j+1] + M[i+1,j] 
        od
    od

    R := M[1,1]
end fun

        

