%Kai's Idee:

heuristikKai([X], [Z], N) :-
  (X == Z), !, N is N;
  (X \= Z), N is (N + 1).

heuristikKai([X | Xs], [Z | Zs], 0) :-
  (X == Z), !, heuristik(Xs, Zs, 0);
  (X \= Z), heuristik(Xs, Zs, 1).

heuristikKai([X | Xs], [Z | Zs], N) :-
  (X == Z), !, heuristik(Xs, Zs, N);
  (X \= Z), heuristik(Xs, Zs, N+1).