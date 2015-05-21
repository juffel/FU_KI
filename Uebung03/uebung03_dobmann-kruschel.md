# Künstliche Intelligenz - Übung 3
### Julian Dobmann, Kai Kruschel

## Aufgabe 1

Um zu zeigen, dass aus einer Menge $$ A $$ von Axiomen die logische Konsequenz $$ K  $$ folgt, muss man zeigen, dass deren Wahrheitswerte sich bei gleicher Belegung wie eine Implikation verhalten. D.h.:

$$ A $$ | $$ K $$ | $$ A \Rightarrow K $$
:-:|:-:|:-:
 0 | 0 | 1
 0 | 1 | 1
 1 | 0 | 0
 1 | 1 | 1

### a)

$$ A = \{ p \vee q \vee r, $$

$$ r \Rightarrow (p \vee q), $$

$$ (q \wedge r) \Rightarrow p, $$

$$ \neg p \vee q \vee r \}  $$

$$ K = (q \Rightarrow) \vee \neg(q \Rightarrow (p \vee r)) $$

Wie in folgender Wahrheitstabelle sichtbar, erfüllen $$ A $$ und $$ K $$ die Implikationseigenschaft, $$ K $$ ist also logische Konsequenz von $$ A $$.
 
 $$p$$ | $$q$$ | $$r$$ | $$ p \vee q \vee r $$ | $$ r \Rightarrow (p \vee q) $$ | $$ (q \wedge  r) \Rightarrow p $$ | $$ \neg p \vee q \vee r $$ | $$A$$ | $$ q \Rightarrow p $$ | $$ \neg(q \Rightarrow (q \vee r)) $$ | $$K$$
:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:
 0 | 0 | 0 | 0 | 1 | 1 | 1 | 0 | 1 | 0 | 1
 0 | 0 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | 0 | 1
 0 | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1
 0 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 0 | 0
 1 | 0 | 0 | 1 | 1 | 1 | 0 | 0 | 1 | 0 | 1
 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1
 1 | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1
 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1


### b)

$$ A = \{ q \vee r, q \Rightarrow \neg p, \neg(r \wedge p) \} $$

$$ K = \neg p $$

 $$p$$ | $$q$$ | $$r$$ | $$ q \vee r $$ | $$ q \Rightarrow \neg p $$ | $$ \neg(r \wedge p) $$ | $$ A $$ | $$ \neg p = K $$
:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:
 0 | 0 | 0 | 0 | 1 | 1 | 0 | 1
 0 | 0 | 1 | 1 | 1 | 1 | 1 | 1
 0 | 1 | 0 | 1 | 1 | 1 | 1 | 1
 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1
 1 | 0 | 0 | 0 | 1 | 1 | 0 | 0
 1 | 0 | 1 | 1 | 1 | 0 | 0 | 0
 1 | 1 | 0 | 1 | 0 | 1 | 0 | 0
 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0

Die logische Konsequenz $$ A \Rightarrow K $$ ist gegeben.

### c)

$$ A = \{ p \Rightarrow q, q \} $$

$$ K = p \wedge q $$

 p | q | $$ p \Rightarrow q $$ | $$ A $$ | $$ K = p \wedge q $$
:-:|:-:|:-:|:-:|:-:
 0 | 0 | 1 | 0 | 0
 0 | 1 | 1 | 1 | 0
 1 | 0 | 0 | 0 | 0
 1 | 1 | 1 | 1 | 1

Für die Belegung $$ p = 0, q = 1 $$ entsteht die Auswertung $$ A=1, K=0 $$ was dazu führt, dass hier $$ A \Rightarrow K $$ nicht gilt.

## Aufgabe 2

### a)

zu zeigen als Wahrheitstabelle: $$(p \wedge q \wedge r) \Rightarrow c$$

