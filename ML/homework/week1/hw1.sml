(* Problem 1: Write a function that takes two dates and evaluates to true or false. It evaluates to true if the first argument is a date that comes before the second argument. *)

(* Algorithm:

  1. Extract year, month, and day from both dates.
  2. Compare the years
  3. If the years are equal, compare the months
  4. If both the years and the months are equal, compare the months
  5. If none of the above conditions are true, return false

*)

fun is_older(date1 : (int*int*int), date2 : (int*int*int))=
  let
    val year1 = #1 date1
    val month1 = #2 date1
    val day1 = #3 date1

    val year2 = #1 date2
    val month2 = #2 date2
    val day2 = #3 date2	       
  in
    (year1 < year2) orelse ((year1 = year2) andalso (month1 < month2))
    orelse ((year1 = year2) andalso (month1 = month2) andalso (day1 < day2))
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
  else if #2 (hd dates) = month
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
  else number_in_month(dates, hd months) + number_in_months(dates, tl months)



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

  1. The function takes an integer day as input, representing a day of the year (between 1 and 365).
  2. Create a list containing the number of days in each month for a non-leap year
  3. Call the function named number_before_reaching_sum. It returns the number of complete months (i.e., the index in the list) before reaching the sum that exceeds the input day.
  4. The result of number_before_reaching_sum is then incremented by 1. This is done because the result from number_before_reaching_sum is zero-indexed (0 for January, 1 for February, etc.)

*)

fun what_month (day : int) =
    let val days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	number_before_reaching_sum(day, days_in_months) + 1
    end



(* Problem 10: Write a function that takes two days of the year day1 and day2 and returns an int list [m1, m2, ..., mn] where m1 is the month of day1, m2 is the month of day1+1, ..., and mn is the month of day day2. Note the result will have lenght day2 - day1 + 1 or length 0 if day1 > day2 *)

(* Algorithm:

  1. Check if day1 is greater than day2. 
     1.1 If yes, the function returns an empty list ([]), indicating an invalid date range (day1 cannot be after day2).
     2.2 If no, proceed with the following steps.
  2. Call the what_month function with day1 as input. This gives you the month number for day1.
  3. Recursively call the month_range function again with two arguments:
     - day1 + 1: This represents the next day after day1.
     - day2: This remains unchanged, representing the end day of the desired range.
  4. The recursive call will continue until day1 reaches day2
  5. The result of each recursive call (a list containing the month number) is prepended (using ::) to the list returned by the previous call. This builds the final list containing month numbers from day1 to day2

*)

fun month_range (day1 : int, day2 : int) =
    if day1 > day2
    then []
    else what_month(day1)::month_range(day1 + 1, day2)



(* Problem 11: Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option. It evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list *)

(* Algorithm:

  1. Check if the input list of dates is empty
     1.1 If it is empty, return NONE
     1.2 If it is not empty, proceed to find the oldest value 
  2. To find the oldest date, use a helper function called older_date:
     2.1 If there's only one date in the list, return that date
     2.2 If there are two or more dates:
         2.2.1 Compare the first date with the second date
         2.2.2 If the first date is older:
	       2.2.2.1 If there are no more dates in the list, return the first date
	       2.2.2.2 If there are more dates, recursively call older_date with a new list containing the first date and all dates after the second date
         2.2.3 If the second date is older or the same age:
               2.2.3.1 Recursively call older_date with the list excluiding the first date
  3. Once the oldest date is found using older_date, wrap it in SOME and return it.
  
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



(* Problem 12: Write functions number_in_months_challenge and dates_in_months_challenge that are like your solutions to problem 3 and 5 except having a month in the second argument multiple times has no more effect than having it once *)

(* Algorithm for number_in_months_challenge:

  1. The function number_in_months_challenge is defined. It takes two arguments:
    - dates: a list of dates, where each date is represented as a tuple (int, int, int)
    - months: a list of integers representing months
  2. Inside number_in_months_challenge, we need that the function does the following:
    a. It calls remove_duplicates on the months list to get a list of unique months.
    b. It then calls number_in_months with the original dates list and the new list of unique months.
  3. The remove_duplicates function removes duplicate elements from a list of months.
  4. The exist_in_list function is a helper function that checks if a value exists in a list.
  5. Once we have the list of unique months, number_in_months is called. 

  Note: By removing duplicates from the months list before counting, we ensure that having a month multiple times in the input has no more effect than having it once, which was the requirement of the challenge.  

 *)

fun exist_in_list(value : int , list : int list) =
    if null list 
    then false
    else if value = (hd list) 
    then true
    else exist_in_list(value, tl list)

fun remove_duplicates(months : int list) =
    if null months
    then []
    else if exist_in_list(hd months, tl months)
    then remove_duplicates(tl months)
    else (hd months) :: remove_duplicates(tl months)
    
fun number_in_months_challenge(dates : (int*int*int) list, months : int list) =
    number_in_months(dates, remove_duplicates(months))

fun dates_in_months_challenge(dates : (int*int*int) list, months : int list) =
    dates_in_months(dates, remove_duplicates(months))



(* Problem 13: Write a function reasonable_date that takes a date and determines if it describes a real date in the common era. A "real date" has a positive year (year 0 did not exist), a month between 1 and 12, and a day appropriate for the month. Solutions should properly handle leap years.
*)

(* Algorithm:

  1. Setting Up: 
    1.1 Define a list called daysInMonth that holds the average number of days in each month.
    1.2 Extracts the year, month, and day values from the date tuple.
  2. It then checks the validity of the date through a series of conditions:
    2.1. First, it checks if the year is valid (greater than 0).
    2.2. If the year is valid, it checks if the month is valid (between 1 and 12).
    2.3. If the month is valid, it checks if the day is within a possible range (1 to 31).
    2.4. If the day is within this range, it checks for months with 30 days (April, June, September, November). If the day is 31 for these months, it returns false.
    2.5. If the date hasn't been invalidated yet, it checks the February case:
          If the day is greater than 28 and it's February:
          It checks if it's the 29th and if it's a leap year.
          A leap year is defined as a year divisible by 4 but not by 100, or divisible by 400.
          If it's the 29th and a leap year, it returns true.
          Otherwise, it returns false (as February can't have more than 29 days).
    2.6. If none of the above conditions invalidate the date, it returns true.
  3. Return false as soon as any invalid condition is met, and true only if all checks pass

*)

fun reasonable_date(date : int * int * int) =
    let
        val (year, month, day) = date
        val daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

        fun is_leap_year(y) =
            (y mod 400 = 0) orelse (y mod 4 = 0 andalso y mod 100 <> 0)

        fun days_in_month(m, y) =
            if m = 2 andalso is_leap_year(y) then 29
            else List.nth(daysInMonth, m - 1)

        fun is_valid_year(y) = y > 0
        fun is_valid_month(m) = m >= 1 andalso m <= 12
        fun is_valid_day(d, m, y) = d >= 1 andalso d <= days_in_month(m, y)
    in
        is_valid_year(year) andalso
        is_valid_month(month) andalso
        is_valid_day(day, month, year)
    end
