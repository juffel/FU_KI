myLast([Item | []], Item).

myLast([ _ | Rest], LastItem) :-
  myLast(Rest, LastItem).


myMax([], _).

myMax([Item | Rest], MaxItem) :-
   Item =< MaxItem,
   myMax(Rest, MaxItem).
