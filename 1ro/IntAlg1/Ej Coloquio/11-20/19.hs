# Monotonia de la conjuncion 

(p=>q) => ((p^r)=>(q^r))
{caracterizacion de la implicacion ×3}
¬(¬pvq) v (¬(p^r)v(q^r))
{distributividad}
¬(¬pvq) v (¬(p^r)v(q^r))
{De Morgan para la conjuncion}
¬(¬pvq) v ((¬pv¬r)v(q^r))
{De Morgan para la disyunci ́on}
(¬¬p^¬q) v ((¬pv¬r)v(q^r))
{doble negacion}
(p^¬q) v (¬p v¬r) v (q^r)
{asociatividad de la disyuncion}
((p^¬q) v ¬p) v (¬r v (q^r))
{distributiva}
((pv¬p) ^ ¬qv¬p) v (¬rvq ^ ¬rvr)
{Tercero excluido}
(True ^ ¬q v ¬p) v (¬r v q ^ True)
{Neutro de la conjunci ́on}
¬q v ¬p v ¬r v q
{acomodo}
¬q v q v ¬p v ¬r
{Tercero excluido}
True v ¬p v ¬r
{Elemento absorbente de la disyunci ́on}
True