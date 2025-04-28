(*     RECURSIVE          *)
fun len [] = 0
  | len (_::xs) = 1 + len xs
  ;

(*      TAIL RECURSIVE      *)
fun len_helper rsf [] = rsf
  | len_helper rsf (_::xs) = len_helper (1 + rsf) xs
  ;

fun len2 lst = len_helper 0 lst;


(*        FOLD         *)
(* sources: class notes *)
(* fix: swapped the order of base and next in the function signature *)
fun fold [] next base = base
  | fold (x::xs) next base = fold xs next (next x base)
  ;

fun inc x y = y + 1;
fun len3 lst = fold lst inc 0;













