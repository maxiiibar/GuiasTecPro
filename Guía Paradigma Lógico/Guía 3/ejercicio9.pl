insertar(X, [], [X]):- !.

insertar(X, [Y|Lres], [X, Y | Lres]) :-
    X =< Y,
    !.

insertar(X, [Y|Lres], [Y | Resultado]) :-
    X > Y,
    insertar(X, Lres, Resultado).
