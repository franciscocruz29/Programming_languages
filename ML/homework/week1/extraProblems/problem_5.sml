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

(* Step 6: What is the imperative algorithm

1. Initialize an empty result array to store the output
2. Initialize a variable to keep track of the result array's size
3. Iterate through both input arrays simultaneously:
    a. For each pair of elements (number, repeat_count):
        i. For repeat_count times:
            - Add the number to the result array
            - Increase the result array's size
4. Return the result array and its size

*)

(* Step 7: Imperative Implementation 

#include <stdio.h>
#include <stdlib.h>

// Function to repeat elements of one list according to another list
int* repeat(int* numbers, int* repeats, int length, int* result_length) {
    // Initialize result array
    int* result = NULL;
    *result_length = 0;

    // Calculate total size needed for result list
    int total_size = 0;
    for (int i = 0; i < length; i++) {
        total_size += repeats[i];
    }

    // Allocate memory for result array
    result = (int*')malloc(total_size * sizeof(int));

    // Fill the result array
    int index = 0;
    for (int i = 0; i < length; i++) {
        for (int j = 0; j < repeats[i]; j++) {
            result[index] = numbers[i];
            index++;
        }
    }

    *result_length = index;
    return result;
}

// Helper function to print an array
void printArray(int* arr, int length) {
    printf("[");
    for (int i = 0; i < length; i++) {
        printf("%d", arr[i]);
        if (i < length - 1) printf(", ");
    }
    printf("]\n");
}

int main() {
    // Test cases
    int numbers1[] = {1, 2, 3};
    int repeats1[] = {0, 0, 0};
    int numbers2[] = {1, 2, 3};
    int repeats2[] = {0, 0, 1};
    int numbers3[] = {1, 2, 3};
    int repeats3[] = {0, 1, 0};
    int numbers4[] = {1, 2, 3};
    int repeats4[] = {4, 0, 3};

    int result_length;
    int* result;

    // Test 1
    result = repeat(numbers1, repeats1, 3, &result_length);
    printf("Test 1 result: ");
    printArray(result, result_length);
    free(result);

    // Test 2
    result = repeat(numbers2, repeats2, 3, &result_length);
    printf("Test 2 result: ");
    printArray(result, result_length);
    free(result);

    // Test 3
    result = repeat(numbers3, repeats3, 3, &result_length);
    printf("Test 3 result: ");
    printArray(result, result_length);
    free(result);

    // Test 4
    result = repeat(numbers4, repeats4, 3, &result_length);
    printf("Test 4 result: ");
    printArray(result, result_length);
    free(result);

    return 0;
}

*)
