estudiantes=read.csv("https://raw.githubusercontent.com/jazaineam1/Script-B-sicos/master/Cuadernos%20r/Semana3/estudiantes.csv",sep=";",header=T)

salarios=c(1.5,2.8,3.5,4.9)
mean(salarios)

x1=c(4.7,4.5,4.6)
promedio1=mean(x1)
cat("el promedio sin el valor atípico es ", promedio1)
x2=c(4.7,4.5,4.6,1.0)
promedio2=mean(x2)
cat("el promedio con el valor atípico es ", promedio2)

estudiantes=read.csv("https://raw.githubusercontent.com/jazaineam1/Script-B-sicos/master/Cuadernos%20r/Semana3/estudiantes.csv",sep=";",header=T)
media=mean(estudiantes$edad)
print(media)

Femenino=estudiantes[estudiantes$sexo=="Femenino",]
mediaF=mean(Femenino$peso)
Masculino=estudiantes[estudiantes$sexo=="Masculino",]
mediaM=mean(Masculino$peso)
cat("El promedio de peso para e sexo femenino es :", mediaF)
cat("El promedio de peso para e sexo masculino es :",mediaM)

estudiantescuanti=estudiantes[,-4]
apply(estudiantescuanti, 2, mean)

n=length(estudiantes$edad); cat("EL número de observaciones es: ", n, " es par")
cat("Cálculamos", n/2, " y ", n/2+1)
cat("ordenamos nuestros datos", sort(estudiantes$edad))
cat("Verificamos los individuos en la posición 10 y 11, los cuales corresponden a los valores 20 y 20 la mediana es ", mean(c(20,20)))

median(estudiantes$edad)

table(estudiantes$edad)

Ana=c(2.9,3.0,3.1)
Pedro=c(1,3,5)
var(Ana)# varianza calificaciones Ana
var(Pedro) # Varianza calficaciones Pedro

Ana=c(2.9,3.0,3.1)
Pedro=c(1,3,5)
sd(Ana)# desviación calificaciones Ana
sd(Pedro) # desviación calificaciones Pedro

rango=range(estudiantes$edad);rango
rango[2]-rango[1]
max(estudiantes$edad)-min(estudiantes$edad)

Femenino=estudiantes[estudiantes$sexo=="Femenino",]
Masculino=estudiantes[estudiantes$sexo=="Masculino",]
RF=max(Femenino$peso)-min(Femenino$peso)
RM=max(Masculino$peso)-min(Masculino$peso)
VF=var(Femenino$peso)
VM=var(Masculino$peso)
DF=sd(Femenino$peso)
DM=sd(Masculino$peso)
cat("El rango, varianza y desviación  para el peso en la categoría femenino es ", RF, ",",VF ,"y", DF,"respectivamente")
cat("El rango, varianza y desviación  para el peso en la categoría masculino es ", RM,",", VM ,"y", DM,"respectivamente")
