# Pide cuántos números se van a sumar
N = int(input("¿Cuántos números deseas sumar? "))
suma = 0

# Usa un bucle para pedir N números y sumarlos
for i in range(N):
    numero = float(input(f"Ingrese el número {i + 1}: "))
    suma += numero

# Imprime el resultado
print(f"La suma total es: {suma:.2f}")