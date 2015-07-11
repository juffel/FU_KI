%1)

expr(add(Y,Z))  --> fac(Y), "+", expr(Z).
expr(X)     	--> fac(X).
fac(mul(Y,Z))   --> term(Y),"*", fac(Z).
fac(X)      --> term(X).
term(X)     --> n(X).
term(X)     --> "(", expr(X), ")".
%i(i(X,Y))   --> "(", n(X), ",", n(Y), ")".
 
n(X)        --> z(X,_).
n(X)        --> z(Y,_), ".", z(Z,A), {X is Y+10^(-A)*Z}.
n(X)        --> "-", z(Y,_), {X is -Y}.
n(X)        --> "-", z(Y,_), ".", z(Z,A), {X is -(Y+10^(-A)*Z)}.
% z(wert,anzahl der ziffern)
z(X,B)      --> num(Y), z(Z,A), {X is Y*10^A+Z, B is A+1}.
z(X,1)      --> num(X).
num(1)      --> "1".
num(2)      --> "2".
num(3)      --> "3".
num(4)      --> "4".
num(5)      --> "5".
num(6)      --> "6".
num(7)      --> "7".
num(8)      --> "8".
num(9)      --> "9".
num(0)      --> "0".


%2)

% if a mit CF1 then b mit CF2
algebra1(CF1,CF2,Res) :- Res is round(CF1 * CF2 / 100).

% CF1 and CF2
algebra2(CF1,CF2,Res) :- min(CF1,CF2,Res).

% combine CF1 und CF2 (wenn zwei Regeln den gleichen Fakt herleiten)
algebra3(X,Y,Z) :-
    X >= 0,
    Y >= 0,
    A is X+Y*(100-X)/100,
    Z is round(A),!.

algebra3(X,Y,Z) :-
    X =< 0,
    Y =< 0,
    algebra3(-X, -Y, A),
    Z is -A.

algebra3(X,Y,0) :-
    ((X < 0, Y > 0);
    (Y < 0, X > 0)),
    abs_min(X,Y,A),
    A == 100.

algebra3(-100,100,0). % Wegen Division durch 0 
algebra3(100,-100,0). % Wegen Division durch 0
algebra3(X,Y,Z) :-
    ((X < 0, Y > 0);
    (Y < 0, X > 0)),
    abs_min(X,Y,A),
    B is 100 * (X+Y) / (100-A),
    Z is round(B).

abs_min(X,Y,Z) :-
    abs(X,A),
    abs(Y,B),
    Z is min(A,B).


