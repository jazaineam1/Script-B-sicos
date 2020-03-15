library(readxl)


data<-read_excel(choose.files())
data=data.frame(data)
head(data)
names(data)
attach(data)
############################################################################

Cuali=eval(parse(text=readline(prompt = "Ingresar variable Cualitativa:")))
Cuanti=eval(parse(text=readline(prompt = "Ingresar variable Cuantitativa:")))

NombreGrafico=readline(prompt = "Nombre gráfico: ")
Nombre.x=readline(prompt = "Nombre eje x: ")
Nombre.y=readline(prompt = "Nombre eje y: ")
##########################################################################
grupos=length(unique(Cuali))
boxplot(Cuanti~Cuali,data=data,
        col=rainbow(grupos,alpha=0.3),
        border=rainbow(grupos,v=0.9),boxwex=0.5,
        xlab=Nombre.x,ylab=Nombre.y,
        main=NombreGrafico)

############################################################################

