import datetime

class Persona:
    def __init__(self, nombre, apellido, fecha_nacimiento):
        self.nombre = nombre
        self.apellido = apellido
        self.fecha_nac = fecha_nacimiento
        
    def _calcular_edad(self):
       return int(((datetime.date.today() - self.fecha_nac )).days / 365)

    def _diasemana(self):
        print(datetime.date(2025,self.fecha_nac.month,self.fecha_nac.day).strftime('%A'))


    def _mostrar(self):
        print(self.nombre,", ", self.apellido,": ",self._calcular_edad(), " años") 

anio = int(input("año: "))
mes = int(input("mes: "))
dia = int(input("dia: "))



ejemplo = Persona("Matias", "Gaitan", datetime.date(anio, mes, dia))
ejemplo._mostrar()
ejemplo._diasemana()
# if __name__ == "__main__":
#     # Completar
#     ...