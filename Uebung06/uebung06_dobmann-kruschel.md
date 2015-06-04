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