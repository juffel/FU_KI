# Künstliche Intelligenz - Übung 05
### Julian Dobmann, Kai Kruschel

## Aufgabe 1
### a) Disagreement Set

das Disagreement Set in diesem Fall besteht aus mehreren subsets, nämlich:

{[X, T, f(dogs)], [f(Y), T, S], [Z, g(cat), g(W)], [cat, W]}

dabei ist allen Termen das p als umschließende Funktion gemein. In den einzelnen Ästen der ersten Ebene unterscheiden sich aber die drei Terme an allen Stellen, wobei sich T2 und T3 im dritten Ast paarweise nicht unterscheiden, wohl aber auf der zweiten Ebene.

### b) Most General Unifier

um einen Most General Unifier zu finden, wenden wir den Algorithmus wie folgt an:

Wir sehen uns das erste Disagreement Subset an.

Falls mehr als ein Ausdruck ,$x_{i}$, der keine Variable ist, existiert mit $x_{i_{1}} /= x_{i_{2}}$, dann ist die Unifikation gescheitert.
Ansonsten sehen wir nach, ob die Variablen in dem Ausdruck $x_{i}$ vorkommen. Ist das nicht der Fall, können wir sie mit dem Ausdruck ersetzen.

Können wir das solange machen, bis die Terme gleich sind, war die Unifikation erfolgreich und wir haben einen Most General Unifier gefunden.

In diesem Fall:

[X, T, f(dog)] -> [X/f(dog), T/f(dog), f(dog)]

dann passen wir das zweite Subset an:

[f(Y), f(dog), S]

hier könnten wir jetzt noch ein neues Subset [Y, dogs] einführen, aber wir behandeln der Einfachheit halber beide auf einmal:

[f(Y/dog), f(dog), S/f(dog)]

die letzten beiden Subsets können wir auch wieder zusammennehmen:

[Z, g(cat), g(W)] -> [Z/g(cat), g(cat), g(W/cat)]

damit haben wir als MGU: [X/f(dog), T/f(dog), S/f(dog), Z/g(cat), Y/dog, W/cat]
