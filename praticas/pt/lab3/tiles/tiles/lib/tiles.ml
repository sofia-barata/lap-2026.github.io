let rec sum f l u = 
  if l > u
    then 0
  else f l + sum f (l+1) u

let rec tiles n =
  if n < 0 then assert false
  else if n < 3 then 1 
  else if n = 3 then 2 
  else 1 + tiles(n-1)  (* Black tile first*)
    + sum(fun i -> tiles (n-i-1)) 3 (n-1) (* Red tile first, blocks of 3,4,5,...  *)