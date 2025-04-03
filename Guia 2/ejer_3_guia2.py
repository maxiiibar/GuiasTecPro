import datetime
class Facultad:
    def __init__(self,nombre):
        self.nombre=  nombre
        self.Carreras = [] #creo una lista de carreras
        pass
    def agregar_carrera(self, carrera):
        self.Carreras.append(carrera)
        pass
    def MostrarCarrerasYAlumnos(self):
        print(f"Facultad:{self.nombre}")
        for carrera in self.Carreras:
            carrera.mostrarAlumnos()
            pass

class Carrera:
    def __init__(self,nombre):
        self.nombre = nombre
        self.Inscripciones = [] #lista de alumnos inscripto
        pass
    def inscribir_alumno(self,alumno):
        self.Inscripciones.append(alumno)
    pass
    def mostrarAlumnos(self):
        print(f"Carrera:{self.nombre}")
        if not self.Inscripciones:
            print("No tiene alumnos inscriptos")
        else:
            print("Alumnos")
            for alumno in self.Inscripciones:
                print(f"{alumno.nombre},{alumno.fecha_insc.strftime("%Y%m%d")}")

class Alumno:
    def __init__(self,nombre, dni, fecha_nac,fecha_insc):
        self.nombre =nombre
        self.dni = dni
        self.fecha_nac = datetime.datetime.strptime(str(fecha_nac),"%Y%m%d")
        self.fecha_insc = datetime.datetime.strptime(str(fecha_insc),"%Y%m%d")
        
    def calcularEdad(self):
        fecha_hoy = datetime.datetime.now()
        edad = fecha_hoy.year - self.fecha_nac.year

        if (fecha_hoy.month,fecha_hoy.day) < (self.fecha_nac.month, self.fecha_nac.day):
            edad -=1
        return edad

#Creo objetos de las clases, facultad, carreres y alumnos
#creo facultad
Facultad1 = Facultad("Fich")
#creo carreras
Informatica = Carrera("Ing Informatica")
ing_RH = Carrera("Ing RH")
#creo alumnos
Alumno1 = Alumno("Ezequiel",11111111,19901111,20081210)
Alumno2 = Alumno("Sofia", 22222222,19901212,20081211)
#inscribo los aluimnos en ing en informatica(carrera)
Informatica.inscribir_alumno(Alumno1)
Informatica.inscribir_alumno(Alumno2)
#agrego las carreras a la facultad ya con los alumnos inscriptos
Facultad1.agregar_carrera(Informatica)
Facultad1.agregar_carrera(ing_RH)
#muestro la informacion
Facultad1.MostrarCarrerasYAlumnos()


