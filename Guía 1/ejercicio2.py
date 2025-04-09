segundos = int(input("introduce el numero de segundos: "))
hora = int(segundos/3600)
minutos = int((segundos-hora*3600)/60)
segundos = segundos - 60*minutos - 3600*hora
print(hora,":",minutos,":",segundos)