(* 'a list * 'a list -> 'a list*)
fun append (xs, ys) = 
  case xs of
    [] => ys
  | x :: xs' => x :: append(xs', ys)

(* string list * string list -> string list*)
val ok1 = append(["hi", "bye"], ["programming", "languages"]);

(* int list * int list -> int list*)
val ok2 = append([1, 2, 3], [4, 5, 6]);


val not_ok = append(["hi", "bye"], [1, 2, 3]);
