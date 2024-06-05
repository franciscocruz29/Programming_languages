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


(* Test problem 8 *)

val test1_8 = number_before_reaching_sum(10, [4, 2, 7, 3, 1]); (* Expected result: 2 *)
val test2_8 = number_before_reaching_sum(8, [1, 2, 3, 4, 5]); (* Expected result: 3 *)
val test3_8 = number_before_reaching_sum(5, [5, 5, 5, 5, 5]); (* Expected result: 0 *)


