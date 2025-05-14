class Empleado:
    def __init__(self, nombre, horas_trabajadas, tarifa_por_hora):
        self.nombre = nombre
        self.horas_trabajadas = horas_trabajadas
        self.tarifa_por_hora = tarifa_por_hora
    def calcular_salario(self):
        return self.horas_trabajadas * self.tarifa_por_hora
    
class ReporteDesempeno:
    def generar_reporte_desempenio(self,empleado):
        # Código para generar el reporte de desempeño
        pass

#Se viola el principio de responsabilidad unica, se crea otra clase para delegar responsabilidades

from abc import ABC, abstractmethod

class Mensaje:
    @abstractmethod
    def enviar_notificacion(self):
        pass

class CorreoElectronico:
    def enviar_notificacion(self, destinatario: str, mensaje: str):
        # Lógica para enviar notificación por correo electrónico
        print(f"Correo electrónico enviado a {destinatario}: {mensaje}")

class Notificador:
    def __init__(self, correo_electronico: CorreoElectronico):
        self.correo_electronico = correo_electronico
    def enviar_notificacion(self, destinatario: str, mensaje: str):
        self.correo_electronico.enviar_notificacion(destinatario, mensaje)

 # Uso del código actual
correo_electronico = CorreoElectronico()
notificador = Notificador(correo_electronico)
Mensaje.enviar_notificacion("usuario@example.com", "¡Tu tarea está lista!")

#Se viola el principio de inversion de dependencia, para ello creamos una interfaz (clase abstracta) que generalice los metodos comunes

class Producto:
    def __init__(self, nombre: str):
        self.nombre = nombre

        @abstractmethod
        def calcular_descuento(self)-> float:
            pass

class ProductoAlimento(Producto):
    def calcular_descuento(self) -> float:
        return 0.10
    
class ProductoLimpieza(Producto):
    def calcular_descuento(self) -> float:
        return 0.05
    
class ProductoSinDescuento(Producto):
    def calcular_descuento(self) -> float:
        return 0.0

class Carrito:
    def __init__(self, productos: list):
        self.productos = productos

def calcular_descuento(productos: list):
    for producto in productos:
       descuento = producto.calcular_descuento()
       print(f"Descuento del {int(descuento*100)}% en {producto.nombre}")
        # Añadir más condiciones para nuevos tipos de productos y descuentos


productos = [
    Producto('manzanas', 'alimentos'),
    Producto('jabón', 'limpieza')
 ]
carrito = Carrito(productos)
calcular_descuento(carrito.productos)

#Se viola el principio de abierto cerrado, porque si la clase producto es modificada, los metodos de calcular descuento ya no funcionan, para ello
#se vuelve una clase asbtracta productos y creamos clases hijas, usando de esa forma polimorfismo y Carrito no tiene que preocuparse por que tipo es el Producto

class Dispositivo:
    def __init__(self, marca: str, modelo: str):
        self.marca = marca
        self.modelo = modelo

class Celular(Dispositivo):
    def __init__(self, marca: str, modelo: str, pantalla: bool):
        super().__init__(marca, modelo)
        self.pantalla = pantalla

class Tablet(Dispositivo):
    def __init__(self, marca: str, modelo: str, pantalla: bool, lapiz: bool):
        super().__init__(marca, modelo)
        self.pantalla = pantalla
        self.lapiz = lapiz

class Smartwatch(Dispositivo):
    def __init__(self, marca: str, modelo: str, pantalla: bool, gps: bool):
        super().__init__(marca, modelo)
        self.pantalla = pantalla
        self.gps = gps

def contar_piezas_reparacion(dispositivos: list):
    for dispositivo in dispositivos:
        if isinstance(dispositivo, Celular):
            print(contar_piezas_celular(dispositivo))
        elif isinstance(dispositivo, Tablet):
            print(contar_piezas_tablet(dispositivo))
        elif isinstance(dispositivo, Smartwatch):
            print(contar_piezas_smartwatch(dispositivo))
 # Funciones para contar piezas de repuesto específicas para cada tipo de dispositivo


def contar_piezas_celular(celular: Celular):
    return "Piezas requeridas para reparar el celular"
def contar_piezas_tablet(tablet: Tablet):
    return "Piezas requeridas para reparar la tablet"
def contar_piezas_smartwatch(smartwatch: Smartwatch):
    return "Piezas requeridas para reparar el smartwatch"


 # Ejemplo de uso
dispositivos = [
    Celular("Samsung", "Galaxy S20", True),
    Tablet("Apple", "iPad Pro", True, True),
    Smartwatch("Apple", "Watch Series 6", True, True)
 ]
contar_piezas_reparacion(dispositivos)

#Al utilizar los ifelse para detectar de que tipo de dispositivo se trata se esta violando el principio de sustitucion de Liskov, ya que
#las clases derivadas no pueden ser sustituidas por su clase base sin alterar el correcto funcionamiento del codigo
#Para solucionar este problema hay que sobreescribir las propiedades de cada clase en la clase dispositivo
#Correccion, el principio de Abierto Cerrado

class IUsuario(ABC):
    @abstractmethod
    def solicitar_prestamo_libro(self):
        pass
    @abstractmethod
    def devolver_libro(self):
        pass
    @abstractmethod
    def buscar_libro(self):
        pass
    @abstractmethod
    def solicitar_reserva_sala_estudio(self):
        pass

class Estudiante(IUsuario):
    def solicitar_prestamo_libro(self):
        print("Estudiante solicitando préstamo de libro.")
    def devolver_libro(self):
        print("Estudiante devolviendo libro.")
    def buscar_libro(self):
        print("Estudiante buscando libro en el catálogo.")
    def solicitar_reserva_sala_estudio(self):
        raise NotImplementedError("Los estudiantes no pueden reservar salas de estudio.")

class Profesor(IUsuario):
    def solicitar_prestamo_libro(self):
        print("Profesor solicitando préstamo de libro.")
    def devolver_libro(self):
        print("Profesor devolviendo libro.")
    def buscar_libro(self):
        print("Profesor buscando libro en el catálogo.")
    def solicitar_reserva_sala_estudio(self):
        print("Profesor solicitando reserva de sala de estudio.")

 # Ejemplo de uso
estudiante = Estudiante()
profesor = Profesor()
estudiante.solicitar_prestamo_libro()
estudiante.devolver_libro()
estudiante.buscar_libro()
profesor.solicitar_prestamo_libro()
profesor.devolver_libro()
profesor.buscar_libro()
profesor.solicitar_reserva_sala_estudio()

#Se viola el principio de segregacion de interfaces, la clase Alumno responde a un metodo que no tiene implementado, que es el de reserva de sala de estudio
#existe una dependencia innecesaria que debe ser eliminada, en especifico el metodo solicitar reserva sala de estudio de la clase alumno
#Se soluciona con interfaces distintas para cada persona