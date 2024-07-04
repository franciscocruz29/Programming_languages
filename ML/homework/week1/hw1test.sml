use "hw1.sml";

(* Tests problem 1 *)

val test1_1 = is_older((2022, 3, 15), (2023, 7, 20)); (* Expected result: true *)
val test2_1 = is_older((2025, 11, 5), (2024, 9, 18)); (* Expected result: false *)
val test3_1 = is_older((2020, 2, 28), (2020, 5, 12)); (* Expected result: true *)
val test4_1 = is_older((2018, 7, 10), (2018, 7, 15)); (* Expected result: true *)
val test5_1 = is_older((2021, 9, 21), (2021, 9, 21)); (* Expected result: false *)


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


(* Tests problem 4 *)

val dates_test4 = [(2024, 4, 15), (2024, 4, 20), (2024, 6, 25), (2024, 7, 30)];

val test_dates_1_4 = dates_in_month(dates_test4, 4); (* Expected result: [(2024, 4, 15), (2024, 4, 20)] *)
val test_dates_2_4 = dates_in_month(dates_test4, 5); (* Expected result: [] *)
val test_dates_3_4 = dates_in_month(dates_test4, 6); (* Expected result: [(2024, 6, 25)] *)


(* Tests problem 5 *)

val dates_test5 = [(2024, 4, 15), (2024, 5, 20), (2024, 6, 25), (2024, 7, 30)];

val test_dates_1_5 = dates_in_months(dates_test5, [4, 6]); (* Expected result: [(2024, 4, 15), (2024, 6, 25)] *)
val test_dates_2_5 = dates_in_months(dates_test5, []); (* Expected result: [] *)
val test_dates_3_5 = dates_in_months(dates_test5, [7]); (* Expected result: [(2024, 7, 30)] *)


(* Tests problem 6 *)

val test1_6 = get_nth(["a", "b", "c"], 1); (* Expected result: 'a' *)
val test2_6 = get_nth(["a", "b", "c"], 3); (* Expected result: 'c' *)
val test3_6 = get_nth(["a", "b", "c"], 4); (* Expected result: Error message *)


(* Tests problem 7 *)

val test1_7 = date_to_string((2022, 12, 4)); (* Expected result: "December 4, 2022" *)
val test2_7 = date_to_string((2022, 1, 4)); (* Expected result: "January 4, 2022" *)


(* Tests problem 8 *)

val test1_8 = number_before_reaching_sum(10, [4, 2, 7, 3, 1]); (* Expected result: 2 *)
val test2_8 = number_before_reaching_sum(8, [1, 2, 3, 4, 5]); (* Expected result: 3 *)
val test3_8 = number_before_reaching_sum(5, [5, 5, 5, 5, 5]); (* Expected result: 0 *)


(* Tests problem 9 *)

val test1_9 = what_month(1); (* Expected result: 1 *)
val test2_9 = what_month(121); (* Expected result: 5 *)
val test3_9 = what_month(334); (* Expected result: 11 *)
val test4_9 = what_month(365); (* Expected result: 12 *)


(* Test problem 10 *)

val test1_10 = month_range(15, 17); (* Expected result: [1, 1, 1] *)
val test2_10 = month_range(59, 61); (* Expected result: [2, 3, 3] *)
val test3_10 = month_range(90, 92); (* Expected result: [3, 4 ,4] *)
val test4_10 = month_range(200, 19); (* Expected result: [] *)


(* Tests problem 11 *)

val test1_11 = oldest([(2023, 6, 17), (2020, 1, 1), (2021, 12, 31)]); (* Expected result: SOME (2020, 1, 1) *)
val test2_11 = oldest([(1999, 12, 31), (2000, 1, 1), (1980, 7, 4)]); (* Expected result: SOME (1980, 7, 4) *)
val test3_11 = oldest([(2022, 5, 20)]); (* Expected result: SOME (2022, 5, 20) *)
val test4_11 = oldest([]); (* Expected result: NONE*)


(* Tests problem 12a *)

val dates_test12a = [(2024, 4, 15), (2024, 5, 20), (2024, 6, 25), (2024, 7, 30)];

val test1_12a = number_in_months_challenge(dates_test12a, [4, 5, 6, 4, 5]); (* Expected result: 3 *)
val test2_12a = number_in_months_challenge(dates_test12a, [5, 7, 5, 7]); (* Expected result: 2 *)
val test3_12a = number_in_months_challenge(dates_test12a, [1, 2, 2]); (* Expected result: 0 *)


(* Tests problem 12b *)

val test1_12b = dates_in_months_challenge(dates_test12a, [4, 6, 6, 4, 6]); (* Expected result: [(2024, 4, 15), (2024, 6, 25)] *)
val test2_12b = dates_in_months_challenge(dates_test12a, []); (* Expected result: [] *)
val test3_12b = dates_in_months_challenge(dates_test12a, [7, 7, 7, 7, 7]); (* Expected result: [(2024, 7, 30)] *)


(* Tests problem 13 *)

val test1_13 = reasonable_date((2023, 5, 15)); (* Expected result: True *)
val test2_13 = reasonable_date((0, 1, 1)); (* Expected result: False *)
val test3_13 = reasonable_date((2023, 13, 1)); (* Expected result: False *)
val test4_13 = reasonable_date((2004, 2, 29)); (* Expected result: True *)
val test5_13 = reasonable_date((2024, 4, 31)); (* Expected result: False *)
