% bfs(S,Z,N) ermuttelt die Anzahl N der bei einer erfolgreichen Suche expandierten
% Knoten bei einer Breitensuche im Graphen
breitensuche(S,Z,N) :- bfs(S,Z,N).

% bfs http://www.hsg-kl.de/faecher/inf/material/prolog/graphen/breit/index.php
% bfs/3
bfs(Start,Ziel,Count) :-
    bfs([Start],[],Ziel,Count).

% bfs/4
% Anker: Wenn ein Ziel gefunden wurde, dann wird Count auf 0 gesetzt
bfs(Pfad,_,Ziel,Count) :-
    Pfad=[Ziel|_],Count=0,!.

bfs(Pfad,Pfade,Ziel,Count) :-
    Pfad=[KnotenA|_],
    findall(
        [KnotenN|Pfad],
        (con(KnotenA,KnotenN),not(member(KnotenN,Pfad))),
        GefundenePfade),
    append(Pfade,GefundenePfade,NeuePfade),
    NeuePfade=[PfadN|RestPfade],
    length(NeuePfade, Len),
    Var is (Count - Len),
    bfs(PfadN,RestPfade,Ziel,Var).


con(A,B):-
    edge(A,B),!;
    edge(B,A).

edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).
edge(c,e).
edge(c,f).
edge(d,g).
edge(e,f).
edge(e,g).
edge(e,h).
edge(f,i).
edge(g,h).
edge(g,j).
edge(h,i).
edge(h,k).
edge(i,m).
edge(j,k).
edge(k,m).

