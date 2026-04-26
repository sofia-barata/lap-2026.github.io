(*
Project 1: Hail Mary - Rescue
LAP - 2025/2026
Sofia Barata (71538) s.barata@campus.fct.unl.pt
*)

(* Defining the types *)
type tool = Vial | Wrap | EVA

type section =
  | Safe of tool option
  | Astrophage
  | Radiation
  | Vacuum
 

let parse_corridor s =
  (* 
  Recursive funcion used for parsting the input string into a section list.
  Note that the corridor is read backwards from the exit, to avoid using List.rev on the min_time function.
   *)
  let rec scanner i acc =
    if i = String.length s then acc
    else
      (* Character pattern matching*)
      let sec = match s.[i] with
        | 'A' -> Astrophage
        | 'R' -> Radiation
        | 'V' -> Vacuum
        | 'T' -> Safe (Some Vial)
        | 'W' -> Safe (Some Wrap)
        | 'E' -> Safe (Some EVA)
        | _ -> Safe None
      in scanner (i + 1) (sec :: acc) (* Adds the section to the head of the list *)
  in scanner 0 []

  (* Function used for calculating the minimum transversal time possible for the corridor *)
let min_time corridor =
  let impossible = 1000000 in 
  
  (* Function that calculates the time of getting through a section with a certain tool *)
  let step (cn, cv, cw, ce) sec =
    (* Evaluates the tool in the current section *)
    match sec with
    | Safe tool_option ->
        (* Cost to reach the exit if the tool is picked up*)
        let pick_cost = match tool_option with
          | Some Vial -> 2 + cv
          | Some Wrap -> 2 + cw
          | Some EVA -> 2 + ce
          | None -> impossible
        in
        (* Calculates the minimum time for all possible tool-carrying states *)
        let time_cn = min (1 + cn) pick_cost in (* Entering the section without a tool *)
        (* Entering the section with a tool (vial, wrap or EVA) *)
        let time_cv = min (3 + cv) (1 + time_cn) in
        let time_cw = min (3 + cw) (1 + time_cn) in
        let time_ce = min (3 + ce) (1 + time_cn) in
        (time_cn, time_cv, time_cw, time_ce)
        
    | Astrophage -> (impossible, 4 + cv, 5 + cw, 6 + ce)
    | Radiation  -> (impossible, impossible, 5 + cw, 6 + ce)
    | Vacuum     -> (impossible, impossible, impossible, 6 + ce)
  in

  (* 
  Processes the corridor backwards from the exit, folding the states to find the minimal times
  for each tool-carrying initial state.
  Since the mission starts with no tools, the first element is the one that must be retrieved 
  *)
  let (result, _, _, _) = List.fold_left step (0, 0, 0, 0) corridor in result