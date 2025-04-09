N = int(input("¿Cuántos números vas a introducir? "))

# Inicializa el máximo con un número muy bajo o con el primer input
maximo = float('-inf')

for i in range(N):
    numero = float(input(f"Ingrese el número {i + 1}: "))
    if numero > maximo:
        maximo = numero

# Muestra el máximo encontrado
print(f"El número máximo es: {maximo:.2f}")
