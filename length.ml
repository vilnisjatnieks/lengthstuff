(*     RECURSIVE          *)
fun len [] = 0
  | len (_::xs) = 1 + len xs
  ;

(*      TAIL RECURSIVE      *)
fun len_helper rsf [] = rsf
  | len_helper rsf (_::xs) = len_helper (1 + rsf) xs
  ;

fun len2 lst = len_helper 0 lst;

(*          FOLD             *)
fun fold [] base op = base
  | fold (x::xs) base op = fold xs (op x base) op
  ;

fun inc x y = y + 1;

fun len3 lst = fold lst 0 inc;

