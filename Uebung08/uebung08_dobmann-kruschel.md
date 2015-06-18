# Künstliche Intelligenz - Übung 8
### Julian Dobmann, Kai Kruschel

## Aufgabe 1 Meta-Interpreter

Die einfachste Form einen Meta-Interpreter zu schreiben, ist es einfach das Systemprädikat `call/1` in ein selbst definiertes Prädikat zu kapseln.

	cheato(A):-call(A).

Dieser "Interpreter" kuckt allerdings seine Argumente nichtmal an, sonder leitet sie einfach an den eigentlichen Prolog-Interpreter weiter und lässt diesen die ganze Arbeit machen.

Das Prädikat `solve/1` soll wenigstens Konjunktionen und Disjunktionen selbst bearbeiten können. Dazu muss man einen Anker, die Behandlung von Prädikaten und von Kon- und Disjunktionen definieren:

	% Anker
	solve(true).
	
	% Konjunktionen
	solve((A,B)) :-
		solve(A), solve(B).
	
	% Disjunktionen
	solve((A;B)) :-
		solve(A);
		solve(B).
	
	% Prädikate
	solve(A) :-
		clause(A, Body),
		solve(Body).

Dieser Interpreter benutzt nur das Systemprädikat `clause/2`, welches für ein *gültiges* Prädikat den Körper diese Prädikats zurückgibt, und bei ungültigen Prädikaten failt.