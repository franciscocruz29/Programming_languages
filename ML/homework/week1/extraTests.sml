use "extra.sml";

(* Tests problem 1 *)

val test1_1 = alternate([]); (* Expected result: 0 *)
val test2_1 = alternate([7]); (* Expected result: 7 *)
val test3_1 = alternate([1, 2, 3]); (* Expected result: 2 *)
val test4_1 = alternate([1, 2, 3, 4]); (* Expected result: -2 *)
val test5_1 = alternate([1, ~2, 3, ~4]); (* Expected result: 10 *)
val test6_1 = alternate([~1, 2, ~3, 4]); (* Expected result: -10 *)
