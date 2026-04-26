open OUnit2
open Hailmary

(** [mk_test name expected route ] produces a OUnit test for [min_time] 
    with name [name] that compares the [expected] number of steps for a 
    [route] using function [parse_corridor] to transform [route] into a
    list of type [section] *)
let mk_test name expected route =
  name >:: (fun _ ->
    assert_equal expected (route |> parse_corridor |> min_time)
      ~printer:string_of_int
      ~msg:(Printf.sprintf "unexpected result for test \"%s\"" name))


(** [sample_tests] checks [min_time] against the two routes provided in the
    problem assignment *)
let sample_tests = "samples" >::: [
  (* "W__ERRVTWA_" -> 34 *)
  mk_test "sample_1" 34  "W__ERRVTWA_";
  (* "_E_V______V__" -> 39 *)
  mk_test "sample_2" 39  "_E_V______V__";
]

(** [trivial_tests] checks [min_time] on routes with no tools and no hazards,
    verifying that each safe section [_] costs exactly 1 step and that
    picking up a [T] tool without a hazard ahead also costs 1. *)
let trivial_tests = "trivial" >::: [
  mk_test "single_easy_no_tool"       1  "_";
  mk_test "single_easy_with_taumoeba" 1  "T";
  mk_test "single_easy_with_eva"      1  "E";
  mk_test "single_easy_with_thermal"  1  "W";
  mk_test "two_easy_no_tools"         2  "__";
  mk_test "five_easy_no_tools"        5  "_____";
  mk_test "five_easy_with_tools"      5  "T_E_W";
]

(** [carrying_tests] checks [min_time] on routes where a tool appears but no
    matching hazard follows, verifying that [min_time] never picks up a tool
    whose carrying cost exceeds the benefit it would provide. *)
let unnecessary_carrying_tests = "carrying" >::: [
  mk_test "no_hazard_ahead_ignore_taumoeba" 2  "T_";
  mk_test "no_hazard_ahead_ignore_thermal"  2  "W_";
  mk_test "no_hazard_ahead_ignore_eva"      2  "E_";
  mk_test "last_plot_ignore_tool"     2  "_T";
]


(** [single_hazard_tests] checks [min_time] on routes with exactly one hazard
    section, verifying that [min_time] selects the correct tool for each hazard
    type and charges the expected per-section cost when carrying that tool. *)
let single_hazard_tests = "single_hazard" >::: [
  (* taumoeba: only works on Astrophage, costs 4 *)
  mk_test "taumoeba_through_astrophage"  6  "TA";
  (* thermal: works on Radiation and Astrophage, costs 5 *)
  mk_test "thermal_through_radiation"    7  "WR";
  mk_test "thermal_through_astrophage"   7  "WA";
  (* eva: works on all hazards, costs 6 *)
  mk_test "eva_through_vacuum"           8  "EV";
  mk_test "eva_through_radiation"        8  "ER";
  mk_test "eva_through_astrophage"       8  "EA";
  (* taumoeba is cheaper than eva for Astrophage — prefer taumoeba, amaze, amaze! *)
  mk_test "prefer_taumoeba_over_eva_for_astrophage"  9  "TEA";
]



(** [multi_hazard_tests] checks [min_time] on routes with two or more hazard
    sections, verifying that [min_time] correctly reuses a tool across
    consecutive hazards and switches tools when a cheaper option is available. *)
let multi_hazard_tests = "multi_hazard" >::: [
  mk_test "eva_three_different_hazards"  20  "EAVR";
  mk_test "thermal_reused_across_two_radiation_zones"  15  "WRWR";
  mk_test "thermal_handles_both_hazard_types"  18  "WT_RA";
  mk_test "swap_taumoeba_for_eva_mid_route"  16  "TA_EV";
  mk_test "two_separate_hazard_groups"  17  "WR__WR";
]

(** [edge_tests] checks [min_time] on routes that require non-obvious tool
    selection, including choosing the cheapest of multiple available tools,
    ignoring tools placed after the hazard they could serve, and carrying a
    tool across many safe sections to reach a distant hazard. *)
let edge_tests = "edge_cases" >::: [
  mk_test "pick_cheapest_tool_for_astrophage"  10  "ET_A";
  mk_test "tool_after_hazard_cannot_help"  10  "EAT";
  mk_test "pick_cheapest_tool_for_astrophage2"  7  "ETA";
  mk_test "either_way_same_cost"  9  "TEA";
  mk_test "pick_last_tool"  10  "T_EA";
  mk_test "single_hazard_at_the_end"  18  "T____A";
]

(** Runs all test suites for [min_time] using [OUnit2]. *)
let () =
  run_test_tt_main ("hail_mary" >::: [
    sample_tests;
    trivial_tests;
    unnecessary_carrying_tests;
    single_hazard_tests;
    multi_hazard_tests;
    edge_tests;
  ])
