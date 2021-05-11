# KenKen-Solver
6x6 KenKen puzzle solver in prolog.

A query consists of a solution `S` which will represent the rows and columns of your blank puzzle and a list of cages that will define the individual cages of the puzzle with their respective arithmetic operations.  

Cages are defined by using the `cage(identifier, result, cell coordinates)` functor.  

The cage identifier can be any one of the following arithmetic operations:  
`div` - division  
`mult` - multiplication  
`add` - addition  
`sub` - subtraction  
`id` - single integer  

The result is simply the result of performing the arithmetic operation on the numbers inside the specified cage. The cell coordinates consistes of a list of [x, y] coordinates specifying the location of each cell in the matrix.

Sample query:
```
S = [[_,_,_,_,_,_],
     [_,_,_,_,_,_],
     [_,_,_,_,_,_],
     [_,_,_,_,_,_],
     [_,_,_,_,_,_],
     [_,_,_,_,_,_]],
     S = [A, B, C, D, E, F],
     solve(S, [
               cage(div, 2, [[0, 0], [1, 0]]),
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

This will solve the 6x6 KenKen puzzle shown in the image below:

![sample_6x6_kenken_puzzle](https://user-images.githubusercontent.com/61041168/117743917-95324600-b1bc-11eb-939c-a90e91736d86.PNG)

Output of the sample query:

![kenken_solver_sample_output](https://user-images.githubusercontent.com/61041168/117743984-b2671480-b1bc-11eb-84bc-880a91547a27.PNG)
