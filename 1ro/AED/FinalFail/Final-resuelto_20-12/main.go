package main

import (
	"fmt"
)

func main() {
	A := []int{3, -1, 1, -1}
	M := len(A)

	// Programa derivado
	var n, m, s int
	if M <= 0 {
		n, s, m = 0, 0, M
	} else if M > 0 {
		n, s, m = 1, 0, M
	}

	for m > 0 {
		if s+A[m-1] < m-1 {
			n, s, m = n+1, s+A[m-1], m-1
		} else if s+A[m-1] >= m-1 {
			n, s, m = n, s+A[m-1], m-1
		}
	}

	fmt.Printf("Resultado: %v\n", n)

}
