library(dplyr)

data=read.csv("https://raw.githubusercontent.com/jazaineam1/Script-B-sicos/master/naci2017.csv",sep=",",header=F)
head(data)


#####Funcion select####
data2 <- data %>% select(SEXO,PESO_NAC,NUMERO_CONSULTAS)
data2


#####Funcion filter####

data3 <- data %>% 
  select(SEXO,PESO_NAC,NUMERO_CONSULTAS) %>% 
  filter(SEXO=='Masculino')
data3


#####Funcion mutate####
data4 <- data %>% 
  select(SEXO,PESO_NAC,NUMERO_CONSULTAS) %>% 
  filter(SEXO=='Masculino') %>% 
  mutate(NUMERO_CONSULTAS_2=NUMERO_CONSULTAS+1)
data4


#### Funcion group_by() y summaraize()###

data5 <- data %>% 
  select(SEXO,PESO_NAC,NUMERO_CONSULTAS) %>% 
  mutate(NUMERO_CONSULTAS_2=NUMERO_CONSULTAS+1) %>% 
  summarise(Promedio_consultas=mean(NUMERO_CONSULTAS))
data5


data6 <- data %>% 
  select(SEXO,PESO_NAC,NUMERO_CONSULTAS) %>% 
  mutate(NUMERO_CONSULTAS_2=NUMERO_CONSULTAS+1) %>% 
  group_by(SEXO) %>% 
  summarize(Prom_consultas_sex=mean(NUMERO_CONSULTAS))
data6


#### Export Bases ####

datafiltro <- data %>% filter(NOMCLASAD=="CAPITAL SALUD" & EDAD_PADRE<18)
write.csv2(datafiltro,"ejemplofiltro.csv")
