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

kronos.
rhea.

%%%%%
% sex
male(zeus).
male(hades).
male(poseidon).
male(ares).
male(kronos).
female(demeter).
female(hestia).
female(hera).
female(rhea).

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

%%%%%%%%%%%%%%%
% zeus' parents
parents(kronos, rhea, zeus).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% family structure definitions
parent(X,Y) :- parents(X,_,Y);parents(_,X,Y).
father(X,Y) :- parent(X,Y),male(X).
mother(X,Y) :- parent(X,Y),female(X).

% two individuals are considered siblings if they share at least a parent
sibling(X,Y) :- parent(Z,X),parent(Z,Y).

% TODO ancestor, predecessor

