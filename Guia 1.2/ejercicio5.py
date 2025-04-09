N = int(input("Introduce un número para generar su tabla de multiplicar: "))

for i in range(1, 11):  # Del 1 al 10
    resultado = N * i
    print(f"{N} x {i} = {resultado}")