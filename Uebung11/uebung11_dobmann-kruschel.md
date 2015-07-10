# Künstliche Intelligenz - Übung 11
### Julian Dobmann, Kai Kruschel

## Aufgabe 1 Forward Chaining
### a)
Prove "Tweety is a canary"
#### Forward
Read Facts from NKB:
read "Tweety eats flies", search for Rule with "eats flies" in LHS, none found. Proceed with next fact.  
read "Tweety chirps", find Rule #1 and apply fact, (effectively) resulting in new rule #1' "If Tweety sings, then Tweety is a canary"  
read "Tweety sings", find rule #1' and apply fact, resulting in "Tweety is a canary". --> proven correct

#### Backward
Search NKB for rule with canary in RHS, find rule "If X chirps and sings, then X is a canary".  
Apply rule (in a backward fashion) and get new goals "Tweety chirps" and "Tweety sings". Lookup NKB for rules with those on the RHS and find the facts themselves. --> proven correct! 

### b)
Backward Chaining ist besonders geeignet, in einem Szenario wo man bereits das Ziel (also die zu beweisende Aussage) kennt und lediglich einen Weg finden möchte, diese Aussage zu beweisen. Das ist klassischerweise der Fall, wenn man aufgrund einer Wissensbasis eine im vorhinein festgelegte Aussage beweisen möchte. Backward Chaining lässt sich nur dann einsetzen, wenn die Anzahl der Ziele überschaubar ist, da für jedes einzelne Ziel der Findungsprozess komplett durchlaufen wird.

Forward Chaining ist in *datengetriebenen* Szenarien besser geeignet, ausgehend von der Wissensbasis wird durch die Verkettung von Inferenzen eine Folgerung entwickelt. Im Gegensatz zu Backward Chaining eignet sich Forward Chaining für Szenarien in denen die Anzahl der Ziele sehr hoch ist.

## Aufgabe 2 Produktionssysteme
