N = int(input("Introduce un número entero N: "))
contador = 0
numero = abs(N)  # Asegura que sea positivo para contar los dígitos

while numero > 0:
    numero = numero // 10  # División entera (quita un dígito)
    contador += 1

# Caso especial si el número es 0 (tiene un solo dígito)
if N == 0:
    contador = 1

print(f"El número de dígitos es: {contador}")