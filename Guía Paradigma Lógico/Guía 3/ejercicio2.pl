contar(_,[],0).
contar(X,[Y|Lres], Cantidad):-
    X = Y,
    contar(X, Lres, Cantidad1),
    Cantidad is Cantidad1 + 1.
contar(X,[Y|Lres], Cantidad):-
    X \= Y,
    contar(X, Lres, Cantidad1),
    Cantidad is Cantidad1,
    !.
