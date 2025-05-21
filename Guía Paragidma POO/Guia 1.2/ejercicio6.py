N = int(input("Introduce un número N: "))
suma = 0

for i in range(1, N + 1):
    if i % 2 == 0:  # Si el número es par
        suma += i

print(f"La suma de los números pares hasta {N} es: {suma}")