{1} slutter [] = []
{2} slutter (x:xs) = x:(x:slutter.xs)

{3} # [] = 0
{4} #(x:xs) = 1+#xs

HIPOTESIS INDUCTIVA
#(slutter.xs) = 2×#.xs

CASO BASE
#(slutter.[]) = 2×#.[]
{1 y 3}
#([]) = 2×0
{3 y multiplico}
0 = 0

CASO INDUCTIVO
#(_slutter.(x.xs)_) = 2×_#.(x.xs)_
{2 y 4}
_#(x:(x:slutter.xs))_ = 2×(1+#xs)
{4}
1+ _#(x:slutter.xs)_ = 2×(1+#xs)
{4}
_1+1_ + _#(slutter.xs)_ = _2×(1+#xs)_
{H.I y sumo y distributiva}
2 + 2×#.xs = 2 + 2×#xs