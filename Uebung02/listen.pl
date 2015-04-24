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
