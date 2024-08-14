datatype suit = Club | Diamond | Heart | Spade

datatype rank = Jack | Queen | King | Ace | Number of int

(* Suppose you want to identify students by their id-numbers, but in case there are students that do not have one 
(perhaps they are new to the university), then you will use their full name instead (with first name, optional middle name, and last name)*)
datatype id = Student of int 
            | Name of string 
                      * (string option) 
                      * string


(* Data definition for arithmetic expressions containing constants, negations, additions, and multiplications *)
datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp

(* Thanks to the self-reference, what this data definition really describes is trees where the leaves are integers and the internal nodes are either negations with one child, additions with two children or multiplications with two children.*)

fun eval e =
  case e of
      Constant i => i
    | Negate e2 => ~ (eval e2)
    | Add (e1, e2) => (eval e1) + (eval e2)
    | Multiply (e1, e2) => (eval e1) * (eval e2)

val example_exp = eval (Add (Constant (10 + 9), Negate (Constant 4))); (* 15 *)
