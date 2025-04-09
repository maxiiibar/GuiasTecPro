import math

# Solicita el radio y la altura
radio = float(input("Introduce el radio de la base del cilindro: "))
altura = float(input("Introduce la altura del cilindro: "))

# Calcula el volumen
volumen = math.pi * (radio ** 2) * altura

# Imprime el volumen
print(f"El volumen del cilindro es: {volumen:.2f} unidades cúbicas")