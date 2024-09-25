(* Problem 4:

Write a function

    greeting : string option -> string

that given a string option SOME name returns the string "Hello there, ...!" where the dots would be replaced by name.
Note that the name is given as an option, so if it is NONE then replace the dots with "you".

*)

(* Step 1: Understand the problem

What is the input?
- A sring option (SOME name | NONE)

What is the output?
- A string value, formatted as "Hello there, ..." where the dots are replaced by either the given name (if it exists) or "you"

What are the rules?
- If the input is SOME name, replace "..." with the name
- If the input is NONE, replace "..." with "you"

What is the mental model of the problem?
- Create a greeting string that personalizes based on whether a name is provided

*)

(* Step 2: Examples

Input: NONE
Output: "Hello there, you!"

Input: SOME "Bob"
Output: "Hello there, Bob!"

*)

(* Step 3: What is the functional algorithm

1. Define a function 'greeting' that takes a string option as input.
  2. Create the beginning of the greeting string: "Hello there, "
  3. Check if the input option contains a value (is SOME)
     - If it does, extract the value and append it to the greeting
     - If it doesn't (is NONE), append "you" to the greeting
  4. Append an exclamation mark to complete the greeting
  5. Return the completed greeting string

*)

(* Step 4: Functional implementation *)

(* fun greeting (some_name : string option) =
  "Hello there, " ^ (if isSome some_name then valOf some_name else "you") ^ "!" *)

(* Step 5: Functional implementation with pattern matching *)

fun greeting (some_name : string option) =
  case some_name of
    SOME name => "Hello there, " ^ name ^ "!"
   | NONE => "Hello there, you!"
