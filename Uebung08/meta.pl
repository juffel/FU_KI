% metainterpreter for prolog code, that handles conjunctions and disjunctions of predicates

% testfacts
peter.
bar(blubb).
plonk(sqortch).
brud(ab,ba).
foo(X,Y) :- bar(X), plonk(Y).

% simply call builtin interpreter
cheato(A):-call(A).


solve(true).
% handle conjunction of predicates
% something like:
% foo(X,Y) :- bar(X), plonk(Y).
solve((A,B)):-
    solve(A), solve(B).

% handle disjunction of predicates
% something like:
% foo(X,Y) :- bar(X); plonk(Y).
solve((A;B)):-
    solve(A);
    solve(B).

% solve simple, non-compound statements
solve(A):-
    clause(A,Body),
    solve(Body).
