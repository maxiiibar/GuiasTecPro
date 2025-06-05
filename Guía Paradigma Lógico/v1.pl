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

% Calcula el camino (lista de ciudades) entre IdOrigen e IdDestino según orden
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

% Convierte lista de ciudades en lista de tramos (pares)
tramos([_], []).
tramos([A, B | Resto], [(A, B) | TramosResto]) :-
    tramos([B | Resto], TramosResto).

% Verifica si un tramo (X,Y) pertenece a una lista de tramos
pertenece((X, Y), [(X, Y) | _]).
pertenece((X, Y), [_ | Resto]) :-
    pertenece((X, Y), Resto).

% Cuenta cuántas personas usan el tramo completo (O, D)
usan_tramo(_, [], 0).
usan_tramo((O, D), [P | Resto], Cant) :-
    camino(P, CaminoP),
    tramos(CaminoP, TramosP),
    pertenece((O, D), TramosP),
    usan_tramo((O, D), Resto, CantR),
    Cant is CantR + 1.
usan_tramo((O, D), [P | Resto], Cant) :-
    camino(P, CaminoP),
    tramos(CaminoP, TramosP),
    \+ pertenece((O, D), TramosP),
    usan_tramo((O, D), Resto, Cant).

% Calcula el costo total para la lista de tramos y las personas
costo_total([], _, 0).
costo_total([(O, D) | Tramos], Personas, Total) :-
    costo(IdC, O, Precio),
    IdC > 0, % asegurar que haya costo para la ciudad O
    usan_tramo((O, D), Personas, Cant),
    costo_total(Tramos, Personas, Resto),
    (Cant =:= 0 ->
        Parcial = 0
    ;
        Parcial is Precio // Cant),
    Total is Parcial + Resto.

% Versión sin usar "->" para compatibilidad total
costo_total_no_cond([], _, 0).
costo_total_no_cond([(O,D) | Tramos], Personas, Total) :-
    costo(IdC, O, Precio),
    usan_tramo((O, D), Personas, Cant),
    costo_total_no_cond(Tramos, Personas, Resto),
    (Cant =:= 0,
     Parcial = 0;
     Cant > 0,
     Parcial is Precio // Cant),
    Total is Parcial + Resto.

% Reparte los costos entre las personas dadas
repartir_costos([], []).
repartir_costos([Persona | Resto], [[Persona, Camino, Total] | Resultado]) :-
    camino(Persona, Camino),
    tramos(Camino, Tramos),
    repartir_costos(Resto, Resultado),
    juntar([Persona | Resto], Todas),
    costo_total_no_cond(Tramos, Todas, Total).

% Copiar lista
juntar([], []).
juntar([X | XS], [X | R]) :-
    juntar(XS, R).

