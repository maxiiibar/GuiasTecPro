tramo('Córdoba Capital', 'Carlos Paz', 1500).
tramo('Carlos Paz', 'Bialet Massé', 1500).
tramo('Bialet Massé', 'Valle Hermoso', 1000).
tramo('Valle Hermoso', 'La Falda', 1200).
tramo('La Falda', 'Huerta Grande', 1000).
tramo('Huerta Grande', 'La Cumbre', 1200).
tramo('La Cumbre', 'Capilla del Monte', 1600).

viaja(jorge, 'Córdoba Capital', 'La Falda').
viaja(adriana, 'Valle Hermoso', 'La Cumbre').
viaja(gabriela, 'Carlos Paz', 'Capilla del Monte').
viaja(roberto, 'Bialet Massé', 'Huerta Grande').
viaja(jose, 'Córdoba Capital', 'Capilla del Monte').

lista_localidades(['Córdoba Capital', 'Carlos Paz', 'Bialet Massé', 'Valle Hermoso', 'La Falda', 'Huerta Grande', 'La Cumbre', 'Capilla del Monte']).

member_custom(E, [E|_]).
member_custom(E, [_|T]) :- member_custom(E, T).

append_custom([], L, L).
append_custom([H|T], L, [H|R]) :- append_custom(T, L, R).

desde(E, [E|T], [E|T]).
desde(E, [_|T], R) :- desde(E, T, R).

hasta(E, [E|_], [E]).
hasta(E, [H|T], [H|R]) :- hasta(E, T, R).

sublista_desde_hasta(Start, End, List, Sublist) :-
    desde(Start, List, Temp),
    hasta(End, Temp, Sublist).

obtener_camino(Persona, Camino) :-
    viaja(Persona, Inicio, Fin),
    lista_localidades(L),
    sublista_desde_hasta(Inicio, Fin, L, Camino).

consecutivos([_], []).
consecutivos([X,Y|T], [[X,Y]|R]) :- consecutivos([Y|T], R).

contar_usuarios(_, [], 0).
contar_usuarios([O, D], [P|Rest], Cant) :-
    obtener_camino(P, C),
    consecutivos(C, T),
    member_custom([O, D], T),
    contar_usuarios([O, D], Rest, CantRest),
    Cant is CantRest + 1.
contar_usuarios([O, D], [P|Rest], Cant) :-
    obtener_camino(P, C),
    consecutivos(C, T),
    \+ member_custom([O, D], T),
    contar_usuarios([O, D], Rest, Cant).

calcular_costo([], _, 0).
calcular_costo([[O,D]|T], Personas, Total) :-
    tramo(O, D, Precio),
    contar_usuarios([O,D], Personas, Cant),
    Cant > 0,
    Parcial is Precio // Cant,
    calcular_costo(T, Personas, Resto),
    Total is Parcial + Resto.

repartir_costos([], []).
repartir_costos(Ps, Resultado) :-
    repartir_costos_aux(Ps, Ps, Resultado).

repartir_costos_aux(_, [], []).
repartir_costos_aux(Todas, [P|R], [[P, Camino, Costo] | RT]) :-
    obtener_camino(P, Camino),
    consecutivos(Camino, Tramos),
    calcular_costo(Tramos, Todas, Costo),
    repartir_costos_aux(Todas, R, RT).
