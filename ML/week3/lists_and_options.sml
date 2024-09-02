fun inc_or_zero intoption =
  case intoption of
    NONE => 0
  | SOME n => n + 1

fun sum_list xs =
  case xs of
    [] => 0
  | x :: xs' => x + sum_list xs'

fun append (xs, ys) = 
  case xs of
    [] => ys
  | x :: xs' => x :: append(xs', ys)
