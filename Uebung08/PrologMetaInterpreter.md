
** noch zu formatieren**

solve(X):-
    solve(X,C,R), 
    (C==!,!,solve(R);true).

solve(true,_,_):-!.

solve(!,!,true):-!. solve((A,B),X,Y):- !,solve(A,X,R),
vater(adam,abel). vater(adam,cain):-!. vater(abel,isaac). opa(X,Y):-!,vater(X,Z),vater(Z,Y).
