(* Problem 5:

Write a function

    repeat : int list * int list -> int list

that given a list of integers and another list of nonnegative integers, repeats the integers in the first list according to the numbers indicated by the second list.

*)

(* Step 1: Understand the problem   

What is the input?  
- A list of integers and a list of nonnegative integers.

What is the output? 
- A list of integers that repeats the integers in the first list according to the numbers indicated by the second list

What are the rules? 
- Both lists can be empty
- The second list contains nonnegative integers
- The length of both lists should be the same

What is the mental model of the problem? 
- Imagine you have two lists side by side, where each element in the first list has a "counter" beside it (from the second list). 
You generate the output list by "copying" each element from the first list a number of times equal to its corresponding counter in the second list.

*)  

(* Step 2: Examples

Input: [1, 2, 3], [0, 0, 0]
Output: []

Input: [1, 2, 3], [0, 0, 1]
Output: [3]

Input: [1, 2, 3], [0, 1, 0]
Output: [2]

Input: [1, 2, 3], [4, 0, 3]
Output: [1, 1, 1, 1, 3, 3, 3]

*)  

(* Step 3: What is the functional algorithm

1. Define a helper function that takes three parameters:
    - The source list
    - The counter list
    - An accumulator list (initially empty) to build the result

2. In the helper function:
- If either the source list or counter list is empty, return the accumulator
- Otherwise:
    a. Take the head of the source list (let's call it x)
    b. Take the head of the counter list (let's call it n)
    c. Create a list of x repeated n times
    d. Append this list to the accumulator
    e. Recursively call the helper function with:
        The tail of the source list
        The tail of the counter list
        The updated accumulator

3. Define the main repeat function that calls the helper function with an empty accumulator

4. Handle edge cases:
    If either input list is empty, return an empty list

*)

(* Step 4: Functional Implementation without pattern matching *)

fun repeat (numbers : int list, repeats : int list) =
    let
        (* Helper function to create a list with n copies of x *)
        fun replicate (x : int, n : int) =
            if n <= 0 then []
            else x :: replicate(x, n-1)

        (* Main recursive helper function *)
        fun repeatHelper (nums : int list, reps : int list, acc : int list) =
            if null nums orelse null reps then
                acc
            else
                let
                    val x = hd nums
                    val n = hd reps
                in
                    repeatHelper(tl nums, tl reps, acc @ replicate(x, n))
                end
    in
        repeatHelper(numbers, repeats, [])
    end

(* Step 5: Functional Implementation with pattern matching

fun repeat (numbers : int list, repeats : int list) =
    let
        (* Helper function to create a list with n copies of x *)
        fun replicate (x : int, n : int) =
            if n <= 0 then []
            else x :: replicate(x, n-1)

        (* Main recursive helper function *)
        fun repeatHelper (nums : int list, reps : int list, acc : int list) =
            case (nums, reps) of
                ([], _) => acc
              | (_, []) => acc
              | (x::xs, n::ns) => repeatHelper(xs, ns, acc @ replicate(x, n))
    in
        repeatHelper(numbers, repeats, [])
    end

 *)
