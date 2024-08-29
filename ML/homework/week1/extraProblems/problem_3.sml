(* Problem 3:

Write a function

    cumsum : int list -> int list

that takes a list of numbers and returns a list of the partial sums of those numbers.

*)

(* Step 1: Understand the problem 

What is the input? 
- A list of integers

What is the output?
- A list of integers

What are the rules?
- The input is a non-empty list of integers

What is the mental model of the problem?
- The function takes a list of integers and returns a new list where each element is the sum of all previous elements in the original list, including the current element.
For example, if the input is [4, 6, 12] the output should be [4, 10, 22] because [4, 4 + 6, 4 + 6 + 12].

*)

(* Step 2: Examples 

Input: [1]
Output: [1]

Input: [1, 4]
Output: [1, 5] 

Input: [1, 4, 20]
Output: [1, 5, 25]

Input: [1, 4, 20, 100]
Output: [1, 5, 25, 125]

Input: [1, 4, 20, 100, 1000]
Output: [1, 5, 25, 125, 1125]

Input: [1, ~2, 3, 4]
Output: [1, ~1, 2, ~2]

*)

(* Step 3: What is the functional algorithm 

1. Define a main function 'cumsum' that takes a list of integers as input.

2. Inside 'cumsum', define a helper function that takes two parameters:
   - The remaining part of the input list
   - A running sum

3. In the helper function, handle two cases:
   a. If the input list is empty, return an empty list.
   b. If the input list is non-empty:
      - Extract the first element (head) and the rest of the list (tail)
      - Calculate a new sum by adding the head to the running sum
      - Create a new list with the new sum as its first element, followed by 
        the result of recursively calling the helper function with:
        * The tail of the current list
        * The new sum as the new running sum

4. Start the process by calling the helper function with:
   - The entire input list
   - An initial sum of 0

5. Return the result of the helper function as the output of 'cumsum'

*)

(* Step 4: Functional Implementation *)

fun cumsum (numbers : int list) =
  let
    fun helper(numbers, sum) =
      if null numbers then
        []
      else
        let
          val x = hd numbers
          val xs = tl numbers
          val new_sum = x + sum
        in
          new_sum :: helper(xs, new_sum)
        end
  in
    helper(numbers, 0)
  end

(* Step 5: What is the imperative algorithm 

1. Initialize an empty result list to store the cumulative sums.
2. Initialize a variable current_sum to 0. This will keep track of the running sum.
3. Iterate through each number in the input list:
   a. Add the current number to current_sum.
   b. Append the current_sum to the result list.
4. Return the result list.

*)

(* Step 6: Imperative Implementation

#include <stdio.h>
#include <stdlib.h>

int *cumsum(int *numbers, int size) {
    // Allocate memory for the result array 
    int *result = (int *')malloc(size * sizeof(int)); 
                       Remove ' to work
    // Initialize the current sum
    int current_sum = 0;

    // Iterate through the input array
    for (int i = 0; i < size; i++) {
        // Add the current element to the current sum
        current_sum += numbers[i];

        // Store the current sum in the result array
        result[i] = current_sum;
    }

    // Return the result array
    return result;
}

int main() {
    // Declare an array of numbers
    int numbers[] = {1, 4, 20, 100};

    // Calculate the size of the array
    int size = sizeof(numbers) / sizeof(numbers[0]);

    // Call the cumsum function to calculate the cumulative sums
    int *cumulative_sums = cumsum(numbers, size);

    // Print the cumulative sums
    printf("Cumulative sums: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", cumulative_sums[i]);
    }
    printf("\n");

    // Free the allocated memory
    free(cumulative_sums);

    return 0;
}

*)
