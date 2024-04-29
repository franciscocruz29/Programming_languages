use "hw1.sml";

(* Tests problem 1 *)

val test1a = (2022, 3, 15)
val test1b = (2023, 7, 20)
val result1 = is_older(test1a, test1b) (* Expected result: true *)


val test2a = (2025, 11, 5)
val test2b = (2024, 9, 18)
val result2 = is_older(test2a, test2b) (* Expected result: false *)

		      
val test3a = (2020, 2, 28)
val test3b = (2020, 5, 12)
val result3 = is_older(test3a, test3b) (* Expected result: true *)

		      
val test4a = (2018, 7, 10)
val test4b = (2018, 7, 15)
val result4 = is_older(test4a, test4b) (* Expected result: true *)

		      
val test5a = (2021, 9, 21)
val test5b = (2021, 9, 21)
val result5 = is_older(test5a, test5b) (* Expected result: false *)


(* Tests problem 2*)

val dates = [(2023, 4, 15), (2022, 12, 25), (2023, 4, 5), (2024, 4, 20), (2023, 8, 12)];

val test1 = number_in_months(dates, 4); (* Expected result: 3 *)
val test2 = number_in_months(dates, 12); (* Expected result: 1 *)
val test3 = number_in_months(dates, 1); (* Expected result: 0 *)

		      
