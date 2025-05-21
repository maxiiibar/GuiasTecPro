N = int(input("Introduce un número entero N para convertirlo a binario: "))

# Forma manual usando iteración
binario = ""
numero = N

if numero == 0:
    binario = "0"
else:
    while numero > 0:
        residuo = numero % 2
        binario = str(residuo) + binario
        numero = numero // 2

print(f"El número {N} en binario es: {binario}")