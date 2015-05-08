myLast([Item], Item).

myLast([ _ | Rest], LastItem) :-
  myLast(Rest, LastItem).


myMax([], _).

myMax([Item | Rest], MaxItem) :-
   Item =< MaxItem,
   myMax(Rest, MaxItem).


mySum([X], Y):-
  X is Y.

mySum([Head | Tail], X):-
  mySum(Tail, (X - Head)).

# myOrder ufert ein bisschen aus...
myOrder([X, Y]):-
  X >= Y.

myOrder([X, Y]):-
  X =< Y.

myOrder([X, Y | Rest]):-
  X >= Y,
  myOrderGreater(Y | Rest).

myOrder([X, Y | Rest]):-
  X =< Y,
  myOrderLesser([Y | Rest]).

myOrderGreater([X | [Y]]):-
  X >= Y.

#Aus irgendeinem Grund wird das immer zu false ausgewertet
myOrderGreater([X, Y | Rest]):-
  X >= Y,
  myOrderGreater([Y | Rest]).

myOrderLesser([X | [Y]]):-
  X =< Y.

myOrderLesser([X, Y | Rest]):-
  X =< Y,
  myOrderLesser([Y | Rest]).
