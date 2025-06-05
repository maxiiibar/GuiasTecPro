costo(1, "Córdoba Capital", 1500).
costo(2, "Carlos Paz", 1500).
costo(3, "Bialet Massé", 1000).
costo(4, "Valle Hermoso", 1200).
costo(5, "La Falda", 1000).
costo(6, "Huerta Grande", 1200).
costo(7, "La Cumbre", 1600).
costo(8, "Capilla Del Monte", 0).

# orden(["Córdoba Capital", "Carlos Paz", "Bialet Massé", "Valle Hermoso", "La Falda", "Huerta Grande", "La Cumbre", "Capilla Del Monte"])

viaje("Jorge", 1, 5).
viaje("Adriana", 4, 7).
viaje("Gabriela", 2, 8).
viaje("Roberto", 3, 6).
viaje("Jose", 1, 8).

listaDeCiudades([],[]):- !.
listaDeCiudades(Inicio, Fin, Resultado):-
    

recorrido([],[]):- !.
recorrido(Nombre, [(A,)]):-
    viaje(Nombre, A, B),


repartir_costos([],[]):- !.
repartir_costos([X, Y | Personas], [(A,B)]):-
    viaje(X, A, B),
    viaje(Y, C, D),
