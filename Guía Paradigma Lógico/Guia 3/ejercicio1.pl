factorial(0,1).
factorial(A, Factorial) :-
A>0,
A1 is A-1,
factorial(A1, Factorial1),
Factorial is A * Factorial1.