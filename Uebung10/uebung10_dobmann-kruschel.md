# Künstliche Intelligenz - Übung 10
### Julian Dobmann, Kai Kruschel

## Aufgabe 1 Parser/DCG

Man kann den gegebenen Parser recht leicht um die Unterstützung von Multiplikation erweitern, indem man eine Regel (3) für das Zeichen `*` nach der Additionsregel hinzufügt.

Um die Klammerung von ganzen Expressions (und nicht nur von Termen) zu unterstützen, fügt man Regel (1) hinzu.
Diese Regel wird als erste von `expr/1` eingesetzt, da Klammerung die allerhöchste Bindungsstärke besitzt.  
Um die Bindungsstärke der Operatoren `+` und `*` korrekt zu berücksichtigen, wird Regel (3) eingefügt.

```
...
(1) expr(X)     --> "(", expr(X), ")".
(2) expr(add(mul(Y,Z), A)) --> term(Y), "*", term(Z), "+", expr(A).
(3) expr(mul(Y, Z)) --> term(Y), "*", expr(Z).
(4) expr(add(Y,Z)) --> term(Y), "+", expr(Z).
...
```

## Aufgabe 2