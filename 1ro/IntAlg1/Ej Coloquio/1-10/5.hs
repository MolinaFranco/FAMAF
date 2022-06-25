repetir:: Num -> Num -> [Num]
repetir 0 x = []
repetir y x |y>=0 = x:repetir y-1 x
            |y<0 = error 