use "problem_1.sml";
use "problem_2.sml";
use "problem_3.sml";

(* All tests should evaluate to true. *)

(* Tests problem 1 *)

val test1_Problem_1 = alternate([]) = 0; 
val test2_Problem_1 = alternate([7]) = 7;
val test3_Problem_1 = alternate([1, 2, 3]) = 2; 
val test4_Problem_1 = alternate([1, 2, 3, 4]) = ~2; 
val test5_Problem_1 = alternate([1, ~2, 3, ~4]) = 10; 
val test6_Problem_1 = alternate([~1, 2, ~3, 4]) = ~10;

(* Tests problem 2 *)

val test1_Problem_2 = min_max([7]) = (7, 7);
val test2_Problem_2 = min_max([1, 2, 3]) = (1, 3);
val test3_Problem_2 = min_max([1, 2, 3, 4]) = (1, 4);
val test4_Problem_2 = min_max([1, ~2, 3, ~4]) = (~4, 3);
val test5_Problem_2 = min_max([20, 5, 4, 123, 3, ~1, 0, 100, 13]) = (~1, 123);

(* Tests problem 3 *)

val test1_Problem_3 = cumsum([1]) = [1];
val test2_Problem_3 = cumsum([1, 4]) = [1, 5];
val test3_Problem_3 = cumsum([1, 4, 20]) = [1, 5, 25];
val test4_Problem_3 = cumsum([1, 4, 20, 100]) = [1, 5, 25, 125];
val test5_Problem_3 = cumsum([1, 4, 20, 100, 1000]) = [1, 5, 25, 125, 1125];
val test6_Problem_3 = cumsum([1, ~2, 3, ~4]) = [1, ~1, 2, ~2];
