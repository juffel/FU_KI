% family tree prolog exercise
% disclaimer: the relations between the following individuals are considered on a purely biological basis 
%%%%%%%%%%%%%
% individuals
zeus.
hades.
poseidon.
demeter.
hestia.

ares.

%%%%%
% sex
male(zeus).
male(hades).
male(poseidon).
male(ares).
female(demeter).
female(hestia).
female(hera).

%%%%%%%%%%%%%%%%
% zeus' siblings
brother(zeus,hera).
brother(zeus,hades).
brother(zeus,hestia).
brother(zeus,poseidon).
brother(zeus,demeter).

%%%%%%%%%%%%%%%%
% zeus' begattings in the form parents(parent_1, parent_2, child)
parents(zeus,hera,ares).
parents(zeus,hera,hephaistos).
parents(zeus,hera,hebe).
parents(zeus,hera,eileithyia).
parents(zeus,leto,artemis).
parents(zeus,leto,apollon).
parents(zeus,maia,hermes).
parents(zeus,methis,athene).
parents(zeus,demeter,persephone).
parents(zeus,dione,aphrodite).
% zeus' mortal inseminations
parents(zeus,alkmene,herakles).
parents(zeus,semele,dionysos).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% family structure definitions
parent(X,Y) :- 
	parents(X,_,Y);parents(_,X,Y).
father(X,Y) :- 
	parent(X,Y),male(X).
mother(X,Y) :- 
	parent(X,Y),female(X).

% two individuals are considered siblings if they share at least a parent
sibling(X,Y) :- 
	parent(Z,X),parent(Z,Y).
brother(X,Y) :-
	sibling(X,Y), male(X).
sister(X,Y) :-
	sibling(X,Y), female(X).

% an individual is considered a grandparent of another if it is a parent of a parent of that individual

grandparent(X,Y) :-
	parent(X,Z), parent(Z,Y).

grandfather(X,Y) :-
	grandparent(X,Y), male(X).

grandmother(X,Y) :-
	grandparent(X,Y), female(X).


% TODO ancestor, predecessor
% not working yet

predecessor(X,Y) :-
	parent(X,Y);
	predecessor(X,parent(Y)).
