# Linguagens e Ambientes de Programação (2026 Edition)

(Para ler esta página em português, clique [aqui](README.md))

The curriculum of this course covers the fundamentals of programming language design, using functional programming in OCaml as a vehicle for a broader understanding of the concepts.

Corrections and suggestions are very much welcomed. (e-mail: i.chirica \<at> campus.fct.unl.pt)

## Announcements

Important announcements and changes to this page will be posted in this section.


## References

The primary reference for the course is the book "OCaml Programming: Correct + Efficient + Beautiful" by Michael R. Clarkson and others. The book is freely available online at OCaml Programming: [OCaml programming: Correct + Efficient + Beautiful](https://cs3110.github.io/textbook/). In addition to the course materials, instructors encourage reading the book and completing the exercises it proposes. The book also includes lecture videos from Cornell University's CS3110 course, recorded during the pandemic.

The second reference for this unit is the book "Programming Languages Pragmatics" by Michael L. Scott and Jonathan Aldrich. The book is available in the school library, and online resources for the book can be found at [Programming Languages Pragmatics](https://www.cs.rochester.edu/~scott/pragmatics/).

During lectures, references will be made to materials from other books freely available online from the [Books On OCaml](https://ocaml.org/books) page. Namely:

* "OCaml from the Very Beginning" by John Whitington. The book is freely available online at [OCaml From the Very Beginning](https://ocaml-book.com/).

* "Introduction to OCaml" by Jason Hickey. The book is freely available online at [Introduction to OCaml](http://courses.cms.caltech.edu/cs134/cs134b/book.pdf).

* "Real World OCaml" by Yaron Minsky, Anil Madhavapeddy, and Jason Hickey. The book is freely available online at [Real World OCaml](https://dev.realworldocaml.org/).

## Instructors Office Hours

Office hours will be held by appointment via email the day before at the following locations and contacts:

| Teacher         | Office hours             | E-mail                                |
|-----------------|--------------------------|---------------------------------------|
| João Costa Seco | Thursday 16h30 (P2/1-II) | joao.seco \<arroba> fct.unl.pt        |
| Vasco Amaral    | Monday 16h30             | vasco.amaral \<arroba> fct.unl.pt     |
| Mario Pereira   | Wednesday 10h00          | mjp.pereira \<arroba> fct.unl.pt      |
| Ion Chirica     | Monday 18h00             | i.chirica \<arroba> campus.fct.unl.pt |


## Syllabus

The plan for the theoretical classes is as follows: (This may change anytime without warning):

(The dates for the english version correspond to the lecture T1, and lab P1.)

|Week|Date|Theoretical|Practical|Materials|
|----|----|-----------|---------|---------|
|1|25/2|[Introduction. Logistics and evaluation.](slides/en/lec0.pdf) [The history and future of programming languages.](slides/en/lec1.pdf)|||
|1|P|||No labs. Though, we recommend you follow the [installation guide](praticas/en/lab1/installation.md).||
|1|26/2|[Functional programming. The OCaml language. Expressions, Variables, and Types. Library functions. Basic Input/Output.](slides/en/lec2.pdf)|||
|2|4/3|[Name declaration; function declaration, with and without parameters; Expression evaluation by substitution; Functions as values (first time); Partial function evaluation.](slides/en/lec3.pdf)|||
|2|5/3|[Functions with multiple parameters, Currying. Pre- and post-conditions. Program correctness. Unit testing. Functions as values (Higher-order). Function composition.](slides/en/lec4.pdf)|||
|2|P||[Exercises: Expressions, Variables and Types in OCaml](praticas/en/lab1/lab1_exp_vars_types(2).ipynb)||
|3|10/3|[Recursive functions over natural numbers. Inductive reasoning vs. Iterative reasoning. Tail recursion.](slides/en/lec6.pdf)|||
|3|11/3|No lecture. Celebrations of the 50th anniversary of the Computer Science degree.|||
|3|P||[Exercises 1: Function types, type conversion and function evaluation](praticas/en/lab2/lab2_basic_functions(1).ipynb) ||
|3|P||[Exercises 2: Input/Output, Unit Testing and Recursive Function Definition in OCaml](praticas/en/lab2/lab2_io_unit_rec(2).ipynb) ||
|4|18/3|[Recursive functions over natural numbers (recap). Function type. Polymorphism. Type inference.](slides/en/lec5.pdf)|||
|4|19/3|[Composite types: pairs, sum types and pattern matching.](slides/en/lec7.pdf)|||
|4|P||[Exercises: Inductive Reasoning](praticas/en/lab3/lab3_inductive.ipynb) | [Dune project](praticas/en/lab3/tiles.zip)|
|5|26/3|[Exercises on Lists. Higher-order functions. Maps and folds.](slides/en/lec9.ipynb) [PDF](slides/en/lec9.pdf) [Lists](slides/en/lec9_1.ipynb) [PDF](slides/en/lec9_1.pdf)|||
|5|P||[Exercises: Product and sum types](praticas/en/lab4/lab4_prod_sum_types_recs.ipynb)||
|6|P||[Exercises: Lists](praticas/en/lab5/lab4_lists.ipynb) [Exercises: Higher-order functions](praticas/en/lab5/lab5_comb_higer_order_fun.ipynb)||
|6|1/4|[Merge sort.](slides/pt/aula10.ipynb) [PDF](slides/pt/aula10.pdf)|||
|7|8/4|[Algebraic Types. Binary trees.](slides/en/lec11.ipynb) [PDF](slides/en/lec11.pdf)|||
|7|9/4|[N-ary trees.](slides/en/lec12.ipynb) [PDF](slides/en/lec12.pdf)|||
|7|P|Project support.|||
|-|Project 1|||[Hail Mary Rescue](praticas/en/project1/HailMaryRescue.pdf) [Dune project](praticas/en/project1/hailmary.zip)|
|8|15/4|No lecture (ExpoFCT event).|||
|8|16/4|Exercise session.|||
|8|16/4|First Test.|||
|8|P||||
|9|22/4|No lecture.|||
|9|23/4|No lecture.|||
|9|P||[Exercises: Pairing Heap](praticas/en/lab7/lab7_pairing_heap.ipynb)|[PDF](praticas/en/lab7/pairing_heap.pdf)|
|10|29/4|[Modules. Mutable state.](slides/en/lec14.pdf)|||
|10|30/4|[Memoization](slides/en/lec15.pdf)|||
|10|P||[Exercises: Quad trees](praticas/en/lab8/lab8_quadtrees.ipynb)|[PDF](praticas/en/lab8/lab8_quadtrees.pdf) (To appear)|
|11|6/5|[Execution support for Object-Oriented languages. Support mechanisms for Datalog and Prolog.](slides/en/lec16.pdf)|||
|11|7/5|[Code as data, parsing. Stack machines.](slides/en/lec17.pdf)|||
|11|P|| [Exercises: Modular Pairing Heap](praticas/en/lab9/lab9_functor_pairing_heap.ipynb) [Exercises: Memoization](praticas/en/lab9/lab9_memoisation.ipynb)||
|-|Project 2|||[From Mondrian to Escher](praticas/en/project2/Eschers.pdf) [Starter Code](https://github.com/lap-2026/project2starter)|
|12|13/5|Interpreter construction. Defining the semantics of a language.|||
|12|14/5|Type systems. Inference vs. checking. Linearity in Rust.|||
|13|20/5|Compiler construction.|||
|13|21/5|Lambda-calculus interpreter. Closures.|||
|14|27/5|Type inference in Lambda-calculus.|||
|14|28/5|Test questions.|||
||9/6|Second test.|||
