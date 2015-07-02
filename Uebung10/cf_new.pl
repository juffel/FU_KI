% CF - a simple shell for use with Prolog
% knowledge bases.  It includes Certainty Factors.

:-op(900,xfy, :).

:- dynamic known/3.

main :-
	greeting,
	repeat,
	write('> '),
	read(X),
	do(X),
	X == quit.

greeting :-
	write('This is the CF Prolog shell.'), nl,
	native_help.

do(help) :- native_help, !.
do(load) :- load_kb, !.
do(solve) :- solve, !.
do(list) :- list_all_known, !.
do(quit).
do(X) :-
	write(X),
	write(' is not a legal command.'), nl,
	fail.

native_help :-
	write('Type help. load. solve. list. or quit.'),nl,
	write('at the prompt.'), nl.

load_kb :-
	write('Enter file name in single quotes (ex. ''swan_or_duck.nkb''.): '),
	read(F),
	reconsult(F).

solve :-
	retractall(known(_,_,_)),
	prove(top_goal(_),_),
	list_top_goals.

list_top_goals :-
	findall(
	    (Goal,CF),
	    (known(Goal,CF,_),clause(top_goal(_),Goal)),
	    L),
	writeln('Answer(s): '),
	write_list(L).

list_all_known :-
	findall((Goal,CF),known(Goal,CF,_),L),
	writeln('Known: '),
	write_list(L).

write_list([]).
write_list([(Goal,CF)|T]) :-
	write(Goal),write(' '),write(CF),nl,
	write_list(T).

ask(Goal,CF) :-
	known(Goal,CF,_),
	!.

ask(Goal,CF) :-
	write(Goal),
	write('? (enter value between -100 and 100) '),
	get_user(CF),
	asserta(known(Goal,CF,[])),
	write('Inserted '),
	write(Goal),
	write(' with CF '),
	write(CF),nl.

get_user(X) :-
	repeat,
	write('> '),
	read(X),!.

prove(true,_) :- !.
prove((Goal,Rest),NewCF) :- !,
	prov(Goal,CF),
	prove(Rest,RestCF),
	algebra2(CF,RestCF,NewCF).
prove(Goal,CurCF) :-
	prov(Goal,CurCF).

prov(top_goal(_),_) :- !,
	clause(top_goal(_),Body),
	prove(rule(_,_,Body),_).
prov(ask(Goal),CF) :- ask(Goal,CF), !.
prov(rule(ID,RuleCF,Goal),NewCF) :-
	clause(rule(ID,RuleCF,Goal),Body),
	prove(Body,CF),
	algebra1(RuleCF,CF,AdjustedCF),
	update(ID,Goal,AdjustedCF,NewCF),
	write('Updated '),
	write(Goal),
	write(' with new CF '),
	write(NewCF),nl,fail.
prov(rule(_,_,Goal),CF) :-
	known(Goal,CF,_),!.

update(ID,Goal,CF,NewCF) :-
	known(Goal,OldCF,IdList),
	not(member(ID,IdList)),
	algebra3(CF,OldCF,NewCF),
	retract(known(Goal,OldCF,IdList)),
	asserta(known(Goal,NewCF,[ID|IdList])),!.
update(ID,Goal,CF,CF) :-
	asserta(known(Goal,CF,[ID])).

% set a CF based on a rule, Threshhold is CF 20. If it's lower, than Adjusted CF is 0 (don't know).
algebra1(RuleCF, CF, AdjustedCF) :-
  CF >= 20,
  AdjustedCF is RuleCF.

algebra1(RuleCF, CF, AdjustedCF) :-
  AdjustedCF is 0.

% combine different CFs. I doubt this is correct like this though.
algebra2(CF, RestCF, NewCF) :-
  algebra3(CF, RestCF, NewCF).


% update the known CF
algebra3(CF, OldCF, NewCF) :-
  CF > 0, OldCF > 0,
  X is (CF + OldCF*(100 - CF)/100),
  int_round(X, NewCF).

algebra3(CF, OldCF, NewCF) :-
  CF < 0, OldCF < 0,
  X is -(-CF - OldCF *(100 + CF)/100),
  int_round(X, NewCF).

% does not divide by 0, because the one of the Values has to be < 100
algebra3(CF, OldCF, NewCF) :-
  (CF < 0; OldCF < 0); (CF > 0; OldCF > 0),
  abs_minimum(CF, OldCF, MinCF),
  X is (100 * (CF + OldCF) / (100 - MinCF)),
  int_round(X, NewCF).
