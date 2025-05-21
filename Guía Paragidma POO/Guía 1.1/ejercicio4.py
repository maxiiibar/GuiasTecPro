# Solicita los datos al usuario
peso = float(input("Introduce tu peso en kilogramos: "))
altura = float(input("Introduce tu altura en metros: "))

# Calcula el IMC
imc = peso / (altura ** 2)

# Clasifica el IMC
if imc < 18.5:
    clasificacion = "Bajo peso"
elif 18.5 <= imc < 24.9:
    clasificacion = "Normal"
elif 25 <= imc < 29.9:
    clasificacion = "Sobrepeso"
else:
    clasificacion = "Obesidad"

# Imprime el resultado
print(f"Tu IMC es {imc:.2f}, lo cual se clasifica como: {clasificacion}")
