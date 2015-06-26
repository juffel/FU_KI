% kinder(X,L)
kinder(X,L) :-
    findall(P, move(X,P),L).