$$p$$ | $$q$$ | $$r$$ | $$(p \wedge q \wedge r)$$ | $$c$$ | $$(p \wedge q \wedge r) \Rightarrow c$$
:-:|:-:|:-:|:-:|:-:|:-:
 0 | 0 | 0 | 0 | 0 | 1
 0 | 0 | 0 | 0 | 1 | 1
 0 | 0 | 1 | 0 | 0 | 1
 0 | 0 | 1 | 0 | 1 | 1
 0 | 1 | 0 | 0 | 0 | 1
 0 | 1 | 0 | 0 | 1 | 1
 0 | 1 | 1 | 0 | 0 | 1
 0 | 1 | 1 | 0 | 1 | 1
 1 | 0 | 0 | 0 | 0 | 1
 1 | 0 | 0 | 0 | 1 | 1
 1 | 0 | 1 | 0 | 0 | 1
 1 | 0 | 1 | 0 | 1 | 1
 1 | 1 | 0 | 0 | 0 | 1
 1 | 1 | 0 | 0 | 1 | 1
 1 | 1 | 1 | 1 | 0 | 0
 1 | 1 | 1 | 1 | 1 | 1

### b)

| $$p$$ | $$q$$ | $$r$$ | $$\neg p$$ | $$\neg q$$ | $$\neg r$$ | $$c$$ | $$c \vee \neg p \vee \neg q \vee \neg r$$ |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 1 | 1 | 1 | 0 | 1 |
| 0 | 0 | 0 | 1 | 1 | 1 | 1 | 1 |
| 0 | 0 | 1 | 1 | 1 | 0 | 0 | 1 |
| 0 | 0 | 1 | 1 | 1 | 0 | 1 | 1 |
| 0 | 1 | 0 | 1 | 0 | 1 | 0 | 1 |
| 0 | 1 | 0 | 1 | 0 | 1 | 1 | 1 |
| 0 | 1 | 1 | 1 | 0 | 0 | 0 | 1 |
| 0 | 1 | 1 | 1 | 0 | 0 | 1 | 1 |
| 1 | 0 | 0 | 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 0 | 1 | 1 | 1 | 1 |
| 1 | 0 | 1 | 0 | 1 | 0 | 0 | 1 |
| 1 | 0 | 1 | 0 | 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 0 | 1 | 1 | 1 |
| 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 0 | 0 | 0 | 1 | 1 |


es fällt auf, dass bei gleicher Belegung von p, q, r und c der Term das gleiche Ergebnis liefert, wie in a)



## Aufgabe 3
### a)
$$ H $$: Der Händler ist ehrlich

$$ S $$: Saatgut ist gut

$$ W_1 $$: Wetter ist gut

$$ G $$: Horst verdient ausreichend Geld

$$ W_2 $$: Der Wolf wird gefüttert

$$ K $$: In der Stadt ist Kirmes

$$ A $$: Horst geht in die Stadt und lässt Wolf und Borsti allein

$$ W_3 $$: Der Wolf ist satt

$$ B $$: Borsti wird gefressen

### b)
**Aufgabenstellung:** *Angenommen, in der Stadt ist Kirmes. Wird Borsti nicht gefressen, wenn das Wetter im
Sommer gut und der Händler ehrlich waren? Formulieren Sie diese Frage als
Unerfüllbarkeitsproblem einer Menge von Hornklauseln und lösen Sie sie mit SLD-­Resolution.*

Fakten:
In der Stadt is Kirmes, das Wetter ist gut und der Händler ist ehrlich:

$$ K, W_1, H $$

Regeln:

$$ (\neg H, S) $$,
$$ (\neg S, \neg W_1, G) $$,
$$ (\neg G, W_2) $$,
$$ (\neg W_2, \neg K, A) $$,
$$ (\neg W_2, W_3) $$,
$$ (\neg W_3, \neg B) $$,
$$ (A, \neg B) $$

Frage:

$$ \neg B $$

Lösung durch SLD-Resolution:

$$ \frac{(\neg S, \neg W_1, G) \ \ \ \ \ (\neg G, W_2)}{(\neg S, \neg W_1, W_2)} $$

$$ \frac{(\neg S, \neg W_1, W_2) \ \ \ \ \ (\neg W_2, \neg K, A)}{(\neg S, \neg W_1, \neg K, A)} $$

$$ \frac{(\neg S, \neg W_1, \neg K, A) \ \ \ \ \ (\neg H, S)}{(\neg H, \neg W_1, \neg K, A)} $$

$$ \frac{(\neg H, \neg W_1, \neg K, A) \ \ \ \ \ (K)}{(\neg H, \neg W_1, A)} $$

$$ \frac{(\neg H, \neg W_1, A) \ \ \ \ \ (W_1)}{(\neg H, A)} $$

$$ \frac{(\neg H, A) \ \ \ \ \ (H)}{(A)} $$

### c)
