
** noch zu formatieren**

solve(X):-
    solve(X,C,R), 
    (C==!,!,solve(R);true).

solve(true,_,_):-!.

solve(!,!,true):-!. solve((A,B),X,Y):- !,solve(A,X,R),(X==!,!,Y=(R,B); solve(B,X,Y)).solve((A;B),X,Y):- !,(solve(A,X,Y), (X==!,!;true);solve(B,X,Y)).system(A),!, call(A).clause(A,B), solve(B,X,R),(X==!,!,solve(R);true).solve(A,_,_):- solve(A,_,_):-system(=(_,_)). system(==(_,_)). system(fail). system(nl). system(read(_)). system(write(_)). system(is(_,_)). system(>(_,_)). system(<(_,_)). system(clause(_,_)). system(call(_)). system(var(_)).
vater(adam,abel). vater(adam,cain):-!. vater(abel,isaac). opa(X,Y):-!,vater(X,Z),vater(Z,Y).a:-c.a:- !,fail. a:- b,!,c. a:-c.b.c.

