# Übung 1 Künstliche Intelligenz
##### Julian Dobmann, Kai Kruschel

## Aufgabe 2
### The Chinese Room Thought Experiment
Quelle: [www-formal.stanford.edu/jmc/chinese.html]()

Das Chinese Room Gedankenexperiment versucht die Frage, inwiefern ein [Computer-]Programm als intelligent zu betrachten ist, in einem Bild darzustellen.
Das Experiment ist folgendermaßen beschrieben:

*Ein **Akteur** befindet sich in einem Raum, welcher - bis auf einen kleinen Papierschlitz - von der Außenwelt abgeriegelt ist. Durch diesen Papierschlitz werden dem Akteur immer wieder Zettel zugestellt, deren Inhalt der Akteur nicht verstehen kann [weil darauf lediglich chinesische Schriftzeichen abgebildet sind]. Der Akteur verfügt jedoch über ein Key-Value Verzeichnis, in welchem die Inhalte der eingehenden Zettel als Keys vermerkt sind. Der Akteur vergleicht nach Erhalt eines Zettels den Inhalt mit den Key-Einträgen im Verzeichnis und gibt daraufhin einen Zettel mit dem Inhalt des zugehörigen Values nach außen zurück.*

Dadurch kann von außen der Eindruck entstehen, dass sich im Inneren eine Entität befindet, welche *intelligent* auf die Anfragen von außen antwortet. Gleichzeitig verfügt der Akteur im Inneren jedoch keinerlei Kenntnis über den Verlauf [der Kommunikation|des Gesprächs] und trägt auch nicht zu dessen Verlauf bei.

Ein *Gegenargument* zur Verwendung dieser Betrachtungsweise für die Einstufung von intelligentem Verhalten, ist dass es einen Einblick in das Systeminnere voraussetzt, über welches Bewertungen bzg. Intelligenz getroffen werden. Da die Diskussion um Intelligenz in der Regel von den Fähigkeiten des menschlichen Gehirns ausgeht, setzt die Anwendung des Modells konsequenterweise voraus, dass ausreichende Kenntisse über die Vorgänge im menschlichen Gehirn bekannt sind, was zum heutigen Stand der Forschung nur bedingt der Fall ist.

Persönlich halte ich den Ansatz das einzustufende System nur durch eine klar definierte Schnittstelle von außen zu betrachten für sinnvoller bzw. brauchbarer. Auch die uneindeutigkeit des Intelligenbegriffs sollte bei solchen Überlegungen immer beachtet werden.

## Aufgabe 3
### Strong AI vs. Weak AI

#### Starke KI
Starke KI ist "echte" KI, also der Versuch, eine Intelligenz zu schaffen die nicht mehr von der des Menschen unterscheidbar ist. Es wurden mehrere Tests vorgeschlagen, wie zum Beispiel der Turing-Test, um zu bestimmen, ob es sich tatsächlich um eine starke KI handelt. Da die Anforderungen und die Definition sich aber mit der Zeit geändert haben und sich viele Tests als zu einfach erwiesen haben, gibt es bis jetzt keine KI die im allgemeinen als stark bezeichnet wird. Einige aktuelle Anforderungen an eine starke KI sind: 
- Die Fähigkeit, natürliche Sprache zu verstehen
- Die Fähigkeit, zu lernen
- Die Fähigkeit, allgemeine Probleme zu lösen

#### Schwache KI
Der Begriff der Schwachen KI umfasst spezialisierte Systeme, die eine bestimmte Aufgabe auf mehr oder weniger intelligente Weise ausführen können. 
Das beinhaltet zum Beispiel Machine Learning für spezifische Anwendungen, Mustererkennung oder Expertensysteme. Der große  Unterschied zur starken KI ist dabei, dass diese Systeme nur die Aufgaben ausführen können, für die sie konzipiert wurden. 



## Aufgabe 1
--- .pl Datei angehängt ---

    % family tree prolog exercise
    % disclaimer: the relations between the following individuals are considered on a purely biological basis
    %%%%%%%%%%%%%
    % individuals
    zeus.

    hades.
    poseidon.
    demeter.
    hestia.
    ares.

    kronos.
    rhea.

    %%%%%
    % sex
    male(zeus).
    male(hades).
    male(poseidon).
    male(ares).
    male(kronos).
    female(demeter).
    female(hestia).
    female(hera).
    female(rhea).

    %%%%%%%%%%%%%%%%
    % zeus' siblings
    brother(zeus,hera).
    brother(zeus,hades).
    brother(zeus,hestia).
    brother(zeus,poseidon).
    brother(zeus,demeter).

    %%%%%%%%%%%%%%%%
    % zeus' begattings in the form parents(parent_1, parent_2, child)
    parents(zeus,hera,ares).
    parents(zeus,hera,hephaistos).
    parents(zeus,hera,hebe).
    parents(zeus,hera,eileithyia).
    parents(zeus,leto,artemis).
    parents(zeus,leto,apollon).
    parents(zeus,maia,hermes).
    parents(zeus,methis,athene).
    parents(zeus,demeter,persephone).
    parents(zeus,dione,aphrodite).
    % zeus' mortal inseminations
    parents(zeus,alkmene,herakles).
    parents(zeus,semele,dionysos).

    %%%%%%%%%%%%%%%
    % zeus' parents
    parents(kronos, rhea, zeus).

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % family structure definitions
    parent(X,Y) :-
        parents(X,_,Y);parents(_,X,Y).
    father(X,Y) :-
        parent(X,Y),male(X).
    mother(X,Y) :-
        parent(X,Y),female(X).

    % two individuals are considered siblings if they share at least a parent
    sibling(X,Y) :-
        parent(Z,X),parent(Z,Y).
    brother(X,Y) :-
        sibling(X,Y), male(X).
    sister(X,Y) :-
        sibling(X,Y), female(X).

    % an individual is considered a grandparent of another if it is a parent of a parent of that individual

    grandparent(X,Y) :-
        parent(X,Z), parent(Z,Y).

    grandfather(X,Y) :-
        grandparent(X,Y), male(X).

    grandmother(X,Y) :-
        grandparent(X,Y), female(X).


    predecessor(X,Y) :-
        parent(X,Y).

    predecessor(X,Y) :-
      parent(X, Z),
      predecessor(Z, Y).


    successor(X,Y) :-
      parent(Y,X).

    successor(X,Y) :-
      parent(Y,Z),
      successor(X,Z).
