N = int(input("¿Cuántos números deseas promediar? "))
suma = 0

# Bucle que agarra los numeros y los suma
for i in range(N):
    numero = float(input(f"Ingrese el número {i + 1}: "))
    suma += numero

# Calcula la media
media = suma / N

# Muestra el resultado
print(f"La media es: {media:.2f}")
