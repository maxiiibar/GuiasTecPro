class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

nombre = input("Nombre:")
edad = input("Edad:")

ejemplo = Persona(nombre,edad)

# print(ejemplo.nombre)
# print(ejemplo.edad)

print(id(ejemplo))