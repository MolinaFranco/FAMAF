siguientes::[Num] -> [(Num,Num)]
siguientes [] = []
siguientes (x:xs) = (x,x+1):siguientes xs

siguientes [11,7] = 
= (11,11+1): siguientes [7]
= (11,12): (7,7+1): siguientes []
= (11,12): (7,8): []
= [(11,12),(7,8)]