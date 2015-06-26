% Corner
move([b, X | Rest], [X, b | Rest]).
move([b, X1, X2, X3 | Rest], [X3, X1, X2, b | Rest]).

move([_, X1, b | Rest], [_, b, X1 | Rest]).
move([_, X1, b, _, _, X2 | Rest], [_, X1, X2, _, _, b | rest]).

move([_, _, _, X1, _, _, b, X2, _], [_, _, _, b, _, _, X1, X2, _]).
move([_, _, _, X1, _, _, b, X2, _], [_, _, _, X1, _, _, X2, b, _]).

move([_, _, _, _, _, X1, _, X2, b], [_, _, _, _, _, b, _, X2, X1]).
move([_, _, _, _, _, X1, _, X2, b], [_, _, _, _, _, X1, _, b, X2]).

% Edge
move([X1, b | Rest], [b, X1 | Rest]).
move([X1, b, X2 | Rest], [X1, X2, b | Rest]).
move([X1, b, X2, X3, X4 | Rest], [X1, X4, X2, X3, b | Rest]).

move([X1, _, _, b, X2, _, X3, _, _], [b, _, _, X1, X2, _, X3, _, _].
move([X1, _, _, b, X2, _, X3, _, _], [X1, _, _, X2, b, _, X3, _, _].
move([X1, _, _, b, X2, _, X3, _, _], [X1, _, _, X3, X2, _, b, _, _].

move([_, _, X1, _, X2, b, _, _, X3], [_, _, b, _, X2, X1, _, _, X3]).
move([_, _, X1, _, X2, b, _, _, X3], [_, _, X1, _, b, X2, _, _, X3]).
move([_, _, X1, _, X2, b, _, _, X3], [_, _, X1, _, X2, X3, _, _, b]).

move([_, _, _, _, X1, _, X2, b, X3], [_, _, _, _, b, _, X2, X1, X3]).
move([_, _, _, _, X1, _, X2, b, X3], [_, _, _, _, X1, _, b, X2, X3]).
move([_, _, _, _, X1, _, X2, b, X3], [_, _, _, _, X1, _, X2, X3, b]).

% Middle
move([_, X1, _, X2, b, X3, _, X4, _], [_, b, _, X2, X1, X3, _, X4, _]).
move([_, X1, _, X2, b, X3, _, X4, _], [_, X1, _, b, X2, X3, _, X4, _]).
move([_, X1, _, X2, b, X3, _, X4, _], [_, X1, _, X2, X3, b, _, X4, _]).
move([_, X1, _, X2, b, X3, _, X4, _], [_, X1, _, X2, X4, X3, _, b, _]).

rotate([X1, X2, X3, X4, X5, X6, X7, X8, X9], Goal):-
  Goal = [X7, X4, X1, X8, X5, X2, X9, X6, X3].