ultimo:: [A] -> a
ultimo [] -> error
ultimo [x] -> x
ultimo (x:xs) = ultimo xs