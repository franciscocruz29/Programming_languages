use "hw1.sml";

(* Tests problem 1 *)

val test1 = is_older((2022, 3, 15), (2023, 7, 20)); (* Expected result: true *)
val test2 = is_older((2025, 11, 5), (2024, 9, 18)); (* Expected result: false *)
val test3 = is_older((2020, 2, 28), (2020, 5, 12)); (* Expected result: true *)
val test4 = is_older((2018, 7, 10), (2018, 7, 15)); (* Expected result: true *)
val test5 = is_older((2021, 9, 21), (2021, 9, 21)); (* Expected result: false *)


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

