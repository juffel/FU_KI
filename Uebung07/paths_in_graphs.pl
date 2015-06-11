% undirected graph definition
% points
a.
b.
c.
d.
e.

% edges
def_con(a,b).
def_con(a,c).
def_con(b,d).
def_con(b,d).
def_con(c,d).
def_con(c,e).
def_con(d,e).

% make edges undirected
con(X,Y) :- def_con(X,Y); def_con(Y,X).

% find preferably loop-free path P from X to Y
path(X,Y,P) :- con(X,Y), P is [X,Y].

