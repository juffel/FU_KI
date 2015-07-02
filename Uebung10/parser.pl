test(X) :- expr(X,"1.3*23+(-4)*(8+5)",[]).
% add(mul(1.3, 23), mul(-4, add(8, 5)))

expr(add(Y,Z)) --> term(Y), "+", expr(Z).
expr(X)     --> term(X).
term(X)     --> n(X).
term(X)     --> "(", expr(X), ")".



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


