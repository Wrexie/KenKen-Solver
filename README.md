# KenKen-Solver
6x6 KenKen puzzle solver in prolog.

Sample query:
```
S = [[_,_,_,_,_,_],
     [_,_,_,_,_,_],
     [_,_,_,_,_,_],
     [_,_,_,_,_,_],
     [_,_,_,_,_,_],
     [_,_,_,_,_,_],],
     S = [A, B, C, D, E, F],
     solve(S, [
               cage(div, 2[[0, 0, [1, 0]]),
               cage(mult, 180, [[0, 1], [0, 2], [1, 1], [1, 2]]),
               cage(mult, 12, [[0, 3], [1, 3], [2, 3]]),
               cage(sub, 2, [[0, 4], [0, 5]]),
               cage(add, 13, [[1, 4], [1, 5], [2, 5], [3, 5]]),
               cage(id, 3, [[2, 0]]),
               cage(mult, 30, [[2, 1], [2, 2], [3, 2]]),
               cage(mult, 360, [[2, 4], [3, 3], [3, 4], [4, 3]]),
               cage(mult, 20, [[3, 0], [4, 0], [3, 1]]),
               cage(mult, 144, [[4, 1], [4, 2], [5, 0], [5, 1]]),
               cage(sub, 5, [[4, 4], [4, 5]]),
               cage(add, 13, [[5, 2], [5, 3], [5, 4], [5, 5]])
               ]).
```
