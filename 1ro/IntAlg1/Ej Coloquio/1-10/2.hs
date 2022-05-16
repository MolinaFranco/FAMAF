tamanos:: [[a]] -> [Num]
tamanos [[]] -> []
tamanos [x:xs] = [#x : tamanos xs] 