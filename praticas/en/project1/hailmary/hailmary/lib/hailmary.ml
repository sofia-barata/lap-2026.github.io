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
  Recursive funcion used for parsing the input string into a section list.
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

  (* Function used for calculating the minimum traversal time possible for the corridor *)
let min_time corridor =
  let impossible = 1000000 in 
  
  (* Function that calculates the time of getting through a section with a certain tool *)
  let step (t_none, t_vial, t_wrap, t_eva) sec =
    (* Evaluates the tool in the current section *)
    match sec with
    | Safe tool_option ->
        (* Cost to reach the exit if the tool is picked up*)
        let pick_cost = match tool_option with
          | Some Vial -> 2 + t_vial
          | Some Wrap -> 2 + t_wrap
          | Some EVA -> 2 + t_eva
          | None -> impossible
        in
        (* Calculates the minimum time for all possible tool-carrying states *)
        let time_t_none = min (1 + t_none) pick_cost in (* Entering the section without a tool *)
        (* Entering the section with a tool (vial, wrap or EVA) *)
        let time_t_vial = min (3 + t_vial) (1 + time_t_none) in
        let time_t_wrap = min (3 + t_wrap) (1 + time_t_none) in
        let time_t_eva = min (3 + t_eva) (1 + time_t_none) in
        (time_t_none, time_t_vial, time_t_wrap, time_t_eva)
        
    | Astrophage -> (impossible, 4 + t_vial, 5 + t_wrap, 6 + t_eva)
    | Radiation  -> (impossible, impossible, 5 + t_wrap, 6 + t_eva)
    | Vacuum     -> (impossible, impossible, impossible, 6 + t_eva)
  in

  (* 
  Processes the corridor backwards from the exit, folding the states to find the minimal times
  for each tool-carrying initial state.
  Since the mission starts with no tools, the first element is the one that must be retrieved 
  *)
  let (result, _, _, _) = List.fold_left step (0, 0, 0, 0) corridor in result