(* Problem 1: Write a function that takes two dates and evaluates to true or false. It evaluates to true if the first argument is a date that comes before the second argument. *)

(* Algorithm:

  1. Extract year, month, and day from both dates.
  2. Compare the years
  3. If the years are equal, compare the months
  4. If both the years and the months are equal, compare the months
  5. If none of the above conditions are true, return false

*)

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

(* Algorithm:

  1. If the list is empty, return 0 
  2. Otherwise, check the month of the first date:
     2.1 If it matches the given month, return 1 plus the result of calling the function with the rest of the list
     2.2 If it does not match, return the result of calling the function with the rest of the list

*)

fun number_in_month(dates : (int*int*int) list, month : int) =
    if null dates
    then 0
    else
	if #2(hd dates) = month
	then 1 + number_in_month(tl dates, month)
	else number_in_month(tl dates, month)



(* Problem 3: Write a function that takes a list of dates and a list of months and returns the number of dates in the list of dates that are in any of the months in the list of months. Assume the list of months has no number repeated *)

(* Algorithm:

  1. Start with a list of dates and a list of months. 
  2. Check if the list of months is empty:
     2.1 If it is empty, return 0 (because there are no months to check against).
  3. If the list of months is not empty:
     3.1 Take the first month from the list.
     3.2 Count how many dates in the date list fall in this month (using the number_in_month function).
     3.3 Remove the first month from the list of months.
     3.4 Recursively apply this same process to the remaining months.
     3.5 Add the count from the first month to the result of the recursive call.
  4. Repeat steps 2-3 until all months have been processed.
  5. The final sum is the total number of dates that fall in any of the given months.

*)

fun number_in_months (dates : (int*int*int) list, months : int list) =
    if null months
    then 0
    else
	number_in_month(dates, hd months) + number_in_months(dates, tl months)



(* Problem 4: Write a function that takes a list of dates and a month (i.e., an int) and returns a list holding the dates from the argument list of dates that are in the month. The returned list should contain dates in the order they were originally given. *)

(* Algorithm:

  1. Check for empty list:
     1.1 If it is, return an empty list
  2. Extract head date and month:
     2.1 It extracts the first element (head) of the dates list using hd
     2.2 It then checks if the second element (month) of datesHead matches the provided month argument
  3. Matching Month:
     3.1 Add the entire head date to the beginning of a new list using the :: operator. This new list will eventually hold the filtered dates for the desired month.
  4. Non-Matching Month:
     4.1 Ignore the current date and moves on to the next one.
  5. Building the Result:
     5.1 With each recursive call, the function keeps adding matching dates to the beginning of the new list.
     5.2 Eventually, when the function reaches the end of the original dates list (empty tail), all relevant dates will be included in the new list.
     5.3 This new list, containing only dates from the original list that fall in the specified month and preserving their original order, is returned as the final result.

*)

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

(* Algorithm:

  1. Checks if the months list is empty. If it is empty, the function returns an empty list
  2. If months is not empty:
     2.1 It extracts the first month from the months list using hd months.
     2.2 It calls the function dates_in_month with dates and the first month as arguments to get the list of dates that are in this month.
     2.3 It then concatenates (@) this list with the result of a recursive call to dates_in_months with the same dates list and the rest of the months list.
  3. This process repeats recursively, processing one month at a time from the months list until the list is empty.
  4. The final result is a list containing all dates that fall in any of the months specified in the months list.

 *)

fun dates_in_months (dates : (int*int*int) list, months : int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)



(* Problem 6: Write a function that takes a list of strings and an int n and return the n^th element of the list where the head of the list is 1^st.*)

(* Algorithm:

  1. Check if the input list str is empty. If it is empty, return the message "n is larger than list bounds".
  2. If the list is not empty, check if n is equal to 1. If n is 1, return the first element (head) of the list.
  3. If n is not 1, the function calls itself recursively with two modified arguments:
     - The new list argument is the tail of the current list (all elements except the first one).
     - The new n argument is decreased by 1.
  4. This recursive process continues until either:
     - The desired element is found (when n becomes 1).
     - The list becomes empty (which means n was larger than the list length).

  Note: This recursive approach effectively traverses the list until it reaches the desired position or determines that the list is too short to fulfill the request.

*)

fun get_nth (str : string list, n : int) =
    if null str then "n is larger than list bounds"
    else if n = 1 then hd str
    else get_nth (tl str, n-1)



(* Problem 7: Write a function that takes a date and returns a string of the form "Month day, year" *)

(* Algorithm:

  1. Create a list containing the names of all twelve months (January, February, etc.)
  2. Extract the month number from the input date (second element of the tuple).
  3. Extract the day from the input date (third element of the tuple).
  4. Extract the year from the input date (first element of the tuple).
  5. Combine the month name, the day string, and the year string into a single formatted string in the form "Month Day, Year".

*)
		 
fun date_to_string (date : (int*int*int)) =
    let val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
	get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end



(* Problem 8: Write a function that takes and int called sum, which you can assume is positive, and an int list, which you can assume contains all positive numbers, and returns and int. You should return an int n such that the first n elements of the list add to less than sum, but the first n + 1 elements of the list add to sum or more. *)

(* Algorithm:

  1. If the first element of the list is itself greater than or equal to the target sum, it means this element alone is enough to reach or exceed the target sum. 
     1.1 In this case, the function returns 0, indicating that no elements precede this element where the sum is less than the target.
  2. If the first element is less than the target sum, the function continues iterating through the list. It performs the following steps:
     2.1 Subtracts the first elementfrom the target sum to get the remaining target sum.
     2.2 Calls itself recursively with the remaining target sum and the tail of the list, which excludes the first element.
     2.3 Adds 1 to the result of the function call.

  Note: The algorithm iterates through the list, keeping track of the cumulative sum. It stops at the point where adding the next element would exceed the target sum and returns the index before that point.

*)
	
fun number_before_reaching_sum (sum : int, number_list : int list) =
    if hd number_list >= sum
    then 0
    else 1 + number_before_reaching_sum (sum - hd number_list, tl number_list)


		
(* Problem 9: Write a function that takes a day of year (i.e., an int between 1 and 365) and returns what month that day is in (1 for January, 2 for February, etc) *)

(* Algorithm:

  1. 
  2. 
  3. 
  4. 
  5. 

*)
					
fun what_month (day : int) =
    let val days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	number_before_reaching_sum(day, days_in_months) + 1
    end



(* Problem 10: Write a function that takes two days of the year day1 and day2 and returns an int list [m1, m2, ..., mn] where m1 is the month of day1, m2 is the month of day1+1, ..., and mn is the month of day day2. Note the result will have lenght day2 - day1 + 1 or length 0 if day1 > day2 *)

(* Algorithm:

  1. 
  2. 
  3. 
  4. 
  5. 

*)

fun month_range (day1 : int, day2 : int) =
    if day1 > day2
    then []
    else what_month(day1)::month_rage(day1 + 1, day2)



(* Problem 11: Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option. It evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list *)

(* Algorithm:

  1. 
  2. 
  3. 
  4. 
  5. 

*)

fun oldest (dates : (int*int*int) list) =
    if null dates
    then NONE
    else
	let fun older_date (dates : (int*int*int) list) =
		if null (tl dates)
		then hd dates
		else
		    if is_older (hd dates, hd (tl dates))
		    then if null (tl(tl dates))
			 then  hd dates
			 else older_date(hd dates::tl(tl dates))
		    else older_date(tl dates)
	in
	    SOME (older_date(dates))
	end
