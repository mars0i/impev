module L  = Batteries.List
module M = Owl.Mat
module P = Probmat

(*********** test data ***********)

let om_max = 3 (* max index into atoms, = omega size - 1 *)
let om_sz = om_max + 1
let num_dists = 10 (* number of probability functions *)

(* a list of num_dists probability dists on omega_sz atoms *)
let ps = L.init num_dists (fun _ -> P.unif_stoch_vec om_sz) 

(* probabilities for algebras for each of the num_dists distributions *)
let algs = L.map P.algebra_probs ps (* alists mapping atom lists to probs *)

(* min and max values of atomic probs across all num_dists distributions *)
let mins = P.min_elts ps
let maxs = P.max_elts ps

(* min and max values of probs for each member of the algebra *)
let min_alg = P.min_algebra_elts algs
let max_alg = P.max_algebra_elts algs

(* prob values for each member of the algebra computed using (3) in Skulj 
 * The first two are min'ed to produce the third. *)
let f_mins = P.simple_sums om_max mins
let f_inverted_maxs = P.inverted_sums om_max maxs
let f_lowers = P.pri_f_field_lowers om_max mins maxs

(* prob values for each member of the algebra computed using (4) in Skulj
 * The first two are max'ed to produce the third. *)
let f_maxs = P.simple_sums om_max maxs
let f_inverted_mins = P.inverted_sums om_max mins
let f_uppers = P.pri_f_field_uppers om_max mins maxs

let f_intervals = P.pri_f_field_intervals f_lowers f_uppers

;;

(* test *)
Printf.printf "\natomic dists:\n";;
L.iter (fun m -> Owl.Mat.print m) ps;;
Printf.printf "\nmin dist:";;
Owl.Mat.print mins;;
Printf.printf "\nmax dist:";;
Owl.Mat.print maxs;;
Printf.printf "\nalgebra uppers:\n";;
Printf.printf "%s\n" (P.string_of_alg_probs f_uppers);;
Printf.printf "\nalgebra lowers:\n";;
Printf.printf "%s\n" (P.string_of_alg_probs f_lowers);;
Printf.printf "\nalgebra intervals:\n";;
Printf.printf "%s\n" (P.string_of_alg_intervals f_intervals);;
Printf.printf "\nYow!\n";;


