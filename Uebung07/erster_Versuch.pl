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
  connected(X, Y),
  write([X, Y] | P).

path(X, Y, P):-
  connected(Z, Y),
  path(X, Z, [[Z, Y] | P]).
