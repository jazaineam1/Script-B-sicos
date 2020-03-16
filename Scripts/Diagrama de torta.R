library("ggplot2")  
library("readxl")
library("dplyr")    

data=read_excel(choose.files())
data=data.frame(data[1:300])
names(data)
attach(data)
###########################################################################
Cuali=eval(parse(text=readline(prompt = "Ingresar variable Cualitativa:")))


tabla=table(Cuali)

count.data <- data.frame(
  Grupo = names(tabla),
  n = as.numeric(tabla),
  prop = as.numeric(tabla)*100/sum(as.numeric(tabla))
)

# Add label position
count.data <- count.data %>%
  arrange(desc(Grupo)) %>%
  mutate(lab.ypos = cumsum(prop) - 0.5*prop)
count.data

n.Color=length(unique(Cuali))
mycols=NULL
for (i in 1:n.Color){
  mycols[i]<-readline(prompt = "Ingresar valores RGB: ")
 
}

###########################################################################

p=ggplot(count.data, aes(x = "", y = prop, fill = Grupo)) +
  geom_bar(width = 1, stat = "identity", color = "white") +
  coord_polar("y", start = 0)+
  geom_text(aes(x=seq(1,1.2,length.out = n.Color),fontface=11,y =lab.ypos, 
                label = paste(round(prop,0),"%")),size=5, color = "white")+
  scale_fill_manual(values = mycols) +
  theme_void()+ annotate("text", x = Inf, y = 10, label = "Jazm",vjust=5, col="red", cex=2, fontface = "bold", alpha = 0.3,srt = 0)
p
