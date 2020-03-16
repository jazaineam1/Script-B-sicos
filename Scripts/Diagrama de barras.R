library(readxl)
library(ggplot2)

data=read_excel(choose.files())
data=data.frame(data)
names(data)
attach(data)
##############################################################################
Cuali=eval(parse(text=readline(prompt = "Ingrese la variable cualitativa:")))

tabla=table(Cuali)
count.data <- data.frame(
  Grupo = names(tabla),
  n = as.numeric(tabla),
  prop = as.numeric(tabla)*100/sum(as.numeric(tabla))
)


ggplot(data=count.data, aes(x=Grupo, y=n)) + 
  geom_col(fill=rgb(0.3,0.3,0.8,0.4),color="blue")+
  theme_minimal()+xlab("Grupos")+ylab("Frecuencia")
  