myLast([Item | []], Item).

myLast([ _ | Rest], LastItem) :-
  myLast(Rest, LastItem).


myMax([], _).

myMax([Item | Rest], MaxItem) :-
   MaxItem > Item;
   myMax(Rest, MaxItem).
