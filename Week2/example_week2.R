my_var <- 46; 
nr <- 38;

library(tidyverse);

DS <- read.table("C:/Users/User/Documents/BUINT/Week2/data/auto-mpg.data", quote="\"",comment.char="");

names(DS) <- c("mpg","cylinders","displacement","horsepower","weight","acceleration","model year","origin","car name");

DS <- as_tibble(DS);

attach(DS); 

View(DS);

filterDS <- filter(DS, weight > 3500);

filter(DS, DS$weight > 3500);

arrange(DS, desc(DS$acceleration));



#select without column 1
select(DS, -1); 
#select column 2 3 4
select(DS, 2,3,4);
select(DS, 1,2);
select(DS, c(mpg,2));

# Create a column based on the condition or calculation
DS2 <- mutate(DS, a4w = acceleration/weight, pre75 = as.numeric(DS$`model year`<75));

#Group by model year, calculated respective mean of displ and standard deviation of displ and count using functin n
summaryDS <- summarise(group_by(DS, `model year`), mean_displ = mean(displacement), sd_displ= sd(displacement), n =n())

rm(car_cost);

car_cost <-read_delim("C:/Users/User/Documents/BUINT/Week2/data//car_197x_costs_2.csv", 
                      delim = "-", 
                      escape_double = FALSE, 
                      na = "NA", trim_ws = TRUE, 
                      col_types =cols(`Car Name` = col_factor(), 
                                      Price = col_character(), 
                                      Location = col_character(), 
                                      `Matriculation Year` = col_integer()));
car_cost <- as_tibble(car_cost);
car_cost <- mutate(car_cost, Location = sapply(Location,as.factor))
