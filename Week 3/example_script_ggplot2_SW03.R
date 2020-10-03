library(ggplot2)

View(mpg)

plot1 <- ggplot(data = mpg, mapping = aes(x = mpg$hwy))+ 
          geom_histogram()
print(plot1)  
  
plot2 <- ggplot(data = mpg, mapping = aes(x = mpg$hwy))+  
          geom_violin(mapping = aes(y = mpg$displ),alpha=0.5)
print(plot2)

View(diamonds)

plot3 <- ggplot(data = diamonds, mapping = aes(x=carat, y=price, color=cut))+ 
          geom_point()
plot3 +  scale_colour_manual(values=c("red", "red", "red", "blue", "blue"))+
          scale_y_continuous(breaks=c(0,2500,5000,7500,10000,12500,15000,17500),
                     labels=c(0,2.5,5,7.5,10,12.5,15,17.5),
                     name="price(thousands of dollars)")+
          geom_rug()
print(plot3)


# From diamonds {ggplot2} documentation:
#color --> diamond colour, from D (best) to J (worst)
# clarity --> a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best))

plot4 <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
  geom_bin2d()
plot4 <- plot4 + facet_wrap(~color) +
  scale_color_manual(values=c("red", "yellow", "green", "blue", "violet")) + 
  scale_y_continuous(breaks=c(0,2500,5000,7500,10000,12500,15000,17500),
                     labels=c(0,2.5,5,7.5,10,12.5,15,17.5),
                     name="price(thousands of dollars)")
print(plot4)

plot5 <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
  geom_density2d() +
  facet_grid(clarity~color) +
  scale_color_manual(values=c("red", "yellow", "green", "blue", "violet")) + 
  scale_y_continuous(breaks=c(0,2500,5000,7500,10000,12500,15000,17500),
                     labels=c(0,2.5,5,7.5,10,12.5,15,17.5),
                     name="price(thousands of dollars)")
print(plot5)

plot6 <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
  geom_point() +
  facet_grid(clarity~color) +
  scale_color_manual(values=c("red", "yellow", "green", "blue", "violet")) + 
  scale_y_continuous(breaks=c(0,2500,5000,7500,10000,12500,15000,17500),
                     labels=c(0,2.5,5,7.5,10,12.5,15,17.5),
                     name="price(thousands of dollars)")
print(plot6)
