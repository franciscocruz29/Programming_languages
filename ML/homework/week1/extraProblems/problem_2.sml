(* Problem 2: 

Write a function 

    min_max : int list -> int * int

that takes a non-empty list of numbers, and returns a pair (min, max) of the minimum and maximum of the numbers in the list.

*)

(* Step 1: Understand the problem 

What is the input? 
- A list of integers

What is the output?
- A pair of integers representing the minimum and maximum of the list elements.

What are the rules?
- The input is a non-empty list of integers.

What is the mental model of the problem?
- Imagine you have a list of integers. You need to look through each number in this list to find the smallest number (minimum) and the largest number (maximum).
For example, if the list is [4, 2, 7, 1, 9], you should identify that 1 is the smallest number and 9 is the largest number. The function should return a tuple (min, max) with these two values.
*)

(* Step 2: Examples 

Input: [7]
Output: (7, 7)

Input: [1, 2, 3]
Output: (1, 3)

Input: [1, 2, 3, 4]
Output: (1, 4)

Input: [1, ~2, 3, ~4]
Output: (~4, 3)

Input: [20, 5, 4, 123, 3, ~1, 0, 100, 13]
Output: (~1, 123)
*)

(* Step 3: What is the algorithm 

1. Initialize: Set the first element of the list as both the initial minimum and maximum values.
2. Process the list:
   - Compare the current element with the current minimum and maximum.
   - If the current element is smaller than the current minimum, update the minimum.
   - If the current element is larger than the current maximum, update the maximum.
   - Move to the next element in the list and repeat step 2.
3. Return result: Once the end of the list is reached, return the final minimum and maximum values as a pair.
*)

(* Step 4: Implementation *)
fun min_max (numbers : int list) =
  let
    fun find_min_max (min, max, remaining) =
      if null remaining then
        (min, max)
      else
        let
          val current = hd remaining
          val newMin = if current < min then current else min
          val newMax = if current > max then current else max
        in
          find_min_max (newMin, newMax, tl remaining)
        end
  in
    find_min_max (hd numbers, hd numbers, tl numbers)
  end
