import datetime

class Persona:
    def __init__(self, nombre, edad, fecha_nacimiento):
        self.nombre = nombre
        self.edad = edad
        self.fecha_nac = fecha_nacimiento

    def __eq__(self, other):
        if isinstance(other, Persona):
            return self.nombre == other.nombre and self.edad == other.edad and self.fecha_nac == other.fecha_nac
        return False
    
    def _calcular_edad(self):
        return int(((datetime.date.today() - self.fecha_nac )).days / 365)
    
    def _mostrar(self):
        print(self.nombre,", ", self._calcular_edad(), " años") 
    
class Principal:
    def __init__(self):
        pass

    def ejecutar(self):
        nombre1 = (input("Ingrese nombre de la persona 1: "))
        edad1 = (input("Ingrese edad de la persona 1: "))
        fecha1 = (input("Ingrese fecha de nacimiento de la persona 1: "))
        nombre2 = (input("Ingrese nombre de la persona 2: "))
        edad2 = (input("Ingrese edad de la persona 2: "))
        fecha2 = (input("Ingrese fecha de nacimiento de la persona 2: "))
        persona_1 = Persona(nombre1, edad1, fecha1)
        persona_2 = Persona(nombre2, edad2, fecha2)
        print("Identidad de persona1: ",persona_1.nombre," Edad: ", persona_1._calcular_edad())
        print("Identidad de persona2: ",persona_2.nombre," Edad: ", persona_2._calcular_edad())
        return(persona_1==persona_2)

if __name__ == "__main__":
    principal = Principal()
    if(principal.ejecutar()):
        print("Son la misma persona")
    else:
        print("No son la misma persona")