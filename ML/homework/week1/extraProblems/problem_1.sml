(* Problem 1: 

Write a function 

      alternate : int list -> int 

that takes a list of numbers and adds them with alternating sign. 

*)

(* Step 1: Understand the problem 

- What is the input? 
A list of integers

- What is the output?
A single integer representing the alternating sum of the list elements.

- What are the rules?
* If the list is empty, return 0 
* The function should alternate the sign of each number when summing them. 
* The function should work for lists of any length

*)

(* Step 2: Examples 

Input: []
Output: 0

Input: [7]
Output: 7

Input: [1, 2, 3]
Output: 1 - 2 + 3 = 2

Input: [1, 2, 3, 4]
Output: 1 - 2 + 3 - 4 = -2

Input: [-1, 2, -3, 4]
Output: -1 - 2 - 3 - 4 = -10

*)

(* Step 3: What is the algorithm

1. Define the main function 'alternate' that takes a list of integers as input.
2. Inside 'alternate', define a helper function 'alternate_helper' that takes three parameters:

  - factor: the current sign multiplier (1 or -1)
  - numbers: the remaining list to process
  - accumulated_sum: the running sum of alternating elements

3. In the helper function, check if the input list 'numbers' is empty:

  - If empty, return the accumulated_sum
  - If not empty, proceed to step 4

4. Extract the head (first element) and tail (rest of the list) from 'numbers'
5. Calculate the new sum by adding (factor * head) to the accumulated_sum
6. Calculate the new factor by negating the current factor (multiply by -1)
7. Recursively call alternate_helper with:

  - new_factor as the factor
  - tail as the remaining numbers to process
  - new_sum as the updated accumulated sum

8. Start the process by calling alternate_helper with:

- Initial factor of 1 (positive)
- The input list of numbers
- Initial accumulated sum of 0

9. Return the final result from alternate_helper as the output of 'alternate'

*)

(* Step 4: Walkthrough 

1. Call alternate([1, 2, 3])
  - This initiates alternate_helper(1, [1, 2, 3], 0)

2. First recursive call: alternate_helper(1, [1, 2, 3], 0)
  - List is not empty
  - head = 1, tail = [2, 3]
  - new_sum = 0 + (1 * 1) = 1
  - new_factor = -1 * 1 = -1
  - Recursive call: alternate_helper(-1, [2, 3], 1)

3. Second recursive call: alternate_helper(-1, [2, 3], 1)
  - List is not empty
  - head = 2, tail = [3]
  - new_sum = 1 + (-1 * 2) = -1
  - new_factor = -1 * (-1) = 1
  - Recursive call: alternate_helper(1, [3], -1)

3. Third recursive call: alternate_helper(1, [3], -1)
  - List is not empty
  - head = 3, tail = []
  - new_sum = -1 + (1 * 3) = 2
  - new_factor = -1 * 1 = -1
  - Recursive call: alternate_helper(-1, [], 2)

4. Final call: alternate_helper(-1, [], 2)
  - List is empty
  - Return accumulated_sum: 2

5. The function alternate returns 2 as the final result

*)

(* Step 5: Functional Implementation

fun alternate (numbers : int list) =
  let
    fun alternate_helper (numbers : int list, factor : int, accumulated_sum : int) =
      if null numbers then
        accumulated_sum
      else 
        let
          val head = hd numbers
          val tail = tl numbers
          val new_sum = accumulated_sum + (factor * head)
          val new_factor = ~factor
        in
          alternate_helper (tail, new_factor, new_sum)
        end
  in
    alternate_helper (numbers, 1, 0)
  end

*)

(* Step 6: Refactoring 

fun alternate (numbers : int list) =
  let
    fun alternate_helper (nums, factor, sum) =
      if null nums then
        sum
      else
        alternate_helper (tl nums, ~factor, sum + (factor * (hd nums)))
  in
    alternate_helper (numbers, 1, 0)
  end

*)

(* Step 7: Functional implementation with pattern matching *)

fun alternate (numbers : int list) =
  let
    fun alternate_helper ([], _, sum) = sum
      | alternate_helper (head :: tail, factor, sum) =
          alternate_helper (tail, ~factor, sum + (factor * head))
  in
    alternate_helper (numbers, 1, 0)
  end

(* Step 8: Imperative Implementation 

#include <stdio.h>

int alternate(int *arr, int size) {
    int result = 0;

    for (int i = 0; i < size; i++) {
        // Alternate the sign by using (-1) ^ i
        result += arr[i] * ((i % 2 == 0) ? 1 : -1);
    }

    return result;
}

int main() {
    // Test examples
    int arr1[] = {};
    int arr2[] = {7};
    int arr3[] = {1, 2, 3};
    int arr4[] = {1, 2, 3, 4};
    int arr5[] = {-1, 2, -3, 4};

    printf("Result 1: %d\n", alternate(arr1, 0));      // Output: 0
    printf("Result 2: %d\n", alternate(arr2, 1));      // Output: 7
    printf("Result 3: %d\n", alternate(arr3, 3));      // Output: 2
    printf("Result 4: %d\n", alternate(arr4, 4));      // Output: -2
    printf("Result 5: %d\n", alternate(arr5, 4));      // Output: -10

    return 0;
}

*)
