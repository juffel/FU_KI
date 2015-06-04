# Künstliche Intelligenz - Übung 6
### Julian Dobmann, Kai Kruschel

## Aufgabe 2
### a)
Beweise $$ A = \diamond(P \Rightarrow \Box P) $$ in Logik T

$$ \underline{ (1) \neg \diamond(P \Rightarrow \Box P) }_{T} $$

$$ \underline{ (1) \neg (P \Rightarrow \Box P) }_{\neg \Rightarrow} $$

$$(1) P$$

$$ \underline{ (1) \neg \Box P }_{\neg \Box} $$

$$ (1.1) \neg P $$

$$ (1.1) P $$

Tableau ist geschlossen, da in allen Pfaden gegensätzliche Formeln mit gleichem Präfix enthalten sind.

$$ \Rightarrow A $$ ist erfüllbar.

### b)
Beweise $$ B = (\Box P \wedge \Box Q) \Rightarrow \Box (\Box P \wedge \Box Q) $$ in Logik K4

$$ 1: \underline{ (1) \neg ((\Box P \wedge \Box Q) \Rightarrow \Box (\Box P \wedge \Box Q)) }_{\neg \Rightarrow} $$

$$ 2: (1) \Box P \wedge \Box Q $$

$$ 3: (1) \neg \Box (\Box P \wedge \Box Q) $$

$$ 4: (1) \Box P \;\; \wedge(2) $$

$$ 5: (1) \Box Q \;\; \wedge(2) $$

$$ 6: \underline{ (1.1) \neg (\Box P \wedge \Box Q) }_{\neg \wedge} \;\; \neg \Box(3) $$

$$ 7: (1.1) \neg \Box P \;\; | \;\; 8: (1.1) \neg \Box Q $$ 

$$ \;\; 9: (1.1) \Box P \;\; 4(4) \;\;  | \;\;  10: (1.1) \Box Q \;\; 4(5) $$

Tableau ist geschlossen, da in allen Pfaden gegensätzlich Formeln mit gleichem Präfix enthalten sind.

$$ \Rightarrow B $$ ist erfüllbar.











