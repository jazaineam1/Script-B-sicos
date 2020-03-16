library(readxl)
library(ggplot2)
library(lmtest)
library(ggfortify)
data=read_excel(choose.files())
data=data.frame(data)
names(data)
attach(data)

##############################################################
x1=as.name(readline(prompt = "Ingrese la variable independiente: "));y1=as.name(readline(prompt = "Ingrese la variable dependiente: "))

p <- ggplot(data, aes_string(x=x1, y=y1)) + geom_point()+
  geom_smooth(method = "lm",se=F)
p

dependiente=eval(y1)
independiente=eval(x1)

cor(dependiente, independiente)
cor.test(dependiente,independiente)
model=lm(dependiente~independiente)
model
summary(model)


errores=residuals(model)
####Verificación supuestos en los errores####
##1. Normalidad
#Prueba de Shapiro-Wilk
shapiro.test(errores)
#Q-Q Plot
df <- data.frame(y =errores)
p <- ggplot(df, aes( sample=y))
p + stat_qq() + stat_qq_line()+xlab("Teoricos")+ylab("Observados")
#2. Homocedasticidad
##Preuba de Homocedasticidad
#Test de BreushPagan
bptest(model)
#Raíz de errores estandarizados vs Predichos
ee=sqrt(abs(rstandard(model)))
yest=predict(model)
df=data.frame(ee,yest)

ggplot(df,aes(x=yest,y=ee))+geom_point()+xlab(expression("Predichos"))+ylab(expression(sqrt("Errores estandarizados")))+
  geom_smooth(se=F,method = 'loess')

#3Prueba de independencia
##Test de Durbin Watson
dwtest(model)
#Gráfico Acf
autoplot(acf(model$residuals, plot = FALSE))
