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

## Aufgabe 2

### a) Warum lässt sich die Klauselmenge S nicht mit Binary Resolution lösen?

um den Term mit Binary Resolution vereinfachen zu können, müsste es Literale geben, die in mehr als einer der Klauseln vorkommen. Da das nicht der Fall ist, können wir ohne Factoring keine Aussagen über die Lösbarkeit der Klauselmenge machen.

### b) Die leere Klausel mit Full Resolution ableiten

wir versuchen, Unifikation in Verbindung mit Binary Resolution so zu betreiben, dass wir nach und nach sämtliche Literale eliminieren können um schließlich zur leeren Klausel zu kommen:

[ p(X) | q(X), ~p(Z) | q(Z)]

ersetzen Z mit X:

[ p(X) | q(X), ~p(X) | q(X)] -> q(X)

-------

[q(X), p(Y) | ~q(Y)]

ersetzen Y mit X:

[q(X), p(X) | ~q(X)] -> p(X)

-------

[~p(U) | ~q(U), p(X)]

ersetzen U mit X:

[~p(X) | ~q(X), p(X)] -> ~q(X)

-------

und schließlich aus der ersten Ersetzung:

[q(X), ~q(X)] -> []

## Aufgabe 3

### a) die jeweiligen Klauselnormalformen:

#### A1) $\forall X(politiker(X) \implies (\forall Y ( knausrig(Y) \implies \neg mag(X, Y)$

$\forallX(\neg politiker(X) \vee (\forall Y(\neg knausrig(Y) \vee \neg mag(X, Y))$

Skolemisiert:

$\neg politiker(X) \vee \neg knausrig(Y) \vee \neg mag(X,Y)$

#### A2) $\forall X(politiker(X) \implies (\exists Y(firma(Y) \wedge mag(X,Y))))

Implikationen entfernen

$\forall X(\neg politiker(X) \vee (\exists Y(firma(Y) \wedge mag(X,Y)))$

Exisitenzquantor nach außen gezogen und skolemisiert (Y/f(X):

$\neg politiker(X) \vee (firma(f(X) \wedge mag(X,f(X))))$

Aufgeteilt, um zur KNF zu kommen:

$(\neg politiker(X) \vee firma(f(X))) \wedge (\neg politiker(X) \vee mag(X, f(X)))$

#### A3) $\exists X (politiker(X))$

skolemisieren(X/g()):

$politiker(g())$

#### B) $\exists X (firma(X) \wedge \neg knausrig(X))$

skolemisieren(X/h()):

$firma(h()) \wedge \neg knausrig(h())$
