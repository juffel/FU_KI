connection(a, b).
connection(a, c).
connection(b, d).
connection(b, e).
connection(c, d).
connection(c, e).

connected(X, Y):-
  connection(X, Y);
  connection(Y, X).


path(X, Y, P):-
    path2(X, Y, P, []).


path2(X, _, _, CL):-
    connected(X, Z),
    member(Z, CL), !.


path2(X, Y, P, _):-
    connected(X, Y),
    write([Y | P]).


path2(X, Y, [Z|P], CL):-
    connected(X, Z),
    path2(Z, Y, P, [Z | CL]).

allPaths(X,Y,L) :-
    findall(P, path(X, Y, P), L).
