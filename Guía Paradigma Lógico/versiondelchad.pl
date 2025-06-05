% Base de datos
orden(["Córdoba Capital", "Carlos Paz", "Bialet Massé", "Valle Hermoso",
       "La Falda", "Huerta Grande", "La Cumbre", "Capilla Del Monte"]).

costo(1, "Córdoba Capital", 1500).
costo(2, "Carlos Paz", 1500).
costo(3, "Bialet Massé", 1000).
costo(4, "Valle Hermoso", 1200).
costo(5, "La Falda", 1000).
costo(6, "Huerta Grande", 1200).
costo(7, "La Cumbre", 1600).
costo(8, "Capilla Del Monte", 0).

viaje(jorge, 1, 5).
viaje(adriana, 4, 7).
viaje(gabriela, 2, 8).
viaje(roberto, 3, 6).
viaje(jose, 1, 8).

% -----------------------------------------------
% Camino de una persona (lista de localidades)
% -----------------------------------------------
camino(Persona, Camino) :-
    viaje(Persona, IdOrigen, IdDestino),
    orden(Orden),
    sublista(IdOrigen, IdDestino, 1, Orden, Camino).

% Toma sublista entre dos posiciones dadas
sublista(Desde, Hasta, Pos, [X | XS], [X | R]) :-
    Pos >= Desde,
    Pos =< Hasta,
    Pos1 is Pos + 1,
    sublista(Desde, Hasta, Pos1, XS, R).
sublista(Desde, Hasta, Pos, [_ | XS], R) :-
    (Pos < Desde ; Pos > Hasta),
    Pos1 is Pos + 1,
    sublista(Desde, Hasta, Pos1, XS, R).
sublista(_, _, _, [], []).

% -----------------------------------------------
% Tramos: lista de pares entre localidades
% -----------------------------------------------
tramos([_], []).
tramos([A, B | Resto], [(A, B) | TramosResto]) :-
    tramos([B | Resto], TramosResto).

% -----------------------------------------------
% Saber si un tramo pertenece a una lista de tramos
% -----------------------------------------------
pertenece((X, Y), [(X, Y) | _]).
pertenece((X, Y), [_ | Resto]) :-
    pertenece((X, Y), Resto).

% -----------------------------------------------
% Contar cuántas personas usan un tramo
% -----------------------------------------------
usan_tramo(_, [], 0).
usan_tramo((O, D), [P | Resto], Cant) :-
    camino(P, Camino),
    tramos(Camino, Tramos),
    pertenece((O, D), Tramos),
    usan_tramo((O, D), Resto, CantR),
    Cant is CantR + 1.
usan_tramo((O, D), [P | Resto], Cant) :-
    camino(P, Camino),
    tramos(Camino, Tramos),
    \+ pertenece((O, D), Tramos),
    usan_tramo((O, D), Resto, Cant).

% -----------------------------------------------
% Costo total de los tramos de una persona
% -----------------------------------------------
costo_total([], _, 0).
costo_total([(O, _) | Tramos], Personas, Total) :-
    costo(_, O, Precio),
    usan_tramo((O, _), Personas, Cant),
    Cant > 0,
    Parcial is Precio // Cant,
    costo_total(Tramos, Personas, Resto),
    Total is Parcial + Resto.

% -----------------------------------------------
% Predicado principal: repartir_costos/2
% -----------------------------------------------
repartir_costos([], []).

repartir_costos([Persona | Resto], [[Persona, Camino, Total] | Resultado]) :-
    camino(Persona, Camino),
    tramos(Camino, Tramos),
    repartir_costos(Resto, Resultado),
    juntar([Persona | Resto], Todas),
    costo_total(Tramos, Todas, Total).

% -----------------------------------------------
% juntar(Lista, Resultado): clona la lista (sin usar append)
% -----------------------------------------------
juntar([], []).
juntar([X | XS], [X | R]) :-
    juntar(XS, R).
