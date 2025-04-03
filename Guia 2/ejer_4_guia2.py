import datetime
import hashlib
#Problema 4: hashing

class Persona:
    def __init__(self,nombre:str, apellido:str, fecha_nac:int, clave):
        self.nombre = nombre
        self.apellido = apellido
        self.fecha_nac= datetime.datetime.strptime(str(fecha_nac), "%Y%m%d")
        self.clave = self._hasear_clave(clave)
        pass
    #calcular la edad
    def _calcular_edad(self):
        fecha_hoy = datetime.datetime.now()
        edad = fecha_hoy.year - self.fecha_nac.year

        if (fecha_hoy.month, fecha_hoy.day) < (self.fecha_nac.month, self.fecha_nac.day):
            edad -=1
        return edad
    #hashear la clave
    def _hasear_clave(self,clave):
        #hashea la clave utilizando SHA256 y la retorna:
        return hashlib.sha256(clave.encode()).hexdigest()
    pass
    #valido la clave
    def validar_clave(self,pasword):
        #comparo si la clave ingresada con la clave hasheado almacenada
        return self._hasear_clave(pasword)==self.clave
        
        

    def mostrar(self):
        print(f"Apellido: {self.apellido}, Nombre: {self.nombre}, Edad: {self._calcular_edad()}")
        pass

juan = Persona("Juan", "segovia",20070810,"hh2")
print(juan.validar_clave("hh2")) #verdadero
print(juan.validar_clave("hh1"))#falso
