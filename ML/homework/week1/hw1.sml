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
number_in_months(dates, 2) = 1

val dates = [(2012, 2, 28),(2013, 12, 1)]
number_in_months(dates, 3) = 0

val dates = [(2012, 2, 28),(2013, 12, 1), (2013, 12, 24)]
number_in_months(dates, 12) = 2
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

fun number_in_months(dates: (int*int*int) list, month: int) =
    if null dates
    then 0
    else
	if #2(hd dates) = month
	then 1 + number_in_months(tl dates, month)
	else number_in_months(tl dates, month)


