# Solicita velocidad y tiempo
velocidad_promedio = float(input("Introduce la velocidad promedio en km/h: "))
tiempo_viaje = float(input("Introduce el tiempo de viaje en horas: "))

# Calcula distancia total
distancia = velocidad_promedio * tiempo_viaje

# Imprime la distancia
print(f"La distancia total recorrida es: {distancia:.2f} km")
