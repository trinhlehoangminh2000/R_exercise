library(ggplot2)
library(MASS)

#view the available datasets
data()
#choose the datasets
str(Sitka)
View(Sitka)

ggplot(data = Sitka, aes(x = Time, y = size))+
        geom_point(aes(shape=treat))+
        geom_smooth()


ggplot(data = Sitka, aes(x = Time, y = size))+
  geom_point(color= "green")



ggplot(data = Sitka, aes(x=size))+
  #number of columns       
  geom_histogram(bins = 20)


ggplot(data = Sitka, aes(x=size, color = factor(tree)))+
  geom_density()


ggplot(data = Sitka, aes(x=size, color = factor(tree)))+
  geom_density()


ggplot(data = Sitka, aes(x=factor(treat), y=size))+
  geom_boxplot()

ggplot(data = Sitka, aes(x=treat))+ 
  geom_bar(fill = "#000000")

#page 21/67
ggplot(data = Sitka, aes(x=treat, fill=factor(Time)))+ 
  geom_bar()

