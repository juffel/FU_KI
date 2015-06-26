% heuristik ermittelt zum Zustand X die Anzahl N der nicht mit dem Zielzustand Z übereinstimmenden Zahlenfelder
% (implizite Bedingung: X.size == Z.size)
% es geht dabei um das 3x3 Schiebepuzzle
% ein Zustand hat dabei die Form board(1,2,3,4,5,6,7,8,b)

% der Abstand zweier ein-elementiger Listen ist 0, wenn sie das gleiche
% Element enthalten, und 1 wenn sie unterschiedliche Elemente enthalten
heuristik([X],[Z],N) :-
    (X == Z),!, N is 0;
    (X \= Z), N is 1.
% der Abstand zweier mehr-elementiger Listen mit gleichem Head ist
% 0 + Abstand der Restlisten
% der Absatnd zweier mehr-elementiger Listen mit verschiedenem Head
% ist 1 + Abstand der Restlisten
heuristik([Xh|X],[Zh|Z],N) :-
    (Xh == Zh),!, heuristik(X,Z,N);
    (Xh \= Zh), heuristik(X,Z,N-1).

