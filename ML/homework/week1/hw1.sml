(* Problem 1: Write a function that takes two dates and evaluates to true or false. It evaluates to true if the first argument is a date that comes before the second argument. *)

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



(* Problem 2: Write a function that takes a list of dates and a month and return how many dates in the list are in the given month *)

fun number_in_month(dates : (int*int*int) list, month : int) =
    if null dates
    then 0
    else
	if #2(hd dates) = month
	then 1 + number_in_month(tl dates, month)
	else number_in_month(tl dates, month)



(* Problem 3: Write a function that takes a list of dates and a list of months and returns the number of dates in the list of dates that are in any of the months in the list of months. Assume the list of months has no number repeated *)

fun number_in_months (dates : (int*int*int) list, months : int list) =
    if null months
    then 0
    else
	number_in_month(dates, hd months) + number_in_months(dates, tl months)



(* Problem 4: Write a function that takes a list of dates and a month (i.e., an int) and returns a list holding the dates from the argument list of dates that are in the month. The returned list should contain dates in the order they were originally given. *)

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



(* Problem 5: Write a function that takes a list of dates and a list of months and returns a list holding the dates from the argument list of dates that are in any of the months in the list of months. Assume the list of months has no number repeated *)

fun dates_in_months (dates : (int*int*int) list, months : int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)



(* Problem 6: Write a function that takes a list of strings and an int n and return the n^th element of the list where the head of the list is 1^st.*)

fun get_nth (str : string list, n : int) =
    if null (str)
    then "n is out of bounds"
    else
	if n = 1
	then hd str
	else get_nth(tl str, n-1)



