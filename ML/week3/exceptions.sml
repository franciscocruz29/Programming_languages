fun hd xs =
    case xs of
        [] => raise List.Empty
      | x::_ => x

exception MyUndesirableCondition

fun mydiv (x, y) =
    if y = 0
    then raise MyUndesirableCondition
    else x div y

fun maxlist (xs,ex) =
    case xs of
        [] => raise ex
      | x::[] => x
      | x::xs' => Int.max(x,maxlist(xs',ex))

val test1 = maxlist([3,4,0],List.Empty);
val test2 = maxlist([],List.Empty);
