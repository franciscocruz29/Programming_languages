use "problem_1.sml";

(* All tests should evaluate to true. *)

(* Tests problem 1 *)

val test1_Problem_1 = alternate([]) = 0; 
val test2_Problem_1 = alternate([7]) = 7;
val test3_Problem_1 = alternate([1, 2, 3]) = 2; 
val test4_Problem_1 = alternate([1, 2, 3, 4]) = ~2; 
val test5_Problem_1 = alternate([1, ~2, 3, ~4]) = 10; 
val test6_Problem_1 = alternate([~1, 2, ~3, 4]) = ~10;
