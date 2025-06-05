tramo('Córdoba Capital', 'Carlos Paz', 1500).
tramo('Carlos Paz', 'Bialet Massé', 1500).
tramo('Bialet Massé', 'Valle Hermoso', 1000).
tramo('Valle Hermoso', 'La Falda', 1200).
tramo('La Falda', 'Huerta Grande', 1000).
tramo('Huerta Grande', 'La Cumbre', 1200).
tramo('La Cumbre', 'Capilla del Monte', 1600).

viaje(jorge, 'Córdoba Capital', 'La Falda').
viaje(adriana, 'Valle Hermoso', 'La Cumbre').
viaje(gabriela, 'Carlos Paz', 'Capilla del Monte').
viaje(roberto, 'Bialet Massé', 'Huerta Grande').
viaje(jose, 'Córdoba Capital', 'Capilla del Monte').

localidades(['Córdoba Capital', 'Carlos Paz', 'Bialet Massé', 'Valle Hermoso', 'La Falda', 'Huerta Grande', 'La Cumbre', 'Capilla del Monte']).

miembro(X, [X|_]).
miembro(X, [_|Y]) :- miembro(X, Y).

concatenar([], X, X).
concatenar([Y|Z], X, [Y|R]) :- concatenar(Z, X, R).

desde(X, [X|Y], [X|Y]).
desde(X, [_|Y], Z) :- desde(X, Y, Z).

hasta(X, [X|_], [X]).
hasta(X, [Y|Z], [Y|R]) :- hasta(X, Z, R).

sublista(Inicio, Fin, Lista, Sublista) :-
    desde(Inicio, Lista, Temp),
    hasta(Fin, Temp, Sublista).

camino(Persona, Camino) :-
    viaje(Persona, Origen, Destino),
    localidades(A),
    sublista(Origen, Destino, A, Camino).

pares_consecutivos([_], []).
pares_consecutivos([X,Y|Z], [[X,Y]|R]) :- pares_consecutivos([Y|Z], R).

contar_usuarios(_, [], 0).
contar_usuarios([A, B], [Persona|Resto], Total) :-
    camino(Persona, Recorrido),
    pares_consecutivos(Recorrido, Tramos),
    miembro([A, B], Tramos),
    contar_usuarios([A, B], Resto, Parcial),
    Total is Parcial + 1.
contar_usuarios([A, B], [Persona|Resto], Total) :-
    camino(Persona, Recorrido),
    pares_consecutivos(Recorrido, Tramos),
    \+ miembro([A, B], Tramos),
    contar_usuarios([A, B], Resto, Total).

costo_total([], _, 0).
costo_total([[A,B]|T], Personas, Total) :-
    tramo(A, B, Precio),
    contar_usuarios([A,B], Personas, Cantidad),
    Cantidad > 0,
    Parte is Precio // Cantidad,
    costo_total(T, Personas, Resto),
    Total is Parte + Resto.

repartir_costos([], []).
repartir_costos(Personas, Resultado) :-
    repartir_aux(Personas, Personas, Resultado).

repartir_aux(_, [], []).
repartir_aux(Todas, [Persona|Resto], [[Persona, Recorrido, Costo]|ResultadoResto]) :-
    camino(Persona, Recorrido),
    pares_consecutivos(Recorrido, Tramos),
    costo_total(Tramos, Todas, Costo),
    repartir_aux(Todas, Resto, ResultadoResto).
