(* Problem 1:
Write a function that takes two dates and evaluates to true or false. It evaluates to true if the first argument is a date that comes before the second argument.
*)

(* Algorithm *)

  (* 1. Take two dates as input, each in the format of (year, month, day) *)

  (* 2. Compare the years of the two dates:
     - If the first year is smaller than the second year, return true
     - If the first year is greater than the second year, return false 
   *)

  (* 3. If the years are equal, compare the months of the two dates:
     - If the first month is smaller than the second month, return true
     - If the first month is greater than the second month, return false
   *)

  (* 4. If the years and months are equal, compare the days of the two dates:
     - If the first day is smaller than the second day, return true
     - If the first day is greater than the second day, return false
   *)


(* Implementation *)

(*
fun is_older(date1 : int*int*int, date2 : int*int*int)=
    let
	val year1 = #1 date1
	val month1 = #2 date1
	val day1 = #3 date1

	val year2 = #1 date2
	val month2 = #2 date2
	val day2 = #3 date2	       
    in
	if year1 < year2 then
	    true
	else if year1 > year2 then
	    false
	else (* years are equal *)
	    if month1 < month2 then
		true
	    else if month1 > month2 then
		false
	    else (* months are equal *)
		if day1 < day2 then
		    true
		else
		    false
    end
 *)

(* Refactoring *)

fun is_older(date1 : int*int*int, date2 : int*int*int)=
    let
			val year1 = #1 date1
			val month1 = #2 date1
			val day1 = #3 date1

			val year2 = #1 date2
			val month2 = #2 date2
			val day2 = #3 date2	       
    in
			(year1 < year2) orelse
			((year1 = year2) andalso (month1 < month2)) orelse
			((year1 = year2) andalso (month1 = month2) andalso (day1 < day2))
    end



(* Problem 2:
Write a function that takes a list of dates and a month and return how many dates in the list are in the given month
*)

(* Inputs: List of dates [(int*int*int) List] and a month (int) *)
(* Outputs: How many dates in the list are in the given month (int) *)


(* Examples:
	val dates = [(2012, 2, 28),(2013, 12, 1)]
	number_in_month(dates, 2) = 1

	val dates = [(2012, 2, 28),(2013, 12, 1)]
	number_in_month(dates, 3) = 0

	val dates = [(2012, 2, 28),(2013, 12, 1), (2013, 12, 24)]
	number_in_month(dates, 12) = 2
 *)


(* Algorithm *)

	(*
	1. Base Case: if the list of dates is empty, then there are no dates in that month, so the function returns 0
	2. Check first date: if the month of the first date matches the given month, then:
		- Increment the count by 1
		- Recursively call the function on the rest of the list to continue checking for matches in the remaining dates
	3. Iterate through the list: if the month of the first date does not match, simply call the function again on the rest of the list to continue checking the remaining dates.
	*)
	
(* Implementation *)

fun number_in_month(dates: (int*int*int) list, month: int) =
    if null dates
    then 0
    else
			if #2(hd dates) = month
			then 1 + number_in_month(tl dates, month)
			else number_in_month(tl dates, month)



(* Problem 3:
Write a function that takes a list of dates and a list of months and returns the number of dates in the list of dates that are in any of the months in the list of months. Assume the list of months has no number repeated			    
*)

(* Inputs: List of dates [(int*int*int) List] with the format of (year, month, day) and a list of months (int list) *)
(* Outputs: How many dates in the list are in the given list of dates *)


(* Examples:
	val dates = [(2024, 2, 28),(2013, 12, 1), (2024, 3, 10)]
	number_in_months(dates, [2, 3, 12]) = 3

	val dates = [(2012, 2, 28),(2013, 12, 1)]
	number_in_months(dates, [4, 6]) = 0

	val dates = [(2012, 2, 28),(2013, 12, 1), (2013, 12, 24)]
	number_in_months(dates, [2]) = 1
 *)

(* Algorithm *)

(*
	1. Base Case: if the list of months is empty, the function returns 0, since there are no target months to check against
	2. Recursive case: 
		- Call the number_in_month function to count the number of dates in the list that fall within the first month of the list of months
		- Recursively call the number_in_months function on the rest of the list of dates and the rest of the list of months (excluding the first element) to continue counting for the remaining months
*)

(* Implementation *)

fun number_in_months (dates: (int*int*int) list, months: int list) =
    if null months
    then 0
    else
			number_in_month(dates, hd months) + number_in_months(dates, tl months)



(* Problem 4:
Write a function that takes a list of dates and a month (i.e., an int) and returns a list holding the dates from the argument list of dates that are in the month. 
The returned list should contain dates in the order they were originally given.
*)

(* Inputs: List of dates [(int*int*int) List] with the format of (year, month, day) and a month (int) *)
(* Outputs: A list with the dates in the given month [(int*int*int) List] *)

(* Examples:
val dates = [(2012, 2, 28),(2013, 12, 1)]
dates_in_month(dates, 2) = [(2012, 2, 28)]

val dates = [(2012, 2, 28),(2013, 12, 1)]
dates_in_month(dates, 3) = []

val dates = [(2012, 2, 28),(2013, 12, 1), (2013, 12, 24)]
dates_in_month(dates, 12) = [(2013, 12, 1), (2013, 12, 24)] *)

(* Algorithm *)

(*
	1. Base Case: if the list of dates is empty, then there are no dates in that month, so the function returns an empty list
	2. Recursive case:
		- If the list is not empty, extract the head of the list. This head is a tuple representing a date (year, month, day).
		- If the month of the head tuple matches the given month, add the head tuple to the list and recursively call the function on the rest of the list
		- Else, recursively call the function on the rest of the list	
*)

(* Implementation *)

fun dates_in_month (dates : (int*int*int) list, month : int) =
  if null dates
  then []
  else
    let val datesHead = hd dates
    in
      if #2 datesHead = month
      then datesHead :: dates_in_month(tl dates, month) (* If the month matches, add the date to the result list *)
      else dates_in_month(tl dates, month)
    end
