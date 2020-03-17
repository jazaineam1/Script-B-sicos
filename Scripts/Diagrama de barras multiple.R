library("ggplot2")  
library("readxl")
library("dplyr")    # Data manipulation
library("grid")
library("png")
data=read_excel(choose.files())
data=data.frame(data)
names(data)
attach(data)
################################################################################
cuali1=as.name(readline(prompt = "Ingrese la variable Cualitativa 1: "));cuali2=as.name(readline(prompt = "Ingrese la variable Cualitativa 2: "))
cuali11=factor(eval(cuali1))
cuali22=factor(eval(cuali2))
# Ejemplo 1. Paleta de colores
ggplot(data, aes_string(cuali22, fill=cuali11)) +
  geom_bar(position="dodge") +
  labs(title="Diagrama de barras",
       x= "Cuali1",
       y="Frecuencias") +
  scale_fill_manual(values = heat.colors(2),"Género",labels=c("Hombre","Mujer"))+
  scale_x_discrete(labels=c("valor1","valor2","valor3","valor4","valor5","valor6"))+
  coord_flip()
###################################################################################
