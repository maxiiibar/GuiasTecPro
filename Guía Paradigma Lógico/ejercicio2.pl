padre(leoncio, alberto).
padre(leoncio, geronimo).
padre(alberto, juan).
padre(alberto, luis).
padre(geronimo, luisa).
padre(luisa, matias).
hermano(A, B) :- padre(P, A), padre(P, B), A \= B.
abuelo(A, B) :- padre(A, P), padre(P, B).

# 1) padre(alberto,luis).
# 2) padre(luis,alberto). 
# 3) hermano(luis, X).
# 4) abuelo(X ,luisa)
# 5) abuelo(X,Y).