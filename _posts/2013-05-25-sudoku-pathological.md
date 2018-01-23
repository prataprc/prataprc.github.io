---
layout: post
title: "Sudoku, backtracking and pathological situation"
permalink: sudoku-pathological.html
---

This write-up describes a sudoku program developed to solve 2x2, 3x3 and 4x4
sudoku puzzles. Source code for the same can be found in
[github][github-link]

The backtracking algorithm that solves sudoku puzzle has exponential
complexity, and suffers from pathological combinations that can throw the
algorithm into a for-ever-loop.

The algorithm works on an unsolved sudoku puzzle, with N elements
pre-populated - which is the measure of difficulty. That is, say for a 9x9
table of numbers, may be just 10 can be pre-populated. The algorithm uses a
double recursive backtracking logic to find the right combination of numbers
satisfying the game rules. So, for a 9x9 table with 10 pre-populated elements,
the program must fill the remaining 71 slots and for each slot there are
9 choices ([1,2,3,4,5,6,7,8,9]).

The first recursion logic moves from one slot to the next, column-wise and
then row-wise. At every step, it tries to reduce the available choices for an
unfilled slot. There are 6 intelligent functors that applies primitive human
logic to reduce the choices. It then detects whether it has taken the right
path by checking with the game rules. If it detects that it has taken a bad
path it backtracks.

The second recursion logic kicks in when the first recursive function detects
that it has taken the right path (so far), and finds that the current slot has
more than one choice left irreducible. The logic will recur over remaining 
choices, and calling back to first recursion logic. So on and so forth ...

Pathological case
-----------------

A pathological case is an input combinations that can make the puzzle solver to
keep executing bad paths for a long time before finding the right path.

Any backtracking algorithm, while executing, will have to make several
choices  before finding the right solution.  We will take our Sudoku puzzle
solver as an  example and expound further -

For a 9x9 puzzle, with 10 elements pre-populated,  should leave 71 slots
unfilled.  And for each slot there are 9 choices to make 
[1,2,3,4,5,6,7,8,9]. If we are using a brute force backtracking algorithm, it
will  have to pass 71 steps (to fill each slot) and for each step it will have
to make nine  choices, making the number of
possible paths to ::

    56392087339601733413306017749077372989860250021295987473736382457209L,

(do not try to interpret, it is way beyond trillions)

This is the worst case for a brute force backtracking algorithm before it
succeeds or fails. But our implementation is not brute force ! It uses
intelligent functors to reduce the choices for each slot.

For the sake of argument, let us say that the functors are able to
reduce the number of choices to 2 - all the time. Then our algorithm will have
to pass 71 steps and for each step it will have to make 2 choices. This will
reduce the number of possible paths to (in worst case) ::

    2361183241434822606848L.

It will still take light years to exhaust all possible paths.

Concurrent sudoku puzzle solver
-------------------------------

To explain how the concurrent algorithm works we are going to use the
following combination as the example ::

    {
     {0,0,2,0,0,4,0,0,9},
     {0,0,0,0,0,9,0,0,0},
     {0,6,0,0,0,0,0,4,8},
     {0,3,5,0,0,0,0,0,0},
     {0,0,6,0,0,0,1,0,0},
     {0,9,0,0,0,5,0,0,4},
     {4,0,0,0,5,0,0,0,0},
     {6,0,0,0,0,2,0,0,0},
     {9,0,0,0,4,6,0,0,0}
    }.

In above case, first slot is unfilled and our functors can reduce the choices
to [1,3,5,7,8]. Once the algorithm knows that those are  irreducible choices,
it will spawn 5 processes, picking a unique  choice for each one of them.
Each of those process will continue from the second slot and repeat the same
logic all over again.

Soon our algorithm is going to spawn millions and millions of processes only to
find that it has taken a bad path. So we will add a cap on the maximum number
of processes it can spawn, **say 100** !

All I did was to change couple of lines in existing code and add another 40
lines to implement the concurrent logic. If you have cloned my repository,
[github][github-link], you can check this out under `src/sudoku_slv.erl` file.
There are two application parameters worth noting here,

- **concurrent** boolean(), `false` to use sequential algorithm and `true` to
  a concurrent backtracking algorithm.
- **procs** Integer(), while executing in concurrent mode, limits the number of
  spawn-able process.

[github-link]: https://github.com/prataprc/sudoku

