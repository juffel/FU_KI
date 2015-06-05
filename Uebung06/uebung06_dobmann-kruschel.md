# Künstliche Intelligenz - Übung 6
### Julian Dobmann, Kai Kruschel
### 5.6.2015

## Aufgabe 1
The two wise men:

$$w_{i}$$ soll bedeuten, $$w$$ hat einen weißen Punkt, $$\neg w_{i}$$ demnach, $$w$$ hat keinen weißen/einen schwarzen Punkt.

Wir begreifen $$\square_{i} \delta$$ als *i weiß, dass $$\delta$$ wahr ist*

Es gibt 2 weise Männer $$w_{1}$$ und $$w_{2}$$ und mindestens einer hat einen weißen Punkt, also:

offensichtliche Formeln:

1 $$w_{1} \vee w_{2}$$

2 $$w_{1} \Rightarrow \square_{2}  w_{1}$$

3 $$w_{1} \Rightarrow \square_{2}  w_{1}$$

4 $$\neg w_{1} \Rightarrow \square_{2} \neg w_{1}$$

5 $$\neg w_{2} \Rightarrow \square_{1} \neg w_{2}$$

Da auf jeden Fall ein weißer Punkt existieren muss:

6 $$\square_{1} \neg w_{2} \Rightarrow \square_{1} w_{1}$$

7 $$\square_{2} \neg w_{1} \Rightarrow \square_{2} w_{2}$$

Aus 7. und 8. folgt auch, dass wenn der jeweils andere nicht

8 $$\neg (\square_{1} w_{1}) \Rightarrow \neg (\square_{1} \neg w_{2})$$

9 $$\neg (\square_{2} w_{2}) \Rightarrow \neg (\square_{2} \neg w_{1})$$

Der erste Weise weiß nicht, dass(ob) er einen weißen Punkt hat:

10 $$\neg (\square_{1} w_{1})$$

also folgt mit 8:

11 $$\neg(\square_{1} \neg w_{2})$$

wir können die Implikation 5 umstellen zu $$\neg(\square_{1} \neg w_{2}) \Rightarrow \neg(\neg w_{2})\equiv w_{2}$$

Aus $$\neg(\square_{1} \neg w_{2}) \Rightarrow \neg(\neg w_{2})$$ und $$\neg (\square_{1} \neg w_{2})$$ folgt offensichtlich $$w_{2}$$



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

Tableau ist geschlossen, da in allen Pfaden gegensätzliche Formeln mit gleichem Präfix enthalten sind.

$$ \Rightarrow B $$ ist erfüllbar.


### c)
Beweise $$ C = \Box (P \Rightarrow Q) \vee \Box \neg \Box (\neg Q \Rightarrow \neg P) $$ in Logik S5

$$ 1: \underline{ (1) \neg (\Box (P \Rightarrow Q) \vee \Box \neg \Box (\neg Q \Rightarrow \neg P)) }_{\neg \vee} $$

$$ 3: (1) \neg \Box (P \Rightarrow Q) $$

$$ 4: (1) \underline{ \neg \Box \neg \Box (\neg Q \Rightarrow \neg P) }_{\neg \Box} $$

$$ 5: \underline{ (1.1) \neg \neg \Box (\neg Q \Rightarrow \neg P) }_{\neg \neg} $$

$$ 6: \underline{ (1.1) \Box (\neg Q \Rightarrow \neg P) }_{4r} $$

$$ 7: \underline{ (1) \Box (\neg Q \Rightarrow \neg P) }_{\Box} $$

$$ 8: \underline{ (1.1) \neg Q \Rightarrow \neg P }_{\Rightarrow} $$

$$ 9: \underline{ (1.1) \neg \neg Q }_{\neg \neg} \;\; | \;\; 10: (1.1) \neg P $$

$$ 11: (1.1) Q \;\; \neg\neg(9) $$

$$ 12: \underline{ (1.2) \neg (P \Rightarrow Q)}_{\neg \Rightarrow} \;\; \neg \Box(3) $$

$$ 13: (1.2) P $$

$$ 14: (1.2) \neg Q $$

Tableau ist geschlossen, da in allen Pfaden gegensätzliche Formeln mit gleichem Präfix enthalten sind.

$$ \Rightarrow C $$ ist erfüllbar.






