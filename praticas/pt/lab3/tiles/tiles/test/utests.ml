open OUnit2
open Tiles

let tests_tiles = "test suite for tiles" >::: [
  (* n_k_element *)
  (* base *)
  "tiles base1" >:: (fun _ -> assert_equal 1 (tiles 0));
  "tiles base2" >:: (fun _ -> assert_equal 1 (tiles 1));
  "tiles base3" >:: (fun _ -> assert_equal 1 (tiles 2));
  "tiles base4" >:: (fun _ -> assert_equal 2 (tiles 3));
  (* general *)
  "tiles general1" >:: (fun _ -> assert_equal 4 (tiles 4));
  "tiles general2" >:: (fun _ -> assert_equal 17 (tiles 7));
  "tiles general3" >:: (fun _ -> assert_equal 305 (tiles 13));
  "tiles general4" >:: (fun _ -> assert_equal 3383 (tiles 18));
  "tiles general5" >:: (fun _ -> assert_equal 60697 (tiles 24));
  (* invalid inputs *)
  (* "tiles invalid" >:: (fun _ -> test_fail1 tiles (-1)); *)
]

let () = run_test_tt_main tests_tiles
