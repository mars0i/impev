
(** Calculate Wright-Fisher transition probabilities with selection.
    Based on Ewens _Mathematical Population Genetics I, 2nd ed, 
    equations 1.58, 1.59, and 1.25, though similar formulas can be 
    found in many places. *)

module Mat = Owl.Mat
module Math = Owl.Maths (* note British->US translation *)

(** 1.59 *)
let weight_i popsize fitnesses freq =
  let i, i' = float freq, float ((2 * popsize) - freq) in
  let w11, w12, w22 = fitnesses in
  let a_hom, het, b_hom = w11 *. i *. i,
                          w12 *. i *. i',
                          w22 *. i' *. i' in
  (a_hom +. het) /. (a_hom +. 2. *. het +. b_hom)

(* TODO seems to work for small pops but not large.  Is there a problem
 * with Math.combination?? *)

(* TODO inefficiently calls weight_i multiple times with same args. *)
(** Wright-Fisher transition probability from frequency = i to frequency = j *)
let prob_ij popsize fitnesses prev_freq next_freq =
  let alleles = 2 * popsize in
  let wt = weight_i popsize fitnesses prev_freq in
  let other_wt = 1. -. wt in
  let j = float next_freq in
  let j' = float (alleles - next_freq) in
  let comb = float (Math.combination alleles next_freq) in
  comb  *.  wt ** j  *.  other_wt ** j'

(*
(** prob_ij with an extra argument that's ignored.  For use with mapi. *)
let prob_ijf popsize fitnesses prev_freq next_freq ignored_float =
  prob_ij popsize fitnesses prev_freq next_freq
*)

let tranmat popsize fitnesses =
  let dim = 2 * popsize + 1 in
  let m = Mat.empty dim dim  in
  Mat.mapi (fun row col _ -> prob_ij popsize fitnesses row col) m
