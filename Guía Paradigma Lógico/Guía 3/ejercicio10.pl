ordenar([], []).
ordenar([X], [X]).

ordenar([X , Y |Lres], Resultado1):-
    X > Y,
    ordenar([X | Lres], Resultado),
    ordenar([Y | Resultado], Resultado1).

ordenar([X ,Y |Lres],[X | Resultado]):-
    X =< Y,
    ordenar([Y | Lres], Resultado).