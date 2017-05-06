module L  = Batteries.List

open Probmat

(*********** test data ***********)

let om_max = 6 (* max index into atoms, = omega size - 1 *)
let om_sz = om_max + 1
let num_dists = 40 (* number of probability functions *)

(* a list of num_dists probability dists on omega_sz atoms *)
let ps = L.init num_dists (fun _ -> unif_stoch_vec om_sz) 

(* probabilities for algebras for each of the num_dists distributions *)
let algs = L.map algebra_probs ps (* alists mapping atom lists to probs *)

(* min and max values of atomic probs across all num_dists distributions *)
let mins = min_elts ps
let maxs = max_elts ps

(* min and max values of probs for each member of the algebra *)
let min_alg = min_algebra_elts algs
let max_alg = max_algebra_elts algs

(* prob values for each member of the algebra computed using (3) in Skulj 
 * The first two are min'ed to produce the third. *)
let f_mins = pri_f_field_simple_sums om_max mins
let f_inverted_maxs = pri_f_field_inverted_sums om_max maxs
let f_lowers = pri_f_field_lowers om_max mins maxs

(* prob values for each member of the algebra computed using (4) in Skulj
 * The first two are max'ed to produce the third. *)
let f_maxs = pri_f_field_simple_sums om_max maxs
let f_inverted_mins = pri_f_field_inverted_sums om_max mins
let f_uppers = pri_f_field_uppers om_max mins maxs

(* old versions *)
let f_old_lowers = pri_F_field_Lowers om_max mins maxs
let f_old_uppers = pri_F_field_Uppers om_max mins maxs

;;


(* test *)
Printf.printf "\natomic dists:\n";;
L.iter (fun m -> Owl.Mat.print m) ps;;
Printf.printf "\nmin dist:";;
Owl.Mat.print mins;;
Printf.printf "\nmax dist:";;
Owl.Mat.print maxs;;
Printf.printf "\nYow!\n";;


