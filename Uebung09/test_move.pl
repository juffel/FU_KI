move(X, X) :-
  fail

move([b, X | Rest], [X, b | Rest]).
move([b, X1, X2, X3 | Rest], [X3, X1, X2, b | Rest]).

move([X1, b | Rest], [b, X1 | Rest]).
move([X1, b, X2 | Rest], [X1, X2, b | Rest]).
move([X1, b, X2, X3, X4 | Rest], [X1, X4, X2, X3, b | Rest]).

move([_, X1, _, X2, b, X3, _, X4, _], [_, b, _, X2, X1, X3, _, X4, _]).
move([_, X1, _, X2, b, X3, _, X4, _], [_, X1, _, b, X2, X3, _, X4, _]).
move([_, X1, _, X2, b, X3, _, X4, _], [_, X1, _, X2, X3, b, _, X4, _]).
move([_, X1, _, X2, b, X3, _, X4, _], [_, X1, _, X2, X4, X3, _, b, _]).