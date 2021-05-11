% 6x6 KenKen Puzzle Solver
% By: Andrew Baltazar (Wrexie)

:- use_module(library(clpfd)).

% True if Z = X + Y
adds_to(X, Y, Z) :- Z #= X + Y.

% True if Z = X * Y
mults_to(X, Y, Z) :- Z #= X * Y.

% Sums all values in a list by using adds_to() inside foldl()
sum_list(List, S) :- foldl(adds_to(), List, 0, S).

% Multiplies all values in a list by using mutls_to() inside foldl()
product_list(List, S) :- foldl(mults_to(), List, 1, S).

% Maps single coordinate pair to value in solution
get_cells(S, [I, J], Val) :- nth0(I, S, X), nth0(J, X, Val).

% Gets the values of each cell in S from a list of cell coordinate pairs
cell_values(Cells, S, Values) :- maplist(get_cells(S), Cells, Values).

% Check constraint for ID cages 
check_constraint(S, cage(id, Value, Cells)) :- cell_values(Cells, S, X), sum_list(X, Y), Value = Y.

% Check constraint for Addition cages 
check_constraint(S, cage(add, Value, Cells)) :- cell_values(Cells, S, X), sum_list(X, Y), Value = Y.

% Check constraint for Subtraction cages
check_constraint(S, cage(sub, Value, Cells)) :- cell_values(Cells, S, X), nth0(0, X, Elem1), nth0(1, X, Elem2), Sub1 #= Elem1 - Elem2, Sub2 #= Elem2 - Elem1, ((Value = Sub1) ; (Value = Sub2)).

% Check constraint for Multiplication cages
check_constraint(S, cage(mult, Value, Cells)) :- cell_values(Cells, S, X), product_list(X, Y), Value = Y.

% Check constraint for Division cages 
check_constraint(S, cage(div, Value, Cells)) :- cell_values(Cells, S, X), nth0(0, X, Elem1), nth0(1, X, Elem2), Div1 #= Elem1 // Elem2, Div2 #= Elem2 // Elem1, ((Value = Div1) ; (Value = Div2)).

% Checks the solution against all of the cages given to verify the solution is correct
check_cages(S, Cages) :- maplist(check_constraint(S), Cages).

% Solves a 6x6 KenKen puzzle
solve(S, Cages) :-
	% Generates a single list of values from our solution
	append(S, Values),
	% Checks the list of values generated to make sure each value is between 1 and 6
	Values ins 1..6,
	% Checks to make sure each row in the solution contains all different values
	maplist(all_different, S),
	% Transposes matrix to give a list of columns
	transpose(S, Cols),
	% Checks to make sure each column in the solution contains all different values
	maplist(all_different, Cols),
	% Calls check_cages with the solution and list of cages as a parameter to verify
	% the solution satisfies each cage
	check_cages(S, Cages),
	% Print all rows in the solution
	maplist(label(), S).


	
