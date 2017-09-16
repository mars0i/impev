impev
===

[Imprecise
probability](https://en.wikipedia.org/wiki/Imprecise_probability) and
population genetics in [OCaml](http://ocaml.org/) using
[Owl](https://github.com/ryanrhymes/owl) and other libraries.
Experimental work in progress.

Some of this will be reorganized in the future.  Some of it was
written when I was learning OCaml.  (I am still learning OCaml.)

A few resources for learning about imprecise probability or population
genetics are listed below.

## What's here

### src/lib/models

#### wrightfisher.ml: simultaneous Wright-Fisher models, PDF plot generation:

For modeling finite sets of transition probabilities generated by
Wright-Fisher models with natural selection.

#### setchains.ml: implementations of algorithms in chapter 2 of *Markov Set-Chains*, by Darald J. Hartfiel, Springer 1998:

These model continuous sets of stochastic transition matrices that fall
within a matrix "interval", i.e. all stochastic matrices such that each
element `x` is s.t. `l <= x <= h`, where `l` and `h` are corresponding
elements of a low matrix `L` and a high matrix `H`.
You can also start from an initial probability "interval", i.e. all
stochastic vectors such that each element `x` is s.t. `l <= x <= h`,
where `l` and `h` are correspoding elements of low and high vectors.
Note that the low and high vectors are not typically stochastic vectors,
nor the low and high matrices typically transition matrices.
(Stochastic vectors here are row vectors, and it's each row of a matrix that
sums to 1, so multiplication of a vector and a matrix typically
happens with the vector on the left.)

### src/lib/utils

#### genl.ml: general-purpose utilities    
#### prob.ml: probability-related utilities


### src/misc
miscellaneous code, potentially useful now or in the future,
including:

#### setchain_egs.ml: definitions for specific examples in Hartfiel (see above)


### src/bin

#### wrightfisherPDFs.ml: source for command line executable that generates simultaneous Wright-Fisher model PDFs

#### setchaintest.ml: miscellaneous tests for setchains.ml


### doc

Miscellaneous notes.  Don't expect to find any systematic
documentation here.


## Resources for learning about imprecise probability or population genetics

### Imprecise probability

[SIPTA: The Society for Imprecise Probability: Theories and
Applications](http://www.sipta.org).

[Imprecise
Probabilities](https://plato.stanford.edu/entries/imprecise-probabilities)
by Seamus Bradley in the *Stanford Encyclopedia of Philosophy*.

[Terrence L. Fine's
papers](https://scholar.google.com/citations?user=CKPeC3IAAAAJ&hl=en).
(There are many other important writers on imprecise probability (IP),
but most of the work is focused on IP as an extension of Bayesian
probability.  Fine and his collaborators have done the most work on
objective imprecise probability, which is what particularly interest me.)

A few good books:

* A handbook-style introductory survey, *Introduction
to Imprecise Probaibiliies* edited by Augustin et al.
* The perhaps easier *Lower Previsions* by Troffaes and de Cooman
* A philosophical classic, *The Enterprise of Knowledge* by Isaac Levi
* The philosophical and mathematical classic of the field, *Statistical
Reasoning with Imprecise Probaiblities* by Peter Walley
* *Markov Set-Chains* by Darald J. Hartfiel. A beautiful little book on
methods for extending Markov chains for one kind of imprecise probability
(or uncertainty, which is how Hartfiel frames the domain).

There's much more.

### Population genetics

Where to start?  This is a huge area in evolutionary biology.

Samir Okasha's [article in the Stanford Encyclopedia of
Philosophy](https://plato.stanford.edu/entries/population-genetics)
provides an overview of basic ideas as well as history and philosophical
issues.

My favorite textbooks include:

* *Population Genetics: A Concise Guide* by John H. Gillespie. (The
first and second editions are similar, but there is valuable material
in each that's not in the other.)

* *Elements of Evolutionary Genetics* by Charlesworth and
  Charlesworth.

* *Evolutionary Theory: Mathematical and Conceptual Foundations* by
  Sean H. Rice.

