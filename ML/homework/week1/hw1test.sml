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

val dates_test2 = [(2023, 4, 15), (2022, 12, 25), (2023, 4, 5), (2024, 4, 20), (2023, 8, 12)];

val test_dates_1_2 = number_in_month(dates_test2, 4); (* Expected result: 3 *)
val test_dates_2_2 = number_in_month(dates_test2, 12); (* Expected result: 1 *)
val test_dates_3_2 = number_in_month(dates_test2, 1); (* Expected result: 0 *)

(* Tests problem 3 *)

val dates_test3 = [(2024, 4, 15), (2024, 5, 20), (2024, 6, 25), (2024, 7, 30)];

val test_dates_1_3 = number_in_months(dates_test3, [4, 5]); (* Expected result: 2 *)
val test_dates_2_3 = number_in_months(dates_test3, [4, 5, 6]); (* Expected result: 3 *)
val test_dates_3_3 = number_in_months(dates_test3, [7]); (* Expected result: 1 *)
val test_dates_4_3 = number_in_months(dates_test3, [1, 2]); (* Expected result: 0 *)

